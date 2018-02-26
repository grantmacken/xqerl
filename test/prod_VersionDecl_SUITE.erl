-module('prod_VersionDecl_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['version_declaration-009'/1]).
-export(['version_declaration-020'/1]).
-export(['K2-VersionProlog-3'/1]).
-export(['K2-VersionProlog-3-v3'/1]).
-export(['version_declaration-022-v1'/1]).
-export(['version_declaration-022-v3'/1]).
-export(['version_declaration-023-v1'/1]).
-export(['K-VersionProlog-1'/1]).
-export(['version_declaration-002'/1]).
-export(['version_declaration-001'/1]).
-export(['version_declaration-007'/1]).
-export(['version_declaration-008'/1]).
-export(['version_declaration-021'/1]).
-export(['VersionDecl-v1-processor-and-v3-query'/1]).
-export(['VersionDecl-v3-processor-and-v1-query'/1]).
-export(['version_declaration-010'/1]).
-export(['version_declaration-010-v3'/1]).
-export(['K-VersionProlog-3'/1]).
-export(['K-VersionProlog-3-v3'/1]).
-export(['K-VersionProlog-4'/1]).
-export(['K-VersionProlog-4-v3'/1]).
-export(['K-VersionProlog-2'/1]).
-export(['K-VersionProlog-2-v3'/1]).
-export(['K-VersionProlog-2-v31'/1]).
-export(['prolog-version-4'/1]).
-export(['prolog-version-4-v3'/1]).
-export(['prolog-version-4-v31'/1]).
-export(['prolog-version-5'/1]).
-export(['prolog-version-5-v3'/1]).
-export(['prolog-version-5-v31'/1]).
-export(['prolog-version-6'/1]).
-export(['prolog-version-6-v3'/1]).
-export(['prolog-version-6-v31'/1]).
-export(['prolog-version-7'/1]).
-export(['prolog-version-7-v3'/1]).
-export(['prolog-version-7-v31'/1]).
-export(['version_declaration-005'/1]).
-export(['prolog-version-1'/1]).
-export(['prolog-version-1-v3'/1]).
-export(['prolog-version-3'/1]).
-export(['prolog-version-3-v3'/1]).
-export(['K-VersionProlog-5'/1]).
-export(['K-VersionProlog-5-v3'/1]).
-export(['version_declaration-023-v3'/1]).
-export(['K2-VersionProlog-1'/1]).
-export(['K2-VersionProlog-2'/1]).
-export(['K2-VersionProlog-3-v4'/1]).
-export(['K2-VersionProlog-4'/1]).
-export(['K2-VersionProlog-5'/1]).
-export(['K2-VersionProlog-6'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> ct:timetrap({seconds,60}), xqerl_module:unload(all).
init_per_suite(Config) -> 
   DD = filename:dirname(filename:dirname(?config(data_dir, Config))),
   TD = filename:join(DD, "QT3-test-suite"),
   BaseDir = filename:join(TD, "prod")

,[{base_dir, BaseDir}|Config].
all() -> [
   'version_declaration-009',
   'version_declaration-020',
   'K2-VersionProlog-3',
   'K2-VersionProlog-3-v3',
   'version_declaration-022-v1',
   'version_declaration-022-v3',
   'version_declaration-023-v1',
   'K-VersionProlog-1',
   'version_declaration-002',
   'version_declaration-001',
   'version_declaration-007',
   'version_declaration-008',
   'version_declaration-021',
   'VersionDecl-v1-processor-and-v3-query',
   'VersionDecl-v3-processor-and-v1-query',
   'version_declaration-010',
   'version_declaration-010-v3',
   'K-VersionProlog-3',
   'K-VersionProlog-3-v3',
   'K-VersionProlog-4',
   'K-VersionProlog-4-v3',
   'K-VersionProlog-2',
   'K-VersionProlog-2-v3',
   'K-VersionProlog-2-v31',
   'prolog-version-4',
   'prolog-version-4-v3',
   'prolog-version-4-v31',
   'prolog-version-5',
   'prolog-version-5-v3',
   'prolog-version-5-v31',
   'prolog-version-6',
   'prolog-version-6-v3',
   'prolog-version-6-v31',
   'prolog-version-7',
   'prolog-version-7-v3',
   'prolog-version-7-v31',
   'version_declaration-005',
   'prolog-version-1',
   'prolog-version-1-v3',
   'prolog-version-3',
   'prolog-version-3-v3',
   'K-VersionProlog-5',
   'K-VersionProlog-5-v3',
   'version_declaration-023-v3',
   'K2-VersionProlog-1',
   'K2-VersionProlog-2',
   'K2-VersionProlog-3-v4',
   'K2-VersionProlog-4',
   'K2-VersionProlog-5',
   'K2-VersionProlog-6'].
environment('empty',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('atomic',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/atomic.xml"), ".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{filename:join(BaseDir, "../docs/atomic.xsd"),"http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, [{"http://www.w3.org/XQueryTest","atomic"}]},
{resources, []},
{modules, []}
];
environment('bib2',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../op/union/bib2.xml"), ".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('atomic-xq',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/atomic.xml"), ".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{filename:join(BaseDir, "../docs/atomic.xsd"),"http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-mod',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/works-mod.xml"), ".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/works.xml"), ".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('staff',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/staff.xml"), ".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-and-staff',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/works.xml"), "$works",""},
{filename:join(BaseDir, "../docs/staff.xml"), "$staff",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('auction',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/auction.xml"), ".",""}]},
{schemas, []},
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
{resources, []},
{modules, []}
];
environment('qname',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "../docs/QName-source.xml"), ".",""}]},
{schemas, [{filename:join(BaseDir, "../docs/QName-schema.xsd"),"http://www.example.com/QNameXSD"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, [{"http://www.example.com/QNameXSD",""}]},
{resources, []},
{modules, []}
];
environment('math',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/math","math"}]},
{resources, []},
{modules, []}
];
environment('array',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"}]},
{resources, []},
{modules, []}
];
environment('map',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{resources, []},
{modules, []}
];
environment('array-and-map',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"},
{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{resources, []},
{modules, []}
].
'version_declaration-009'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "declare boundary-space preserve; xquery version \"1.0\"; 1,2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-009.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'version_declaration-020'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version; 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-020.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-VersionProlog-3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'K2-VersionProlog-3-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\" default; 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-VersionProlog-3-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'version_declaration-022-v1'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'version_declaration-022-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery encoding \"utf-8\" version \"3.0\"; 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-022-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'version_declaration-023-v1'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'K-VersionProlog-1'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "(:encoding \"UTF-8XX\":)xquery version \"1.0\" encoding \"UTF-8\"; 1 eq 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K-VersionProlog-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"*") of 
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
'version_declaration-002'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "(:encoding \"utf-8xx\":)xquery version \"1.0\"; <bib/>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-002.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_xml(Res,"<bib/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"*") of 
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
'version_declaration-001'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"1.0\" (:encoding \"utf-8xx\":); 1,2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-001.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_string_value(Res, "1 2") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"*") of 
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
'version_declaration-007'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version '-1.0'; 2 + 2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-007.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0031") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'version_declaration-008'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"abc\"; 1,2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-008.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0031") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'version_declaration-021'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"2.0\"; 1.2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-021.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_eq(Res,"1.2") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XQST0031") of 
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
'VersionDecl-v1-processor-and-v3-query'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'VersionDecl-v3-processor-and-v1-query'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"1.0\"; <bib/>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "VersionDecl-v3-processor-and-v1-query.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"XQST0031") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_xml(Res,"<bib/>") of 
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
'version_declaration-010'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'version_declaration-010-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\" encoding \"999-UTF-8-*\"; \"ABC\"",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-010-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0087") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K-VersionProlog-3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'K-VersionProlog-3-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\" encoding \"UTF-8 \"; 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K-VersionProlog-3-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0087") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K-VersionProlog-4'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'K-VersionProlog-4-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\" encoding \"ISO-8859-1|\"; 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K-VersionProlog-4-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0087") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K-VersionProlog-2'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'K-VersionProlog-2-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\" ; 1 eq 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K-VersionProlog-2-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K-VersionProlog-2-v31'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.1\" ; 1 eq 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K-VersionProlog-2-v31.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-4'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'prolog-version-4-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 1,2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-4-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "1 2") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-4-v31'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.1\"; 1,2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-4-v31.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "1 2") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-5'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'prolog-version-5-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; <bib/>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-5-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<bib/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-5-v31'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.1\"; <bib/>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-5-v31.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<bib/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-6'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'prolog-version-6-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "
        xquery version '3.0'; 
        declare boundary-space preserve; 
        declare default order empty greatest; 
        declare namespace ns = \"http://www.example.org/\"; 
        for $b in//book stable order by xs:decimal($b/price[1]) empty greatest 
        return $b/title",
   {Env,Opts} = xqerl_test:handle_environment(environment('bib2',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-6-v3.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<title>Data on the Web</title><title>TCP/IP Illustrated</title><title>Advanced Programming in the Unix environment</title><title>The Economics of Technology and Content for Digital TV</title>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-6-v31'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "
         xquery version '3.1'; 
         declare boundary-space preserve; 
         declare default order empty greatest; 
         declare namespace ns = \"http://www.example.org/\"; 
         for $b in//book stable order by xs:decimal($b/price[1]) empty greatest 
         return $b/title",
   {Env,Opts} = xqerl_test:handle_environment(environment('bib2',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-6-v31.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<title>Data on the Web</title><title>TCP/IP Illustrated</title><title>Advanced Programming in the Unix environment</title><title>The Economics of Technology and Content for Digital TV</title>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-7'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'prolog-version-7-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "
        xquery version \"3.0\"; 
        declare boundary-space preserve; 
        declare default order empty greatest; 
        declare namespace ns = \"http://www.example.org/\"; 
        for $b in //book stable order by xs:decimal($b/price[1]) empty greatest 
        return $b/title",
   {Env,Opts} = xqerl_test:handle_environment(environment('bib2',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-7-v3.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<title>Data on the Web</title><title>TCP/IP Illustrated</title><title>Advanced Programming in the Unix environment</title><title>The Economics of Technology and Content for Digital TV</title>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-7-v31'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "
         xquery version \"3.1\"; 
         declare boundary-space preserve; 
         declare default order empty greatest; 
         declare namespace ns = \"http://www.example.org/\"; 
         for $b in //book stable order by xs:decimal($b/price[1]) empty greatest 
         return $b/title",
   {Env,Opts} = xqerl_test:handle_environment(environment('bib2',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-7-v31.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<title>Data on the Web</title><title>TCP/IP Illustrated</title><title>Advanced Programming in the Unix environment</title><title>The Economics of Technology and Content for Digital TV</title>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'version_declaration-005'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"schemaImport"}.
'prolog-version-1'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'prolog-version-1-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\" encoding \"utf-8\"; 1,2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-1-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "1 2") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'prolog-version-3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'prolog-version-3-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\" encoding \"US-ASCII\"; 1,2",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "prolog-version-3-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "1 2") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K-VersionProlog-5'(Config) ->
   BaseDir = ?config(base_dir, Config),
   {skip,"XQ10"}.
'K-VersionProlog-5-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "
        xquery version \"3.0\" encoding \"ISO-8859-1\"; 
        declare boundary-space preserve; 
        declare default collation \"http://www.w3.org/2005/xpath-functions/collation/codepoint\"; 
        declare base-uri \"http://example.com/\"; 
        declare construction strip; 
        declare ordering ordered; 
        declare default order empty greatest; 
        declare copy-namespaces no-preserve, no-inherit; 
        declare namespace ex = \"http://example.com/a/Namespace\"; 
        declare default element namespace \"http://example.com/\"; 
        declare default function namespace \"http://example.com/\"; 
        declare option fn:x-notRecognized \"option content\"; 
        1 eq 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K-VersionProlog-5-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'version_declaration-023-v3'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery encoding \"utf-8\"; 1 eq 1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "version_declaration-023-v3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-VersionProlog-1'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "'xquery version \"1.0\" encoding \"UTF-8|#%\";' eq 'xquery version \"1.0\" encoding \"UTF-8|#%\";'",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-VersionProlog-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-VersionProlog-2'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "\"xquery version '1.0' encoding 'UTF-8|#%';\" eq \"xquery version '1.0' encoding 'UTF-8|#%';\"",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-VersionProlog-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-VersionProlog-3-v4'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version '1&#x2e;0' encoding 'UTF-8'; true()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-VersionProlog-3-v4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-VersionProlog-4'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "encoding :localName",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-VersionProlog-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-VersionProlog-5'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery gt xquery",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-VersionProlog-5.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPDY0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-VersionProlog-6'(Config) ->
   BaseDir = ?config(base_dir, Config),
   Qry = "xquery version '1.0' encoding 'UTF&#x2d;8'; true()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-VersionProlog-6.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
