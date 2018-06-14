%% -------------------------------------------------------------------
%%
%% xqerl - XQuery processor
%%
%% Copyright (c) 2017-2018 Zachary N. Dean  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc  JSON related functions for de-encoding from/to map/array

-module(xqerl_json).
-compile(inline_list_funcs).

-include("xqerl.hrl").

-define(ns, "http://www.w3.org/2005/xpath-functions").
-define(qn(Local), #qname{namespace = ?ns, prefix = [], local_name = Local}).
-define(key(Value),#xqAttributeNode{name = #qname{namespace = 'no-namespace', 
                                                  prefix = [], 
                                                  local_name = "key"},
                                    expr = #xqAtomicValue{type = 'xs:string', 
                                                          value = Value}}).
-define(esckey, #xqAttributeNode{name = #qname{namespace = 'no-namespace', 
                                               prefix = [], 
                                               local_name = "escaped-key"},
                                 expr = #xqAtomicValue{type = 'xs:string', 
                                                       value = "true"}}).
-define(esc, #xqAttributeNode{name = #qname{namespace = 'no-namespace', 
                                            prefix = [], 
                                            local_name = "escaped"},
                              expr = #xqAtomicValue{type = 'xs:string', 
                                                    value = "true"}}).

-record(state, {liberal    = false, % ignored, no liberal parsing
                duplicates = use_first,
                escape     = false,
                %escape     = true, %% different from the spec
                validate   = false,
                indent     = false,
                fallback   = fun(_) -> [16#FFFD] end}).


%% ====================================================================
%% API functions
%% ====================================================================
-export([string/2]).
-export([string_to_xml/2]).
-export([xml_to_string/2]).

string(String, Options) ->
   State = parse_options(#state{},Options),
   try 
      xqldb_res:string_to_json(String) 
   of
      {error,invalid_json} ->
         ?err('FOJS0001');
      Term ->
         ?dbg("Term",Term),
         json_to_map(State, Term)
   catch
      _:_ ->
         ?err('FOJS0001')
   end.

xml_to_string(Node, Options) ->
   State = parse_options(#state{},Options),
   #xqAtomicValue{type = 'xs:string', value = xml_to_json(State, Node)}.

string_to_xml(String, Options) ->
   State = parse_options(#state{duplicates = retain,
                                escape = false},Options),
   try 
      xqldb_res:string_to_json(String) 
   of
      {error,invalid_json} ->
         ?err('FOJS0001');
      Term ->
         ?dbg("Term",Term),
         Frag = json_to_xml(State, [], Term),
         Doc = #xqDocumentNode{expr = Frag},
         Opt = #{namespaces => [],
                 'base-uri' => get_base_uri(Options),
                 'copy-namespaces' => {preserve,'no-inherit'}},
         xqerl_node:new_fragment(Opt, Doc)
   catch
      _:_ ->
         ?err('FOJS0001')
   end.

%% ====================================================================
%% Internal functions
%% ====================================================================

get_base_uri(Options) ->
   proplists:get_value('base-uri', Options).

if_empty([],Default) -> Default;
if_empty(Value,_Default) -> Value.

xml_to_json(State, #xqNode{} = Doc) ->
   Tree = xqerl_node:node_to_content(Doc),
   % Attributes are in 'expr', not in 'attributes'
   case xml_to_json(State, Tree) of
      {_K,V,_EscKey0} -> % key with no map, internal node
         V;
      V ->
         V
   end;

xml_to_json(State, [#xqElementNode{} = E]) ->
  xml_to_json(State, E);

xml_to_json(State = #state{indent = Indent},
             #xqElementNode{name = #qname{namespace = ?ns, 
                                          local_name = "array"},
                            expr = Expr}) ->
   {Key, EscKey, _Esc, Rest} = get_attributes(Expr,false),
   Content = lists:map(fun(V) ->
                          xml_to_json(State, V)
                       end, Rest),
   if Key =:= [] ->
         serialize_array(Content, Indent);
      true ->
         State1 = State#state{escape = not if_empty(EscKey,false)},
         KeyVal = normalize_string(State1, xqerl_types:string_value(Key)),
         {[$"] ++ KeyVal ++ [$"], serialize_array(Content, Indent), EscKey}
   end;
xml_to_json(State = #state{indent = Indent}, 
            #xqElementNode{name = #qname{namespace = ?ns, local_name = "map"},
                           expr = Expr}) ->
   {Key, EscKey, _Esc, Rest} = get_attributes(Expr,false),
   Fold = fun(V,Check) ->
                case xml_to_json(State, V) of
                   {K,V1,EscKey0} ->
                      EscKey1 = if_empty(EscKey0,false),
                      K1 = if EscKey1 ->
                                 to_codepoints(K,true);
                              true ->
                                 to_codepoints(K,false)
                           end,
                      case maps:is_key(K1, Check) of
                         true ->
                            ?err('FOJS0006');
                         _ ->
                            {{K,V1}, Check#{K1 => ok}}
                      end;
                   _ ->
                      ?err('FOJS0006')
                end
          end,
   {Content,_} = lists:mapfoldl(Fold, #{}, Rest),
   if Key == [] ->
         serialize_map(Content, Indent);
      true ->
         State1 = State#state{escape = not EscKey},
         KeyVal = normalize_string(State1, xqerl_types:string_value(Key)),
         {[$"] ++ KeyVal ++ [$"],serialize_map(Content, Indent), EscKey}
   end;
xml_to_json(State, #xqElementNode{name = #qname{namespace = ?ns, 
                                                local_name = "boolean"},
                                  expr = Expr}) -> 
   try
      {Key, EscKey, _Esc, Rest} = get_attributes(Expr,true),
      Txt = xqerl_node:atomize_nodes(Rest),
      Bool = xqerl_types:string_value(xqerl_types:cast_as(Txt,'xs:boolean')),
      if Key == [] ->
            Bool;
         true ->
            State1 = State#state{escape = not if_empty(EscKey,false)},
            KeyVal = normalize_string(State1, xqerl_types:string_value(Key)),
            {[$"] ++ KeyVal ++ [$"],Bool, EscKey}
      end
   catch
      _:_ ->
         ?err('FOJS0006') % invalid boolean
   end;
xml_to_json(State, #xqElementNode{name = #qname{namespace = ?ns, 
                                                local_name = "null"},
                                  expr = Expr}) -> 
   {Key, EscKey, _Esc, Rest} = get_attributes(Expr,true),
   if Rest =/= [] ->
         ?err('FOJS0006');
      Key == [] ->
         "null";
      true ->
         State1 = State#state{escape = not if_empty(EscKey,false)},
         KeyVal = normalize_string(State1, xqerl_types:string_value(Key)),
         {[$"] ++ KeyVal ++ [$"],"null", EscKey}
   end;
xml_to_json(State, #xqElementNode{name = #qname{namespace = ?ns, 
                                                local_name = "number"},
                                  expr = Expr})->
   try
      {Key, EscKey, _Esc, Rest} = get_attributes(Expr,true),
      Txt = xqerl_node:atomize_nodes(Rest),
      Dbl = xqerl_types:cast_as(Txt,'xs:double'),
      NumTxt = xqerl_types:string_value(Dbl),
      if NumTxt == "INF";
         NumTxt == "-INF";
         NumTxt == "NaN" -> % not allowed in JSON
            ?err('FOJS0006');
         Key == [] ->
            NumTxt;
         true ->
            State1 = State#state{escape = not if_empty(EscKey,false)},
            KeyVal = normalize_string(State1, xqerl_types:string_value(Key)),
            {[$"] ++ KeyVal ++ [$"],NumTxt, EscKey}
      end
   catch 
      _:_ ->
         ?err('FOJS0006') % invalid number
   end;
