-module('fn_collection_SUITE').
-include_lib("common_test/include/ct.hrl").
-compile({nowarn_unused_function,[environment/2]}).
-export([all/0,
         suite/0]).
-export([init_per_suite/1,
         end_per_suite/1]).
-export(['fn-collection-1'/1]).
-export(['fn-collection-2'/1]).
-export(['fn-collection-3'/1]).
-export(['fn-collection-4'/1]).
-export(['fn-collection-4d'/1]).
-export(['fn-collection-5'/1]).
-export(['fn-collection-5d'/1]).
-export(['fn-collection-6'/1]).
-export(['fn-collection-7'/1]).
-export(['fn-collection-8'/1]).
-export(['fn-collection-9'/1]).
-export(['fn-collection-10'/1]).
-export(['fn-collection-10d'/1]).
-export(['K2-SeqCollectionFunc-1'/1]).
-export(['K2-SeqCollectionFunc-2'/1]).
-export(['collection-001'/1]).
-export(['collection-002'/1]).
-export(['collection-003'/1]).
-export(['collection-004'/1]).
-export(['collection-005'/1]).
-export(['collection-006'/1]).
-export(['collection-007'/1]).
-export(['collection-008'/1]).
-export(['collection-009'/1]).
-export(['collection-010'/1]).
-export(['collection-900'/1]).
-export(['collection-901'/1]).
-export(['collection-902'/1]).
-export(['collection-903'/1]).
-export(['cbcl-collection-001'/1]).
-export(['cbcl-collection-002'/1]).
-export(['cbcl-collection-003'/1]).
-export(['cbcl-collection-004'/1]).
suite() -> [{timetrap,{seconds,5}}].
end_per_suite(_Config) -> 
   ct:timetrap({seconds,60}), 
   xqerl_module:unload(all).
init_per_suite(Config) -> 
   xqerl_db:install([node()]),
   xqerl_module:one_time_init(), 
   {ok,_} = application:ensure_all_started(xqerl),
   DD = filename:dirname(filename:dirname(?config(data_dir, Config))),
   TD = filename:join(DD, "QT3-test-suite"),
   __BaseDir = filename:join(TD, "fn"),
   [{base_dir, __BaseDir}|Config].
