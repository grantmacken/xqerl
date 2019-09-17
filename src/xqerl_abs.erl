%% -------------------------------------------------------------------
%%
%% xqerl - XQuery processor
%%
%% Copyright (c) 2017-2019 Zachary N. Dean  All Rights Reserved.
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

%% @doc  The messy spaghetti-code that writes abstract Erlang.

-module(xqerl_abs).

-export([scan_mod/1,
         handle_predicate/2]).

-define(L,get_line()).
-define(LN, {undefined, get_line()}).

-define(s(E,T), {call,?L,{remote,?L,{atom,?L,xqerl_types},
                          {atom,?L,cast_as_seq}},[E,abs_seq_type(Ctx,T)]}).
-define(e, erl_syntax).
-define(A(T),<<T>>).
-define(FN,?A("http://www.w3.org/2005/xpath-functions")).
-define(XS,?A("http://www.w3.org/2001/XMLSchema")).
-define(REST, <<"http://exquery.org/ns/restxq">>).

-include("xqerl.hrl").
-include("xqerl_parser.hrl").

-include_lib("syntax_tools/include/merl.hrl").
%-undef(Q).
%-define(Q(Text), merl:quote(?LINE, Text)).
% revert everything from merl
-define(P(Text), update_line_numbers(?Q(Text))).
%-define(P1(Text), revert(?e:add_ann(?L, ?Q(Text)))).

-compile(inline_list_funcs).
%-compile({parse_transform, merl_transform}).

used_records() ->
   Recs = static_records(),
   Used = get_used_record_types(),
   lists:map(fun(A) ->
                   proplists:get_value(A, Recs)
             end, Used).
   
all_records() ->
   [P || {_,P} <- static_records()].

static_records() ->
   %% TODO add default values
   [{xqError,                     "-record(xqError,{name,description,value,location,additional})."},
    {xqAtomicValue,               "-record(xqAtomicValue,{type,value})."},
    {qname,                       "-record(qname,{namespace,prefix,local_name})."},
    {xqFunction,                  "-record(xqFunction,{annotations,name,arity,params,type,body,external})."},
    {xqDocumentNode,              "-record(xqDocumentNode, {identity,document_uri,base_uri,children,content})."},
    {xqElementNode,               "-record(xqElementNode, {identity,name,parent_node,children,attributes,inscope_ns,type,base_uri,content})."},
    {xqAttributeNode,             "-record(xqAttributeNode, {identity,name,parent_node,string_value,type})."},
    {xqTextNode,                  "-record(xqTextNode, {identity,parent_node,cdata,string_value})."},
    {xqCommentNode,               "-record(xqCommentNode, {identity,parent_node,string_value})."},
    {xqProcessingInstructionNode, "-record(xqProcessingInstructionNode, {identity,name,parent_node,base_uri,string_value})."},
    {xqNamespaceNode,             "-record(xqNamespaceNode, {identity,uri,prefix,parent_node})."},
    {xqNamespace,                 "-record(xqNamespace,{namespace,prefix})."},
    {xqFunTest,                   "-record(xqFunTest,{kind,annotations,name,params,type})."},
    {xqSeqType,                   "-record(xqSeqType,{type,occur})."},
    {xqKindTest,                  "-record(xqKindTest,{kind,name,type})."},
    {xqRange,                     "-record(xqRange,{min,max,cnt})."}
   ].

% revert to erl_parse form
revert_all(L) when is_list(L) ->
   [revert_all(I) || I <- L];
revert_all(I) ->
   ?e:revert(I).

% recursively set all line numbers
update_line_numbers(Trees) when is_list(Trees) ->
   [update_line_numbers(Tree) || Tree <- Trees, Tree =/= {nil, -1}];
%% patched #2348
update_line_numbers({map_field_assoc, _, Name, Value}) ->
   ?e:set_pos(?e:map_field_assoc(Name, Value), current_position());
%% patched #2348
update_line_numbers({map_field_exact, _, Name, Value}) ->
   ?e:set_pos(?e:map_field_exact(Name, Value), current_position());
update_line_numbers({atom, _, Atom}) -> 
   ?e:set_pos(?e:atom(Atom), current_position());
update_line_numbers({var, _, Atom}) -> 
   ?e:set_pos(?e:variable(Atom), current_position());
update_line_numbers(Tree) ->
    case ?e:get_pos(Tree) of
        [{file,_},{location,_}] -> % already set so do not overwrite
            Tree;
        _ ->
            Tree1 = ?e:set_pos(Tree, current_position()),
            case ?e:subtrees(Tree1) of
                [] -> Tree1;
                List ->
                    Sub = [[update_line_numbers(Subtree)
                           || Subtree <- Group,
                              Subtree =/= {nil, -1}]
                          || Group <- List],
                    ?e:update_tree(Tree1, Sub)
            end
    end.

current_position() ->
   A = erl_anno:new(0),
   B = erl_anno:set_file(get_filename(), A),
   erl_anno:set_line(get_line(), B).

get_line() ->
   erlang:get(line_number).

get_filename() ->
   erlang:get(current_filename).

set_line(undefined) -> ok;
set_line(-1) -> ok;
set_line(L) ->
   erlang:put(line_number, L).

set_filename(undefined) ->
   ok;
set_filename(L) ->
   erlang:put(current_filename, L).

init_mod_scan() ->
   erlang:put(current_filename, ""),
   erlang:put(line_number, 1),
   erlang:put(imp_mod, 1),
   erlang:put(ctx, 1),
   erlang:put(var_tuple, 1),
   erlang:put(iter_loop, 1).

scan_functions(#{tab := Tab}, Functions,ModName, public) ->
   Specs = [ {Name#qname{prefix = <<>>}, 
              Type, 
              Annos,
              begin
                 {F,A} = xqerl_static:function_hash_name(Name,Arity),
                 {ModName,F,A}
              end, 
              %function_function_name(Id, Arity), 
              Arity, 
              param_types(Params) } 
           || #xqFunctionDef{ 
                          annotations = Annos, 
                          arity = Arity,
                          params = Params,
                          name = Name, 
                          type = Type} 
           <- Functions,
              not_private(Annos) ],
   xqerl_context:import_functions(Specs,Tab),
   Specs.

%% {Name, Type, Annos, function_name, External }
scan_variables(Ctx, Variables) ->
   scan_variables(Ctx, Variables, all).

scan_variables(#{tab := Tab}, Variables, _Scope) ->
   Specs = [{Name#qname{prefix = <<>>}, Type, Annos,
             xqerl_static:variable_hash_name(Name),External}
           || #xqVar{annotations = Annos, 
                     name = Name,
                     external = External, 
                     type = Type} 
           <- Variables%,
              %Scope == all orelse not_private(Annos) 
           ],
   xqerl_context:import_variables(Specs,Tab),
   Specs.

expand_local_funs(#{module        := Mod,
                    mod_type      := ModType,
                    known_fx_sigs := Funs} = Ctx) ->
   OnlyPriv = 
      % add only private lib functions to a lib
      % all functions to a main module, these are seen by function-lookup
      fun({_, _, Annos, {F,A}, _, _} = S) when ModType == library ->
            case not_private(Annos) of
               true -> false;
               false -> {true, setelement(4, S, {Mod,F,A})}
            end;
         ({_, _, _, {F,A}, _, _} = S) ->
            {true, setelement(4, S, {Mod,F,A})};
         (_) -> false
      end,
   NewFuns = lists:filtermap(OnlyPriv, Funs),
   Ctx#{known_fx_sigs := NewFuns}.

init_fun_abs(Ctx0, KeysToAdd) ->
   Ctx = expand_local_funs(Ctx0),
   Fun = fun({context_item_type, _}, M) -> M;
            (Name, M) ->
               add_context_key(M,Name,Ctx)            
         end,
   Map3 = lists:foldl(Fun, #{}, KeysToAdd),
   a_term(Map3).

add_context_key(Map, default_calendar, _) -> Map;
add_context_key(Map, default_place, _) -> Map;
add_context_key(Map, default_language, _) -> Map;
add_context_key(Map, module, #{module := M}) ->
   Map#{module => M};
add_context_key(Map, dynamic_known_functions, #{known_fx_sigs := K}) ->
   Map#{named_functions => K};
add_context_key(Map, known_decimal_formats, #{known_dec_formats := K}) ->
   Map#{known_dec_formats => K};
add_context_key(Map, base_uri, #{'base-uri' := K}) ->
   Map#{'base-uri' => K};
add_context_key(Map, known_collations, #{'base-uri' := B,
                                         'default-collation' := D,
                                         known_collations := K}) ->
   Map#{'base-uri' => B,
        'default-collation' => D,
        known_collations => K};
add_context_key(Map, known_namespaces, #{'copy-namespaces' := C,
                                         namespaces := N}) ->
   Map#{'copy-namespaces' => C,
        namespaces => N};
% when named-functions added, everything is needed
add_context_key(Map, named_functions, #{'base-uri'          := B,
                                        'construction-mode' := M,
                                        'copy-namespaces'   := C,
                                        'default-collation' := D,
                                        known_collations    := O,
                                        known_dec_formats   := K}) ->
   Map#{'base-uri'          => B,
        'construction-mode' => M,
        'copy-namespaces'   => C,
        'default-collation' => D,
        known_collations    => O,
        known_dec_formats   => K};
add_context_key(Map,Key,Ctx) ->
   Map#{Key => maps:get(Key, Ctx)}.

%% dynamic_context_items() ->
%%    context_item,
%%    context_position,
%%    context_size,
%%    variable_values,           % lives in process dictionary for global variables, locals stay local
%%    named_functions,           % only filled when fn:function-lookup is used, filled with statically known
%%    current_date_time,         % lives in process dictionary
%%    implicit_timezone,         % lives in process dictionary
%%    available_documents,       % lives in seperate process
%%    available_text_resources,  % lives in seperate process
%%    available_collections,     % lives in seperate process
%%    default_collection,        % always empty
%%    available_uri_collections, % lives in seperate process
%%    default_uri_collection,    % always empty
%%    ok.

scan_mod(#{body := B} = Map) ->
   X = scan_mod(B, maps:remove(body, Map)),
%?dbg("here",ok),
   X.
   
scan_mod(#xqModule{prolog = Prolog, 
                   declaration = {ModNs,Prefix}, 
                   type = library,
                   body = _}, Map) ->
   _ = init_mod_scan(),
   _ = set_filename(ModNs),
   ok = set_globals(Prolog, Map),
   _ = add_used_record_type(xqAtomicValue),
   _ = add_used_record_type(xqSeqType),
   DefElNs     = xqerl_static:pro_def_elem_ns(Prolog),
   %ContextItem = xqerl_static:pro_context_item(Prolog,main),
   Namespaces  = xqerl_static:pro_namespaces(Prolog,[],DefElNs),
   Variables   = xqerl_static:pro_glob_variables(Prolog,[]),
   Functions   = xqerl_static:pro_glob_functions(Prolog,[]),
   StaticNamespaces = xqerl_context:static_namespaces(),
   %?dbg("{Variables}",{Variables}),
   NoQ = binary:part(ModNs, 2, byte_size(ModNs) - 3),
   ConstNamespaces  = xqerl_static:overwrite_static_namespaces(StaticNamespaces, 
                                                               [{NoQ,Prefix}|Namespaces]),
   ModName = xqerl_static:string_atom(ModNs),
   EmptyMap0 = Map#{module => ModName,
                    mod_type => library,
                    namespaces => [#xqNamespace{prefix = Px, namespace = Ns} || {Px,Ns} <- ConstNamespaces]},
   ImportedMods = lists:filtermap(fun({'module-import', {_,<<>>}}) -> false;
                                     ({'module-import', {N,_}}) -> 
                                        {true, N};
                                     (_) -> false
                                  end,Prolog),
   Imports     = xqerl_static:pro_mod_imports(Prolog),
   {_Functions1, _Variables1, StaticProps0} = 
     xqerl_context:get_module_exports(Imports),
   StaticProps = [Sp || Sp <- StaticProps0, not is_record(Sp, xqError)], 
   StatProps0 = lists:usort(maps:get(stat_props, EmptyMap0) ++ StaticProps),
   CtxItemType = maps:get(context_item_type, EmptyMap0),
   StatProps = [{context_item_type, CtxItemType}|StatProps0],
   EmptyMap = EmptyMap0#{stat_props := StatProps0}, 
   %[base_uri,default_calendar,default_language,default_place,dynamic_known_functions,known_collations,known_decimal_formats,known_namespaces]
   LibCtxClosure = revert_all(
                     init_fun_abs(
                       EmptyMap, 
                       StatProps0 -- [dynamic_known_functions, named_functions])),
   %?dbg("StatProps0",StatProps0),
   LibCtxClosureFun =
      case StatProps0 of
         [] ->
            ?P("close_context(C) -> C.");
         _ ->
            {map, L, B} = LibCtxClosure,
            CloseMap = {map, L, {var, ?L, 'C'}, B},
            ?P("close_context(C) -> _@CloseMap.")
      end,
   P1a = {attribute,1,file,{binary_to_list(ModNs),2}},
   P1 = scan_variables(EmptyMap,Variables, public), 
   P2 = scan_functions(EmptyMap,Functions,ModName, public),
   P3 = ?P(["-module('@ModName@').",
            "-export([static_props/0]).",
            "-export([init/1])."
            ]),
   P5 = ?P([%"-compile(inline_list_funcs).",
            "-compile(inline).",
            "static_props() -> _@StatProps@."]),
    % this will also setup the global variable match
   P6 = init_function(ModName,scan_variables(EmptyMap,Variables),Prolog),
   P7 = variable_functions(EmptyMap, Variables, library),
   P8 = function_functions(EmptyMap, Functions, library),
   {RestExports, RestWrappers} = rest_functions(EmptyMap, Functions),
   P9 = get_global_funs(),
   P4 = lists:flatten([
         ?P(export_variables(Variables, EmptyMap)),
         ?P(export_functions(Functions)),
         RestExports,
         ?P(used_records())
        ]),
   P10 = lists:flatten([P3, [P1a|P4], P5, P6, LibCtxClosureFun, P7, P8, P9]),
%?dbg("ImportedMods",ImportedMods),
%?dbg("AllAbs",P10),
   {ModNs,
    library,
    ImportedMods,
    P1,
    P2,
    revert_all(P10),
    RestWrappers
   };

scan_mod(#xqModule{prolog = Prolog, 
                   type = main, 
                   body = Body}, #{file_name := FileName,
                                   tab := Tab} =  Map) ->
   xqerl_context:set_statically_known_functions(Tab,[]), %%% get rid of this!!
   _ = init_mod_scan(),
   _ = set_filename(FileName),
   ok = set_globals(Prolog, Map),
   _ = add_used_record_type(xqAtomicValue),
   % the prolog is sorted in reverse order
   Imports     = xqerl_static:pro_mod_imports(Prolog),
   
   VarFun = fun(#xqVar{} = V) ->
                  {true,V};
               ({'context-item',{_,_,_} = V}) ->
                  {true,{'context-item',V}};
               (_) ->
                  false
            end,
   Variables   = lists:filtermap(VarFun, Prolog),
   Functions   = xqerl_static:pro_glob_functions(Prolog,[]),
   {Functions1, Variables1, StaticProps0} = 
     xqerl_context:get_module_exports(Imports),
   StaticProps = [case Sp of
                     #xqError{} ->
                        throw(Sp);
                     _ ->
                        Sp
                  end || Sp <- StaticProps0], 
   
   ImportedMods = lists:filtermap(fun({'module-import', {_,<<>>}}) -> false;
                                     ({'module-import', {N,_}}) -> 
                                        {true, xqerl_static:string_atom(N)};
                                     (_) -> false
                                  end,Prolog),
  
   ok = xqerl_context:import_variables(Variables1,Tab),
   ok = xqerl_context:import_functions(Functions1,Tab),
   
   VarFun1 = fun(#xqVar{annotations = Annos,
                        external = External,
                        name = Name,
                        type = Type}) ->
                   Name2 = xqerl_static:variable_hash_name(Name),
                   {Name, Type, Annos, {Name2,1},External };
                (X) ->
                   X
             end,
   
   FileName1 = binary_to_list(FileName),

   ModName = xqerl_static:string_atom(FileName),
   EmptyMap = Map#{variables => lists:map(VarFun1, Variables),
                   mod_type => main,
                   module => ModName
                  }, 
   
   MapItems = init_fun_abs(
                EmptyMap#{module => ModName},
                maps:get(stat_props, EmptyMap) ++ [options|[module|StaticProps]]),
    % abstract after this point
   P1 = ?P(["-module('@ModName@').",
            "-export([main/1])."
           ]),
   P1a = {attribute,1,file,{FileName1,1}},
   P3 = ?P([%"-compile(inline).", % later ...
            "init() ->",
            "  _ = xqerl_lib:lnew(),",
            "  Tab = xqerl_context:init(),",
            "  Map = maps:put(tab,Tab,_@MapItems),",
            "  xqerl_context:set_named_functions(Tab,maps:get(named_functions,Map,[])),",
            "  maps:remove(named_functions,Map)."]),
   ContextTypes = [Ty || {context_item_type, Ty} <- StaticProps,
                         Ty =/= #xqSeqType{type = item, occur = zero_or_many}],
   P4 = body_function(EmptyMap, Body, Prolog, ContextTypes), % this will also setup the global variable match
   P5 = variable_functions(EmptyMap, Variables), 
   P6 = function_functions(EmptyMap, Functions),
   %{RestExports, RestWrappers} = rest_functions(EmptyMap, Functions),
   P7 = get_global_funs(),
   P2 = lists:flatten([?P(export_functions(Functions)),
                       [], %RestExports,
                       ?P(used_records())]),
   AllAbs = lists:flatten([P1,[P1a|P2],P3,P4,P5,P6,P7]),
   {FileName,
    main,
    ImportedMods,
    scan_variables(EmptyMap,Variables, public),
    scan_functions(EmptyMap,Functions,ModName, public),
    revert_all(AllAbs),
    [] %RestWrappers
   };

scan_mod(#xqModule{prolog = Prolog, 
                   type = expression, % simple commands  
                   body = Body}, #{tab := Tab} =  Map) ->
   xqerl_context:set_statically_known_functions(Tab,[]), %%% get rid of this!!
   _ = init_mod_scan(),
   ok = set_globals(Prolog, Map),
   _ = add_used_record_type(xqAtomicValue),
   _ = add_used_record_type(xqSeqType),
   % the prolog is sorted in reverse order
   Imports     = xqerl_static:pro_mod_imports(Prolog),
   
   VarFun = fun(#xqVar{} = V) ->
                  {true,V};
               ({'context-item',{_,_,_} = V}) ->
                  {true,{'context-item',V}};
               (_) ->
                  false
            end,
   Variables   = lists:filtermap(VarFun, Prolog),
   {Functions1, Variables1, StaticProps} = 
     xqerl_context:get_module_exports(Imports),
   
   ok = xqerl_context:import_variables(Variables1,Tab),
   ok = xqerl_context:import_functions(Functions1,Tab),
   
   VarFun1 = fun(#xqVar{annotations = Annos,
                        external = External,
                        name = Name,
                        type = Type}) ->
                   Name2 = xqerl_static:variable_hash_name(Name),
                   {Name, Type, Annos, {Name2,1},External };
                (X) ->
                   X
             end,
   
   EmptyMap = Map#{%namespaces => ConstNamespaces,
                   variables => lists:map(VarFun1, Variables),
                   mod_type => expression
                  }, 
   
   MapItems = init_fun_abs(
                EmptyMap#{module => undefined},
                maps:get(stat_props, EmptyMap) ++ [options|[module|StaticProps]]),
   % abstract after this point
   P1 = ?Q(["-module(dummy)."]),
   P2 = ?P(all_records()),
   P3 = ?Q(["fun() ->",
            "  _ = xqerl_lib:lnew(),",
            "  Tab = xqerl_context:init(),",
            "  Map = maps:put(tab,Tab,_@MapItems),",
            "  xqerl_context:set_named_functions(Tab,maps:get(named_functions,Map,[])),",
            "  maps:remove(named_functions,Map) end()"]),
   P4 = expression_body(EmptyMap, Body, Prolog, Variables, P3), % this will also setup the global variable match
   PAll = lists:flatten([[P1],[P2],[P4]]),
   Exp = erl_expand_records:module(revert_all(PAll), []),
   [{clause,_,_,_,Block}] = [Cla || {function,_,dummy,_, [Cla]} <- Exp],
   {undefined,
    expression,
    [],
    scan_variables(EmptyMap,Variables, public),
    [],
    Block
   }.

%% used in library modules instead of main init 
init_function(ModName,Variables,Prolog) ->
   Stats = [N || {_,N} <- xqerl_context:static_namespaces()],
   ImportedMods = [E || 
                   {'module-import',{N,P} = E} <- Prolog,
                   not lists:member(N, Stats),
                   P =/= <<>>],
   %?dbg("{Variables,ImportedMods}",{Variables,ImportedMods}),
   Ctx0 = ?P("Ctx0 = Ctx#{'@ModName@' => imported}"), 
   ImpSetFun = fun({I,_} = _M, CtxVar) ->
                     NC0 = next_ctx_var_name(),
                     NV0 = {var,?L,NC0},
                     At = xqerl_static:string_atom(I),
                     O = ?P("_@NV0 = '@At@':init(_@CtxVar)"),
                     {O,NV0}
               end,
   {ImportedVars,FCtx} = lists:mapfoldl(ImpSetFun, {var,?L,'Ctx0'}, ImportedMods),
   
   VarSetFun = fun({_N,_T,_A,V,_Ext}, CtxVar) -> %%% mapfold here to make new ctx for each variable
                     NC = next_ctx_var_name(),
                     NV = {var,?L,NC},
                     VV = {var,?L,next_var_name()},
                     O = ?P("_@VV = '@V@'(_@CtxVar), "
                            "_@NV = (_@CtxVar)#{'@V@' => _@VV}"),
                     {O,NV}
               end,
   {VarSetAbs,LastCtx} = lists:mapfoldl(VarSetFun, FCtx, lists:reverse(Variables)),
   
   Imps = ?P("_@@ImportedVars"),
   Body = lists:flatten([Ctx0, Imps, VarSetAbs, [LastCtx]]),
   Clauses =[{clause,?L,[{var,?L,'Ctx'}],
              [[{call,?L,
                 {remote,?L,{atom,?L,erlang},
                  {atom,?L,is_map_key}},
                 [{atom,?L,ModName},{var,?L,'Ctx'}]}]],
              [{var,?L,'Ctx'}]},
             {clause,?L,[{var,?L,'Ctx'}],[],revert_all(Body)}],
   [{function,?L,init,1,Clauses}].