xml_to_json(State, #xqElementNode{name = #qname{namespace = ?ns, 
                                                local_name = "string"},
                                  expr = Expr}) ->
   {Key, EscKey, Esc, Rest} = get_attributes(Expr,true),
   case Rest of
      [#xqTextNode{}] when Key =:= [] ->
         State1 = State#state{escape = not if_empty(Esc,false)},
         StrVal = escape_non_json(
                    normalize_string(State1, xqerl_types:string_value(Rest))),
         [$"] ++ StrVal ++ [$"];
      [#xqTextNode{}] ->
         State2 = State#state{escape = not if_empty(EscKey,false)},
         State3 = State#state{escape = not if_empty(Esc,false)},
         KeyVal = normalize_string(State2, xqerl_types:string_value(Key)),
         StrVal = escape_non_json(
                    normalize_string(State3, xqerl_types:string_value(Rest))),
         {[$"] ++ KeyVal ++ [$"],[$"] ++ StrVal ++ [$"], EscKey};
      [] when Key =:= [] ->
         [$",$"];
      [] ->
         State4 = State#state{escape = not if_empty(EscKey,false)},
         KeyVal = normalize_string(State4, xqerl_types:string_value(Key)),
         {[$"] ++ KeyVal ++ [$"],[$",$"], EscKey};
      _ ->
         ?err('FOJS0006')
   end;
xml_to_json(_State, _) -> % not schema conform
   ?err('FOJS0006').

get_attributes(Content, AllowWs) ->
   try
      Key = [ xqerl_types:string_value(K) || 
              #xqAttributeNode{name = #qname{namespace = 'no-namespace', 
                                             local_name = "key"},
                               expr = K} <- Content ],
      EscKey = [ xqerl_types:value(xqerl_types:cast_as(K,'xs:boolean')) || 
                 #xqAttributeNode{name = #qname{namespace = 'no-namespace', 
                                                local_name = "escaped-key"},
                                  expr = K} <- Content ],
      Esc = [ xqerl_types:value(xqerl_types:cast_as(K,'xs:boolean')) || 
              #xqAttributeNode{name = #qname{namespace = 'no-namespace', 
                                             local_name = "escaped"},
                               expr = K} <- Content ],
      Rest0 = [ K || K <- Content, 
                     not is_record(K, xqProcessingInstructionNode),
                     not is_record(K, xqCommentNode)],
      F = fun(#xqTextNode{expr = [#xqAtomicValue{value = V}]}) ->
                AllowWs orelse string:trim(V) =/= [];
             (#xqTextNode{expr = #xqAtomicValue{value = V}}) ->
                AllowWs orelse string:trim(V) =/= [];
             (#xqAttributeNode{name = #qname{namespace = 'no-namespace', 
                                             local_name = Ln}}) 
                when Ln == "key";
                     Ln == "escaped-key";
                     Ln == "escaped" ->
                false;
             (#xqAttributeNode{name = #qname{namespace = Ns}}) 
                when Ns == 'no-namespace';
                     Ns == ?ns ->
                true;
             (#xqAttributeNode{}) ->
                false;
             (_) ->
                true
          end,
      Rest = lists:filter(F, Rest0),
      {sing_val(Key), 
       sing_val(EscKey), 
       sing_val(Esc), 
       xqerl_node:merge_content(Rest,[])}
   catch 
      _:_ -> ?err('FOJS0006') % bad cast
  end.

sing_val([]) -> [];
sing_val([Val]) -> Val.

json_to_xml(State, Key, {array, Values}) ->
   Content = lists:map(fun(V) ->
                          json_to_xml(State, [], V)
                       end, Values),
   #xqElementNode{name = ?qn("array"),
                  attributes = att_key(Key, State#state.escape),
                  inscope_ns = [#xqNamespace{prefix = [],namespace = ?ns}],
                  type = 'xs:untyped',
                  expr = Content};
json_to_xml(#state{duplicates = Dupes,
                   escape = Escape} = State, 
            Key, {object, Members}) ->
   F = fun({K,V},Map) when Dupes == reject ->
               NormKey = if_empty(normalize_string(State, K), empty),
               case maps:is_key(NormKey, Map) of
                  true ->
                     ?err('FOJS0003');
                  _ ->
                     {json_to_xml(State, NormKey, V),Map#{NormKey => []}} 
               end;
          ({K,V},Map) when Dupes == use_first ->
               NormKey = if_empty(normalize_string(State, K), empty),
               case maps:is_key(NormKey, Map) of
                  true ->
                     {[],Map};
                  _ ->
                     {json_to_xml(State, NormKey, V),Map#{NormKey => []}}
               end;
          ({K,V},Map) when Dupes == retain ->
               NormKey = if_empty(normalize_string(State, K), empty),
               {json_to_xml(State, NormKey, V),Map#{NormKey => []}};
          (_,_) ->
             ?err('FOJS0005')
       end,
   {Content,_} = lists:mapfoldl( F, #{}, Members),
   #xqElementNode{name = ?qn("map"),
                  attributes = att_key(Key, Escape),
                  inscope_ns = [#xqNamespace{prefix = [],namespace = ?ns}],
                  type = 'xs:untyped',
                  expr = Content};
json_to_xml(State, Key, true) -> 
   #xqElementNode{name = ?qn("boolean"),
                  attributes = att_key(Key, State#state.escape),
                  inscope_ns = [#xqNamespace{prefix = [],namespace = ?ns}],
                  type = 'xs:untyped',
                  expr = #xqAtomicValue{type = 'xs:boolean', value = true}};
json_to_xml(State, Key, false) -> 
   #xqElementNode{name = ?qn("boolean"),
                  attributes = att_key(Key, State#state.escape),
                  inscope_ns = [#xqNamespace{prefix = [],namespace = ?ns}],
                  type = 'xs:untyped',
                  expr = #xqAtomicValue{type = 'xs:boolean', value = false}};
json_to_xml(State, Key, null) -> 
   #xqElementNode{name = ?qn("null"),
                  inscope_ns = [#xqNamespace{prefix = [],namespace = ?ns}],
                  type = 'xs:untyped',
                  attributes = att_key(Key, State#state.escape)};
json_to_xml(State, Key, Val) when is_float(Val);
                                  Val =:= neg_zero;
                                  Val =:= infinity;
                                  Val =:= neg_infinity ->
   #xqElementNode{name = ?qn("number"),
                  attributes = att_key(Key, State#state.escape),
                  inscope_ns = [#xqNamespace{prefix = [],namespace = ?ns}],
                  type = 'xs:untyped',
                  expr = #xqAtomicValue{type = 'xs:double', value = Val}};
json_to_xml(State, Key, Val) ->
   Norm = normalize_string(State, Val),
   Esc = att_esc(Norm, State#state.escape),
   #xqElementNode{name = ?qn("string"),
                  attributes = [Esc|att_key(Key, State#state.escape)],
                  inscope_ns = [#xqNamespace{prefix = [],namespace = ?ns}],
                  type = 'xs:untyped',
                  expr = #xqAtomicValue{type = 'xs:string', 
                                        value = Norm}}.

json_to_map(State, {array, Values}) ->
   {array,lists:map(fun(V) ->
                          json_to_map(State,V)
                    end, Values)};
json_to_map(#state{duplicates = Dupes} = State, {object, Members}) ->
   F = fun({K,V},Map) when Dupes == reject ->
             NormKey = normalize_string(State, K),
             case maps:is_key(NormKey, Map) of
                true ->
                   ?err('FOJS0003');
                _ ->
                   ATString = #xqAtomicValue{type = 'xs:string', 
                                             value = NormKey},
                   Map#{NormKey => {ATString,json_to_map(State,V)}}
             end;
          ({K,V},Map) when Dupes == use_first ->
             NormKey = normalize_string(State, K),
             case maps:is_key(NormKey, Map) of
                true ->
                   Map;
                _ ->
                   ATString = #xqAtomicValue{type = 'xs:string', 
                                             value = NormKey},
                   Map#{NormKey => {ATString,json_to_map(State,V)}}
             end;
          ({K,V},Map) when Dupes == use_last ->
             NormKey = normalize_string(State, K),
             ATString = #xqAtomicValue{type = 'xs:string', 
                                       value = NormKey},
             Map#{NormKey => {ATString,json_to_map(State,V)}};
          (_,_) ->
             ?err('FOJS0005')
       end,
   lists:foldl(F, #{}, Members);
json_to_map(_State, true) -> 
   #xqAtomicValue{type = 'xs:boolean', value = true};
json_to_map(_State, false) -> 
   #xqAtomicValue{type = 'xs:boolean', value = false};
json_to_map(_State, null) -> [];
json_to_map(_State, Val) when is_float(Val);
                              Val =:= neg_zero;
                              Val =:= infinity;
                              Val =:= neg_infinity ->
   #xqAtomicValue{type = 'xs:double', value = Val};
json_to_map(State, Val) ->
   Norm = normalize_string(State, Val),
   #xqAtomicValue{type = 'xs:string', value = Norm}.

normalize_string(#state{escape = true, fallback = Fallback}, String) ->
   escape(String, Fallback);
normalize_string(#state{escape = [], fallback = Fallback}, String) ->
   escape(String, Fallback);
normalize_string(#state{fallback = Fallback}, String) ->
   no_escape(String, Fallback).

escape_non_json([]) -> [];
escape_non_json([$\\,$"|T]) ->
   [$\\,$"|escape_non_json(T)];
escape_non_json([$"|T]) ->
   [$\\,$"|escape_non_json(T)];
escape_non_json([$\b|T]) ->
   [$\\,$f|escape_non_json(T)];
escape_non_json([$\f|T]) ->
   [$\\,$f|escape_non_json(T)];
escape_non_json([$\n|T]) -> 
   [$\\,$n|escape_non_json(T)];
escape_non_json([$\r|T]) -> 
   [$\\,$r|escape_non_json(T)];
escape_non_json([$\t|T]) -> 
   [$\\,$t|escape_non_json(T)];
escape_non_json([$\\,$\\|T]) -> 
   [$\\,$\\|escape_non_json(T)];
escape_non_json([$\\,$u,A,B,C,D, $\\,$u,E,F,G,H | T]) ->
   try
      High = list_to_integer([A,B,C,D],16),
      Low  = list_to_integer([E,F,G,H],16),
      %?dbg("High",High),
      %?dbg("Low",Low),
      if High >= 16#D800, High =< 16#DFFF,
         Low  >= 16#D800, Low  =< 16#DFFF ->
            [$\\,$u,A,B,C,D, $\\,$u,E,F,G,H |escape_non_json(T)];
         High < 16#D800;
         High > 16#DFFF ->
            [$\\,$u,A,B,C,D | escape_non_json([$\\,$u,E,F,G,H|T])];
         true ->
            ?err('FOJS0007')
      end
   catch
      _:_ -> ?err('FOJS0007')
   end;
escape_non_json([$\\,$u,A,B,C,D | T]) ->
   try
      Num = list_to_integer([A,B,C,D],16),
      %?dbg("Num",Num),
      if Num >= 16#D800, Num =< 16#DFFF ->
            ?err('FOJS0007');
         true ->
            [$\\,$u,A,B,C,D | escape_non_json(T)]
      end
   catch
      _:_ -> ?err('FOJS0007')
   end;
escape_non_json([H|T]) when H >= 1, H =< 31;
                            H >= 127, H =< 159 -> 
   Pad = do_pad(H),
   [$\\, $u | Pad] ++ escape_non_json(T);
escape_non_json([H|T]) -> 
   %?dbg("T",T),
   [H|escape_non_json(T)].

do_pad(H) ->
   string:uppercase(
           lists:flatten(string:pad(integer_to_list(H,16), 4, leading, $0))).

escape([], _Fallback) -> [];
%% escape([$\\, $u, A,B,C,D | T],Fallback) ->
%%    [$\\, $u] ++ string:uppercase([A,B,C,D]) ++ escape(T, Fallback);
% escape([$"|T], Fallback) ->
%    [$\\,$"|escape(T, Fallback)];
escape([$/|T], Fallback) ->
   [$\\,$/|escape(T, Fallback)];
escape([$\\|T], Fallback) ->
   [$\\,$\\|escape(T, Fallback)];
escape([$\f|T], Fallback) ->
   [$\\,$f|escape(T, Fallback)];
escape([$\n|T], Fallback) -> 
   [$\\,$n|escape(T, Fallback)];
escape([$\r|T], Fallback) -> 
   [$\\,$r|escape(T, Fallback)];
escape([$\t|T], Fallback) -> 
   [$\\,$t|escape(T, Fallback)];
escape([H1,H2|T], Fallback) when H1 >= 16#D800, H1 =< 16#DFFF, 
                                 H2 >= 16#D800, H2 =< 16#DFFF ->
   C = from_surrogates(H1, H2),
   [C|escape(T, Fallback)];
escape([H|T], Fallback) when H >= 16#00,   H =< 16#07; % hack \b out
                             H >= 16#09,   H =< 16#1F;
                             H >= 16#7F,   H =< 16#9F -> 
   Pad = do_pad(H),
   [$\\, $u | Pad] ++ escape(T, Fallback);
escape([$\\|_], _Fallback) -> 
   ?err('FOJS0007'); % bad escape sequence
escape([H|T], Fallback) ->
   case xqerl_lib:is_xschar(H) of
      true ->
         %?dbg("H",H),
         [H|escape(T, Fallback)];
      _ when H =< 65535 ->
         Pad = do_pad(H),
         Str = [$\\,$u | Pad],
         Str ++ escape(T, Fallback);
      _ -> % invalid XML, but valid JSON
         NewStr = Fallback(#xqAtomicValue{type = 'xs:string', value = [H]}),
         xqerl_types:string_value(NewStr) ++ escape(T, Fallback)
   end.

no_escape([], _Fallback) -> [];
no_escape([$\\, $u, A,B,C,D | T],Fallback) ->
   [$\\, $u] ++ string:uppercase([A,B,C,D]) ++ no_escape(T, Fallback);
no_escape([H1,H2|T], Fallback) when H1 >= 16#D800, H1 =< 16#DFFF, 
                                    H2 >= 16#D800, H2 =< 16#DFFF ->
   C = from_surrogates(H1, H2),
   no_escape([C|T], Fallback);
no_escape([H|T], Fallback) when H >= 16#D800, 
                                H =< 16#DFFF -> % unpaired surrogate
   Pad = do_pad(H),
   Str = [$\\,$u | Pad],
   try
      NewStr = Fallback(#xqAtomicValue{type = 'xs:string', value = Str}),
      xqerl_types:string_value(NewStr) ++ no_escape(T, Fallback)
   catch
      _:#xqError{} = E ->
         throw(E);
      _:_ ->
         ?err('XPTY0004')
   end;
no_escape([$\\,H|_], _Fallback) when H =/= $\\,
                                     H =/= $/,
                                     H =/= $",
                                     H =/= $b,
                                     H =/= $f,
                                     H =/= $n,
                                     H =/= $r,
                                     H =/= $t -> 
   ?err('FOJS0007'); % bad escape sequence
%% no_escape([$\\,$t|T],Fallback) -> % catch valid xml char not valid in json
%%    [$\\, $t|no_escape(T, Fallback)];
%% no_escape([$\t|T],Fallback) -> % catch valid xml char not valid in json
%%    [$\\, $t|no_escape(T, Fallback)];
no_escape([H|T], Fallback) ->
   %?dbg("H",H),
   case xqerl_lib:is_xschar(H) of
      true ->
         [H|no_escape(T, Fallback)];
      _ ->
         Str = if H =< 65535 ->
                     [$\\, $u |do_pad(H)];
                  true ->
                     %?dbg("BIG",H),
                     [H]
               end,
         try
            NewStr = Fallback(#xqAtomicValue{type = 'xs:string', value = Str}),
            xqerl_types:string_value(NewStr) ++ no_escape(T, Fallback)
         catch
            _:#xqError{} = E ->
               throw(E);
            _:_ ->
               ?err('XPTY0004')
         end
   end.

-compile({nowarn_unused_function, to_surrogates/1}).
to_surrogates(C) when C >= 16#10000, C =< 16#10FFFF ->
   CP = C - 16#10000,
   High = CP bsr 10 + 16#D800,
   Low  = CP band 16#3FF + 16#DC00,
   [High,Low].

from_surrogates(High, Low) ->
   HC = (High - 16#D800) bsl 10,
   LC = Low - 16#DC00,
   HC bor LC + 16#10000.


parse_options(State, []) ->
   State;
parse_options(State, [{liberal,Bool}|T]) ->
   parse_options(State#state{liberal = Bool}, T);
parse_options(State, [{duplicates,Bool}|T]) ->
   parse_options(State#state{duplicates = Bool}, T);
parse_options(State, [{escape,Bool}|T]) ->
   parse_options(State#state{escape = Bool}, T);
parse_options(State, [{fallback,Bool}|T]) ->
   parse_options(State#state{fallback = Bool}, T);
parse_options(State, [{indent,Bool}|T]) ->
   parse_options(State#state{indent = Bool}, T);
parse_options(State, [_|T]) ->
   parse_options(State, T).

att_esc([],_) -> [];
att_esc(_, false) -> [];
att_esc(Key, true) -> 
   case lists:member($\\, Key) of
      true ->
         [?esc];
      _ ->
         []
   end.

att_key([],_) -> [];
att_key(empty, _) -> 
   [?key([])];
att_key(Key, false) -> [?key(Key)];
att_key(Key, true) -> 
   case lists:member($\\, Key) of
      true ->
         [?key(Key),?esckey];
      _ ->
         [?key(Key)]
   end.

serialize_array([],_) -> "[]";
serialize_array([H|T],false) ->
   lists:flatten("["++ H ++ ["," ++ C || C <- T] ++"]");
serialize_array([H|T],true) ->
   lists:flatten("["++ H ++ [", " ++ C || C <- T] ++"]").

serialize_map([],_) -> "{}";
serialize_map([H|T],false) ->
   lists:flatten("{" ++ serialize_key_val(H) ++ 
                   ["," ++ serialize_key_val(C) || C <- T] ++ "}");
serialize_map([H|T],true) ->
   lists:flatten("{ " ++ serialize_key_val(H) ++ 
                   [",\n" ++ serialize_key_val(C) || C <- T] ++ " }").

serialize_key_val({Key,Value}) ->
   Key ++ [$:] ++ Value .

to_codepoints([],_) -> [];
to_codepoints([$\\,$"|T],Esc) -> 
   [$"|to_codepoints(T,Esc)];
to_codepoints([$\\,$b|T],Esc) -> 
   [$\b|to_codepoints(T,Esc)];
to_codepoints([$\\,$f|T],Esc) -> 
   [$\f|to_codepoints(T,Esc)];
to_codepoints([$\\,$n|T],Esc) -> 
   [$\n|to_codepoints(T,Esc)];
to_codepoints([$\\,$r|T],Esc) -> 
   [$\r|to_codepoints(T,Esc)];
to_codepoints([$\\,$t|T],Esc) -> 
   [$\t|to_codepoints(T,Esc)];
to_codepoints([$\\,$u,A,B,C,D|T],true) -> 
   [list_to_integer([A,B,C,D],16)|to_codepoints(T,true)];
%% to_codepoints([$\\|_T],_Esc) -> 
%%    ?err('FOJS0007'); % bad escape sequence
to_codepoints([H|T],Esc) -> 
   [H|to_codepoints(T,Esc)].