all() -> [
'fn-collection-1', 
'fn-collection-2', 
'fn-collection-3', 
'fn-collection-4', 
'fn-collection-4d', 
'fn-collection-5', 
'fn-collection-5d', 
'fn-collection-6', 
'fn-collection-7', 
'fn-collection-8', 
'fn-collection-9', 
'fn-collection-10', 
'fn-collection-10d', 
'K2-SeqCollectionFunc-1', 
'K2-SeqCollectionFunc-2', 
'collection-001', 
'collection-002', 
'collection-003', 
'collection-004', 
'collection-005', 
'collection-006', 
'collection-007', 
'collection-008', 
'collection-009', 
'collection-010', 
'collection-900', 
'collection-901', 
'collection-902', 
'collection-903', 
'cbcl-collection-001', 
'cbcl-collection-002', 
'cbcl-collection-003', 
'cbcl-collection-004'
].
environment('empty',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('atomic',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/atomic.xml"), ".","http://www.w3.org/fots/docs/atomic.xml"}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/XQueryTest","atomic"}]},
{schemas, [{filename:join(__BaseDir, "../docs/atomic.xsd"),"http://www.w3.org/XQueryTest"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('atomic-xq',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/atomic.xml"), ".","http://www.w3.org/fots/docs/atomic.xml"}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, [{filename:join(__BaseDir, "../docs/atomic.xsd"),"http://www.w3.org/XQueryTest"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('works-mod',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/works-mod.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('works',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/works.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('staff',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/staff.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('works-and-staff',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/works.xml"), "$works",[]}, 
{filename:join(__BaseDir, "../docs/staff.xml"), "$staff",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('auction',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/auction.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.example.com/AuctionWatch","ma"}, 
{"http://www.w3.org/1999/xlink","xlink"}, 
{"http://www.example.com/auctioneers#anyzone","anyzone"}, 
{"http://www.example.com/auctioneers#eachbay","eachbay"}, 
{"http://www.example.com/auctioneers#yabadoo","yabadoo"}, 
{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('qname',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/QName-source.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.example.com/QNameXSD",""}]},
{schemas, [{filename:join(__BaseDir, "../docs/QName-schema.xsd"),"http://www.example.com/QNameXSD"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('math',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/math","math"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('array',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('map',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('array-and-map',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"}, 
{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('default-collection-1',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, [{"",[{src,filename:join(__BaseDir, "../docs/bib.xml")}, 
{src,filename:join(__BaseDir, "../docs/reviews.xml")}]}]}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('simple-collection-1',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, [{"http://www.w3.org/2010/09/qt-fots-catalog/collection1",[{src,filename:join(__BaseDir, "../docs/bib.xml")}, 
{src,filename:join(__BaseDir, "../docs/reviews.xml")}]}]}, 
{'static-base-uri', [{"http://www.w3.org/2010/09/qt-fots-catalog/"}]}, 
{params, []}, 
{vars, [{"collection-uri","xs:string","'http://www.w3.org/2010/09/qt-fots-catalog/collection1'"}]}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('default-collection-2',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, [{"",[{src,filename:join(__BaseDir, "../docs/bib.xml")}, 
{src,filename:join(__BaseDir, "../docs/reviews.xml")}, 
{src,filename:join(__BaseDir, "../docs/books.xml")}]}]}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('simple-collection-2',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, [{"http://www.w3.org/2010/09/qt-fots-catalog/collection2",[{src,filename:join(__BaseDir, "../docs/bib.xml")}, 
{src,filename:join(__BaseDir, "../docs/reviews.xml")}, 
{src,filename:join(__BaseDir, "../docs/books.xml")}]}]}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, [{"collection-uri","xs:string","'http://www.w3.org/2010/09/qt-fots-catalog/collection2'"}]}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('integer-collection',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, [{"http://www.w3.org/2010/09/qt-fots-catalog/integers",[{query,__BaseDir,"1 to 10"}]}]}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('atomic-collection',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, [{"http://www.w3.org/2010/09/qt-fots-catalog/atomics",[{query,__BaseDir,"(1, \"hello\", 1e0)"}]}]}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('default-string-collection',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, [{"",[{query,__BaseDir,"(\"goodbye\", \"cruel\", \"world\")"}]}]}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
].
'fn-collection-1'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:collection(\"argument1\",\"argument2\")", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-2'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:collection(\"thisfileshouldnotexists\")", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-3'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:collection(\"invalidURI%gg\")", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"FODC0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-4'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "count(fn:collection($collection-uri))", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-4.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"2") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-4d'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "count(fn:collection())", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-4d.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"2") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-5'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "count(fn:collection($collection-uri))", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-5.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"3") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-5d'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "count(fn:collection())", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-5d.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"3") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-6'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "for $x in fn:collection($collection-uri)//title order by string($x) return $x", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-6.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<title>Advanced Programming in the Unix environment</title><title>Advanced Programming in the Unix environment</title><title>Basic Syntax</title><title>Data Model</title><title>Data on the Web</title><title>Data on the Web</title><title>Syntax For Data Model</title><title>TCP/IP Illustrated</title><title>TCP/IP Illustrated</title><title>The Economics of Technology and Content for Digital TV</title><title>XML</title><title>XML and Semistructured Data</title>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-7'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "distinct-values(fn:collection($collection-uri)//*[text()[contains(.,\"TCP/IP\")]]/normalize-space())", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-7.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_permutation(Res,"\"TCP/IP Illustrated\", \"One of the best books on TCP/IP.\"") of 
      true -> {comment, "Correct permutation"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XPST0005") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-8'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "for $d in fn:collection($collection-uri) return ($d//title)[1]", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-8.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_xml(Res,"<title>TCP/IP Illustrated</title><title>Data on the Web</title>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_xml(Res,"<title>Data on the Web</title><title>TCP/IP Illustrated</title>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-9'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "for $d in fn:collection($collection-uri) order by count($d//title) return
         count($d//title)", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-9.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "3 4 5") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-10'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = " let $c1 := fn:collection($collection-uri) let $c2 := fn:collection($collection-uri) for
         $c at $p in $c1 return $c is exactly-one($c2[$p])", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-10.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "true true true") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-collection-10d'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = " let $c1 := fn:collection() let $c2 := fn:collection() for $c at $p in $c1 return $c is
         exactly-one($c2[$p])", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-collection-10d.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "true true true") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K2-SeqCollectionFunc-1'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\"http:\\\\invalidURI\\someURI%gg\")", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K2-SeqCollectionFunc-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"FODC0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K2-SeqCollectionFunc-2'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\":/\")", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K2-SeqCollectionFunc-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"FODC0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-001'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection()", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-001.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case xqerl_test:assert_error(Res,"FODC0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-002'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(())", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-002.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case xqerl_test:assert_error(Res,"FODC0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-003'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection() | collection(())", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-collection-2',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-003.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 3") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case xqerl_test:assert_error(Res,"FODC0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-004'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection() | collection(())", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-004.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 4") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-005'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\"http://www.w3.org/2010/09/qt-fots-catalog/collection1\")", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-005.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case xqerl_test:assert_error(Res,"FODC0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-006'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\"collection1\")", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-006.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case xqerl_test:assert_error(Res,"FODC0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-007'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\"http://www.w3.org/2010/09/qt-fots-catalog/collection1\") |
         collection(\"collection1\")", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-007.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case xqerl_test:assert_error(Res,"FODC0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-008'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\"http://www.w3.org/2010/09/qt-fots-catalog/collection1\") |
         collection(\"collection1\")", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-008.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 4") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-009'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "let $c := collection(\"http://www.w3.org/2010/09/qt-fots-catalog/collection1\") return $c
         | (for $doc in $c return doc(document-uri($doc)))", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('simple-collection-1',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-009.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"count($result) = 2") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"document-node()*") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end,
   case xqerl_test:assert_error(Res,"FODC0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-010'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"directory-as-collection-uri"}. 
'collection-900'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\"nonexistent\")", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-900.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-901'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection()", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-901.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-902'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(\"##invalid\")", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-902.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"FODC0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'collection-903'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "collection(())", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "collection-903.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-collection-001'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:collection('%gg')", 
   _ = xqldb_docstore:delete_collection([]),
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-collection-001.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"FODC0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"FODC0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-collection-002'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:collection('http://www.w3.org/2010/09/qt-fots-catalog/integers')", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('integer-collection',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-collection-002.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_deep_eq(Res,"(1 to 10)") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_type(Res,"xs:integer+") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-collection-003'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:collection('http://www.w3.org/2010/09/qt-fots-catalog/atomics')", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('atomic-collection',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-collection-003.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_type(Res,"xs:anyAtomicType+") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_deep_eq(Res,"(1, 'hello', 1e0)") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-collection-004'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:collection()", 
   _ = xqldb_docstore:delete_collection([]),
   {Env,Opts} = xqerl_test:handle_environment(environment('default-string-collection',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-collection-004.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_type(Res,"xs:string+") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_deep_eq(Res,"('goodbye', 'cruel', 'world')") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.