% RESTXQ functions:
% needs to init like a main module, and like a library
% Context setup in REST wrapper
% new context, plus all global variables set, pulls in all options set 
% at the module level and overloads them with annotations.
% all path templates as string cast to parameter type,
% all other templates as string cast to parameter type or empty sequence 
% body can be any of the accepted types, xml, json, text, binary; 
% parsed to parameter type
% if return method has body, the function can return sequence where first 
% is an xml element with all header values set. 
% external variable are not set by rest
% if rest: init/2   -> {cowboy_rest, Req, Opts}
% if get/head content_types_provided/2 -> {List, Req, State} 
% if put/post content_types_accepted/2 -> {List, Req, State}
% if delete   delete_resource/2 -> {true, Req, State}
rest_functions(Ctx, Functions) ->
   % internal function name to call from REST wrapper
   FxNameFun = 
     fun(#xqFunctionDef{name = FxName, arity = FxArity}) ->
           {FName, _} = xqerl_static:function_hash_name(FxName, FxArity),
           FName
     end,
   RestFuns = [{F#xqFunctionDef.id,
                FxNameFun(F),
                F#xqFunctionDef.params,
                xqerl_restxq:parse_annos(F#xqFunctionDef.annotations)} || 
               #xqFunctionDef{annotations = Annos} = F <-  Functions,
               #annotation{name = #qname{namespace = ?REST, 
                                  local_name = <<"path">>}} <- Annos],
   if RestFuns == [] ->
         ok;
      true ->
         init_ctx_function(Ctx)
   end,
   %?dbg("RestFuns",RestFuns),
   UsedMethods = lists:usort([M || {_,_,_,#{method := Ms}} <- RestFuns, M <- Ms]),
   % allowed_methods callback
   MethodBinFun = fun(Atom) -> string:uppercase(atom_to_binary(Atom, latin1)) end,
   Ms = [MethodBinFun(M) || M <- UsedMethods],
   E0 = if UsedMethods == [] -> [];
           true ->
              G0 = ?P(["allowed_methods(Req, State) -> {_@Ms@, Req, State}."]),
              _ = add_global_funs([G0]),
              ?Q("-export([allowed_methods/2]).")
        end,
   %?dbg("UsedMethods",UsedMethods),
   IsProv = UsedMethods =/= [],%[1 || M <- UsedMethods, M == get orelse M == head orelse M == put orelse M == post] =/= [],
   IsAccp = UsedMethods =/= [],%[1 || M <- UsedMethods, M == put orelse M == post] =/= [],
   IsDele = lists:member(delete, UsedMethods),
   
   E1 = if IsProv ->
              Cls_1 = 
                 [begin
                     Mb = MethodBinFun(M),
                     ?P(["content_types_provided(#{method := _@Mb@} = Req, ",
                        "#{_@M@ := #{output_media_types := M}} = State) ->",
                        " {M,Req,State}."])
                  end
                 || 
                  M <- UsedMethods],
             G1 = join_functions(Cls_1),
             _ = add_global_funs([G1]),
             ?Q("-export([content_types_provided/2]).");
          true -> []
       end,
   E2 = if IsAccp ->
              Cls_2 = 
                 [begin
                     Mb = MethodBinFun(M),
                     ?P(["content_types_accepted(#{method := _@Mb@} = Req, ",
                        "#{_@M@ := #{input_media_types := M}} = State) ->",
                        " {M,Req,State}."])
                  end
                 || 
                  M <- UsedMethods],
             G2 = join_functions(Cls_2),
             _ = add_global_funs([G2]),
             ?Q("-export([content_types_accepted/2]).");
          true -> []
       end,
   E3 = if IsDele ->
             G3 = ?P(["delete_resource(Req, State) ->",
                     " {true, Req, State}."]),
             _ = add_global_funs([G3]),
             ?Q("-export([delete_resource/2]).");
          true -> []
       end,
   E4 = lists:flatten([E0,E1,E2,E3]),
   Exports1 = if E4 == [] ->
                    [];
                 true ->
                    G4 = ?P("init(Req, Opts) -> {cowboy_rest, Req, Opts}."),
                    _ = add_global_funs([G4]),
                    [?Q("-export([init/2]).")|E4]
              end,
   % cowboy callbacks are done, now on to the wrapper functions
   ParamMapFun = 
     fun(#xqVar{id = Id,
                name = #qname{prefix = Px, local_name = Ln}, 
                type = Ty}, VarMap) ->
           Nm = if Px == <<>> -> Ln;
                   true -> <<Px/binary,":", Ln/binary>>
                end,
           VarMap#{Nm => {Id,Ty}}
     end,
   FunMap = 
     fun({FId, FName, FParams, #{fields := Fields,
                                 output := Serial0,
                                 param_cookie := PCookies,
                                 param_form := PForm,
                                 param_header := PHead,
                                 param_query := PQry} = FRestMap}) ->
           Serial = if is_map_key('omit-xml-declaration', Serial0) ->
                          Serial0;
                       true ->
                          Serial0#{'omit-xml-declaration' => false}
                    end,
           ParamMap = lists:foldl(ParamMapFun, #{}, FParams),
           FieldPart = param_fields(Fields, ParamMap),
           CookiePart = param_cookies(PCookies, ParamMap),
           HeaderPart = param_headers(PHead, ParamMap),
           FormPart = param_forms(PForm, ParamMap),
           QryPart = param_queries(PQry, ParamMap),
           Parts = lists:flatten([FieldPart,CookiePart,HeaderPart,FormPart,QryPart]),
           LocalParams = [{var,?L,list_to_atom("Var_" ++ integer_to_list(Id))} 
                         || #xqVar{id = Id} <- FParams],
           %?dbg("Parts",Parts),

           HasUpd = maps:get(contains_updates, Ctx),
           FunName = rest_fun_name(FId),
           % TODO stream response body
           G5 = if HasUpd -> 
                ?P(["'@FunName@'(#{method := Method} = Req, State) -> ",
                    "_@Parts,",
                    " PUL = xqerl_update:pending_update_list(erlang:self()),",
                    " {TRA,_} = locks:begin_transaction(),",
                    "Ctx = (init(init_ctx()))#{pul => PUL, trans => TRA},"
                    "XQuery = '@FName@'(Ctx, _@@LocalParams),",
                    "ReturnVal = xqerl_types:rest_return_value(XQuery,Ctx#{options => _@Serial@}),",
                    "xqerl_context:destroy(Ctx),{ReturnVal, Req, State}." %,
                    %"if Method == <<\"POST\">>; Method == <<\"GET\">> -> ",
                    %"  "
                    %" {true, xqerl_restxq:stream_body(ReturnVal, Req), State};",
                    %"true -> {ReturnVal, Req, State}"
                    %"end."
                     ]);
                 true ->
                 ?P(["'@FunName@'(#{method := Method} = Req, State) -> ",
                    "_@Parts,",
                    "Ctx = init(init_ctx()),"
                    "XQuery = '@FName@'(Ctx, _@@LocalParams),",
                    "ReturnVal = xqerl_types:rest_return_value(XQuery,Ctx#{options => _@Serial@}),",
                    "xqerl_context:destroy(Ctx), {ReturnVal, Req, State}."%,
                    %"if Method == <<\"POST\">>; Method == <<\"GET\">> -> ",
                   % " "
                   % " {true, xqerl_restxq:stream_body(ReturnVal, Req), State};",
                   % "true -> {ReturnVal, Req, State}"
                   % "end."
                     ])
                 end,
           add_global_funs([G5]),
           
           {FunName, FRestMap}
     end,
   Wrappers = lists:map(FunMap, RestFuns),
   Exports2 = lists:foldl(fun({Fx,_}, Acc) ->
                                [?P("-export(['@Fx@'/2]).")|Acc]
                          end, Exports1, Wrappers),
   {Exports2, Wrappers}.

rest_fun_name(Id) ->
   list_to_atom("rest_wrap__" ++ integer_to_list(Id)).

% each function has been created by ?P("afun(_@A,_@B) -> _@X."
% join their clauses to one function.
join_functions([]) -> [];
join_functions([H|_] = Funs) ->
   Name = ?e:function_name(H),
   Clauses = lists:flatten([?e:function_clauses(H) || 
                              F <- Funs, 
                              ?e:type(F) == function]),
   ?e:function(Name, Clauses).

init_ctx_function(Ctx) ->
   MapItems = init_fun_abs(Ctx, lists:usort(maps:get(stat_props, Ctx) ++ [options,module] )),
   G = ?P(["init_ctx() ->",
           "  _ = xqerl_lib:lnew(),",
           "  Tab = xqerl_context:init(),",
           "  Map = maps:put(tab,Tab,_@MapItems),",
           "  xqerl_context:set_named_functions(Tab,maps:get(named_functions,Map,[])),",
           "  maps:remove(named_functions,Map)."]),
   add_global_funs([G]).

param_fields([],_) -> [];
param_fields([{body, VarName}|T],Map) ->
   {VarId, _VarType} = maps:get(VarName, Map),
   VarAtom = {var,?L,list_to_atom("Var_" ++ integer_to_list(VarId))},
   TmpAtom = {var,?L,list_to_atom("TVar_" ++ integer_to_list(VarId))},
   [?P(["_@TmpAtom = xqerl_mod_http_client:read_body(Req),",
        "ContentType = cowboy_req:header(<<\"content-type\">>, Req),",
        "_@VarAtom = xqerl_mod_http_client:parse_body(ContentType, _@TmpAtom, <<>>)"
       ])|param_fields(T,Map)];
param_fields([{Atom, VarName}|T],Map) ->
   {VarId, VarType} = maps:get(VarName, Map),
   VarAtom = {var,?L,list_to_atom("Var_" ++ integer_to_list(VarId))},
   TmpAtom = {var,?L,list_to_atom("TVar_" ++ integer_to_list(VarId))},
   [?P(["_@TmpAtom = cowboy_req:binding(_@Atom@, Req),",
        "_@VarAtom = xqerl_types:cast_as(_@TmpAtom, _@VarType@)"
       ])|param_fields(T,Map)].

param_headers([],_) -> [];
param_headers(Params,Map) ->
   [begin
       {VarId, VarType} = maps:get(VarName, Map),
       VarAtom = {var,?L,list_to_atom("Var_" ++ integer_to_list(VarId))},
       TmpAtom = {var,?L,list_to_atom("TVar_" ++ integer_to_list(VarId))},
       ?P(["_@TmpAtom = cowboy_req:header(_@ParamName@, Req, _@Default0@),",
           "_@VarAtom = xqerl_types:cast_as(_@TmpAtom, _@VarType@)"
           ])
    end || {ParamName, VarName, Default0} <- Params].

param_cookies([],_) -> [];
param_cookies(Params,Map) ->
   [?Q("Cookies = cowboy_req:parse_cookies(Req)")|
   [begin
       {VarId, VarType} = maps:get(VarName, Map),
       VarAtom = {var,?L,list_to_atom("Var_" ++ integer_to_list(VarId))},
       TmpAtom = {var,?L,list_to_atom("TVar_" ++ integer_to_list(VarId))},
       ?P(["_@TmpAtom = proplists:get_value(_@CookieName@, Cookies, _@Default0@),",
           "_@VarAtom = xqerl_types:cast_as(_@TmpAtom, _@VarType@)"
           ])
    end || {CookieName, VarName, Default0} <- Params]
   ].

param_forms([],_) -> [];
param_forms(Params,Map) ->
   [?Q("{ok, FormKeyVals, _} = cowboy_req:read_urlencoded_body(Req)")|
   [begin
       {VarId, VarType} = maps:get(VarName, Map),
       VarAtom = {var,?L,list_to_atom("Var_" ++ integer_to_list(VarId))},
       TmpAtom = {var,?L,list_to_atom("TVar_" ++ integer_to_list(VarId))},
       ?P(["_@TmpAtom = proplists:get_value(_@ParamName@, FormKeyVals, _@Default0@),",
           "_@VarAtom = xqerl_types:cast_as(_@TmpAtom, _@VarType@)"
           ])
    end || {ParamName, VarName, Default0} <- Params]].

param_queries([],_) -> [];
param_queries(Params,Map) ->
   [?Q("QueryKeyVals = cowboy_req:parse_qs(Req)")|
   [begin
       {VarId, VarType} = maps:get(VarName, Map),
       VarAtom = {var,?L,list_to_atom("Var_" ++ integer_to_list(VarId))},
       TmpAtom = {var,?L,list_to_atom("TVar_" ++ integer_to_list(VarId))},
       ?P(["_@TmpAtom = proplists:get_value(_@ParamName@, QueryKeyVals, _@Default0@),",
           "_@VarAtom = xqerl_types:cast_as(_@TmpAtom, _@VarType@)"
           ])
    end || {ParamName, VarName, Default0} <- Params]].

get_imported_variables(Module) ->
   {_,Variables,_} = xqerl_context:get_module_exports(Module),
   [{var,?L,V} || {_,_,_A,{_,V},_} <- lists:sort(Variables)].

get_local_variables(Variables) ->
   [{var,?L,V} || {_,_,_,V,_} <- Variables].

%% get_imported_variable_tuple(Module) ->
%%    VarList = get_imported_variables(Module),
%%    ?P("{_@@VarList}").

set_globals(Prolog, Map) ->
   Vars = xqerl_static:pro_glob_variables(Prolog,[]),
   Variables = scan_variables(Map, Vars),
   Locals = get_local_variables(Variables),
   Stats = [N || {_,N} <- xqerl_context:static_namespaces()],
   ImportedMods = [E || 
                {'module-import',{N,P} = E} <- Prolog,
                not lists:member(N, Stats),
                P =/= []],
   ok = global_variable_map_match(ImportedMods,Locals),
   ok = global_variable_map_set(ImportedMods,Locals),
   ok.

%% USED ???
global_variable_map_match(Modules,Locals) ->
   Vars = lists:flatten([get_imported_variables(M) || M <- Modules]),
%?dbg("Vars",Vars),
   Matches = [{map_field_exact,?L,{atom,?L,V},V1} || {_,_,V} = V1 <- Vars ++ Locals],
   O = {map,?L,Matches},
   erlang:put(global_var_match, O),
   ok.

global_variable_map_set(Modules,Locals) ->
   Vars = lists:flatten([get_imported_variables(M) || M <- Modules]),
%?dbg("Vars",Vars),
   Match = fun({_,_,V} = _V1) ->
                 ?e:map_field_assoc({atom,?L,V}, ?e:variable(V))
           end,
   Matches =  [Match(V1) || V1 <- Vars ++ Locals],
   O = ?e:map_expr(Matches), 
   erlang:put(global_var_set, O),
   ok.


body_function(ContextMap, Body, Prolog, ContextTypes) ->
   _ = set_line(1),
   Stats = [N || {_,N} <- xqerl_context:static_namespaces()],
   ImportedMods = [E || 
                   {'module-import',{N,P} = E} <- Prolog,
                   not lists:member(N, Stats),
                   P =/= <<>>],
   _ = erlang:put(ctx, 1),
%?dbg("ImportedMods",ImportedMods),
   ImpSetFun = fun({I,_} = _M, CtxVar) ->
                     NC0 = next_ctx_var_name(),
                     NV0 = {var,?L,NC0},
                     At = xqerl_static:string_atom(I),
                     O = ?P("_@NV0 = '@At@':init(_@CtxVar)"),
                     {O,NV0}
               end,
   {ImportedVars,FCtx} = lists:mapfoldl(ImpSetFun, {var,?L,'Ctx0'}, ImportedMods),
   
   VarSetFun = 
      fun({_N,_T,_A,{V,1},_Ext}, CtxVar) ->
            AV = ?e:variable(next_var_name()),
            NC = next_ctx_var_name(),
            NV = {var,?L,NC},
            P = ?P(["_@AV = '@V@'(_@CtxVar),",
                    "_@NV = (_@CtxVar)#{'@V@' => _@AV}"]),
            {P, NV};
         ({'context-item',{CType,External,Expr}}, {_,_,C} = CtxVar1) ->
            Occ = if External =:= external -> zero_or_one;
                     Expr =/= []           -> one;
                     true                  -> zero_or_one
                  end,
            C1 = #xqSeqType{type = CType, occur = Occ},
            Unique = lists:usort(ContextTypes),
            Dmy = {var, ?L, 'CI'},
            Checks = [?P("_ = xqerl_types:check(_@Dmy, _@U@)") || U <- Unique],
            NC = next_ctx_var_name(),
            NV = {var,?L,NC},
            NextVar = {var,?L,next_var_name()},
            NewC = set_context_variable_name(ContextMap, C),
            E2 = expr_do(NewC, Expr),
            P = ?P(["_@NV = begin ",
                    " {CI,_} = maps:get('context-item', Options, {_@E2, 1}),"
                    " _@@Checks ,"
                    " _@NextVar = xqerl_types:promote(CI,_@C1@),",
                    " xqerl_context:set_context_item(_@CtxVar1,_@NextVar,1,",
                    "      xqerl_seq3:size(_@NextVar))"
                    "end"]),
            {P, NV}
      end,                 
   % reverse list that the dependencies are correct   
   {VarSetAbs0,{_,_,LastCtx}} = 
     lists:mapfoldl(VarSetFun, FCtx,
                    lists:reverse(maps:get(variables, ContextMap))),
   VarSetAbs = lists:flatten(VarSetAbs0),
   BodyAbs = expr_do(maps:put(ctx_var, LastCtx,ContextMap), Body),
   HasUpd = maps:get(contains_updates, ContextMap),
   V1 = ?P("_@@VarSetAbs"),
   M = if HasUpd ->
             ?P(["main(Options) ->",
                 " PUL = xqerl_update:pending_update_list(erlang:self()),",
                 " {TRA,_} = locks:begin_transaction(),",
                 " Ctx0 = xqerl_context:merge(init(), Options#{pul => PUL, trans => TRA}),",
                 " _@@ImportedVars,",
                 " _@@V1,",
                 "_@BodyAbs."]);
          true ->
             ?P(["main(Options) ->",
                 " Ctx0 = xqerl_context:merge(init(), Options),",
                 " _@@ImportedVars,",
                 " _@@V1,",
                 "_@BodyAbs."])
       end,             
   [M].

expression_body(ContextMap, Body, Prolog, Variables, Init) ->
      Stats = [N || {_,N} <- xqerl_context:static_namespaces()],
   ImportedMods = [E || 
                   {'module-import',{N,P} = E} <- Prolog,
                   not lists:member(N, Stats),
                   P =/= <<>>],
   _ = erlang:put(ctx, 1),
%?dbg("ImportedMods",ImportedMods),
   ImpSetFun = fun({I,_} = _M, CtxVar) ->
                     NC0 = next_ctx_var_name(),
                     NV0 = {var,?L,NC0},
                     At = xqerl_static:string_atom(I),
                     O = ?P("_@NV0 = '@At@':init(_@CtxVar)"),
                     {O,NV0}
               end,
   {ImportedVars,FCtx} = lists:mapfoldl(ImpSetFun, {var,?L,'Ctx0'}, ImportedMods),
   
   VarSetFun = 
      fun({N,_T,_A,{V,1},_Ext}, CtxVar) ->
            AV = {var,?L,next_var_name()},
            NC = next_ctx_var_name(),
            NV = {var,?L,NC},
            [ExtVar] = [begin
                           _ = set_line(LineNum),
                           TheVar
                        end || 
                        #xqVar{name = Nm,
                               anno = LineNum} = TheVar <- Variables, 
                        Nm == N], 
            VarFun = internal_variable_function(ContextMap, ExtVar),
            P = ?P(["_@AV = _@VarFun,",
                    "_@NV = (_@CtxVar)#{'@V@' => _@AV}"]),
            %P = ?P("xqerl_lib:lput('@V@','@V@'(_@CV))"),
            {P, NV};
         ({'context-item',{CType,External,Expr}}, {_,_,C} = CtxVar1) ->
            NC = next_ctx_var_name(),
            NV = {var,?L,NC},
            NextVar = {var,?L,next_var_name()},
            Occ = if External =:= external -> zero_or_one;
                     Expr =/= []           -> one;
                     true                  -> zero_or_one
                  end,
            NewC = set_context_variable_name(ContextMap, C),
            E1 = expr_do(NewC, #xqSeqType{type = CType, occur = Occ}),
            E2 = expr_do(NewC, Expr),
            P = ?Q(["_@NV = begin ",
                    " CI = maps:get('context-item', Options, _@E2),"
                    " _@NextVar = xqerl_types:promote(CI,_@E1),",
                    " xqerl_context:set_context_item(_@CtxVar1,_@NextVar,1,",
                    "      xqerl_seq3:size(_@NextVar))"
                    "end"]),
            {P, NV}
      end,                 
   % reverse list that the dependencies are correct   
   {VarSetAbs0,{_,_,LastCtx}} = 
     lists:mapfoldl(VarSetFun, FCtx,
                    lists:reverse(maps:get(variables, ContextMap))),
   VarSetAbs = lists:flatten(VarSetAbs0),
   BodyAbs = expr_do(maps:put(ctx_var, LastCtx,ContextMap), Body),
   V1 = ?Q("_@@VarSetAbs"),
   M = ?Q(["dummy() ->",
           "begin ",
           " Ctx0 = xqerl_context:merge(_@Init, Options),",
           " _@@ImportedVars,",
           " _@@V1,",
           "_@BodyAbs",
           "end. "]),
%%    ?dbg("M",M),
   [M].


variable_functions(ContextMap, Variables) ->
   variable_functions(ContextMap, Variables, main).

variable_functions(ContextMap, Variables, ModType) ->
   LocCtx = set_context_variable_name(ContextMap, '__Ctx'),
   F = fun(#xqVar{id = _, name = QName, expr = Expr, 
                  external = Ext, type = Type0, anno = LineNum}) ->
             _ = set_line(LineNum),
             Type = if Type0 == undefined ->
                          #xqSeqType{type = item, occur = zero_or_many};
                       true ->
                          Type0
                    end,
             #qname{namespace = Ns1, prefix = P1, local_name = L1} = QName,
             QNameStr = if Ext == true andalso ModType == library;
                           Ext == true andalso P1 =/= <<>> ->
                              % Ns1 may already have Q{} wrapper
                              case Ns1 of
                                 <<"Q{", _/binary>> ->
                                    <<Ns1/binary, L1/binary>>;
                                 _ ->
                                    <<"Q{", Ns1/binary,"}", L1/binary>>
                              end;
                           P1 == undefined ->
                              <<"Q{", Ns1/binary,"}", L1/binary>>;
                           P1 == <<>> ->
                              L1;
                           true ->
                              <<P1/binary, ":", L1/binary>>
                        end,
             erlang:put(ctx, 1),
             Name = xqerl_static:variable_hash_name(QName),
             Expr1 = expr_do(LocCtx, Expr),
             % when external, check for set value first, then default, 
             % or then XPDY0002 when not set.
             if Ext == true ->
                  ?P(["'@Name@'(__Ctx) ->",
                      "   Tmp = begin _@Expr1 end,",
                      "   case maps:get(_@QNameStr@,__Ctx,Tmp) of",
                      "      undefined -> erlang:exit(xqerl_error:error('XPDY0002'));",
                      "      X -> xqerl_types:promote(X, _@Type@) end."]);
                true ->
                   % close the context in lib variables
                   case ModType of
                      library ->
                         ?P(["'@Name@'(__Ctx0) ->",
                             "   __Ctx = close_context(__Ctx0),",
                             "   _@Expr1."]);
                      _ ->
                         ?P(["'@Name@'(__Ctx) ->",
                             "   _@Expr1."])
                   end
             end
     end,
   [begin _ = set_line(Line), F(V) end || 
    #xqVar{anno = Line} = V <- Variables].

internal_variable_function(LocCtx, #xqVar{id = _, name = QName, expr = Expr, 
                                          external = Ext, type = Type0, 
                                          anno = LineNum}) ->
   _ = set_line(LineNum),
   CtxVar = {var, ?L, get_context_variable_name(LocCtx)},
   Type = if Type0 == undefined ->
                 #xqSeqType{type = item, occur = zero_or_many};
              true ->
                 Type0
           end,
    #qname{namespace = Ns1, prefix = P1, local_name = L1} = QName,
    QNameStr = if P1 == <<>> ->
                     L1;
                  P1 == undefined ->
                     <<"Q{", Ns1/binary, "}", L1/binary>>;
                  true ->
                     <<P1/binary, ":", L1/binary>>
               end,
    Expr1 = expr_do(LocCtx, Expr),
    % when external, check for set value first, then default, 
    % or then XPDY0002 when not set.
    if Ext == true ->
         ?P(["fun() ->",
             "   Tmp = begin _@Expr1 end,",
             "   case maps:get(_@QNameStr@,_@CtxVar,Tmp) of",
             "      undefined -> erlang:exit(xqerl_error:error('XPDY0002'));",
             "      X -> xqerl_types:promote(X, _@Type@) end end()"]);
       true ->
         ?P(["fun() ->",
             "   _@Expr1 end()"])
    end.

function_functions(ContextMap, Functions) ->
   function_functions(ContextMap, Functions, main).

function_functions(ContextMap, Functions, ModType) ->
   CtxName = get_context_variable_name(ContextMap),
   F =fun(#xqFunctionDef{name = FxName,
                         arity = Arity,
                         %type = RType,
                         params = Params,
                         body = Expr,
                         anno = Line}) ->
            erlang:put(ctx, 1),
            _ = set_line(Line),
            {FName, _} = xqerl_static:function_hash_name(FxName, Arity),
            % add parameters to scope
            VF = fun(#xqVar{id = VId,
                            name = Name,
                            type = Type,
                            annotations = Annos}, Map) ->
                       VarName = list_to_atom(
                                   lists:concat([param_prefix(), VId])),
                       %% {name,type,annos,Name}
                       NewMap = add_param({Name,Type,Annos,VarName}, Map),
                       {{var,?L,VarName}, NewMap}
                 end,
            {List,Map2} =  lists:mapfoldl(VF, ContextMap, Params),
            CtxName2 = next_ctx_var_name(),
            Map3 = set_context_variable_name(Map2, CtxName2),
            E1 = alist(expr_do(Map3#{in_local_fun => true}, Expr)),
            C1 = {var,?L,CtxName},
            C2 = {var,?L,CtxName2},
            % do not allow functions to access the current context item
            case ModType of
               library ->
                  ?P(["'@FName@'(_@C1,_@@List) ->",
                      "   _@C2 = close_context(xqerl_context:set_empty_context_item(_@C1)),",
                      "   _@E1."]);
               _ ->
                  ?P(["'@FName@'(_@C1,_@@List) ->",
                      "   _@C2 = xqerl_context:set_empty_context_item(_@C1),",
                      "   _@E1."])
            end
     end,
   [ F(V)
     || #xqFunctionDef{} = V <- Functions].

not_private(Annos) ->
   [ok || 
    #annotation{name = #qname{namespace = ?A("http://www.w3.org/2012/xquery"),
                              local_name = ?A("private")}} <- Annos] == [].


export_functions(Functions) ->
   Specs = [ xqerl_static:function_hash_name(Name, Arity) 
           || #xqFunctionDef{name = Name, 
                          arity = Arity,
                          annotations = _Annos} <- Functions%,
              %not_private(Annos)
           ],
   export_atts(Specs).

export_variables(Variables, _Ctx) ->
   Specs = [ {xqerl_static:variable_hash_name(Name),1}
           || #xqVar{name = Name, 
                     annotations = _Annos} <- Variables%,
              %not_private(Annos)
           ],
   export_atts(Specs).

export_atts([]) -> [];
export_atts([{F,A}|T]) ->
   lists:concat(["-export(['",F,"'/",A,"]). ",export_atts(T)]).

param_types(Params) ->
   [ T || #xqVar{type = T} <- Params].


expr_do(Ctx, {update, rename, Tgt, Src}) ->
   CtxVar = {var, ?L, get_context_variable_name(Ctx)},
   SrcAbs = expr_do(Ctx, Src),
   Namespaces = abs_ns_list(Ctx),
   TgtAbs = expr_do(Ctx, Tgt),
   ?P(["begin ",
       " xqerl_update:add(_@CtxVar, {rename, _@TgtAbs, ",
       " xqerl_node:ensure_qname(_@SrcAbs, _@Namespaces)})  end"]);
expr_do(Ctx, {update, InsertKind, Src, Tgt}) ->
   CtxVar = {var, ?L, get_context_variable_name(Ctx)},
   SrcAbs = expr_do(Ctx, Src),
   TgtAbs = expr_do(Ctx, Tgt),
   ?P("begin xqerl_update:add(_@CtxVar, {_@InsertKind@, _@SrcAbs, _@TgtAbs})  end");
expr_do(Ctx, {update, delete, Tgt}) ->
   CtxVar = {var, ?L, get_context_variable_name(Ctx)},
   TgtAbs = expr_do(Ctx, Tgt),
   ?P("begin xqerl_update:add(_@CtxVar, {delete, _@TgtAbs})  end");
expr_do(Ctx, {update, modify, Id, VarsStmt, ExprStmt, ReturnStmt}) ->
   %?dbg("VarsStmt",VarsStmt),
   CtxNext = next_ctx_var_name(),
   Ctx1 = set_context_variable_name(Ctx, CtxNext),
   CtxVar1 = {var, ?L, CtxNext},
   PFun = fun(#xqVar{id = ID, 
                     name = #qname{} = Name,
                     type = Type, 
                     annotations = Annos,
                     expr = VarEx}, Map) ->
                VarExprAbs = expr_do(Map, VarEx),
                VarName = copy_variable_name(ID),
                %% {name,type,annos,Name}
                NewMap = add_variable({Name,Type,Annos,VarName}, Map),
                VarAbs = {var,?L,VarName},
                {?P("_@VarAbs = xqerl_node:copy_node(_@VarExprAbs)"), NewMap}
          end,
   {CopySet,Ctx2} =  lists:mapfoldl(PFun, Ctx1, VarsStmt),
   CtxVar = {var, ?L, get_context_variable_name(Ctx)},

   ModifyMatch = [{var,?L,local_variable_name(ID)} 
                 || #xqVar{id = ID} <- VarsStmt],
   CopyMatch = [{var,?L,copy_variable_name(ID)} 
                 || #xqVar{id = ID} <- VarsStmt],
   ExprStmtAbs = expr_do(Ctx2, ExprStmt),
   Pul = {var, ?L, list_to_atom("Pul__" ++ integer_to_list(Id))},
   RetCtx = lists:foldl(fun(#xqVar{id = ID,
                                   name = #qname{} = Name,
                                   type = Type,
                                   annotations = Annos}, C) ->
                              VarName = local_variable_name(ID),
                              add_variable({Name,Type,Annos,VarName}, C)
                        end, Ctx, VarsStmt),
   RetAbs = expr_do(RetCtx, ReturnStmt),
   ?P(["begin",
       " _@Pul = xqerl_update:pending_update_list(erlang:self()),",
       " _@CtxVar1 = _@CtxVar#{pul => _@Pul},",
       "_@CopySet,",
       "_@ExprStmtAbs,",
       " [_@@ModifyMatch] = xqerl_update:apply_local_updates(_@CtxVar1, _@Pul, [_@@CopyMatch]),",
       " _@RetAbs",
       "end"]);


% cardinality ensure
expr_do(Ctx, {ensure, #xqAtomicValue{} = Var, _}) ->
   expr_do(Ctx, Var);
expr_do(Ctx, {ensure, Var, #xqSeqType{occur = zero_or_many}}) ->
   expr_do(Ctx, Var);
expr_do(Ctx, {ensure, Var, #xqSeqType{occur = Occur}}) ->
   Expr = expr_do(Ctx, Var),
   FunName = if Occur == one ->
                   ensure_one;
                Occur == one_or_many ->
                   ensure_one_or_more;
                Occur == zero_or_one ->
                   ensure_zero_or_one;
                true ->
                   ensure_zero_or_more
             end,
   ?P("xqerl_seq3:'@FunName@'(_@Expr)");
% ignoring pragmas for now
expr_do(_Ctx, {pragma, _Pragmas, []}) ->
   ?err('XQST0079', ?LN);
expr_do(Ctx, {pragma, [{#qname{namespace = ?A("http://xqerl.org/xquery"),
                               local_name = ?A("parallel")},P}], Exprs}) ->
   case string:trim(P) of
      ?A("unordered") ->
         {unordered_parallel,expr_do(Ctx, Exprs)};
      _ ->
         {parallel,expr_do(Ctx, Exprs)}
   end;
expr_do(Ctx, {pragma, _Pragmas, Exprs}) ->
   expr_do(Ctx, Exprs);

expr_do(_Ctx, Atom) when Atom =:= infinity;
                         Atom =:= neg_infinity;
                         Atom =:= neg_zero;
                         Atom =:= nan;
                         Atom =:= undefined ->
   {atom,?L,Atom};
% try/catch
expr_do(Ctx, {'try',Id,Expr,{'catch',CatchClauses}}) ->
   _ = add_used_record_type(xqError),
   _ = add_used_record_type(xqAtomicValue),
   CodeVar = list_to_atom("__CodeVar" ++ integer_to_list(Id)),
   DescVar = list_to_atom("__DescVar" ++ integer_to_list(Id)),
   ValuVar = list_to_atom("__ValuVar" ++ integer_to_list(Id)),
   ModuVar = list_to_atom("__ModuVar" ++ integer_to_list(Id)),
   LineVar = list_to_atom("__LineVar" ++ integer_to_list(Id)),
   ColnVar = list_to_atom("__ColnVar" ++ integer_to_list(Id)),
   AddlVar = list_to_atom("__AddlVar" ++ integer_to_list(Id)),
   
   ErrNs = ?A("http://www.w3.org/2005/xqt-errors"),
   
   NewCodeVar = {#qname{namespace = ErrNs,prefix = ?A("err"), 
                        local_name = ?A("code")},
                 #xqSeqType{type = 'xs:QName', 
                            occur = one},[],CodeVar},
   NewDescVar = {#qname{namespace = ErrNs,prefix = ?A("err"), 
                        local_name = ?A("description")},
                 #xqSeqType{type = 'xs:string', 
                            occur = zero_or_one},[],DescVar},
   NewValuVar = {#qname{namespace = ErrNs,prefix = ?A("err"), 
                        local_name = ?A("value")},
                 #xqSeqType{type = 'item', 
                            occur = zero_or_many},[],ValuVar},
   NewModuVar = {#qname{namespace = ErrNs,prefix = ?A("err"), 
                        local_name = ?A("module")},
                 #xqSeqType{type = 'xs:string', 
                            occur = zero_or_one},[],ModuVar},
   NewLineVar = {#qname{namespace = ErrNs,prefix = ?A("err"), 
                        local_name = ?A("line-number")},
                 #xqSeqType{type = 'xs:integer', 
                            occur = zero_or_one},[],LineVar},
   NewColnVar = {#qname{namespace = ErrNs,prefix = ?A("err"), 
                        local_name = ?A("column-number")},
                 #xqSeqType{type = 'xs:integer', 
                            occur = zero_or_one},[],ColnVar},
   NewAddlVar = {#qname{namespace = ErrNs,prefix = ?A("err"), 
                        local_name = ?A("additional")},
                 #xqSeqType{type = item, 
                            occur = zero_or_many},[],AddlVar},
   
   Ctx0 = add_variable(NewCodeVar, Ctx),
   Ctx1 = add_variable(NewDescVar, Ctx0),
   Ctx2 = add_variable(NewValuVar, Ctx1),
   Ctx3 = add_variable(NewModuVar, Ctx2),
   Ctx4 = add_variable(NewLineVar, Ctx3),
   Ctx5 = add_variable(NewColnVar, Ctx4),
   Ctx6 = add_variable(NewAddlVar, Ctx5),

   CodeVar1 = {var,?L,CodeVar},
   DescVar1 = {var,?L,DescVar},
   ValuVar1 = {var,?L,ValuVar},
   ModuVar1 = {var,?L,ModuVar},
   LineVar1 = {var,?L,LineVar},
   ColnVar1 = {var,?L,ColnVar},
   AddlVar1 = {var,?L,AddlVar},
   
   ClsFun = 
     fun({Errors,DoExpr}) ->
           DoExprAbs = expr_do(Ctx6, DoExpr),
           D = alist(?Q("_@DoExprAbs")),
           lists:map(
             fun(#xqNameTest{name = #qname{namespace = ?A("*"),local_name = ?A("*")}}) ->
                   C = ?Q("#xqError{name = _@CodeVar1,
                                 description = _@DescVar1,
                                 value = _@ValuVar1,
                                 location = {_@ModuVar1, _@LineVar1, _@ColnVar1}}"),
                   Q = ?e:class_qualifier(?e:underscore(), C, ?Q("_@AddlVar1")),
                   ?e:clause(alist(Q), [], D);
                (#xqNameTest{name = #qname{namespace = ?A("*"),local_name = Ln}}) ->
                   _ = add_used_record_type(qname),
                   C = ?Q("#xqError{name = #xqAtomicValue{value = #qname{local_name = _@Ln@}} = _@CodeVar1,
                                 description = _@DescVar1,
                                 value = _@ValuVar1,
                                 location = {_@ModuVar1, _@LineVar1, _@ColnVar1}}"),
                   Q = ?e:class_qualifier(?e:underscore(), C, ?Q("_@AddlVar1")),
                   ?e:clause(alist(Q), [], D);
                (#xqNameTest{name = #qname{namespace = Ns,local_name = ?A("*")}}) ->
                   _ = add_used_record_type(qname),
                   C = ?Q("#xqError{name = #xqAtomicValue{value = #qname{namespace = _@Ns@}} = _@CodeVar1,
                                 description = _@DescVar1,
                                 value = _@ValuVar1,
                                 location = {_@ModuVar1, _@LineVar1, _@ColnVar1}}"),
                   Q = ?e:class_qualifier(?e:underscore(), C, ?Q("_@AddlVar1")),
                   ?e:clause(alist(Q), [], D);
                (#xqNameTest{name = #qname{namespace = Ns,local_name = Ln}}) ->
                   _ = add_used_record_type(qname),
                   C = ?Q("#xqError{name = #xqAtomicValue{value = #qname{namespace = _@Ns@,
                                                     local_name = _@Ln@}} = _@CodeVar1,
                                 description = _@DescVar1,
                                 value = _@ValuVar1,
                                 location = {_@ModuVar1, _@LineVar1, _@ColnVar1}}"),
                   Q = ?e:class_qualifier(?e:underscore(), C, ?Q("_@AddlVar1")),
                   ?e:clause(alist(Q), [], D)
               end, Errors)
     end,
   
   TryAbs = alist(expr_do(Ctx, Expr)),
   Clauses = lists:flatmap(ClsFun, CatchClauses),
   ?e:try_expr(TryAbs, [], alist(Clauses));

expr_do(Ctx, #xqNameTest{name = Name}) ->
   abs_qname(Ctx, Name);

% inline errors
expr_do(_Ctx, {error, ErrCode}) when is_atom(ErrCode) ->
   ?P("erlang:exit(xqerl_error:error(_@ErrCode@))");

% bang operator
expr_do(Ctx, {'simple-map',SeqExpr,MapExpr}) ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   SeqAbs = expr_do(Ctx, SeqExpr),

   NextCtxVar = next_ctx_var_name(),
   NextCtxVar1 = {var,?L,NextCtxVar},
   
   IntCtxVar = {var,?L,next_var_name()},
   PosVar = {var,?L,next_var_name()},
   SizeVar = {var,?L,next_var_name()},

   AddFun = fun(N,C) ->
                  add_variable(N, C)
            end,
   Ctx0 = lists:foldl(AddFun, Ctx, 
                      [{context_variable,IntCtxVar},
                       {position_variable,PosVar},
                       {size_variable,SizeVar}
                      ]),   
   Ctx1 = set_context_variable_name(Ctx0, NextCtxVar),
   Ctx2 = Ctx1#{context_variable => IntCtxVar,
                position_variable => PosVar,
                size_variable => SizeVar},
   
   BodyAbs = expr_do(Ctx2, MapExpr),

   FunAbs = ?P("fun(_@NextCtxVar1,_@IntCtxVar,_@PosVar,_@SizeVar) -> _@BodyAbs end"),
   ?P("xqerl_seq3:map(_@CtxVar,_@FunAbs,_@SeqAbs)");

% inline anonymous functions
expr_do(Ctx, #xqFunctionDef{name = undefined, % fun object
                            annotations = _, 
                            arity = _,
                            params = Params,
                            body = Expr,
                            anno = Line} = F) ->
   _ = set_line(Line),
   _ = add_used_record_type(xqFunction),
   NextCtxVar = next_ctx_var_name(),
   NextNextCtxVar = next_ctx_var_name(),
   NextNextNextCtxVar = next_ctx_var_name(),
   Ctx1 = set_context_variable_name(Ctx, NextCtxVar),
   % add parameters to scope
   PFun = fun(#xqVar{id = ID, 
                     name = #qname{} = Name,
                     type = Type, 
                     annotations = Annos}, Map) ->
                VarName = list_to_atom(lists:concat([param_prefix(), ID])),
                TVarName = list_to_atom(lists:concat(["T",param_prefix(), ID])),
                %% {name,type,annos,Name}
                NewMap = add_param({Name,Type,Annos,VarName}, Map),
                {{var,?L,TVarName}, NewMap};
             (X,Map) ->
               X1 = expr_do(Ctx,X),
               {X1,Map}
          end,
   {ParamList,Ctx2} =  lists:mapfoldl(PFun, Ctx1, Params),
   % check parameter types
   Checks = [begin
                V = {var,?L,list_to_atom(lists:concat([param_prefix(), ID]))},
                T = {var,?L,list_to_atom(lists:concat(["T",param_prefix(), ID]))},
                ensure_param_type(Ctx, V, T, Type)
             end ||
             #xqVar{id = ID, type = Type} <- Params],
   % do not allow functions to access the current context item
   Ctx3 = set_context_variable_name(Ctx2, NextNextNextCtxVar),
   CtxP = {var,?L,NextNextCtxVar},
   CtxI = {var,?L,NextNextNextCtxVar},
   case maps:find(in_pred, Ctx) of
      error ->
         FunBod = expr_do(clear_context_variables(Ctx3), Expr),
         Body = ?P(["fun(_@CtxP,_@@ParamList) ->",
                    " _@CtxI = xqerl_context:set_empty_context_item(_@CtxP),",
                    " _@@Checks,",   
                    " _@FunBod end"]),
         abs_function(Ctx, F, Body) ;
      {ok,true} ->
         FunBod = expr_do(Ctx3, Expr),
         Body = ?P(["fun(_@CtxI,_@@ParamList) ->",
                    " _@@Checks,",   
                    " _@FunBod end"]),
         abs_function(Ctx, F, Body) 
   end;
         

expr_do(Ctx, {'context-item', {_Type,_External,Expr}} )->
   expr_do(Ctx, Expr);
expr_do(_Ctx, {map, []} ) -> % empty map
   ?Q("#{}");
expr_do(Ctx, {map, Vals} ) ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   AVals = lists:foldl(
             fun({'map-key-val',Key,Val}, Abs) ->
                   KeyExp = expr_do(Ctx,Key),
                   ValExp = expr_do(Ctx,Val),
                   ?P("[{_@KeyExp, _@ValExp}|_@Abs]")
             end, {nil,?L}, alist(Vals)), 
   ?P("xqerl_mod_map:construct(_@CtxVar,_@@AVals)");
expr_do(Ctx, {false_not_empty, Expr} )->
   E1 = expr_do(Ctx, Expr),
   ?P("xqerl_types:ensure_empty(_@E1)");
expr_do(Ctx, {array, {expr, Expr}} )->
   Vals = lists:foldr(
            fun(E,Acc) ->
                  Ex = expr_do(Ctx, E),
                  case Ex of
                     {nil,_} ->
                        ?P("[[]|_@Acc]");
                     _ ->
                        ?P("[_@Ex|_@Acc]")
                  end
            end,{nil,?L}, alist(Expr)),
   ?P("xqerl_mod_array:from_list(_@Vals)");

% this is a constructor
expr_do(Ctx, {array, [{content_expr, Expr}]} ) ->
   Vals = lists:foldr(
            fun(E,Acc) ->
                  Ex = expr_do(Ctx, E),
                  case Ex of
                     {nil,_} ->
                        ?P("_@Acc");
                     _ ->
                        ?P("[_@Ex|_@Acc]")
                  end
            end,{nil,?L}, alist(Expr)),
   ?P("xqerl_mod_array:from_list(xqerl_seq3:flatten(xqerl_seq3:expand(_@Vals)))");
expr_do(Ctx, {array, Expr}) ->
   expr_do(Ctx, {array, {expr,Expr}});

expr_do(Ctx, #xqQuery{query = Qry}) ->
   XQ = alist(expr_do(Ctx, Qry)),
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   ?P(["XQuery = begin _@XQ end,",
       "ReturnVal = xqerl_types:return_value(XQuery,_@CtxVar),",
       "xqerl_context:destroy(_@CtxVar),",
       "ReturnVal"
      ]);
   
expr_do(Ctx, [T]) when is_tuple(T) ->
   expr_do(Ctx, T);
expr_do(_Ctx, V) when is_number(V) ->
   ?P("_@V@");
expr_do(_Ctx, V) when is_binary(V) ->
   ?P("_@V@");
expr_do(_Ctx, #xqAtomicValue{type = T, value = V}) ->
   ?P("#xqAtomicValue{type = _@T@, value = _@V@}");

expr_do(Ctx, {'string-constructor', Expr}) ->
   C = {var,?L,get_context_variable_name(Ctx)},
   F = fun(V, Abs) when is_binary(V) ->
             if V == <<>> ->
                   Abs;
                true ->
                   V1 = binary_to_list(V),
                   B = {bin_element, ?L,{string,?L,V1},default,default},
                     %?P("<<_@V1>>"),
                   [B|Abs]
             end;
          (I,Abs) ->
             V = expr_do(Ctx,I),
             %?dbg("I",I),
             {_,_,[B]} = ?e:revert(?Q("<<(xqerl_types:string_value(_@C, _@V))/binary>>")),
             [B|Abs]          
       end,
   Es = lists:foldr(F, [], alist(Expr)),
   Fl = {bin,?L,Es},
   ?P("_@Fl");

% context item can be a variable of set in the context map
expr_do(#{context_variable := CtxVar}, 'context-item') ->
   ?P("_@CtxVar");
expr_do(Ctx, 'context-item') ->
   CtxName = {var,?L,get_context_variable_name(Ctx)},
   ?P("xqerl_context:get_context_item(_@CtxName)");

expr_do(Ctx, {range,Expr1,Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_seq3:range(_@E1,_@E2)");

expr_do(Ctx, {eff_bool, Expr}) ->
   E = expr_do(Ctx, Expr),
   ?P("xqerl_operators:eff_bool_val(_@E)");
   
%#xqLogicalExpr
expr_do(Ctx, #xqLogicalExpr{comp = Op,
                            anno = Line,
                            lhs = Expr1,
                            rhs = Expr2}) ->
   _ = set_line(Line),
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   S1 = ?P("_@E1"),
   S2 = ?P("_@E2"),
   if Op =:= 'and' ->
         ?P("xqerl_operators:op_and(_@S1, fun() -> _@S2 end)");
      Op =:= 'or' ->
         ?P("xqerl_operators:op_or(_@S1, fun() -> _@S2 end)")
   end;

% instance of / castable
expr_do(Ctx, {instance_of,Expr1,Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_types:instance_of(_@E1,_@E2)");

expr_do(_Ctx, {castable_as,'empty-sequence',#xqSeqType{occur = one}}) -> 
   % bad empty cast
   abs_boolean(false);
expr_do(_Ctx, {castable_as,'empty-sequence',#xqSeqType{occur = zero_or_one}}) -> 
   % good empty cast
   abs_boolean(true);
expr_do(Ctx, {castable_as,Expr1,
              #xqSeqType{type = #qname{prefix = ?A("xs"),local_name = ?A("QName")}}}) ->
   expr_do(Ctx, {castable_as,Expr1,#xqSeqType{type = 'xs:QName'}});
expr_do(Ctx, {castable_as,Expr1,#xqSeqType{type = 'xs:QName'}}) -> 
   % namespace sensitive
   Namespaces = abs_ns_list(Ctx),
   E1 = expr_do(Ctx, Expr1),
   ?P("xqerl_types:castable(_@E1,'xs:QName',_@Namespaces)");
   %?P("xqerl_types:castable(_@E1,'xs:QName',_@Namespaces)");
expr_do(Ctx, {castable_as,Expr1,Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_types:castable(_@E1,_@E2)");

expr_do(Ctx, {cast_as,Expr1,
              #xqSeqType{type = #qname{prefix = ?A("xs"),local_name = ?A("QName")}}}) -> 
   expr_do(Ctx, {cast_as,Expr1,#xqSeqType{type = 'xs:QName'}});
expr_do(Ctx, {cast_as,Expr1,#xqSeqType{type = 'xs:QName'}}) -> 
   % namespace sensitive
   CtxVar = {var, ?L, get_context_variable_name(Ctx)},
   E1 = expr_do(Ctx, Expr1),
   ?P("xqerl_types:cast_as(_@E1,'xs:QName', maps:get(namespaces, _@CtxVar))");
expr_do(Ctx, {cast_as,Expr1,Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_types:cast_as(_@E1,_@E2)");

% atomize/promote bodies of functions
expr_do(Ctx, {promote_to, {atomize, #xqFunctionDef{body = Body} = Expr1},
              #xqSeqType{type = #xqFunTest{type = Expr2}}}) ->
   expr_do(Ctx, Expr1#xqFunctionDef{body = {promote_to, {atomize, Body}, Expr2}});
expr_do(Ctx, {promote_to, #xqFunctionDef{body = Body} = Expr1,
              #xqSeqType{type = #xqFunTest{type = Expr2}}}) ->
   expr_do(Ctx, Expr1#xqFunctionDef{body = {promote_to, Body, Expr2}});
expr_do(Ctx, {promote_to,Expr1,Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_types:promote(_@E1,_@E2)");

expr_do(Ctx, {check,Expr1,Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_types:check(_@E1,_@E2)");

expr_do(Ctx, #xqSeqType{type = #qname{local_name = Ln}} = ST) ->
   Atom = erlang:binary_to_atom(<<"xs:", Ln/binary>>, latin1),
   abs_seq_type(Ctx, ST#xqSeqType{type = Atom});
expr_do(Ctx, #xqSeqType{} = ST) ->
   abs_seq_type(Ctx, ST);

% node construction
% just for now
expr_do(Ctx, {content_expr, List}) when is_list(List) ->
   Exprs = lists:map(fun('empty-sequence') -> {nil,?L};
                        (E) ->
                           expr_do(Ctx, E)
                     end, List),
   abs_list(Exprs);
expr_do(Ctx, {content_expr, List}) ->
   expr_do(Ctx, {content_expr, [List]});

expr_do(Ctx, {Cons, Expr}) when Cons =:= direct_cons;
                                Cons =:= comp_cons ->
   C = {var,?L,get_context_variable_name(Ctx)},
   E = expr_do(Ctx, Expr),
   ?P("xqerl_node:new_fragment(_@C, _@E)");

expr_do(Ctx, {atomize, #xqFunctionDef{body = Body} = Expr1}) ->
   expr_do(Ctx, Expr1#xqFunctionDef{body = {atomize, Body}});

% atomize called on cardinality fun
expr_do(Ctx, {double,{'function-call', 
                       #xqFunctionDef{params = [A],
                                      body = {xqerl_mod_fn,Name,2}} = F
                      }
             }) 
   when Name == 'exactly-one';
        Name == 'zero-or-one';
        Name == 'one-or-more' ->
   expr_do(Ctx, {'function-call', F#xqFunctionDef{params = [{double, A}]}});
expr_do(Ctx, {atomize,{'function-call', 
                       #xqFunctionDef{params = [A],
                                      body = {xqerl_mod_fn,Name,2}} = F
                      }
             }) 
   when Name == 'exactly-one';
        Name == 'zero-or-one';
        Name == 'one-or-more' ->
   expr_do(Ctx, {'function-call', F#xqFunctionDef{params = [{atomize, A}]}});

expr_do(Ctx, {double, {path_expr,_Id,Steps}}) ->
   expr_do(Ctx, {path_expr,_Id,Steps ++ [double]});
expr_do(Ctx, {atomize, {path_expr,_Id,Steps}}) ->
   expr_do(Ctx, {path_expr,_Id,Steps ++ [atomize]});

expr_do(Ctx, {atomize, Expr}) ->
   E = expr_do(Ctx, Expr),
   ?P("xqerl_types:atomize(_@E)");
expr_do(Ctx, {double, Expr}) ->
   E = expr_do(Ctx, Expr),
   ?P("xqerl_types:cast_as(_@E, 'xs:double')");

% paths
%TODO move path expressions to local functions
% should take Base as the original context
expr_do(_,{path_expr,_,['empty-sequence'|_]}) ->
   {nil,?L};

%% Split path into simple and complex parts: 
%% Simple is path with only positional/easy predicates
%%  they send a fun to the document process 
%% Complex are joins and complex predicates  
%%  they call the document process per function 

%abs_path_expr(Ctx, {path_expr, Id, Steps})
expr_do(Ctx, {db_path_expr,_Id, _Steps} = P) ->
   %?dbg("db_path_expr",_Id),
   abs_path_expr(Ctx, P);

expr_do(Ctx, {path_expr,_Id, _Steps} = P) ->
   abs_path_expr(Ctx, P);







expr_do(Ctx, {root}) ->
   expr_do(Ctx, 'context-item');
expr_do(Ctx, {'any-root'}) ->
   expr_do(Ctx, 'context-item');

expr_do(Ctx, #xqDocumentNode{} = N) ->
   abs_document_node(Ctx, N);
expr_do(Ctx, #xqElementNode{} = N) ->
   abs_element_node(Ctx, N);
expr_do(Ctx, #xqAttributeNode{} = N) ->
   abs_attribute_node(Ctx, N);
expr_do(Ctx, #xqTextNode{} = N) ->
   abs_text_node(Ctx, N);
expr_do(Ctx, #xqCommentNode{} = N) ->
   abs_comment_node(Ctx, N);
expr_do(Ctx, #xqProcessingInstructionNode{} = N) ->
   abs_pi_node(Ctx, N);
expr_do(Ctx, #xqNamespace{} = N) ->
   abs_namespace_node(Ctx, N);
expr_do(Ctx, #xqNamespaceNode{} = N) ->
   abs_namespace_node(Ctx, N);

% some, every == lists: any, all
expr_do(Ctx, {Op,Vars,Test}) when Op =:= every;
                                  Op =:= some ->
   % add the variables to the stack
   VarNames = [{[],[],[],local_variable_name(Id)} || #xqVar{id = Id} <- Vars],
   VarTup = get_variable_tuple(Ctx, VarNames),
   
   Fun = fun(#xqVar{id = Id,
                    name = Name,
                    type = Type,
                    expr = Expr}, Ctx1) ->
               VarName = local_variable_name(Id),
               Ctx2 = add_variable({Name,Type,[],VarName}, Ctx1),
               E = expr_do(Ctx1, Expr),
               {{generate,?L,
                  {var,?L,VarName}, ?P("xqerl_seq3:to_list(_@E)")},
                Ctx2}
         end,
   {Gens,Ctx3} = lists:mapfoldl(Fun, Ctx,Vars),
   F = case Op of
          every -> ?Q("lists:all");
          some ->  ?Q("lists:any")
       end,
   E = expr_do(Ctx3, Test),
   ?P([" _@F(fun(_@VarTup) ->",
       "    xqerl_operators:eff_bool_val(_@E)",
       " end,[_@VarTup || _@Gens])"]);

% ordering
%% expr_do(Ctx, {'function-call', 
%%               #qname{namespace = ?FN,
%%                      local_name = ?A("unordered")}, 1, Args}) ->
%%    expr_do(Ctx, {'unordered-expr', Args});
expr_do(_Ctx, {'unordered-expr', 'empty-expr'}) -> ?err('XPST0003', ?LN);
expr_do(Ctx, {'unordered-expr', Expr}) ->
   % new context to unordered
   % run expression with new context
   % continue with old context
   C = {var,?L,get_context_variable_name(Ctx)},
   NextCtx = next_ctx_var_name(),
   Ctx1 = set_context_variable_name(Ctx, NextCtx),
   V = {var,?L,NextCtx},
   S3 = expr_do(Ctx1, Expr),
   ?P("begin _@V = xqerl_context:set_ordering_mode(_@C,unordered), _@S3 end");

expr_do(_Ctx, {'ordered-expr', 'empty-expr'}) -> ?err('XPST0003', ?LN);
expr_do(Ctx, {'ordered-expr', Expr}) ->
   % new context to ordered
   % run expression with new context
   % continue with old context
   C = {var,?L,get_context_variable_name(Ctx)},
   NextCtx = next_ctx_var_name(),
   Ctx1 = set_context_variable_name(Ctx, NextCtx),
   V = {var,?L,NextCtx},
   S3 = expr_do(Ctx1, Expr),
   ?P("begin _@V = xqerl_context:set_ordering_mode(_@C,ordered), _@S3 end");

% position replacement
expr_do(#{position_variable := PosVar}, 
        {'function-call', #xqFunctionDef{body = {xqerl_mod_fn,position,_}}}) ->
   ?P("_@PosVar");
expr_do(#{size_variable := {var,_,_} = SizeVar}, 
        {'function-call', #xqFunctionDef{body = {xqerl_mod_fn,last,_}}}) ->
   ?P("(_@SizeVar)()");
expr_do(#{size_variable := SizeVar}, 
        {'function-call', #xqFunctionDef{body = {xqerl_mod_fn,last,_}}}) ->
   ?P("_@SizeVar");
% 'lang' call on context item
expr_do(#{context_variable := _} = Ctx, 
        {'function-call', #xqFunctionDef{params = [A], 
                                         body = {xqerl_mod_fn,lang,2}} = FC}) ->
   expr_do(Ctx,{'function-call', 
                FC#xqFunctionDef{params = [A,'context-item'], 
                                 body = {xqerl_mod_fn,lang,3}}});
% magic functions that automatically use the context item
expr_do(#{context_variable := _} = Ctx, 
        {'function-call', #xqFunctionDef{body = {xqerl_mod_fn,Fn,1}} = FC})
   when Fn == 'node-name';        Fn == 'nilled';
        Fn == 'string';           Fn == 'data';
        Fn == 'base-uri';         Fn == 'document-uri';
        Fn == 'number';           Fn == 'normalize-space';
        Fn == 'string-length';    Fn == 'name';
        Fn == 'local-name';       Fn == 'namespace-uri';
        Fn == 'root';             Fn == 'path';
        Fn == 'has-children';     Fn == 'generate-id' -> 
   expr_do(Ctx,{'function-call', 
                FC#xqFunctionDef{params = ['context-item'], 
                                 body = {xqerl_mod_fn,Fn,2}}});

%% expr_do(Ctx0, 
%%         {'function-call', #xqFunctionDef{body = {xqerl_mod_fn,'function-lookup',4}} = FC}) ->
%%    Ctx = clear_context_variables(Ctx0),
%%    expr_do(Ctx,{'function-call', FC});

%% special case spawn_
expr_do(Ctx, {'function-call', #xqFunctionDef{params = Params, 
                                              body = {xqerl_mod_actor,spawn_,_A}}}) ->
   NextCtxVar = next_ctx_var_name(),
   Ctx1 = set_context_variable_name(Ctx, NextCtxVar),
   CtxName = {var,?L,get_context_variable_name(Ctx)},
   Ctx1Name = {var,?L,get_context_variable_name(Ctx1)},
   NewArgs = lists:map(fun(P) ->
                             expr_do(Ctx1,P)
                       end, Params),
   ?P("begin _@Ctx1Name = _@CtxName#{parent => erlang:self()}, xqerl_mod_actor:spawn_(_@Ctx1Name,_@@NewArgs) end");
expr_do(Ctx, {'function-call', #xqFunctionDef{params = Params, 
                                              body = {M,F,_A}}}) when is_atom(M),
                                                                   is_atom(F) ->
   CtxName = {var,?L,get_context_variable_name(Ctx)},
   NewArgs = lists:map(fun(P) ->
                             expr_do(Ctx,P)
                       end, Params),
   ?P("'@M@':'@F@'(_@CtxName,_@@NewArgs)");

expr_do(_Ctx, #xqFunctionDef{annotations = Annos, 
                             name = Name, 
                             arity = Ay, 
                             params = Params,
                             type = Type,
                             body = {xqerl_mod_fn,concat,_},
                             anno = Line}) ->
   _ = set_line(Line),
   _ = add_used_record_type(xqFunction),
   ?P(["#xqFunction{annotations = _@Annos@," 
       "            name = _@Name@," 
       "            arity = _@Ay@," 
       "            params = _@Params@,"
       "            type = _@Type@,"
       "            body = fun xqerl_mod_fn:concat/2}"]);
expr_do(Ctx, #xqFunctionDef{annotations = Annos, 
                            name = Name, 
                            arity = Ay, 
                            params = Params,
                            type = Type,
                            body = {promote_to, {M,F,_}, OtherType},
                            anno = Line}) ->
   _ = set_line(Line),
   _ = add_used_record_type(xqFunction),
   TA = expr_do(Ctx, OtherType),
   CtxVar = context_map_abs(Ctx), 
   Fun = if Ay > 0 ->
               DArgs = [{var,?L,list_to_atom("P__"++integer_to_list(I))} ||
                        I <- lists:seq(1, Ay)],
               ?P("fun(_,_@@DArgs) -> xqerl_types:promote('@M@':'@F@'(_@CtxVar,_@@DArgs),_@TA) end");
            true ->
               ?P("fun(_) -> xqerl_types:promote('@M@':'@F@'(_@CtxVar),_@TA) end")
         end,
   ?P(["#xqFunction{annotations = _@Annos@," 
       "            name = _@Name@," 
       "            arity = _@Ay@," 
       "            params = _@Params@,"
       "            type = _@Type@,"
       "            body = _@Fun}"]);

expr_do(Ctx, #xqFunctionDef{annotations = Annos, 
                            name = Name, 
                            arity = Ay, 
                            params = Params,
                            type = Type,
                            body = {M,F,_},
                            anno = Line}) ->
   _ = set_line(Line),
   _ = add_used_record_type(xqFunction),
   CtxVar = context_map_abs(Ctx), 
   Fun = if Ay > 0 ->
               DArgs = [{var,?L,list_to_atom("P__"++integer_to_list(I))} ||
                        I <- lists:seq(1, Ay)],
               ?P("fun(_,_@@DArgs) -> '@M@':'@F@'(_@CtxVar,_@@DArgs) end");
            true ->
               ?P("fun(_) -> '@M@':'@F@'(_@CtxVar) end")
         end,
   ?P(["#xqFunction{annotations = _@Annos@," 
       "            name = _@Name@," 
       "            arity = _@Ay@," 
       "            params = _@Params@,"
       "            type = _@Type@,"
       "            body = _@Fun}"]);

expr_do(Ctx, #xqFunctionDef{annotations = Annos, 
                            name = Name, 
                            arity = Ay, 
                            params = Params,
                            type = Type,
                            body = {F,_},
                            anno = Line}) ->
   _ = set_line(Line),
   _ = add_used_record_type(xqFunction),
   CtxVar = context_map_abs(Ctx), 
   Fun = if Ay > 0 ->
               DArgs = [{var,?L,list_to_atom("P__"++integer_to_list(I))} ||
                        I <- lists:seq(1, Ay)],
               ?P("fun(_,_@@DArgs) -> '@F@'(_@CtxVar,_@@DArgs) end");
            true ->
               ?P("fun(_) -> '@F@'(_@CtxVar) end")
         end,
   ?P(["#xqFunction{annotations = _@Annos@," 
       "            name = _@Name@," 
       "            arity = _@Ay@," 
       "            params = _@Params@,"
       "            type = _@Type@,"
       "            body = _@Fun}"]);

expr_do(Ctx, {'function-call', #xqFunctionDef{params = Params, 
                                              body = {F,_A},
                                              anno = Line}}) ->
   _ = set_line(Line),
   CtxName = {var,?L,get_context_variable_name(Ctx)},
   NewArgs = lists:map(fun(P) ->
                             expr_do(Ctx,P)
                       end, Params), 
   ?P("'@F@'(_@CtxName,_@@NewArgs)");

expr_do(Ctx, {'anon-call', #xqFunctionDef{params = {P1,OldP1},
                                          body = #xqFunctionDef{params = P2,
                                                                body = B2},
                                          anno = Line}}) ->
   _ = set_line(Line),
   CtxVar = get_context_variable_name(Ctx),
   PFun = fun(#xqVar{id = ID, 
                     name = #qname{} = Name,
                     type = Type, 
                     annotations = Annos}, Map) ->
                VarName = list_to_atom(lists:concat([param_prefix(), ID])),
                %% {name,type,annos,Name}
                NewMap = add_param({Name,Type,Annos,VarName}, Map),
                {{var,?L,VarName}, NewMap};
             (X,Map) ->
               X1 = expr_do(Ctx,X),
               {X1,Map}
          end,
   {P1_1,Ctx2} =  lists:mapfoldl(PFun, Ctx, P1),
   {P1_2,Ctx3} =  lists:mapfoldl(PFun, Ctx2, OldP1),
   P2_1 = lists:map(fun(P) ->
                             expr_do(Ctx3,P)
                       end, P2),
   B2_1 = alist(expr_do(Ctx3, B2)),
   CtxVar1 = {var,?L,CtxVar},
   ?P(["fun (_@CtxVar1,_@@P1_1) -> ",
       "   fun(_@CtxVar1,_@@P1_2) -> _@@B2_1 end(_@CtxVar1,_@@P2_1)",
       "end"]);

% list 
expr_do(Ctx, {expr,[Sing]}) ->
   expr_do(Ctx, Sing);
expr_do(Ctx, {expr,List}) when is_list(List) ->
   Exprs = lists:map(fun(E) ->
                           expr_do(Ctx, E)
                     end, List),
   abs_list(Exprs);

expr_do(Ctx, {expr,E}) ->
   expr_do(Ctx, E);

expr_do(Ctx, {sequence,List}) ->
   Exprs = lists:flatmap(
             fun('empty-sequence') -> [];
                ({sequence,SList}) -> % flatten sequences
                   alist(expr_do(Ctx, SList));
                (E) ->
                   alist(expr_do(Ctx, E))
             end, List),
   from_list_to_seq(Exprs);
%% expr_do(Ctx, {sequence,List}) ->
%%    Exprs = lists:map(fun('empty-sequence') -> {nil,?L};
%%                         (E) ->
%%                            expr_do(Ctx, E)
%%                      end, List),
%%    from_list_to_seq(Exprs);

expr_do(_Ctx, []) ->
    {nil,?L};


%% expr_do(#{in_local_fun := true} = Ctx, {variable, {Name,1}}) when is_atom(Name) ->
expr_do(Ctx, {variable, {Name,1}}) when is_atom(Name) ->
   M = {var,?L,get_context_variable_name(Ctx)},
   ?P("maps:get('@Name@',_@M)");
expr_do(Ctx, {variable, {Mod,Name}}) when is_atom(Mod),is_atom(Name) ->
   a_var({Mod,Name},{var,?L,get_context_variable_name(Ctx)});
expr_do(_Ctx, {variable, Name}) when is_atom(Name) ->
   V = {var,?L,Name},
   case atom_to_list(Name) of
      "__AddlVar" ++ _ ->
         ?P("xqerl_lib:format_stacktrace(_@V)");
      _ ->
         V
   end;

expr_do(Ctx, {postfix,_Id, {'function-ref',Q,V}, [{arguments,Args}]}) ->
   PhF = fun('?') ->
               VarName = next_var_name(),
               [{var,?L,VarName}];
            (_) ->
               []
         end,
   PlaceHolders = lists:flatmap(PhF, Args),
   NwF = fun('?',PHs) ->
               {hd(PHs),tl(PHs)};
            (Arg,PHs) ->
               {Arg,PHs}
         end,
   {NewArgs, _Empty} = lists:mapfoldl(NwF, PlaceHolders, Args),
   ArF = fun({var,_,_} = Arg) ->
               Arg;
            (Arg) ->
               expr_do(Ctx, Arg)
         end,
   ArgAbs = lists:map(ArF, NewArgs),
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   NextVar = {var,?L,next_var_name()},
   E1 = expr_do(Ctx, {'function-ref',Q,V}),
   if PlaceHolders =:= [] ->
         ?P("begin _@NextVar = _@E1, _@NextVar(_@CtxVar,_@@ArgAbs) end");
      true -> % has placeholders, so only a ref to new function
         ?P("fun(_@CtxVar,_@@PlaceHolders) -> 
                _@NextVar = _@E1, _@NextVar(_@CtxVar,_@@ArgAbs) end")
   end;

% map/array unary lookups
expr_do(Ctx, {postfix,_Id, Map, [{LU, {sequence,_} = Val}]}) 
   when LU =:= array_lookup;
        LU =:= map_lookup ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   MapExpr = expr_do(Ctx, Map),
   ValExp =  expr_do(Ctx, Val),
   ?P("xqerl_operators:lookup(_@CtxVar,_@MapExpr,_@ValExp)");
expr_do(Ctx, {postfix,_Id, Map, [{LU, wildcard}]})
   when LU =:= array_lookup;
        LU =:= map_lookup ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   MapExpr = expr_do(Ctx, Map),
   ?P("xqerl_operators:lookup(_@CtxVar,_@MapExpr,all)");
expr_do(Ctx, {postfix,_Id, Map, [{LU, Val}]})
   when LU =:= array_lookup;
        LU =:= map_lookup ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   MapExpr = expr_do(Ctx, Map),
   ValExp =  expr_do(Ctx, Val),
   ?P("xqerl_operators:lookup(_@CtxVar,_@MapExpr,_@ValExp)");
expr_do(Ctx, {LU, all}) 
   when LU =:= array_lookup;
        LU =:= map_lookup ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   MapExpr = expr_do(Ctx, 'context-item'),
   ?P("xqerl_operators:lookup(_@CtxVar,_@MapExpr,all)");
expr_do(Ctx, {LU, wildcard})
   when LU =:= array_lookup;
        LU =:= map_lookup ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   MapExpr = expr_do(Ctx, 'context-item'),
   ?P("xqerl_operators:lookup(_@CtxVar,_@MapExpr,all)");
expr_do(Ctx, {LU, Val}) 
   when LU =:= array_lookup;
        LU =:= map_lookup ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   MapExpr = expr_do(Ctx, 'context-item'),
   ValExp = expr_do(Ctx, Val),
   ?P("xqerl_operators:lookup(_@CtxVar,_@MapExpr,_@ValExp)");

expr_do(Ctx, {postfix,_Id, Base, Preds}) when is_list(Preds) ->
   % flag that ctx item is accessible
   Source = expr_do(Ctx#{in_pred => true}, Base), 
   lists:foldl(fun(Val, Abs) ->
                     handle_predicate({Ctx, Val}, Abs)
               end, Source, Preds);

% node sequences
expr_do(Ctx, {'intersect', Expr1, Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_seq3:intersect(_@E1,_@E2)");
expr_do(Ctx, {'union', Expr1, Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_seq3:union(_@E1,_@E2)");
expr_do(Ctx, {'except', Expr1, Expr2}) ->
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   ?P("xqerl_seq3:except(_@E1,_@E2)");

expr_do(Ctx, #xqVarRef{name = Name}) ->
   %?dbg("Loc",Name),
   {V,_} = get_variable_ref(Name, Ctx),
   V;

expr_do(Ctx, {'switch', RootExpr, [Cases, {'default', DefaultExpr}]}) ->
   RootVar = {var,?L,next_var_name()},
   RootExpr1 = {ensure,RootExpr,#xqSeqType{type = item, occur = zero_or_one}},
   E1 = expr_do(Ctx,RootExpr1),
   Atom = ?P("xqerl_types:atomize(_@E1)"),
   Value = ?P("xqerl_types:value(_@Atom)"),
   RootVarSet = ?P("_@RootVar = _@Value"),
   DefaultRet = alist(expr_do(Ctx,DefaultExpr)),
   % cases are {[MatchExprs], {return, ReturnExpr}}
   OFold = 
     fun({MatchExprs,{return, ReturnExpr}},Abs) ->
           MatchExprs2 = if MatchExprs == [] -> [[]];
                            true -> MatchExprs
                         end,
           ReturnAbs = expr_do(Ctx, ReturnExpr),
           %% TODO change this to lists:any/2 of deep-equal matches
           %% The match should be using the default collation
           IFold = fun(MatchExpr, Abs1) ->
                         Var = {var,?L,next_var_name()},
                         MatchExpr1 = expr_do(Ctx, 
                           {ensure,MatchExpr,
                            #xqSeqType{type = item, occur = zero_or_one}}),
                         Atom1 = ?P("xqerl_types:atomize(_@MatchExpr1)"),
                         Value1 = ?P("xqerl_types:value(_@Atom1)"),
                         ?P("_@Var = _@Value1, 
                             if _@RootVar == _@Var -> _@ReturnAbs;
                                true -> _@Abs1 end")
                   end,
           lists:foldr(IFold, Abs, MatchExprs2)
     end,
   
   IfStatements = (catch lists:foldr(OFold, DefaultRet, Cases)),
   ?P("begin _@RootVarSet, _@@IfStatements end");

expr_do(Ctx, {'typeswitch', RootExpr, CasesDefault}) ->
   CaseVar = {var,?L,next_var_name()},
   Root = expr_do(Ctx,RootExpr),
   True = abs_boolean(true),
   ExpF = fun({'case-var',{'types', Types},XqVar}) ->
                lists:map(fun(Type) -> 
                                {'case-var',{'type', Type}, XqVar} 
                          end, Types);
             ({'case-novar',{'types', Types},XqVar}) ->
                lists:map(fun(Type) ->
                                {'case-novar',{'type', Type}, XqVar}
                          end, Types);
             (Def) ->
                [Def]
          end,
   ExpandedCases = lists:flatmap(ExpF, CasesDefault),
   CaseF = fun({'case-novar',{'type', Type},{return,RetExpr}}, Acc) ->
                 AType = abs_seq_type(Ctx,Type),
                 R1 = expr_do(Ctx, RetExpr),
                 ?P(["case xqerl_types:instance_of(_@CaseVar,_@AType) of",
                     " _@True -> _@R1;",
                     " _ -> _@Acc end"]);
              ({'case-var',{'type', Type},#xqVar{id = Id, 
                                                 name = Name, 
                                                 expr = RetExpr}}, Acc) ->
                 AType = abs_seq_type(Ctx,Type),
                 VarName = local_variable_name(Id),
                 NewVar  = {Name,Type,[],VarName},
                 NewCtx  = add_variable(NewVar, Ctx),
                 R1 = expr_do(NewCtx, RetExpr),
                 VarName1 = {var,?L,VarName},
                 ?P(["case xqerl_types:instance_of(_@CaseVar,_@AType) of",
                     " _@True -> _@VarName1 = _@CaseVar, _@R1;",
                     " _ -> _@Acc end"]);
              ({'def-var',#xqVar{id = Id, 
                                 name = Name, 
                                 type = Type, 
                                 expr = RetExpr}}, _Acc) ->
                 VarName = local_variable_name(Id),
                 NewVar  = {Name,Type,[],VarName},
                 NewCtx  = add_variable(NewVar, Ctx),
                 R1 = expr_do(NewCtx, RetExpr),
                 VarName1 = {var,?L,VarName},
                 ?P("_@VarName1 = _@CaseVar, _@R1");
              ({'def-novar',{return,RetExpr}}, _Acc) ->
                 alist(expr_do(Ctx, RetExpr))
           end,
   CaseNestExprs = lists:foldr(CaseF, [{nil,?L}], ExpandedCases),
   ?P("begin _@CaseVar = _@Root, _@@CaseNestExprs end");

expr_do(Ctx, {'if-then-else', If, Then, Else}) ->
   IfSt = expr_do(Ctx, If),
   True = expr_do(Ctx, Then),
   False = expr_do(Ctx, Else),
   ?P(["case xqerl_seq3:singleton_value(_@IfSt) of",
       "   true -> _@True; ",
       "_ -> _@False end"]);

expr_do(Ctx, #xqComparisonExpr{anno = Line,
                               comp = Op,
                               lhs = Expr1,
                               rhs = Expr2}) ->
   _ = set_line(Line),
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   if Op =:= '='; Op =:= '!=';
      Op =:= '>'; Op =:= '>=';
      Op =:= '<'; Op =:= '<=' ->
         ?P("xqerl_operators:general_compare('@Op@',_@E1,_@E2)");
      %xqerl_context:get_default_collation(Ctx)
      Op =:= 'eq' -> ?P("xqerl_operators:equal(_@E1,_@E2)");
      Op =:= 'ne' -> ?P("xqerl_operators:not_equal(_@E1,_@E2)");
      Op =:= 'gt' -> ?P("xqerl_operators:greater_than(_@E1,_@E2)");
      Op =:= 'ge' -> ?P("xqerl_operators:greater_than_eq(_@E1,_@E2)");
      Op =:= 'lt' -> ?P("xqerl_operators:less_than(_@E1,_@E2)");
      Op =:= 'le' -> ?P("xqerl_operators:less_than_eq(_@E1,_@E2)");
      Op =:= '<<' -> ?P("xqerl_operators:node_before(_@E1,_@E2)");
      Op =:= '>>' -> ?P("xqerl_operators:node_after(_@E1,_@E2)");
      Op =:= 'is' -> ?P("xqerl_operators:node_is(_@E1,_@E2)")
   end;

expr_do(Ctx, #xqArithExpr{op = Op,
                          lhs = Expr1,
                          rhs = Expr2,
                          anno = Line}) ->
   _ = set_line(Line),
   E1 = expr_do(Ctx, Expr1),
   E2 = expr_do(Ctx, Expr2),
   if Op =:= '+' -> ?P("xqerl_operators:add(_@E1,_@E2)");
      Op =:= '-' -> ?P("xqerl_operators:subtract(_@E1,_@E2)");
      Op =:= '*' -> ?P("xqerl_operators:multiply(_@E1,_@E2)");
      Op =:= 'div' -> ?P("xqerl_operators:divide(_@E1,_@E2)");
      Op =:= 'mod' -> ?P("xqerl_operators:modulo(_@E1,_@E2)");
      Op =:= 'idiv' -> ?P("xqerl_operators:idivide(_@E1,_@E2)")
   end;

expr_do(Ctx, {'unary', '-', Expr1}) ->
   E1 = expr_do(Ctx, Expr1),
   ?P("xqerl_operators:unary_minus(_@E1)");
expr_do(Ctx, {'unary', '+', Expr1}) ->
   E1 = expr_do(Ctx, Expr1),
   ?P("xqerl_operators:unary_plus(_@E1)");

expr_do(_Ctx, 'empty-sequence') -> {nil,?L};
expr_do(_Ctx, 'empty-expr') -> {nil,?L};

% each position of the flwor is put in its own function.
% every function is a body call to the next section and tail to self.
expr_do(Ctx, #xqFlwor{id = RetId, loop = Loop, return = Return, anno = Line}) ->
   Ctx1 = Ctx#{grp_variables => []}, % Clear any grouping variables
   VarTup = get_variable_tuple_name(Ctx1),
   %% find when variables are used last
   Rems = scan_variable_usage(Loop, Return),
   {_NewCtx,In,Out} = flwor(Ctx1, Loop, {RetId, Line}, Return, [], [],VarTup, false, Rems),
   add_global_funs(Out),
   %?P("(begin _@In end)");
   ?P("xqerl_seq3:flatten(begin _@In end)");

expr_do(Ctx, [Sing]) ->
   expr_do(Ctx, Sing);
expr_do(Ctx, List) when is_list(List) ->
   Exprs = lists:map(fun(E) ->
                           expr_do(Ctx, E)
                     end, List),
   abs_list(Exprs);

% steps
expr_do(Ctx, #xqAxisStep{} = Step) ->
   Base = expr_do(Ctx, 'context-item'),
   S = step_expr_do(Ctx, [Step], Base),
   ?P("begin _@S end");

expr_do(_Ctx, <<>>) ->
   ?Q("<<>>");
expr_do(_Ctx, true) -> ?Q("true");
expr_do(_Ctx, false) -> ?Q("false");

% catch-all
expr_do(_Ctx, Expr) ->
   ?dbg("TODO", Expr),
   {nil,?L}.


%% path_expr_do : here recursivly try to compile simple steps together
% and jump out to do one step at a time (step_expr_do) if complex  
% entire path expression goes in a global function, so no need
% to wrap in begin/end
path_expr_do(Ctx0, {_PathExpr, _Id, [ Base | Steps ]}) ->
   Ctx = clear_context_variables(Ctx0),
   CtxItems = 
     case Base of
        'context-item' -> % get context item
           expr_do(Ctx0, 'context-item');
        {'any-root'} -> % get root of context item
           expr_do(Ctx0, 'context-item');
        {'root'} -> % get root of context item
           step_expr_do(Ctx, [Base], expr_do(Ctx0, 'context-item'));
        {postfix,_,_,_} -> % use old context item
           expr_do(Ctx0, {expr, Base});
        #xqAxisStep{} -> % use old context item, 
           expr_do(Ctx0, {expr, Base});
        {variable,Var} ->
            CurrCtxVar = {var, ?L, get_context_variable_name(Ctx0)},
            a_var(Var, CurrCtxVar);           
        _ ->
           %?dbg("Base", Base),
           expr_do(Ctx, {expr, Base})
     end,

   CtxVar = {var, ?L, 'InitCtxItem'},
   % document order ensures this is a list of XML nodes
   case Steps of
      [] when is_record(Base, xqAxisStep) -> % already doc ordered
         ?P(["_@CtxItems"]);
      [] ->
         ?P(["case xqldb_xpath:document_order(begin  _@CtxItems end) of",
                " {error, non_node} -> erlang:exit(xqerl_error:error('XPTY0019'));",
                " C -> C end"]);
      _ ->
         CtxSeq = ?P(["InitCtxItem = begin _@CtxItems end"]), % steps will order it
%%          CtxSeq = ?P(["InitCtxItem = case xqldb_xpath:document_order(begin _@CtxItems end) of",
%%                 " {error, non_node} -> erlang:exit(xqerl_error:error('XPTY0019'));",
%%                 " C -> C end"]),
         [CtxSeq | compile_path_statement(Ctx, CtxVar, Steps)]
   end.



step_expr_do(_, [continue], SourceVar) ->
   % continue triggers that this statement will be used as 
   % the context for another statement
   SourceVar;
step_expr_do(_, [], SourceVar) ->
   O = ?P("_@SourceVar"),
   alist(O);
step_expr_do(_, [atomize], SourceVar) -> 
   DocVar = {var,?L,next_var_name()},
   O = ?P([" xqerl_seq3:path_map(",
       "      fun(_@DocVar,_,_) ->",
       "             xqerl_types:atomize(_@DocVar)",
       "      end, _@SourceVar)"       
      ]),
   alist(O);
step_expr_do(_, [double], SourceVar) -> 
   DocVar = {var,?L,next_var_name()},
   O = ?P([" xqerl_seq3:path_map(",
       "      fun(_@DocVar,_,_) ->",
       "             xqerl_types:cast_as(_@DocVar, 'xs:double')",
       "      end, _@SourceVar)"       
      ]),
   alist(O);
step_expr_do(Ctx, [Step1|Rest], SourceVar) when Step1 == {'root'};
                                                Step1 == {'any-root'} ->
   CurrCtxVar = {var,?L,get_context_variable_name(Ctx)},
   NextVar = {var,?L,next_var_name()},
   PosVar = {var,?L,next_var_name()},
   SizVar = {var,?L,next_var_name()},
   NodeVar = {var,?L,next_var_name()},
   R1 = alist(step_expr_do(Ctx, Rest, NextVar)),
   O1 = ?P([" _@NextVar = xqerl_seq3:path_map(",
            "      fun(#{nk := document} = _@NodeVar,_@PosVar,_@SizVar) ->",
            "              _@NodeVar",
            "        ;(#{nk := _} = _@NodeVar,_@PosVar,_@SizVar) ->",
            "              erlang:exit(xqerl_error:error('XPDY0050'))",
            "        ;(_,_,_) -> erlang:exit(xqerl_error:error('XPTY0019'))",
            "      end, xqerl_mod_fn:root(_@CurrCtxVar, _@SourceVar))"
           ]), 
   [O1|R1];
% empty predicates so no context item needs to be set
step_expr_do(Ctx, [#xqAxisStep{predicates = []} = Step1|Rest], SourceVar) ->
%?dbg("SourceVar",SourceVar),
   NextVar = {var,?L,next_var_name()},
   TempVar = {var,?L,next_var_name()},
   NodeVar = {var,?L,next_var_name()},
   ErrVar = {var,?L,next_var_name()},
   NextCtxVar = next_ctx_var_name(),
   Ctx1 = set_context_variable_name(Ctx, NextCtxVar),
   E1 = step_expr_do(Ctx1, Step1, NodeVar),
   R1 = alist(step_expr_do(Ctx, Rest, NextVar)),
   O1 = ?P([" _@NextVar = ",
            "case catch xqldb_xpath:document_order(lists:append([_@E1 || _@NodeVar <- xqerl_seq3:sequence(_@SourceVar)]))",
            "of {'EXIT',{function_clause,_}} -> erlang:exit(xqerl_error:error('XPTY0019')); ",
            "{'EXIT',_@ErrVar} -> erlang:exit(_@ErrVar); ",
            "_@TempVar -> _@TempVar end"
           ]), 
   [O1|R1];
step_expr_do(Ctx, [Step1|Rest], SourceVar) -> % stepping on an unknown
   CurrCtxVar = {var,?L,get_context_variable_name(Ctx)},
   NextVar = {var,?L,next_var_name()},
   PosVar = {var,?L,next_var_name()},
   SizVar = {var,?L,next_var_name()},
   NodeVar = {var,?L,next_var_name()},
   NextCtxVar = next_ctx_var_name(),
   NextCtxVVar = {var,?L,NextCtxVar},
   Ctx1 = set_context_variable_name(Ctx, NextCtxVar),
   E1 = step_expr_do(Ctx1, Step1, NodeVar),
   R1 = alist(step_expr_do(Ctx, Rest, NextVar)),
   O1 = ?P([" _@NextVar = xqerl_seq3:path_map(",
            "      fun(#{nk := _} = _@NodeVar,_@PosVar,_@SizVar) ->",
            "              _@NextCtxVVar = xqerl_context:set_context_item(_@CurrCtxVar,_@NodeVar,_@PosVar,_@SizVar),",
            "             _@E1",
            "        ;(_,_,_) -> erlang:exit(xqerl_error:error('XPTY0019'))",
            "      end, _@SourceVar)"
           ]),
   if is_list(O1) ->
         O1 ++ R1;
      true ->
         [O1|R1]
   end;
step_expr_do(Ctx, #xqAxisStep{} = As, SourceAbs) ->
   do_axis_step(Ctx, SourceAbs, As);
step_expr_do(Ctx, Other, _) ->
   expr_do(Ctx, Other).

% return clause end loop and returns {NewCtx,Internal,Global}
flwor(Ctx, [], {RetId, RetLn}, Return, Internal, Global,TupleVar,true, _) ->
   {NewCtx,FunAbs} = return_part(Ctx, {RetId, RetLn, Return},false),
   NewCtx1 = set_variable_tuple_name(NewCtx, TupleVar),
   {NewCtx1,Internal,FunAbs ++ Global};
flwor(Ctx, [], {RetId, RetLn}, Return, Internal, Global,TupleVar,_Inline, _) ->
   FunctionName = glob_fun_name({return,RetId}),
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   NextTupleVar = next_var_tuple_name(),
   {NewCtx,FunAbs} = return_part(Ctx, {RetId, RetLn, Return},true),
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   Call = [?P("'@FunctionName@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInt = Internal ++ Call,
   %?dbg("FunAbs",FunAbs),
   {NewCtx1,NewInt,FunAbs ++ Global};

% (for|let)/return
flwor(Ctx, [{Curr,_,_} = F], {RetId, _} = Ret, Return, Internal, Global,TupleVar,Inline, [Rem|Rems]) 
   when Curr =:= 'let';
        Curr =:= 'for' ->
   IsList = if Internal =:= [] ->
                  false;
               Inline =:= false ->
                  true;
               true ->
                  false
            end,
   Vars = case get_variable_tuple(Ctx) of
             {nil,_} -> {atom,?L,new};
             O -> O
          end,
   NextTupleVar = if TupleVar =:= [];
                     Inline =:= false ->
                        {var,?L,next_var_tuple_name()};
                     true ->
                        TupleVar
                  end,
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name(F),
   NextFun = glob_fun_name({return, RetId}),
   {NewCtx,FunAbs} = if Curr =:= 'let' ->
                           let_part(Ctx, F, NextFun, IsList, Rem);
                        true ->
                           for_loop(Ctx, F, NextFun, IsList, Rem)
                     end,
   Call1 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,_@@Vars)")],
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = if Internal =:= [] ->
                       Internal ++ Call1;
                    Inline =:= false ->
                       Internal ++ Call2;
                    true ->
                       Internal
                 end,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, [], Ret, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,true,Rems);

% for/let
flwor(Ctx, [{Curr,_,_} = F,{Next,_,_} = N|T], RetId, Return, Internal, 
      Global,TupleVar,Inline,[Rem|Rems]) 
   when Curr == 'let' andalso Next == 'let';
        Curr == 'let' andalso Next == 'for';
        Curr == 'for' andalso Next == 'let';
        Curr == 'for' andalso Next == 'for' ->
   IsList = if Internal =:= [] ->
                  false;
               Inline =:= false ->
                  true;
               true ->
                  false
            end,
   Vars = case get_variable_tuple(Ctx) of
             {nil,_} -> {atom,?L,new};
             O -> O
          end,
   NextTupleVar = if TupleVar =:= [];
                     Inline =:= false ->
                        {var,?L,next_var_tuple_name()};
                     true ->
                        TupleVar
                  end,
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name(F),
   NextFun = glob_fun_name(N),
   {NewCtx,FunAbs} = if Curr =:= 'let' ->
                           let_part(Ctx, F, NextFun, IsList, Rem);
                        true ->
                           for_loop(Ctx, F, NextFun, IsList, Rem)
                     end,
   Call1 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,_@@Vars)")],
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = if Internal =:= [] ->
                       Internal ++ Call1;
                    Inline =:= false ->
                       Internal ++ Call2;
                    true ->
                       Internal
                 end,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, [N|T], RetId, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,true,Rems);

% for/other
flwor(Ctx, [{Curr,_,_} = F|T], RetId, Return, Internal, Global,TupleVar,Inline,[Rem|Rems]) 
   when Curr =:= 'let';
        Curr =:= 'for' ->
   Vars = case get_variable_tuple(Ctx) of
             {nil,_} -> {atom,?L,new};
             O -> O
          end,
   NextTupleVar = if TupleVar =:= [];
                     Inline =:= false ->
                        {var,?L,next_var_tuple_name()};
                     true ->
                        TupleVar
                  end,
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name(F),
   {NewCtx,FunAbs} = if Curr =:= 'let' ->
                           let_part(Ctx, F, [], not Inline andalso Internal =/= [], Rem);
                        true ->
                           for_loop(Ctx, F, [], not Inline andalso Internal =/= [], Rem)
                     end,
   Call1 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,_@@Vars)")],
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = if Internal =:= [] ->
                       Internal ++ Call1;
                    Inline =:= false ->
                       Internal ++ Call2;
                    true ->
                       Internal
                 end,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, T, RetId, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,false,Rems);

flwor(Ctx, [#xqWindow{win_variable = #xqVar{id = Id}} = F|T], RetId, 
      Return, Internal, Global,TupleVar,Inline,[Rem|Rems]) ->
   Vars = case get_variable_tuple(Ctx) of
             {nil,_} -> {atom,?L,new};
             O -> O
          end,
   NextTupleVar = if TupleVar =:= [];
                     Inline =:= false ->
                        {var,?L,next_var_tuple_name()};
                     true ->
                        TupleVar
                  end,
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name({window,Id}),
   {NewCtx,FunAbs} = window_loop(Ctx, F, [], Internal == [], Rem),
   
   Call1 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,_@@Vars)")],
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = if Internal =:= [] ->
                       Internal ++ Call1;
                    Inline =:= false andalso TupleVar =/= [] ->
                       Internal ++ Call2;
                    true ->
                       Internal ++ Call1
                 end,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, T, RetId, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,false,Rems);

% where
flwor(Ctx, [{where,Id,_} = W|T], RetId, Return, Internal, 
      Global,TupleVar,_Inline,[Rem|Rems]) ->
   NextTupleVar = {var,?L,next_var_tuple_name()},
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name({where,Id}),
   {NewCtx,FunAbs} = where_part(Ctx, W, [], Rem),
   
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = Internal ++ Call2,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, T, RetId, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,false,Rems);

% count
flwor(Ctx, [{count,_} = C|T], RetId, Return, Internal, 
      Global,TupleVar,_Inline,[_Rem|Rems]) ->
   NextTupleVar = {var,?L,next_var_tuple_name()},
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name(C),
   {NewCtx,FunAbs} = count_part(Ctx, C, []),
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = Internal ++ Call2,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, T, RetId, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,false,Rems);

% group
flwor(Ctx, [{group_by,Id,_} = F|T], RetId, Return, Internal, 
      Global,TupleVar,_Inline,[Rem|Rems]) ->
   NextTupleVar = {var,?L,next_var_tuple_name()},
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name({group_by,Id}),
   {NewCtx,FunAbs} = group_part(Ctx, F, Rem),
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = Internal ++ Call2,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, T, RetId, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,false,Rems);

% order
flwor(Ctx, [{order_by,Id,_} = F|T], RetId, Return, Internal, 
      Global,TupleVar,_Inline,[Rem,Rem2|Rems]) ->
   NextTupleVar = {var,?L,next_var_tuple_name()},
   CurrContext = {var,?L,get_context_variable_name(Ctx)},
   ThisFun = glob_fun_name({order_by,Id}),
   {NewCtx,FunAbs} = order_part(Ctx, F),
   Call2 = [?P("_@NextTupleVar = '@ThisFun@'(_@CurrContext,xqerl_seq3:flatten(_@TupleVar))")],
   NewInternal = Internal ++ Call2,
   NewCtx1 = set_variable_tuple_name(NewCtx, NextTupleVar),
   flwor(NewCtx1, T, RetId, Return, NewInternal, 
         FunAbs ++ Global,NextTupleVar,false,[Rem ++ Rem2|Rems]).

scan_variable_usage(Loop, Return) -> % 2170
   FMap = fun({'for', #xqVar{id = Id, position = #xqPosVar{id = PId}}, _}) ->
                {true, [local_variable_name(Id), local_variable_name(PId)]};
             ({'for', #xqVar{id = Id}, _}) ->
                {true, [local_variable_name(Id)]};
             ({'let', #xqVar{id = Id}, _}) ->
                {true, [local_variable_name(Id)]};
             ({'count', #xqVar{id = Id}, _}) ->
                {true, [local_variable_name(Id)]};
             (#xqWindow{win_variable = #xqVar{id = Id}}) ->
                {true, [local_variable_name(Id)]};
             (_) ->
                false
          end,
   Local = lists:append(lists:filtermap(FMap, Loop)),
   
   UMap = fun(Exp) ->
                A = collect_variable_refs(Exp),
                U = lists:usort(A),
                [I || I <- U, lists:member(I, Local)]
          end,
   Used = lists:map(UMap, Loop ++ [Return]),
   
   RFold = fun(U, Acc) ->
                 {[I || I <- U, not lists:member(I, Acc)], U ++ Acc}
           end,
   {Last,  _} = lists:mapfoldr(RFold, [], Used),
   %?dbg("Last", Last),
   Last.


collect_variable_refs(Expr) ->
   collect_variable_refs(Expr, []).

collect_variable_refs({variable, Var}, Acc) ->
   [Var|Acc];
collect_variable_refs(Tup, Acc) when is_tuple(Tup) ->
   collect_variable_refs(erlang:tuple_to_list(Tup), Acc);
collect_variable_refs(List, Acc) when is_list(List) ->
   lists:flatten([collect_variable_refs(L) || L <- List]) ++ Acc;
collect_variable_refs(_, Acc) ->
   Acc.

return_part(Ctx,{Id, Line, Expr},IsList) ->
   _ = set_line(Line),
   FunctionName = glob_fun_name({return,Id}),
   OldVariableTupleMatch = get_variable_tuple(Ctx),
   LocCtx = set_context_variable_name(Ctx, '__Ctx'),
   %InLine = attribute(compile, {inline,{FunctionName,2}}),
   E1 = expr_do(LocCtx,Expr),
   %?dbg("Expr",Expr),
   R = if IsList ->
              ?P(["'@FunctionName@'(_,[]) -> [];",
                  "'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
                  "   ['@FunctionName@'(Ctx,X) || X <- L];",
                  "'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) ->",
                  "   _@E1."
                  ]);
          true ->
              ?P(["'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) ->",
                  "   _@E1."
                  ])
              end,
   %{Ctx,[InLine, R]}.
   {Ctx,[R]}.

where_part(Ctx,{'where',Id, Expr},_NextFunAtom, Rem) ->
   FunctionName = glob_fun_name({where, Id}),
   OldVariableTupleMatch = get_variable_tuple(Ctx),
   Ctx1 = remove_variables(Rem, Ctx),
   NewVariableTupleMatch = get_variable_tuple(Ctx1),
   %InLine = attribute(compile, {inline,{FunctionName,2}}),
   LocCtx = set_context_variable_name(Ctx, '__Ctx'),

   E1 = expr_do(LocCtx,Expr),
   R =?P(["'@FunctionName@'(_,[]) -> [];",
          "'@FunctionName@'(__Ctx,List) ->",
          "[_@NewVariableTupleMatch || _@OldVariableTupleMatch <- List,",
          " _@E1 =:= true]."
         ]),
   
   %{Ctx,[InLine,WhereFun]}.
   {Ctx1, [R]}.

order_part(Ctx,{'order_by',Id, Exprs}) ->
   Collations = [C || {order,_,{modifier,_,_,{_,C}}} <- alist(Exprs)],
   CollVars = [begin
                  V = {var,?L,next_var_name()},
                  ?P("_@V = xqerl_coll:parse(_@C@)")
               end || C <- Collations],
   FunctionName = glob_fun_name({order_by, Id}),
   LocCtx = set_context_variable_name(Ctx, '__Ctx'),
   VarTup = get_variable_tuple(Ctx),
   OFun = fun({{order,Expr,{modifier,Dir,{_,Empty},_}}, CF},Acc) ->
                E1 = expr_do(LocCtx, Expr),
                ?P("[{fun(_@VarTup) -> xqerl_coll:sort_key(xqerl_seq3:singleton_value(_@E1), _@CF) end,
                      '@Dir@','@Empty@'}|_@Acc]")
          end,
   Funs = lists:foldr(OFun, {nil,?L}, lists:zip(alist(Exprs), CollVars)),
   
   R =?P(["'@FunctionName@'(_,[]) -> [];",
          "'@FunctionName@'(__Ctx, Stream) ->",
          "   xqerl_flwor:orderbyclause(Stream,_@Funs)."
         ]),
   
   %{Ctx,[InLine,WhereFun]}.
   {Ctx,[R]}.

count_part(Ctx,{'count',#xqVar{id = Id,
                               name = Name,
                               anno = Line}} = Part,NextFunAtom) ->
   _ = set_line(Line),
   VarName = local_variable_name(Id),
   VarName1 = {var,?L,VarName},
   NewVar  = {Name,#xqSeqType{type = 'xs:integer', occur = 'one'},[],VarName},
   FunctionName = glob_fun_name(Part),
   NewCtx  = add_grouping_variable(NewVar, Ctx),
   OldVariableTupleMatch = get_variable_tuple(Ctx),
   NewVariableTupleMatch = get_variable_tuple(NewCtx),
   
   NextFun = if NextFunAtom == [] ->
                   NewVariableTupleMatch;
                true ->
                   ?P("'@NextFunAtom@'(Ctx,_@NewVariableTupleMatch)")
             end,
   
   R1 = ?P(["'@FunctionName@'(Ctx,Stream) ->",
            "   '@FunctionName@'(Ctx,1,Stream)."
           ]),
   R2 = ?P(["'@FunctionName@'(_,_,[]) -> [];",
            "'@FunctionName@'(Ctx,_@VarName1,[_@OldVariableTupleMatch|T]) ->",
            "   [_@NextFun|'@FunctionName@'(Ctx,_@VarName1 + 1,T)]."
           ]),
   {NewCtx,[R1,R2]}.

group_part(#{grp_variables := GrpVars,
             variables     := Vars} = Ctx, {group_by,Id,Clauses}, Rem) ->
   % 1. seperate the local/group-able variables from the out-of-scope variables.
   AllInScopeVars = [N || {_,_,_,N} <- Vars, is_atom(N)],
   GroupVars      = [N || {_,_,_,N} <- GrpVars],
   OuterVars      = AllInScopeVars -- GroupVars,
   % 2. split key/vals
   KeyNames = [ Name || 
                #xqGroupBy{grp_variable = {variable, Name}} <- alist(Clauses)],
   OK = lists:all(fun(N) ->
                        lists:member(N, GroupVars)
                  end, KeyNames),
   if OK ->
         ok;
      true ->
         %TODO move this check to static phase
         ?err('XQST0094', ?LN)% out of scope grouping variable
   end,
   UColls = lists:usort([Coll ||
                         #xqGroupBy{collation = Coll} <- alist(Clauses)]),
   
   CollsFun = fun(Str,{Acc,I}) ->
                    {Acc#{Str => {?P("xqerl_coll:parse('@Str@')"),I}}, I + 1}
              end,
   {CollsMap,_} = lists:foldl(CollsFun, {#{},1}, UColls),
   CollMFun = fun(_K,{V,Id1},L) ->
                    VA = {var,?L,list_to_atom("C"++integer_to_list(Id1))},
                    [?P("_@VA = _@V")|L]
              end,
   CollMatch = maps:fold(CollMFun, [], CollsMap),
   CollNFun = fun(_K,{_V,Id1},L) ->
                    VA = {var,?L,list_to_atom("C"++integer_to_list(Id1))},
                    [VA|L]
                    %[?Q("_@VA")|L]
              end,
   CollNT = {tuple,?L,maps:fold(CollNFun, [], CollsMap)},
   
   KeyTuples   = [begin
                     {_,Id2} = maps:get(Coll, CollsMap),
                     VName = {var,?L,list_to_atom("C"++integer_to_list(Id2))},
                     Name1 = {var,?L,Name},
                     ?P("{_@Name1,_@VName}")
                  end || 
                  #xqGroupBy{grp_variable = {variable, Name}, 
                             collation = Coll} <- alist(Clauses)],
   KeyNamesTup = [{var,?L,Name} || 
                  #xqGroupBy{grp_variable = 
                               {variable, Name}} <- alist(Clauses)],

   KeyTuple    = if KeyTuples == [] ->
                       {nil,?L};
                    true ->
                       ?P("{_@@KeyTuples}")
                 end,
   GroupedVars = GroupVars -- KeyNames,
   GroupedTups = [{var,?L,Name} || Name <- GroupedVars],
   OuterTups   = if OuterVars == [] ->
                       {nil,?L};
                    true ->
                       {tuple,?L,[{var,?L,Name} || Name <- OuterVars]}
                 end,
   GroupedTup  = {tuple,?L,GroupedTups},
   % 3. group key/vals
   ToGroupTuple = {tuple,?L,[KeyTuple,GroupedTup]},
   OutputTuple  = {tuple,?L,KeyNamesTup ++ GroupedTups},
   % 4. send back entire tuple
   Ctx1 = remove_variables(Rem, Ctx),
   OutgoingVarTup0 = get_variable_tuple(Ctx),
   OutgoingVarTup = get_variable_tuple(Ctx1),

   FunctionName = glob_fun_name({group_by, Id}),
   
   Hd = ?P("erlang:hd([_@OuterTups || _@OutgoingVarTup <- List])"),
   Flatten = ?P("lists:flatten(['@FunctionName@'(Ctx,T,_@CollNT) || T <- List])"),
   Rest = if OuterVars =:= [] -> {nil,?L}; true -> Hd end,
%?dbg("_@@CollMatch",?P("_@@CollMatch")),
   GrpFun1 = 
     ?P(["'@FunctionName@'(_,[]) -> [];",
         "'@FunctionName@'(Ctx,List) when erlang:is_list(List) -> ",
         "   _@@CollMatch, Split = _@Flatten, Rest = _@Rest,",
         "   '@FunctionName@'(Ctx,Split,Rest)."]),
   GrpFun2 =
     ?P(["'@FunctionName@'(_Ctx,_@OutgoingVarTup0,_@CollNT) -> _@ToGroupTuple;",
         "'@FunctionName@'(_Ctx,Split,_@OuterTups) -> ",
         "   Grouped = xqerl_flwor:groupbyclause(Split), ",
         "   [_@OutgoingVarTup || _@OutputTuple <- Grouped]."]),
   {Ctx1, [GrpFun1,GrpFun2]}.

let_part(Ctx,{'let',#xqVar{id = Id,
                           name = Name,
                           type = Type,
                           expr = Expr,
                           anno = Line},
              AType} = Part,NextFunAtom,IsList, Rem) ->
   _ = set_line(Line),
   VarName = local_variable_name(Id),
   NewVar  = {Name,Type,[],VarName},
   FunctionName = glob_fun_name(Part),
   LocCtx = set_context_variable_name(Ctx, '__Ctx'),
   NewCtx0  = add_grouping_variable(NewVar, Ctx),
   NewCtx = remove_variables(Rem, NewCtx0),
   OldVariableTupleMatch = case get_variable_tuple(Ctx) of
                              {nil,_} ->
                                 {var,?L, '_'};
                              O ->
                                 O
                           end,
   NewVariableTupleMatch = get_variable_tuple(NewCtx),
   %InLine = attribute(compile, {inline,{FunctionName,2}}),
   
   E1 = expr_do(LocCtx,Expr),
   VarName1 = {var,?L,VarName},
   Ens = ensure_type(Ctx,VarName1,Type,AType),
   LetFun = 
     if NextFunAtom == [] andalso IsList ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) ->",
            "   ['@FunctionName@'(Ctx,X) || X <- L];",
            "'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) ->",
            "   _@VarName1 = _@E1,",
            "   _@Ens,",
            "   _@NewVariableTupleMatch."
           ]);
        NextFunAtom == [] ->
        ?P(["'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) ->",
            "   _@VarName1 = _@E1,",
            "   _@Ens,",
            "   _@NewVariableTupleMatch."
           ]);
        IsList ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) ->",
            "   ['@FunctionName@'(Ctx,X) || X <- L];",
            "'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) ->",
            "   _@VarName1 = _@E1,",
            "   _@Ens,",
            "   '@NextFunAtom@'(__Ctx,_@NewVariableTupleMatch)."
           ]);
        true ->
        ?P(["'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) ->",
            "   _@VarName1 = _@E1,",
            "   _@Ens,",
            "   '@NextFunAtom@'(__Ctx,_@NewVariableTupleMatch)."
           ])
        end,
   %{NewCtx,[InLine, LetFun]}.
   {NewCtx,[LetFun]}.

window_loop(Ctx, #xqWindow{type = Type,
                           win_variable = #xqVar{id = WId,
                                                 name = WName,
                                                 type = WType,
                                                 expr = Expr,
                                                 anno = Line}, 
                           s     = S,
                           spos  = SPos,
                           sprev = SPrev,
                           snext = SNext,
                           e     = E,
                           epos  = EPos,
                           eprev = EPrev,
                           enext = ENext,
                           only  = Only,
                           start_expr = StartExpr,
                           end_expr = EndExpr}, NextFunAtom, IsInitial, Rem) ->
   _ = set_line(Line),
   OldCtxname = get_context_variable_name(Ctx),
   LocCtx = set_context_variable_name(Ctx, '__Ctx'),
   {SVar,Ctx0} =  case S of
                     #xqVar{id = Id1,name = Name1} ->
                        Vn1 = local_variable_name(Id1),
                        Var1 = {Name1,WType,[],Vn1},
                        Ctx1 = add_grouping_variable(Var1, LocCtx),
                        {Var1,Ctx1};
                     undefined ->
                        {{[],[],[],'_'},LocCtx}
                  end,
   {SPosVar,Ctx2} =  case SPos of
                        #xqPosVar{id = Id2,name = Name2} ->
                           Vn2 = local_variable_name(Id2),
                           Var2 = {Name2,WType,[],Vn2},
                           Ctx3 = add_grouping_variable(Var2, Ctx0),
                           {Var2,Ctx3};
                        undefined ->
                           {{[],[],[],'_'},Ctx0}
                     end,
   {SPrevVar,Ctx4} = case SPrev of
                        #xqVar{id = Id3,name = Name3} ->
                           Vn3 = local_variable_name(Id3),
                           Var3 = {Name3,WType,[],Vn3},
                           Ctx5 = add_grouping_variable(Var3, Ctx2),
                           {Var3,Ctx5};
                        undefined ->
                           {{[],[],[],'_'},Ctx2}
                     end,
   {SNextVar,Ctx6} = case SNext of
                        #xqVar{id = Id4,name = Name4} ->
                           Vn4 = local_variable_name(Id4),
                           Var4 = {Name4,WType,[],Vn4},
                           Ctx7 = add_grouping_variable(Var4, Ctx4),
                           {Var4,Ctx7};
                        undefined ->
                           {{[],[],[],'_'},Ctx4}
                     end,
   {EVar,Ctx10} = case E of
                     #xqVar{id = Id11,name = Name11} ->
                        Vn11 = local_variable_name(Id11),
                        Var11 = {Name11,WType,[],Vn11},
                        Ctx11 = add_grouping_variable(Var11, Ctx6),
                        {Var11,Ctx11};
                     undefined ->
                        {{[],[],[],'_'},Ctx6}
                  end,
   {EPosVar,Ctx12} = case EPos of
                        #xqPosVar{id = Id12,name = Name12} ->
                           Vn12 = local_variable_name(Id12),
                           Var12 = {Name12,WType,[],Vn12},
                           Ctx13 = add_grouping_variable(Var12, Ctx10),
                           {Var12,Ctx13};
                        undefined ->
                           {{[],[],[],'_'},Ctx10}
                     end,
   {EPrevVar,Ctx14} =   case EPrev of
                           #xqVar{id = Id13,name = Name13} ->
                              Vn13 = local_variable_name(Id13),
                              Var13 = {Name13,WType,[],Vn13},
                              Ctx15 = add_grouping_variable(Var13, Ctx12),
                              {Var13,Ctx15};
                           undefined ->
                              {{[],[],[],'_'},Ctx12}
                        end,
   {ENextVar,Ctx16} =   case ENext of
                           #xqVar{id = Id14,name = Name14} ->
                              Vn14 = local_variable_name(Id14),
                              Var14 = {Name14,WType,[],Vn14},
                              Ctx17 = add_grouping_variable(Var14, Ctx14),
                              {Var14,Ctx17};
                           undefined ->
                              {{[],[],[],'_'},Ctx14}
                        end,
          
   WVn = local_variable_name(WId),
   WVar = {WName,WType,[],WVn},
   Ctx21 = add_grouping_variable(WVar, Ctx16),
   {WinVar,Ctx20} = {WVar, remove_variables(Rem, Ctx21)},
   % first check for bad name shadows
   AllVars = [SVar,SPosVar,SPrevVar,SNextVar,
              EVar,EPosVar,EPrevVar,ENextVar,
              WinVar],
   lists:foldl(fun({_,_,_,'_'},Acc) ->
                     Acc;
                  ({A,_,B,_},Acc) ->
                     case sets:is_element({A,B}, Acc) of
                        true ->
                           %TODO move to static phase
                           ?err('XQST0103', ?LN);
                        _ ->
                           sets:add_element({A,B}, Acc)
                     end
               end, sets:new(), AllVars),
   StartTup = get_variable_tuple(Ctx, [SVar,SPosVar,SPrevVar,SNextVar]),
   EndTup   = get_variable_tuple(Ctx, [SVar,SPosVar,SPrevVar,SNextVar,
                                       EVar,EPosVar,EPrevVar,ENextVar]),
   % mask the win variable name to type-check it later
   % TODO
   %TempWinVarName = next_var_name(),
   %TempWinVar = {[],[],[],TempWinVarName},

   OutTup   = get_variable_tuple(Ctx, [SVar,SPosVar,SPrevVar,SNextVar,
                                       EVar,EPosVar,EPrevVar,ENextVar,WinVar]),
   StartFunAbs = case StartExpr of
                    true -> % very common start
                       ?Q("true");
                    _ ->
                       E1 = expr_do(Ctx6, StartExpr),
                       ?P("fun(_@StartTup) -> _@E1 end")
                 end,

   WinCall= if EndExpr =:= undefined ->
                  ?P("xqerl_flwor:windowclause(List,_@StartFunAbs,_@WType@)");
               true ->
                  E2 = alist(expr_do(Ctx16, EndExpr)),
                  EndFunAbs = ?P("fun(_@EndTup) -> _@E2 end"),
                  ?P(["xqerl_flwor:windowclause(List,_@StartFunAbs,",
                      "_@EndFunAbs,{'@Type@','@Only@'},_@WType@)"])
            end,

   FunctionName = glob_fun_name({window,WId}),
   OldVariableTupleMatch = case get_variable_tuple(Ctx) of
                              {nil,_} ->
                                 {var,?L, '_'};
                              O ->
                                 O
                           end,
   
   NewVariableTupleMatch = get_variable_tuple(Ctx20),

   TempStreamVar = {var,?L,next_var_name()},
   
   E3 = expr_do(LocCtx, Expr),
   Next = if NextFunAtom == [] ->
                ?P("_@NewVariableTupleMatch");
             true ->
                ?P("'@NextFunAtom@'(__Ctx,_@NewVariableTupleMatch)")
          end,
   
   WinFun =
     if IsInitial ->
        ?P(["'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) -> ",
            "   List = _@E3,",
            "   _@TempStreamVar = _@WinCall,",
            "   [_@Next || _@OutTup <- _@TempStreamVar]."]);
        true ->
           ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
               "   lists:map(fun(X) -> '@FunctionName@'(Ctx,X) end,L);",
               "'@FunctionName@'(__Ctx,_@OldVariableTupleMatch) -> ",
               "   List = _@E3,",
               "   _@TempStreamVar = _@WinCall,",
               "   [_@Next || _@OutTup <- _@TempStreamVar]."])
     end,
   OutCtx = set_context_variable_name(Ctx20, OldCtxname),
   {OutCtx,[WinFun]}.

% for loop with no position var
for_loop(Ctx,{'for',#xqVar{id = Id,
                           name = Name, 
                           type = Type, 
                           empty = Empty,
                           expr = Expr, 
                           position = undefined,
                           anno = Line},
              AType} = Part, NextFunAtom, IsList, Rem) ->
   _ = set_line(Line),
   Filename = get_filename(),
%?dbg("list?",{Id,IsList}),
   VarName = local_variable_name(Id),
   NewVar    = {Name,Type,[],VarName},
   NoEmptyType = (Type#xqSeqType.occur == one orelse 
                  Type#xqSeqType.occur == one_or_many), 
   NewCtx  = add_grouping_variable(NewVar, remove_variables(Rem, Ctx)),
   FunctionName = glob_fun_name(Part),
   LocCtx = set_context_variable_name(Ctx, '__Ctx'),
   OldVariableTupleMatch = case get_variable_tuple(Ctx) of
                              {nil,_} -> {var,?L, '_'};
                              O -> O
                           end,
   NewVariableTupleMatch = get_variable_tuple(NewCtx),
   VarName1 = {var,?L,VarName},
   {FName,E1} = case expr_do(LocCtx, Expr) of
                  {parallel,E} ->
                      {pformap,E};
                  {unordered_parallel,E} ->
                      {pmap,E};
                   E ->
                      %{pformap,E} % just for fun
                      {formap,E}
                end,
   Next = if NextFunAtom == [] ->
                ?P("_@NewVariableTupleMatch");
             true ->
                ?P("'@NextFunAtom@'(__Ctx,_@NewVariableTupleMatch)")
          end,
   %HasNext = NextFunAtom =/= [] ,
   Ens = ensure_type(Ctx,VarName1,Type,AType),
   ForFun1 = 
     if IsList andalso Empty andalso NoEmptyType ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
            "   lists:map(fun(X) -> '@FunctionName@'(Ctx,X) end,L);",
            "'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/3,",
            "   if List =:= [] -> ",
            "         erlang:exit(xqerl_error:error('XPTY0004', {_@Filename@, _@Line@}));",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List)",
            "   end."]);
        IsList andalso Empty ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
            "   lists:map(fun(X) -> '@FunctionName@'(Ctx,X) end,L);",
            "'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/3, ",
            "   if List =:= [] -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, [List]);",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List)",
            "   end."]);
        Empty andalso NoEmptyType ->
        ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/3, ",
            "   if List =:= [] -> ",
            "         erlang:exit(xqerl_error:error('XPTY0004', {_@Filename@, _@Line@}));",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List)",
            "   end."]);
        Empty ->
        ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/3, ",
            "   if List =:= [] -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, [List]);",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List)",
            "   end."]);
        IsList ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
            "   lists:map(fun(X) -> '@FunctionName@'(Ctx,X) end,L);",
            "'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/3, ",
            "   xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List)."]);
        true ->
        ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/3, ",
            "   xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List)."])
        end,
   ForFun2 = ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch, _@VarName1) -> _@Ens,_@Next."]),
   {NewCtx,[ForFun1, ForFun2]};
% for loop with position var
for_loop(Ctx,{'for',#xqVar{id = Id,
                           name = Name, 
                           type = Type, 
                           empty = Empty,
                           expr = Expr, 
                           position = #xqPosVar{id = PId, 
                                                name = PName},
                           anno = Line},
              AType} = Part, NextFunAtom, IsList, Rem) ->
   _ = set_line(Line),
   Filename = get_filename(),
   VarName = local_variable_name(Id),
   NewVar    = {Name,Type,[],VarName},
   PosVarName = local_variable_name(PId),
   NewVar     = {Name,Type,[],VarName},
   NewPosVar  = {PName,#xqSeqType{type = 'xs:integer', 
                                  occur = 'one'},[],PosVarName},
   NoEmptyType = (Type#xqSeqType.occur == one orelse 
                  Type#xqSeqType.occur == one_or_many), 
   NewCtx      = add_grouping_variable(NewPosVar, 
                                       add_grouping_variable(NewVar, 
                                                             remove_variables(Rem, Ctx))),
   FunctionName = glob_fun_name(Part),
   LocCtx = set_context_variable_name(Ctx, '__Ctx'),
   OldVariableTupleMatch = case get_variable_tuple(Ctx) of
                              {nil,_} -> {var,?L, '_'};
                              O -> O
                           end,
   NewVariableTupleMatch = get_variable_tuple(NewCtx),

   VarName1 = {var,?L,VarName},
   PosVarName1 = {var,?L,PosVarName},
   {FName,E1} = case expr_do(LocCtx, Expr) of
                  {parallel,E} ->
                      {forposmap,E};
                  {unordered_parallel,E} ->
                      {forposmap,E};
                   E ->
                      {forposmap,E}
                end,
   Next = if NextFunAtom == [] ->
                ?P("_@NewVariableTupleMatch");
             true ->
                ?P("'@NextFunAtom@'(__Ctx,_@NewVariableTupleMatch)")
          end,
   Ens = ensure_type(Ctx,VarName1,Type,AType),
   ForFun1 = 
     if IsList andalso Empty andalso NoEmptyType ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
            "   lists:map(fun(X) -> '@FunctionName@'(Ctx,X) end,L);",
            "'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/4,",
            "   if List =:= [] -> ",
            "         erlang:exit(xqerl_error:error('XPTY0004', {_@Filename@, _@Line@}));",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List, 1)",
            "   end."]);
        IsList andalso Empty ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
            "   lists:map(fun(X) -> '@FunctionName@'(Ctx,X) end,L);",
            "'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/4,",
            "   if List =:= [] -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, [List], 0);",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List, 1)",
            "   end."]);
        Empty andalso NoEmptyType ->
        ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/4,",
            "   if List =:= [] -> ",
            "         erlang:exit(xqerl_error:error('XPTY0004', {_@Filename@, _@Line@}));",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List, 1)",
            "   end."]);
        Empty ->
        ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/4,",
            "   if List =:= [] -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, [List], 0);",
            "      true -> ",
            "         xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List, 1)",
            "   end."]);
        IsList ->
        ?P(["'@FunctionName@'(Ctx,L) when erlang:is_list(L) -> ",
            "   lists:map(fun(X) -> '@FunctionName@'(Ctx,X) end,L);",
            "'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/4,",
            "   xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List, 1)."
           ]);
        true ->
        ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch = Tuple) -> ",
            "   List = _@E1,",
            "   Fun = fun '@FunctionName@'/4,",
            "   xqerl_seq3:'@FName@'({Fun, __Ctx, Tuple}, List, 1)."
           ])
        end,
   ForFun2 = ?P(["'@FunctionName@'(__Ctx, _@OldVariableTupleMatch, _@VarName1,",
                 " _@PosVarName1) ->  _@Ens,_@Next."]),
   {NewCtx,[ForFun1, ForFun2]}.

glob_fun_name({window,Id}) ->
   list_to_atom("window__" ++ integer_to_list(Id));
glob_fun_name({group_by,Id}) ->
   list_to_atom("group__" ++ integer_to_list(Id));
glob_fun_name({order_by,Id}) ->
   list_to_atom("order__" ++ integer_to_list(Id));
glob_fun_name({return,Id}) ->
   list_to_atom("return__" ++ integer_to_list(Id));
glob_fun_name({where,Id}) ->
   list_to_atom("where__" ++ integer_to_list(Id));
glob_fun_name({count,#xqVar{id = Id}}) ->
   list_to_atom("count__" ++ integer_to_list(Id));
glob_fun_name({for,#xqVar{id = Id},_}) ->
   list_to_atom("for__" ++ integer_to_list(Id));
glob_fun_name({'let',#xqVar{id = Id},_}) ->
   list_to_atom("let__" ++ integer_to_list(Id)).

%% {name,type,annos,Name}
add_param(Variable, Map) ->
   NewMap = add_variable(Variable, Map),
   Vars = maps:get(parameters, Map),
   Key = element(1, Variable),
   NewVars = lists:keystore(Key, 1, Vars, Variable),
   maps:put(parameters, NewVars, NewMap).

remove_variables(Vars, Map) ->
   F = fun(V, M) ->
             remove_variable(V, M)
       end,
   lists:foldl(F, Map, Vars).
   
remove_variable(AtomName, #{variables := Vars,
                            grp_variables := GVars} = Map) ->
   RemFun = fun({_,_,_,N}) when N == AtomName -> false;
               (_) -> true
            end,
   Vars1 = [V || V <- Vars, RemFun(V)],
   GVars1 = [V || V <- GVars, RemFun(V)],
   Map#{variables := Vars1,
        grp_variables := GVars1}.

%% {name,type,annos,Name}
add_variable({#qname{} = Qn,_,_,_} = Variable, #{tab := Tab} = Map) ->
   Qn1 = case Qn of
            #qname{namespace = undefined, prefix = Px, local_name = Ln} ->
               Nss = maps:get(namespaces, Map),
               Ns1 = proplists:get_value(Px, Nss),
               #qname{namespace = Ns1, prefix = <<>>, local_name = Ln};
            _ ->
               Qn#qname{prefix = <<>>}
         end,
   Variable1 = erlang:setelement(1, Variable, Qn1),
   
   _ = xqerl_context:add_in_scope_variable(Tab,Variable1),
   
   Vars = maps:get(variables, Map),
   Key = Qn1,
   Vars1 = lists:keydelete(Key, 1, Vars),
   NewVars = lists:keystore(Key, 1, Vars1, Variable1),
   maps:put(variables, NewVars, Map);
% these are the context item variables
add_variable({Name,_} = Variable, Map) when is_atom(Name) ->
   Vars = maps:get(variables, Map),
   Key = Name,
   Vars1 = lists:keydelete(Key, 1, Vars),
   NewVars = lists:keystore(Key, 1, Vars1, Variable),
   maps:put(variables, NewVars, Map).

add_grouping_variable({#qname{} = Qn,_,_,_} = Variable, #{tab := Tab} = Map) ->
   Qn1 = case Qn of
            #qname{namespace = undefined, prefix = Px, local_name = Ln} ->
               Nss = maps:get(namespaces, Map),
               Ns1 = proplists:get_value(Px, Nss),
               #qname{namespace = Ns1, prefix = <<>>, local_name = Ln};
            _ ->
               Qn#qname{prefix = <<>>}
         end,
   Variable1 = erlang:setelement(1, Variable, Qn1),
   
   _ = xqerl_context:add_in_scope_variable(Tab,Variable1),
   
   Vars = maps:get(variables, Map),
   GVars = maps:get(grp_variables, Map),
   Key = Qn1,
   Vars1 = lists:keydelete(Key, 1, Vars),
   NewVars = lists:keystore(Key, 1, Vars1, Variable1),
   GVars1 = lists:keydelete(Key, 1, GVars),
   GNewVars = lists:keystore(Key, 1, GVars1, Variable1),
   Map#{variables => NewVars,
        grp_variables => GNewVars}.

get_variable_ref(#qname{namespace = Ns, prefix = Px, local_name = Ln}, 
                 #{tab        := Tab,
                   parameters := Vars1,
                   variables  := Vars2,
                   namespaces := Nss} = Map) ->
   Vars0 = xqerl_context:get_in_scope_variables(Tab),
   Vars = Vars2 ++ Vars1 ++ Vars0,
   Ns2 = case Ns of
            undefined ->
               proplists:get_value(Px, Nss);
            _ ->
               Ns
         end,
   Var = lists:filter(fun(E) ->
                           case element(1, E) of
                              #qname{namespace = Ns2, local_name = Ln} ->
                                 true;
                              _ ->
                                 false
                           end
                        end, Vars),
   Loc = case Var of 
            [] ->
               ?err('XPST0008', ?LN);
            [H] ->
               element(4, H);
            [H|_] ->
               element(4, H)
         end,
   Typ = case Var of 
            [H1] ->
               element(2, H1);
            [H1|_] ->
               element(2, H1)
         end,
   if is_atom(Loc) ->
         {{var,?L,Loc},Typ};
      true ->
         case Loc of
            {F,_} ->
               CtxVar = get_context_variable_name(Map),
               CV = {var,?L,CtxVar},
               %GV = {var,?L,F},
               Get = ?P("maps:get('@F@',_@CV)"),
               {Get,Typ}
         end
   end.

alist(L) when is_list(L) -> lists:flatten(L);
alist(L) -> [L].

% return module function that takes a list of nodes and returns whatever
abs_path_expr(Ctx, {_, Id, _Steps} = P) ->
   FunNameAtom = path_function_name(Id), 
   CallingCtx = {var,?L,get_context_variable_name(Ctx)},
   CallingVarTup = get_variable_tuple(Ctx),
   %% conditionals can duplicate path calls
   %% so make sure there is only one function
   case global_fun_exists(FunNameAtom, 2) of
      true ->
         ?P("'@FunNameAtom@'(_@CallingCtx,_@CallingVarTup)");
      false ->
         Ctx1 = set_context_variable_name(Ctx, '__Ctx'),
         Expr = path_expr_do(Ctx1, P),
         Fun = ?P(["'@FunNameAtom@'(__Ctx,_@CallingVarTup) ->",
                  " _@Expr."
                  ]),
         add_global_funs([Fun]),   
         ?P("'@FunNameAtom@'(_@CallingCtx,_@CallingVarTup)")
   end.

abs_document_node(Ctx, #xqDocumentNode{identity = Id, 
                                       content = E, 
                                       base_uri = BU}) ->
   _ = add_used_record_type(xqDocumentNode),
   VarTup = get_variable_tuple(Ctx),
   FN = node_function_name(Id),
   CV1 = {var,?L,'Ctx1'},
   Ctx1 = set_context_variable_name(Ctx, 'Ctx1'),
   BU1 = case maps:get('base-uri', Ctx) of
            undefined -> BU;
            B -> B
         end,
   E1 = expr_do(Ctx,BU1),
   P1 = ?P(["BaseUri = _@E1,",
            "_@CV1 = Ctx#{'base-uri' := BaseUri}"]),
   E2 = case is_list(E) of
           true ->
              if length(E) == 1 ->
                    expr_do(Ctx1, E);
                 true ->
                    lists:foldr(fun(X, Abs) ->
                               {cons,?L,expr_do(Ctx1, X), Abs} 
                         end, {nil,?L}, E)
              end;
           _ ->
              if E == undefined -> empty_seq();
                 true ->
                    expr_do(Ctx1, E)
              end
        end,
   Fun = ?P(["'@FN@'(Ctx,_@VarTup) ->",
            " _@P1,",
            " Expr = _@E2,",
            " #xqDocumentNode{base_uri = BaseUri, children = [], content = Expr}."
            ]),
   add_global_funs([Fun]),
   CCtx = {var,?L,get_context_variable_name(Ctx)},
   ?P("'@FN@'(_@CCtx,_@VarTup)").

abs_element_node(#{namespaces := Nss} = 
                 Ctx, #xqElementNode{name = N, 
                                     attributes = A1, % namespaces in here
                                     content = E0, 
                                     type = Type}) ->
   _ = add_used_record_type(xqElementNode),
   NssN = [{P, U} ||
           #xqNamespaceNode{uri = U, prefix = P} <- A1],
   NssN1 = lists:ukeymerge(1, 
                           lists:keysort(1, NssN), 
                           lists:keysort(1, Nss)),
   E1 = case N of
           #qname{} ->
              abs_qname(Ctx,N);
           _ ->
              expr_do(Ctx, N)
        end,
   E2 = expr_do(Ctx, A1),
   E3 = case maps:get('construction-mode', Ctx) of
           strip ->
              {atom,?L,'xs:untyped'};
           _ when Type == undefined ->
              {atom,?L,'xs:anyType'};
           _ ->
              {atom,?L,Type}
        end,
   NextCtxName = next_ctx_var_name(),
   NextCtx = {var, ?L, NextCtxName},
   Ctx1 = set_context_variable_name(Ctx, NextCtxName),
   if E0 == [undefined];
      E0 == [] -> 
         ?P(["#xqElementNode{name = _@E1, children = [], attributes = _@E2,",
             " inscope_ns = [], type = _@E3, base_uri = [], ",
             "content = []}"]);
      true ->
          E5 = expr_do(Ctx1#{namespaces => NssN1},E0),
          ?P(["#xqElementNode{name = _@E1, children = [], attributes = _@E2,",
              " inscope_ns = [], type = _@E3, base_uri = [], ",
              "content = fun(_@NextCtx) -> _@E5 end}"])
   end.

abs_attribute_node(Ctx, #xqAttributeNode{name = N, string_value = E}) ->
   _ = add_used_record_type(xqAttributeNode),
   E1 = case N of
           #qname{namespace = _Ns, prefix = Px} ->
              if Px == <<>> ->
                    % no default namespace for these
                    abs_ns_qname(Ctx,N#qname{namespace = 'no-namespace'});
                 true ->
                    abs_qname(Ctx,N)
              end;
           _ ->
              expr_do(Ctx, N)
        end,
   E2 = if E == [undefined] -> {nil,?L};
           true ->
              Flat = lists:map(fun(Ex) ->
                                     expr_do(Ctx,Ex)
                               end, alist(E)), 
              case E of
                 {content_expr, _} ->
                    {cons,?L,lists:foldr(fun(X, Abs) ->
                               {cons,?L,X, Abs} 
                         end, {nil,?L}, Flat),{nil,?L}};
                 _ ->
                    lists:foldr(fun(X, Abs) ->
                               {cons,?L,X, Abs} 
                         end, {nil,?L}, Flat)
              end
        end,
   ?P("#xqAttributeNode{name = _@E1, string_value = _@E2}").

abs_text_node(Ctx, #xqTextNode{string_value = E, cdata = C}) ->
   _ = add_used_record_type(xqTextNode),
   E1 = case is_list(E) of
           true ->
              lists:foldr(fun(X, Abs) ->
                                {cons,?L,expr_do(Ctx, X), Abs}
                          end, {nil,?L}, E);
           _ ->
              if E == undefined -> empty_seq();
                 E == 'empty-expr' -> empty_seq();
                 E == 'empty-sequence' -> empty_seq();
                 true ->
                    expr_do(Ctx, E)
              end
        end,
   ?P("#xqTextNode{cdata = _@C@, string_value = _@E1}").

abs_comment_node(Ctx, #xqCommentNode{string_value = E}) ->
   _ = add_used_record_type(xqCommentNode),
   E1 = case is_list(E) of
           true ->
              lists:foldr(fun(X, Abs) ->
                                {cons,?L,expr_do(Ctx, X), Abs}
                          end, {nil,?L}, E);
           _ ->
              if E == undefined -> empty_seq();
                 true ->
                    expr_do(Ctx, E)
              end
        end,
   ?P("#xqCommentNode{string_value = _@E1}").

abs_pi_node(Ctx, #xqProcessingInstructionNode{name = N, 
                                              string_value = E, 
                                              base_uri = BU}) ->
   _ = add_used_record_type(xqProcessingInstructionNode),
   BU1 = case maps:get('base-uri', Ctx) of
            undefined when BU =/= <<>> ->
               BU;
            undefined ->
               [];
            _ ->
               BU
         end,
   E1 = case N of
           #qname{} ->
              abs_qname(Ctx,N);
           _ ->
              expr_do(Ctx, N)
        end,
   E2 = expr_do(Ctx,BU1),
   E3 = case is_list(E) of
           true ->
               lists:foldr(fun(X, Abs) ->
                               {cons,?L,expr_do(Ctx, X), Abs} 
                         end, {nil,?L}, E);
           _ ->
              if E == undefined -> empty_seq();
                 true ->
                    expr_do(Ctx, E)
              end
        end,
   ?P("#xqProcessingInstructionNode{name = _@E1,base_uri = _@E2,string_value = _@E3}").

abs_namespace_node(_Ctx, #xqNamespace{namespace = N, prefix = P}) ->
   _ = add_used_record_type(xqNamespace),
   if is_atom(N) ->
         ?P("#xqNamespace{namespace = '@N@', prefix = _@P}");
      true ->
         ?P("#xqNamespace{namespace = _@N@, prefix = _@P}")
   end;
abs_namespace_node(Ctx, #xqNamespaceNode{uri = U, prefix = P}) ->
   _ = add_used_record_type(xqNamespaceNode),
   %U1 = expr_do(Ctx, F)
   {U1, P1} = abs_ns_qname(Ctx,{U,P}),
   ?P("#xqNamespaceNode{uri = _@U1, prefix = _@P1}").

abs_fun_test(Ctx,#xqFunTest{kind = Kind, 
                            annotations = Annos, 
                            name = Name, 
                            params = Params, 
                            type = Type}) ->
   _ = add_used_record_type(xqFunTest),
   AnnoF = fun(#annotation{name = #qname{namespace = ?A("http://www.w3.org/2012/xquery"),
                                   local_name = L} = Q}, Abs) 
                 when L == ?A("public");
                      L == ?A("private") ->
                 {cons,?L,abs_qname(Ctx, Q), Abs};
              (#annotation{name = #qname{namespace = N} = Q}, Abs) ->
                 _ = xqerl_lib:reserved_namespaces(N),
                 {cons,?L,abs_qname(Ctx, Q), Abs}
           end,
   E1 = if Annos == [] ->
              {nil,?L};
           true ->
              lists:foldr(AnnoF, {nil,?L}, Annos)
        end,
   E2 = abs_qname(Ctx,Name),
   E3 = if Params =:= any ->
              atom_or_string(any);
           is_atom(Params) ->
              {cons,?L,abs_seq_type(Ctx,Params), {nil,?L}};
           true ->
              lists:foldr(fun(P, Abs) ->
                                {cons,?L,abs_seq_type(Ctx,P), Abs}
                          end, {nil,?L}, Params)
        end,
   E4 = if Type =:= any ->
              atom_or_string(any);
           true ->
              abs_seq_type(Ctx,Type)
        end,
   ?P("#xqFunTest{kind = '@Kind@', annotations = _@E1, name = _@E2,
         params = _@E3, type = _@E4}").

abs_seq_type(_Ctx,Type) when is_atom(Type) ->
   _ = add_used_record_type(xqSeqType),
   ?P("#xqSeqType{type = '@Type@', occur = one}");
abs_seq_type(Ctx,#xqSeqType{type = #xqFunTest{} = Ft, occur = O}) ->
   _ = add_used_record_type(xqSeqType),
   E1 = abs_fun_test(Ctx,Ft),
   ?P("#xqSeqType{type = _@E1, occur = _@O@}");
abs_seq_type(Ctx,#xqSeqType{type = #xqKindTest{} = Kt, occur = O}) ->
   _ = add_used_record_type(xqSeqType),
   E1 = abs_kind_test(Ctx,Kt),
   ?P("#xqSeqType{type = _@E1, occur = _@O@}");
abs_seq_type(_Ctx,#xqSeqType{type = T, occur = O}) ->
   _ = add_used_record_type(xqSeqType),
   ?P("#xqSeqType{type = _@T@, occur = _@O@}").   

abs_qname(_Ctx, undefined) ->
   atom_or_string(undefined);
abs_qname(_Ctx, {variable,_}) ->
   atom_or_string(undefined);
abs_qname(_Ctx, #qname{namespace = N, prefix = P, local_name = L}) ->
   try
      N1 = if N == 'no-namespace' ->
                  'no-namespace';
              true ->
                 xqerl_types:string_value(xqerl_types:cast_as(N, 'xs:anyURI'))
           end,
      P1 = if P == <<>> ->
                  <<>>;
              true ->
                 xqerl_types:string_value(xqerl_types:cast_as(P, 'xs:NCName'))
           end,
      L1 = xqerl_types:string_value(xqerl_types:cast_as(L, 'xs:NCName')),
      _ = add_used_record_type(xqAtomicValue),
      _ = add_used_record_type(qname),
      ?P("#xqAtomicValue{type = 'xs:QName', value = #qname{namespace = _@N1@, prefix = _@P1@, local_name = _@L1@}}")
   catch
      _:_ ->
         _ = add_used_record_type(qname),
         if is_atom(N) ->
               ?P("#qname{namespace = '@N@', prefix = _@P@, local_name = _@L@}");
            true ->
               ?P("#qname{namespace = _@N@, prefix = _@P@, local_name = _@L@}")
         end
   end.

abs_ns_qname(Ctx, {N, P}) ->
   E1 = if is_tuple(N) ->
              expr_do(Ctx, N);
           true ->
              atom_or_string(N)
        end,
   E2 = if is_tuple(P) ->
              %case P of
              %   <<>> ->
              %      atom_or_string(<<>>);
              %   _ ->
            expr_do(Ctx, P);
              %end;
           true ->
              atom_or_string(P)
        end,
   {E1, E2};
abs_ns_qname(Ctx, #qname{namespace = N, prefix = P, local_name = L}) ->
   _ = add_used_record_type(qname),
   E1 = atom_or_string(N),
   E2 = if is_tuple(P) ->
              %case P of
              %   <<>> ->
              %      atom_or_string(<<>>);
              %   _ ->
              expr_do(Ctx, P);
              %end;
           true ->
              atom_or_string(P)
        end,
   ?P("#qname{namespace = _@E1, prefix = _@E2, local_name = _@L@}").

% {xqKindTest,node,undefined,undefined,undefined}
abs_kind_test(Ctx,#xqKindTest{kind = K, name = Q, type = T}) ->
   _ = add_used_record_type(xqKindTest),
   E1 = abs_qname(Ctx,Q),
   E2 = if is_atom(T) ->
              atom_or_string(T);
           true ->
              expr_do(Ctx, T)
        end,
   ?P("#xqKindTest{kind = _@K@, name = _@E1, type = _@E2}").

abs_function(Ctx,#xqFunctionDef{annotations = _A,
                             name = N,
                             arity = Ar,
                             params = Params,
                             type = Type}, BodyAbs) ->
   _ = add_used_record_type(xqFunction),
   AbsName = abs_qname(Ctx, N),
   AbsArity = {integer,?L,Ar},
   AbsParams = abs_param_list(Ctx, Params),
   AbsType = abs_seq_type(Ctx, Type),
   ?P("#xqFunction{
          name =   _@AbsName,
          arity =  _@AbsArity,
          params = _@AbsParams,
          type =   _@AbsType,
          body =   _@BodyAbs}").

abs_param_list(Ctx, List) ->
   lists:foldr(fun(#xqSeqType{} = St,Acc) ->
                     {cons,?L,abs_seq_type(Ctx, St) ,Acc};
                  (#xqVar{type = #xqSeqType{} = St},Acc) ->
                     {cons,?L,abs_seq_type(Ctx, St) ,Acc};
                  (#xqVar{type = undefined},Acc) ->
                     {cons,?L,abs_seq_type(Ctx, #xqSeqType{occur = zero_or_many,
                                                           type = item}) ,Acc};
                  (#xqAtomicValue{type = St},Acc) ->
                     {cons,?L,abs_seq_type(Ctx, 
                                           #xqSeqType{occur = one,
                                                      type = St}) ,Acc};
                  (I, Acc) when is_binary(I) ->
                     {cons,?L,abs_seq_type(Ctx, 
                                           #xqSeqType{occur = one,
                                                      type = 'xs:string'}) ,Acc};
                  (I, Acc) when is_float(I) ->
                     {cons,?L,abs_seq_type(Ctx, 
                                           #xqSeqType{occur = one,
                                                      type = 'xs:double'}) ,Acc};
                  (I, Acc) when is_integer(I) ->
                     {cons,?L,abs_seq_type(Ctx, 
                                           #xqSeqType{occur = one,
                                                      type = 'xs:integer'}) ,Acc}
               end, {nil,?L}, List).
   
abs_boolean(Bool) ->
   ?P("_@Bool@").

%% abs_simp_atomic_value(#xqAtomicValue{type = 'xs:boolean', value = V}) ->
%%    ?P("_@V@");
abs_simp_atomic_value(#xqAtomicValue{type = T, value = V}) ->
   _ = add_used_record_type(xqAtomicValue),
   ?P("#xqAtomicValue{type = _@T@, value = _@V@}").

atom_or_string(<<>>) ->
   {bin,?L, []};
%% atom_or_string([]) ->
%%    {nil,?L};
atom_or_string(AS) ->
   if is_atom(AS) -> {atom,?L,AS};
      is_binary(AS) -> ?P("_@AS@");
      %is_list(AS) -> {string,?L,AS};
      true -> throw({string,?L,AS})
   end.

empty_seq() ->
   {nil,?L}.

get_context_variable_name(#{ctx_var := V}) -> V.
set_context_variable_name(Ctx, Name) ->
   Ctx#{ctx_var => Name}.

get_variable_tuple_name(#{var_tuple := V}) -> V.
set_variable_tuple_name(Ctx, Name) ->
   Ctx#{var_tuple => Name}.

abs_ns_list(Ctx) ->
   _ = add_used_record_type(xqNamespace),
   lists:foldr(fun(#xqNamespace{prefix = P,namespace = N}, Abs) ->
                     ?P("[#xqNamespace{prefix = _@P@,namespace = _@N@}|_@Abs]");
                  ({P, N}, Abs) ->
                     ?P("[#xqNamespace{prefix = _@P@,namespace = _@N@}|_@Abs]")                  
               end, {nil,?L}, maps:get(namespaces,Ctx)).   

next_var_tuple_name() ->
   list_to_atom("__VarTup__"++integer_to_list(next_id(var_tuple))).

next_id(Atom) ->
   Id = erlang:get(Atom),
   erlang:put(Atom, Id + 1),
   Id.

next_id() ->
   Id = erlang:get(imp_mod),
   erlang:put(imp_mod, Id + 1),
   Id.

next_ctx_id() ->
   Id = erlang:get(ctx),
   erlang:put(ctx, Id + 1),
   Id.

next_var_name() ->
   list_to_atom("__Local__"++integer_to_list(next_id())).

next_ctx_var_name() ->
   list_to_atom("__Ctx__"++integer_to_list(next_ctx_id())).

local_variable_name(Id) ->
  list_to_atom(lists:concat(["__XQ__var_", Id])).

copy_variable_name(Id) ->
   list_to_atom(lists:concat(["__Copy__var_", Id])).

node_function_name(Id) ->
   list_to_atom(lists:concat(["node_cons__", Id])).

% TODO implement
path_function_name(Id) ->
   list_to_atom(lists:concat(["path_expr__", Id])).

get_variable_tuple(Map) when is_map(Map) ->
   Vars = maps:get(variables, Map),
   Cnt = length(Vars),
   if Cnt == 0 ->
         {nil,?L};
      true ->
         get_variable_tuple(Map, Vars)
   end.

get_variable_tuple(_Ctx, List) when is_list(List) ->
   F = fun({_,_,_,Name}) when is_atom(Name) ->
             {true,{var,?L,Name}};
          ({Name,{var,_,_} = Var}) when is_atom(Name) ->
             {true,Var}; % context items
          (_) ->
             false
       end,
   Vars = lists:filtermap(F, List),
   ?P("{_@@Vars}").

abs_list(List) ->
    lists:foldr(fun(E, Abs) ->
                      {cons,?L, E, Abs}
                end, {nil,?L}, List).

%% from_list_to_seq([List]) when not is_list(List) ->
%%    ?P("(_@List)");
from_list_to_seq(List) when is_list(List) ->
   E1 = abs_list(List),
   ?P("xqerl_seq3:flatten(_@E1)").
%% ;
%% from_list_to_seq(NonList) ->
%%    ?P("(_@NonList)").

get_global_funs() ->
   case erlang:get(global_funs) of
      undefined ->
         [];
      F ->
         F
   end.

add_global_funs(Funs) ->
   case erlang:get(global_funs) of
      undefined ->
         erlang:put(global_funs,Funs);
      Gs ->
         erlang:put(global_funs,Funs ++ Gs)
   end.

global_fun_exists(Name, Arity) ->
   F = fun(Fun) ->
             FName = ?e:atom_value(?e:function_name(Fun)),
             FArity = ?e:function_arity(Fun),
             Name == FName andalso Arity == FArity
       end,
   lists:any(F, get_global_funs()).

a_term(Term) ->
   ?e:abstract(Term).

handle_predicate({Ctx, {LU, wildcard}}, Abs) 
   when LU =:= map_lookup;
        LU =:= array_lookup ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   ?P("xqerl_operators:lookup(_@CtxVar,_@Abs,all)");
handle_predicate({Ctx, {LU, Val}}, Abs) 
   when LU =:= map_lookup;
        LU =:= array_lookup ->
   %?dbg("Val",Val),
   E1 =  expr_do(Ctx, Val),
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   ?P("xqerl_operators:lookup(_@CtxVar,_@Abs,_@E1)");

handle_predicate({Ctx, {positional_predicate, [P]}}, Abs) ->
   handle_predicate({Ctx, {positional_predicate, P}}, Abs);
handle_predicate({Ctx, {positional_predicate, {sequence,[P]}}}, Abs) ->
   handle_predicate({Ctx, {positional_predicate, P}}, Abs);
handle_predicate({Ctx, {positional_predicate, {variable, Name}}}, Abs) ->
   Name1 = {var,?L,Name},
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   ?P("xqerl_seq3:position_filter(_@CtxVar,_@Name1,_@Abs)");
handle_predicate({Ctx, {positional_predicate, #xqAtomicValue{} = A}}, Abs) -> 
   A1 = abs_simp_atomic_value(A),
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   ?P("xqerl_seq3:position_filter(_@CtxVar,_@A1,_@Abs)");
handle_predicate({Ctx, {positional_predicate, #xqVarRef{name = Name}}}, Abs) -> 
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   {VarAbs, _} = get_variable_ref(Name, Ctx),
   ?P("xqerl_seq3:position_filter(_@CtxVar,_@VarAbs,_@Abs)");
handle_predicate({_Ctx, {positional_predicate, % Seq[last()] 
                        {'function-call', 
                         #xqFunctionDef{body = {xqerl_mod_fn,last,_}}}}}, Abs) ->
   ?P("xqerl_seq3:last(_@Abs)");
handle_predicate({Ctx, {positional_predicate, P}}, Abs) ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   NextCtxVar = next_ctx_var_name(),
   NextCtxVar1 = {var,?L,NextCtxVar},
   Ctx1 = set_context_variable_name(Ctx, NextCtxVar),
   E1 = expr_do(Ctx1, P),
   ?P("xqerl_seq3:position_filter(_@CtxVar,fun(_@NextCtxVar1) ->"
      " _@E1 end,_@Abs)");

handle_predicate({Ctx, {predicate, [P]}}, Abs) ->
   handle_predicate({Ctx, {predicate, P}}, Abs);
handle_predicate({Ctx, {predicate, #xqAtomicValue{type = Type} = A}}, Abs) 
   when ?xs_numeric(Type) ->
   A1 = abs_simp_atomic_value(A),
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   ?P("xqerl_seq3:position_filter(_@CtxVar,_@A1,_@Abs)");

handle_predicate({Ctx, {predicate, #xqVarRef{name = Name}}}, Abs) ->
%%    Ctx = lists:foldl(
%%            fun(V,M) ->
%%                  maps:remove(V, M)
%%            end, Ctx0, [context_variable,position_variable,size_variable]),
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   {VarAbs, #xqSeqType{type = VarType}} = get_variable_ref(Name, Ctx),
   if ?xs_numeric(VarType) ->
         ?P("xqerl_seq3:position_filter(_@CtxVar,_@VarAbs,_@Abs)");
      true ->
         NextCtxVar = {var,?L,next_ctx_var_name()},
         ?P("xqerl_seq3:filter(_@CtxVar,fun(_@NextCtxVar,_,_,_) -> "
            "_@VarAbs end,_@Abs)")
   end;
handle_predicate({Ctx, {predicate, P}}, Abs) ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   NextCtxVar = next_ctx_var_name(),
   NextCtxVar1 = {var,?L,NextCtxVar},
   IntCtxVar = {var,?L,next_var_name()},
   PosVar = {var,?L,next_var_name()},
   SizeVar = {var,?L,next_var_name()},

   AddFun = fun(N,C) ->
                  add_variable(N, C)
            end,
   Ctx0 = lists:foldl(AddFun, Ctx, 
                      [{context_variable,IntCtxVar},
                       {position_variable,PosVar},
                       {size_variable,SizeVar}
                      ]),   
   Ctx1 = set_context_variable_name(Ctx0, NextCtxVar),
   Ctx2 = Ctx1#{context_variable => IntCtxVar,
                position_variable => PosVar,
                size_variable => SizeVar},
   E1 = expr_do(Ctx2, P),
   ?P("xqerl_seq3:filter(_@CtxVar,fun(_@NextCtxVar1,_@IntCtxVar,_@PosVar,_@SizeVar) -> _@E1 end,_@Abs)");

handle_predicate({Ctx, {arguments, Args}}, Abs) ->
   PhF = fun('?') ->
               VarName = next_var_name(),
               [{var,?L,VarName}];
            (_) ->
               []
         end,
   PlaceHolders = lists:flatmap(PhF, Args),
   NwF = fun('?',PHs) ->
               {hd(PHs),tl(PHs)};
            (Arg,PHs) ->
               {Arg,PHs}
         end,
   {NewArgs, _} = lists:mapfoldl(NwF, PlaceHolders, Args),
   AgF = fun({var,_,_} = Arg) ->
               Arg;
            (Arg) ->
               expr_do(Ctx, Arg)
         end,
   ArgAbs = lists:map(AgF, NewArgs),
   NextCtxVar2 = {var,?L,next_ctx_var_name()},
   NextVar2    = {var,?L,next_var_name()},
   CtxAbs = context_map_abs(Ctx),
   Fun1 = ?P(["fun([]) ->",
              "     erlang:exit(xqerl_error:error('XPTY0004'));",
              "   (_@NextVar2) ->",
              "     xqerl_seq3:do_call(_@CtxAbs,_@NextVar2,{_@@ArgAbs})",
              "end"]),
   Fun2 = ?P(["fun(_@NextCtxVar2,_@@PlaceHolders) ->",
              " _@NextVar2 = xqerl_types:value(_@Abs),",
              " _@NextVar2(_@NextCtxVar2,_@@ArgAbs)",
              "end"]),
   if PlaceHolders == [] ->
         ?P("xqerl_seq3:val_map(_@Fun1,_@Abs)");
      true ->
         Fun2
   end.

a_var({_,Name},CtxVar) when is_atom(Name) -> % imported var
   V = {atom,?L,Name},
   ?P("maps:get(_@V, _@CtxVar)");
a_var({Name,1},CtxVar) when is_atom(Name) ->
   V = {atom,?L,Name},
   ?P("maps:get(_@V, _@CtxVar)");
a_var(Name,_CtxVar) when is_atom(Name) ->
   {var,?L,Name}.


param_prefix() -> "__Param__var_".



%% qname_tuple(#qname{namespace = 'no-namespace', local_name = Ln}) ->
%%    ?P("{<<>>,_@Ln@}");
%% qname_tuple(#qname{namespace = Ns, local_name = Ln}) ->
%%    ?P("{_@Ns@,_@Ln@}").

ensure_type(_,_,#xqSeqType{type = item, occur = zero_or_many},_) ->
   {nil, -1};
ensure_type(_,_,#xqSeqType{type = Type, 
                           occur = zero_or_many},_) when ?node(Type) ->
   {nil, -1};
ensure_type(_,_,#xqSeqType{type = #xqFunTest{}},_) ->
   {nil, -1};
ensure_type(_,_,Type,Type) ->
   {nil, -1};
ensure_type(_,_,
            #xqSeqType{type = Type,
                       occur = Occ1},
            #xqSeqType{type = Type,
                       occur = Occ2})
   when Occ1 == zero_or_many;
        Occ1 == zero_or_one, Occ2 == one;
        Occ1 == one_or_many, Occ2 == one ->
   {nil, -1};
ensure_type(Ctx,Var,Type,_AType) ->
   _ = add_used_record_type(xqAtomicValue),
   %?dbg("ensure_type         ",{Var,Type,AType}),
   T = expr_do(Ctx,Type),
   ?P("_ = case xqerl_types:instance_of(_@Var,_@T) of "
      "true -> _@Var; "
      "_ -> erlang:exit(xqerl_error:error('XPTY0004')) end").


ensure_param_type(_Ctx,Var,TVar,#xqSeqType{type = item, occur = zero_or_many}) ->
   ?P("_@Var = _@TVar");
ensure_param_type(_Ctx,Var,TVar,undefined) ->
   ?P("_@Var = _@TVar");
ensure_param_type(Ctx,Var,TVar,Type) ->
   T = expr_do(Ctx,Type),
   ?P("_@Var = xqerl_types:promote(_@TVar,_@T)").

clear_context_variables(Map) ->
   M1 = maps:remove(context_variable, Map),
   M2 = maps:remove(position_variable, M1),
   maps:remove(size_variable, M2).

context_map_abs(#{context_variable := C,
                  position_variable := P,
                  size_variable := S} = Ctx) ->
   CtxVar = {var,?L,get_context_variable_name(Ctx)},
   ?P("xqerl_context:set_context_item(_@CtxVar,_@C,xqerl_types:value(_@P),_@S)");
context_map_abs(Ctx) ->
   {var,?L,get_context_variable_name(Ctx)}.

do_axis_step(Ctx, SourceVariable, #xqAxisStep{id = _Id, axis = Axis,
                                              node_test = NodeTest, 
                                              predicates = Preds}) ->
   AbsPreds = abs_list([handle_axis_step_pred(Ctx, P) || P <- Preds]),
   case xpath_function(Axis, NodeTest) of
      {none, Fun} -> 
         ?P("xqldb_xpath:'@Fun@'(_@SourceVariable,{_@AbsPreds})");
      {name, Fun} -> 
         N = local_name_filter(NodeTest),
         ?P("xqldb_xpath:'@Fun@'(_@SourceVariable,{_@N, _@AbsPreds})");
      {name_type, Fun} -> 
         N = name_type_filter(NodeTest),
         ?P("xqldb_xpath:'@Fun@'(_@SourceVariable,{_@N, _@AbsPreds})");
      {error, _} ->
         {nil,?L}
         %?err('XPST0005')
   end.

local_name_filter(#xqKindTest{name = #qname{local_name = Ln}}) ->
   ?P("{_@Ln@}");
local_name_filter(#xqKindTest{name = undefined}) ->
   ?Q("{'_'}").


name_type_filter(#xqKindTest{type = #xqSeqType{type = 'xs:anyType'}} = K) ->
   name_type_filter(K#xqKindTest{type = undefined});
name_type_filter(#xqKindTest{name = #qname{namespace = 'no-namespace'} = N} = K) ->
   name_type_filter(K#xqKindTest{name = N#qname{namespace = <<>>}});

name_type_filter(#xqKindTest{name = undefined, type = undefined}) -> ?Q("{'_','_','_'}");
name_type_filter(#xqKindTest{name = undefined, type = #xqSeqType{type = Type}}) -> ?P("{'_','_',_@Type@}");

name_type_filter(#xqKindTest{name = #qname{namespace = <<"*">>,
                                           local_name = <<"*">>}, 
                             type = undefined}) -> 
   ?Q("{'_','_','_'}");
name_type_filter(#xqKindTest{name = #qname{namespace = <<"*">>,
                                           local_name = Ln}, 
                             type = undefined}) -> 
   ?P("{'_',_@Ln@,'_'}");
name_type_filter(#xqKindTest{name = #qname{namespace = Ns,
                                           local_name = <<"*">>}, 
                             type = undefined}) -> 
   ?P("{_@Ns@,'_','_'}");
name_type_filter(#xqKindTest{name = #qname{namespace = Ns,
                                           local_name = Ln}, 
                             type = undefined}) -> 
   ?P("{_@Ns@,_@Ln@,'_'}");

name_type_filter(#xqKindTest{name = #qname{namespace = <<"*">>,
                                           local_name = <<"*">>}, 
                             type = #xqSeqType{type = Type}}) -> 
   ?P("{'_','_',_@Type@}");
name_type_filter(#xqKindTest{name = #qname{namespace = <<"*">>,
                                           local_name = Ln}, 
                             type = #xqSeqType{type = Type}}) -> 
   ?P("{'_',_@Ln@,_@Type@}");
name_type_filter(#xqKindTest{name = #qname{namespace = Ns,
                                           local_name = <<"*">>}, 
                             type = #xqSeqType{type = Type}}) -> 
   ?P("{_@Ns@,'_',_@Type@}");
name_type_filter(#xqKindTest{name = #qname{namespace = Ns,
                                           local_name = Ln}, 
                             type = #xqSeqType{type = Type}}) -> 
   ?P("{_@Ns@,_@Ln@,_@Type@}").


handle_axis_step_pred(Ctx, {predicate, Pred}) ->
   IntCtxVar = {var,?L,next_var_name()},
   PosVar = {var,?L,next_var_name()},
   SizeVar = {var,?L,next_var_name()},

   AddFun = fun(N,C) ->
                  add_variable(N, C)
            end,
   Ctx1 = lists:foldl(AddFun, Ctx, 
                      [{context_variable,IntCtxVar},
                       {position_variable,PosVar},
                       {size_variable,SizeVar}
                      ]),   
   Ctx2 = Ctx1#{context_variable => IntCtxVar,
                position_variable => PosVar,
                size_variable => SizeVar},
   E1 = expr_do(Ctx2, Pred),
   ?P("fun(_@IntCtxVar,_@PosVar,_@SizeVar) -> "
      "xqerl_operators:eff_bool_val(_@E1) end");
handle_axis_step_pred(Ctx, {positional_predicate, Pred}) ->
   IntCtxVar = {var,?L,next_var_name()},
   PosVar = {var,?L,next_var_name()},
   SizeVar = {var,?L,next_var_name()},

   AddFun = fun(N,C) ->
                  add_variable(N, C)
            end,
   Ctx1 = lists:foldl(AddFun, Ctx, 
                      [{context_variable,IntCtxVar},
                       {position_variable,PosVar},
                       {size_variable,SizeVar}
                      ]),   
   Ctx2 = Ctx1#{context_variable => IntCtxVar,
                position_variable => PosVar,
                size_variable => SizeVar},
   E1 = expr_do(Ctx2, Pred), 
   % TODO check for last() function call and use in filter params as match
%   ?dbg("E1", {Pred, E1}),
   ?P("fun(_@IntCtxVar,_@PosVar,_@SizeVar) -> "
      "xqerl_operators:eff_bool_val("
      "  xqerl_operators:general_compare('=',_@E1, _@PosVar)) "
      "end");
handle_axis_step_pred(Ctx, Other) ->
   ?dbg("!!!SKIPPING!!!", Other),
   expr_do(Ctx, Other).


%% handle_predicate({Ctx, {predicate, P}}, Abs) ->
%%    ?P("xqerl_seq3:filter(_@CtxVar,fun(_@NextCtxVar1,_@IntCtxVar,_@PosVar,_@SizeVar) -> _@E1 end,_@Abs)");


% {name | name_type | none, fun_name}
xpath_function('ancestor', #xqKindTest{kind = 'document-node'}) -> {name_type,ancestor_document_node};
xpath_function('ancestor', #xqKindTest{kind = 'element'}) -> {name_type,ancestor_element};
xpath_function('ancestor', #xqKindTest{kind = 'node'}) -> {none,ancestor_node};
xpath_function('ancestor-or-self', #xqKindTest{kind = 'attribute'}) -> {name_type,ancestor_or_self_attribute};
xpath_function('ancestor-or-self', #xqKindTest{kind = 'comment'}) -> {none,ancestor_or_self_comment};
xpath_function('ancestor-or-self', #xqKindTest{kind = 'document-node'}) -> {name_type,ancestor_or_self_document_node};
xpath_function('ancestor-or-self', #xqKindTest{kind = 'element'}) -> {name_type,ancestor_or_self_element};
xpath_function('ancestor-or-self', #xqKindTest{kind = 'node'}) -> {none,ancestor_or_self_node};
xpath_function('ancestor-or-self', #xqKindTest{kind = 'processing-instruction'}) -> {name,ancestor_or_self_processing_instruction};
xpath_function('ancestor-or-self', #xqKindTest{kind = 'text'}) -> {none,ancestor_or_self_text};
xpath_function('attribute', #xqKindTest{kind = 'attribute'}) -> {name_type,attribute_attribute};
xpath_function('attribute', #xqKindTest{kind = 'node'}) -> {none,attribute_node};
xpath_function('child', #xqKindTest{kind = 'comment'}) -> {none,child_comment};
xpath_function('child', #xqKindTest{kind = 'element'}) -> {name_type,child_element};
xpath_function('child', #xqKindTest{kind = 'node'}) -> {none,child_node};
xpath_function('child', #xqKindTest{kind = 'processing-instruction'}) -> {name,child_processing_instruction};
xpath_function('child', #xqKindTest{kind = 'text'}) -> {none,child_text};
xpath_function('descendant', #xqKindTest{kind = 'comment'}) -> {none,descendant_comment};
xpath_function('descendant', #xqKindTest{kind = 'element'}) -> {name_type,descendant_element};
xpath_function('descendant', #xqKindTest{kind = 'node'}) -> {none,descendant_node};
xpath_function('descendant', #xqKindTest{kind = 'processing-instruction'}) -> {name,descendant_processing_instruction};
xpath_function('descendant', #xqKindTest{kind = 'text'}) -> {none,descendant_text};
xpath_function('descendant-or-self', #xqKindTest{kind = 'attribute'}) -> {name_type,descendant_or_self_attribute};
xpath_function('descendant-or-self', #xqKindTest{kind = 'comment'}) -> {none,descendant_or_self_comment};
xpath_function('descendant-or-self', #xqKindTest{kind = 'document-node'}) -> {name_type,descendant_or_self_document_node};
xpath_function('descendant-or-self', #xqKindTest{kind = 'element'}) -> {name_type,descendant_or_self_element};
xpath_function('descendant-or-self', #xqKindTest{kind = 'node'}) -> {none,descendant_or_self_node};
xpath_function('descendant-or-self', #xqKindTest{kind = 'processing-instruction'}) -> {name,descendant_or_self_processing_instruction};
xpath_function('descendant-or-self', #xqKindTest{kind = 'text'}) -> {none,descendant_or_self_text};
xpath_function('following', #xqKindTest{kind = 'comment'}) -> {none,following_comment};
xpath_function('following', #xqKindTest{kind = 'element'}) -> {name_type,following_element};
xpath_function('following', #xqKindTest{kind = 'node'}) -> {none,following_node};
xpath_function('following', #xqKindTest{kind = 'processing-instruction'}) -> {name,following_processing_instruction};
xpath_function('following', #xqKindTest{kind = 'text'}) -> {none,following_text};
xpath_function('following-sibling', #xqKindTest{kind = 'comment'}) -> {none,following_sibling_comment};
xpath_function('following-sibling', #xqKindTest{kind = 'element'}) -> {name_type,following_sibling_element};
xpath_function('following-sibling', #xqKindTest{kind = 'node'}) -> {none,following_sibling_node};
xpath_function('following-sibling', #xqKindTest{kind = 'processing-instruction'}) -> {name,following_sibling_processing_instruction};
xpath_function('following-sibling', #xqKindTest{kind = 'text'}) -> {none,following_sibling_text};
xpath_function('parent', #xqKindTest{kind = 'document-node'}) -> {name_type,parent_document_node};
xpath_function('parent', #xqKindTest{kind = 'element'}) -> {name_type,parent_element};
xpath_function('parent', #xqKindTest{kind = 'node'}) -> {none,parent_node};
xpath_function('preceding', #xqKindTest{kind = 'comment'}) -> {none,preceding_comment};
xpath_function('preceding', #xqKindTest{kind = 'element'}) -> {name_type,preceding_element};
xpath_function('preceding', #xqKindTest{kind = 'node'}) -> {none,preceding_node};
xpath_function('preceding', #xqKindTest{kind = 'processing-instruction'}) -> {name,preceding_processing_instruction};
xpath_function('preceding', #xqKindTest{kind = 'text'}) -> {none,preceding_text};
xpath_function('preceding-sibling', #xqKindTest{kind = 'comment'}) -> {none,preceding_sibling_comment};
xpath_function('preceding-sibling', #xqKindTest{kind = 'element'}) -> {name_type,preceding_sibling_element};
xpath_function('preceding-sibling', #xqKindTest{kind = 'node'}) -> {none,preceding_sibling_node};
xpath_function('preceding-sibling', #xqKindTest{kind = 'processing-instruction'}) -> {name,preceding_sibling_processing_instruction};
xpath_function('preceding-sibling', #xqKindTest{kind = 'text'}) -> {none,preceding_sibling_text};
xpath_function('self', #xqKindTest{kind = 'attribute'}) -> {name_type,self_attribute};
xpath_function('self', #xqKindTest{kind = namespace}) -> {none,self_namespace};
xpath_function('self', #xqKindTest{kind = 'comment'}) -> {none,self_comment};
xpath_function('self', #xqKindTest{kind = 'document-node'}) -> {name_type,self_document_node};
xpath_function('self', #xqKindTest{kind = 'element'}) -> {name_type,self_element};
xpath_function('self', #xqKindTest{kind = 'node'}) -> {none,self_node};
xpath_function('self', #xqKindTest{kind = 'processing-instruction'}) -> {name,self_processing_instruction};
xpath_function('self', #xqKindTest{kind = 'text'}) -> {none,self_text};
xpath_function(_, _) -> {error, empty_axis}.

get_used_record_types() ->
   case erlang:get('$_used_records') of
      undefined ->
         [];
      L ->
         lists:usort(L)
   end.

add_used_record_type(Atom) ->
   case erlang:get('$_used_records') of
      undefined ->
         erlang:put('$_used_records', [Atom]),
         ok;
      L ->
         erlang:put('$_used_records', [Atom|L]),
         ok         
   end.
   
%% splits a path expression into simple and complex parts.
%% simple parts: forward axes without predicates
%%  all child axes need not be doc-ordered
%% complex part: steps predicates and reverse steps other than parent
%%   after a complex step, if the steps continue, they can possibly be simple.
%% need to check if they are. so, split the path expression into parts  

%% Simple steps can most-likely be answered using the structure index
%% db_path_expr are known to be DB nodes path_expr can be either DB or memory
compile_path_statement(Ctx, CurrentContextSeq, Steps) ->
   SplitSteps = split_steps(Steps), 
   compile_path_statement_1(Ctx, CurrentContextSeq, SplitSteps).

compile_path_statement_1(Ctx, SourceVar, [{[],Hard}]) ->
   step_expr_do(Ctx, Hard, SourceVar);
compile_path_statement_1(Ctx, SourceVar, [{Simp,[]}]) ->
   [build_simple_path(Ctx, SourceVar, Simp)];
compile_path_statement_1(Ctx, SourceVar, [{Simp,Hard}]) ->
   NextVar = {var, ?L, next_var_name()},
   S = build_simple_path(Ctx, SourceVar, Simp),
   Sa = ?P("_@NextVar = _@S"),
   [Sa|step_expr_do(Ctx, Hard, NextVar)];

compile_path_statement_1(Ctx, SourceVar, [{[],Hard}|Rest]) ->
   Abs0 = step_expr_do(Ctx, Hard ++ [continue], SourceVar),
   NewSourceVar = lists:last(Abs0),
   Abs = lists:droplast(Abs0),
   Abs ++ compile_path_statement_1(Ctx, NewSourceVar, Rest);
compile_path_statement_1(Ctx, SourceVar, [{Simp,[]}|Rest]) ->
   NextVar = {var, ?L, next_var_name()},
   S = build_simple_path(Ctx, SourceVar, Simp),
   Sa = ?P("_@NextVar = _@S"),
   [Sa|compile_path_statement_1(Ctx, NextVar, Rest)];
compile_path_statement_1(Ctx, SourceVar, [{Simp,Hard}|Rest]) ->
   NextVar = {var, ?L, next_var_name()},
   S = build_simple_path(Ctx, SourceVar, Simp),
   Sa = ?P("_@NextVar = _@S"),
   Abs0 = step_expr_do(Ctx, Hard ++ [continue], NextVar),
   NewSourceVar = lists:last(Abs0),
   Abs = lists:droplast(Abs0),
   [Sa|Abs] ++ compile_path_statement_1(Ctx, NewSourceVar, Rest).

build_simple_path(_Ctx, SourceVar, Simp) ->
   %CtxVar = {var, ?L, get_context_variable_name(Ctx)},
   List = lists:map(fun simple_axis/1, Simp),
   AList = a_term(List),
   %?dbg("List ",List),
   ?P("xqldb_xpath:simple_path(_@SourceVar, _@AList)").

%% returns [{Simple, Hard}] list 
split_steps([]) -> [];
split_steps(Steps) ->
   case lists:splitwith(fun is_simple_step/1, Steps) of
      {[atomize], []} ->
         [{[], [atomize]}];
      {[double], []} ->
         [{[], [double]}];
      {Sim1, []} ->
         [{Sim1, []}];
      {Sim1, Hard1} ->
         {Sim1a, Hard1a} = maybe_split_predicate_step(Sim1, Hard1),
         {Hard2, Rest} = lists:splitwith(fun is_hard_step/1, Hard1a),
         [{Sim1a, Hard2} | split_steps(Rest)]
   end.

is_hard_step(Step) ->
   not is_simple_step(Step).

is_simple_step(atomize) -> true;
is_simple_step(double) -> true;
is_simple_step(#xqAxisStep{axis = Axis,
                           node_test = #xqKindTest{type = Ty},
                           predicates = []}) 
   when Axis == child;
        Axis == self;
        Axis == descendant;
        Axis == 'descendant-or-self';
        Axis == attribute ->
   if Ty == undefined;
      Ty == 'xs:anyType';
      Ty == 'xs:string';
      Ty == 'xs:untyped';
      Ty == 'xs:untypedAtomic' ->
         true;
      true ->
         false
   end;
is_simple_step(_) ->
   false.

% if the head of the hard steps is easy, except for non-positional predicate, 
% split into
% simple & hd hard, and make hd hard into a self axis step
maybe_split_predicate_step(Sim, 
                           [#xqAxisStep{axis = Axis,
                                        predicates = [{predicate, _}] = Preds} = H|Hs]) 
   when Axis == child;
        Axis == self;
        Axis == descendant;
        Axis == 'descendant-or-self';
        Axis == attribute ->
   case contains_position_call(Preds) of
      true ->
         {Sim, [H|Hs]};
      false ->
         %?dbg("Preds",Preds),
         NewSim = Sim ++ [H#xqAxisStep{predicates = []}],
         NewHard = [H#xqAxisStep{axis = self}|Hs],
         %?dbg("H    ",H),
         {NewSim, NewHard}
   end;
maybe_split_predicate_step(Sim, Hard) ->
   {Sim, Hard}.

simple_axis(atomize) -> atomize;
simple_axis(double) -> double;
simple_axis(#xqAxisStep{axis = Axis,
                        node_test = 
                          #xqKindTest{kind = Kind,
                                      name = Name}}) ->
   {Axis, simple_name(Kind, Name)}.

simple_name(attribute, #qname{namespace = N, local_name = L}) ->
   {att, any_name(N), any_name(L)};
simple_name(attribute, undefined) ->
   {att, '_', '_'};
simple_name('processing-instruction', #qname{local_name = L}) ->
   {pi, any_name(L)};
simple_name('processing-instruction', undefined) ->
   {pi, '_'};
simple_name(_, #qname{namespace = N, local_name = L}) ->
   {any_name(N), any_name(L)};
simple_name(document, undefined) ->
   [];
simple_name('document-node', undefined) ->
   [];
simple_name(node, _) ->
   '_';
simple_name(Kind, _) ->
   Kind.

any_name(<<"*">>) -> '_';
any_name('no-namespace') -> <<>>;
any_name(N) -> N.

%% -record(xqAxisStep, {
%%    axis       = child | descendant | attribute | self | 'descendant-or-self' | 'following-sibling' | following | namespace | parent | ancestor | 'preceding-sibling' | preceding | 'ancestor-or-self',
%%    node_test  = #xqKindTest{},
%% }).
%% -record(xqKindTest, {
%%    kind :: node | text | comment | 'namespace-node' | namespace | 'schema-element' | element | 'schema-attribute' | attribute | 'document-node' | document | 'processing-instruction',
%%    name :: #qname{} | undefined,
%% }).
                                                  

%%    step_expr_do(_, [continue], SourceVar)
%%    CurrCtxVar = {var,?L,get_context_variable_name(Ctx)},
%%    NextVar = {var,?L,next_var_name()},

contains_position_call({qname,<<"http://www.w3.org/2005/xpath-functions">>,_,<<"position">>}) -> true;
contains_position_call({qname,<<"http://www.w3.org/2005/xpath-functions">>,_,<<"last">>}) -> true;
contains_position_call(L) when is_list(L) ->
   lists:any(fun contains_position_call/1, L);
contains_position_call(T) when is_tuple(T) ->
   contains_position_call(tuple_to_list(T));
contains_position_call(_) -> false.
