-module('prod_CompAttrConstructor_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['Constr-compattr-name-1'/1]).
-export(['Constr-compattr-name-2'/1]).
-export(['Constr-compattr-name-3'/1]).
-export(['Constr-compattr-name-4'/1]).
-export(['Constr-compattr-compname-1'/1]).
-export(['Constr-compattr-compname-2'/1]).
-export(['Constr-compattr-compname-3'/1]).
-export(['Constr-compattr-compname-4'/1]).
-export(['Constr-compattr-compname-5'/1]).
-export(['Constr-compattr-compname-6'/1]).
-export(['Constr-compattr-compname-7'/1]).
-export(['Constr-compattr-compname-8'/1]).
-export(['Constr-compattr-compname-9'/1]).
-export(['Constr-compattr-compname-10'/1]).
-export(['Constr-compattr-compname-11'/1]).
-export(['Constr-compattr-compname-12'/1]).
-export(['Constr-compattr-compname-13'/1]).
-export(['Constr-compattr-compname-14'/1]).
-export(['Constr-compattr-compname-15'/1]).
-export(['Constr-compattr-compname-16'/1]).
-export(['Constr-compattr-compname-17'/1]).
-export(['Constr-compattr-compname-18'/1]).
-export(['Constr-compattr-compname-19'/1]).
-export(['Constr-compattr-doc-1'/1]).
-export(['Constr-compattr-parent-1'/1]).
-export(['Constr-compattr-string-1'/1]).
-export(['Constr-compattr-data-1'/1]).
-export(['Constr-compattr-enclexpr-1'/1]).
-export(['Constr-compattr-enclexpr-2'/1]).
-export(['Constr-compattr-enclexpr-3'/1]).
-export(['Constr-compattr-enclexpr-4'/1]).
-export(['Constr-compattr-id-1'/1]).
-export(['Constr-compattr-id-2'/1]).
-export(['constattrerr-1'/1]).
-export(['K2-ComputeConAttr-1'/1]).
-export(['K2-ComputeConAttr-2'/1]).
-export(['K2-ComputeConAttr-3'/1]).
-export(['K2-ComputeConAttr-4'/1]).
-export(['K2-ComputeConAttr-5'/1]).
-export(['K2-ComputeConAttr-6'/1]).
-export(['K2-ComputeConAttr-7'/1]).
-export(['K2-ComputeConAttr-8'/1]).
-export(['K2-ComputeConAttr-9'/1]).
-export(['K2-ComputeConAttr-10'/1]).
-export(['K2-ComputeConAttr-11'/1]).
-export(['K2-ComputeConAttr-12'/1]).
-export(['K2-ComputeConAttr-13'/1]).
-export(['K2-ComputeConAttr-14'/1]).
-export(['K2-ComputeConAttr-15'/1]).
-export(['K2-ComputeConAttr-16'/1]).
-export(['K2-ComputeConAttr-17'/1]).
-export(['K2-ComputeConAttr-18'/1]).
-export(['K2-ComputeConAttr-19'/1]).
-export(['K2-ComputeConAttr-20'/1]).
-export(['K2-ComputeConAttr-21'/1]).
-export(['K2-ComputeConAttr-22'/1]).
-export(['K2-ComputeConAttr-23'/1]).
-export(['K2-ComputeConAttr-24'/1]).
-export(['K2-ComputeConAttr-25'/1]).
-export(['K2-ComputeConAttr-26'/1]).
-export(['K2-ComputeConAttr-27'/1]).
-export(['K2-ComputeConAttr-28'/1]).
-export(['K2-ComputeConAttr-29'/1]).
-export(['K2-ComputeConAttr-30'/1]).
-export(['K2-ComputeConAttr-31'/1]).
-export(['K2-ComputeConAttr-32'/1]).
-export(['K2-ComputeConAttr-33'/1]).
-export(['K2-ComputeConAttr-34'/1]).
-export(['K2-ComputeConAttr-35'/1]).
-export(['K2-ComputeConAttr-36'/1]).
-export(['K2-ComputeConAttr-37'/1]).
-export(['K2-ComputeConAttr-38'/1]).
-export(['K2-ComputeConAttr-39'/1]).
-export(['K2-ComputeConAttr-40'/1]).
-export(['K2-ComputeConAttr-41'/1]).
-export(['K2-ComputeConAttr-42'/1]).
-export(['K2-ComputeConAttr-43'/1]).
-export(['K2-ComputeConAttr-44'/1]).
-export(['K2-ComputeConAttr-45'/1]).
-export(['K2-ComputeConAttr-46'/1]).
-export(['K2-ComputeConAttr-47'/1]).
-export(['K2-ComputeConAttr-48'/1]).
-export(['K2-ComputeConAttr-49'/1]).
-export(['K2-ComputeConAttr-50'/1]).
-export(['K2-ComputeConAttr-51'/1]).
-export(['K2-ComputeConAttr-52'/1]).
-export(['K2-ComputeConAttr-53'/1]).
-export(['K2-ComputeConAttr-54'/1]).
-export(['K2-ComputeConAttr-55'/1]).
-export(['K2-ComputeConAttr-56'/1]).
-export(['K2-ComputeConAttr-57'/1]).
-export(['K2-ComputeConAttr-58'/1]).
-export(['K2-ComputeConAttr-59'/1]).
-export(['K2-ComputeConAttr-60'/1]).
-export(['K2-ComputeConAttr-61'/1]).
-export(['comp-attr-bad-name-1'/1]).
-export(['comp-attr-bad-name-2'/1]).
-export(['comp-attr-bad-name-3'/1]).
-export(['comp-attr-bad-name-4'/1]).
-export(['comp-attr-bad-name-5'/1]).
-export(['comp-attr-bad-name-6'/1]).
-export(['comp-attr-bad-name-7'/1]).
-export(['cbcl-constr-compattr-001'/1]).
-export(['cbcl-constr-compattr-002'/1]).
-export(['cbcl-constr-compattr-003'/1]).
-export(['cbcl-constr-compattr-005'/1]).
-export(['cbcl-constr-compattr-006'/1]).
-export(['cbcl-constr-compattr-007'/1]).
-export(['cbcl-constr-compattr-008'/1]).
-export(['cbcl-constr-compattr-009'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> ct:timetrap({seconds,60}), xqerl_module:unload(all).
init_per_suite(Config) -> 
   DD = filename:dirname(filename:dirname(proplists:get_value(data_dir, Config))),
   TD = filename:join(DD, "QT3-test-suite"),
   BaseDir = filename:join(TD, "prod")

,[{base_dir, BaseDir}|Config].
all() -> [
   'Constr-compattr-name-1',
   'Constr-compattr-name-2',
   'Constr-compattr-name-3',
   'Constr-compattr-name-4',
   'Constr-compattr-compname-1',
   'Constr-compattr-compname-2',
   'Constr-compattr-compname-3',
   'Constr-compattr-compname-4',
   'Constr-compattr-compname-5',
   'Constr-compattr-compname-6',
   'Constr-compattr-compname-7',
   'Constr-compattr-compname-8',
   'Constr-compattr-compname-9',
   'Constr-compattr-compname-10',
   'Constr-compattr-compname-11',
   'Constr-compattr-compname-12',
   'Constr-compattr-compname-13',
   'Constr-compattr-compname-14',
   'Constr-compattr-compname-15',
   'Constr-compattr-compname-16',
   'Constr-compattr-compname-17',
   'Constr-compattr-compname-18',
   'Constr-compattr-compname-19',
   'Constr-compattr-doc-1',
   'Constr-compattr-parent-1',
   'Constr-compattr-string-1',
   'Constr-compattr-data-1',
   'Constr-compattr-enclexpr-1',
   'Constr-compattr-enclexpr-2',
   'Constr-compattr-enclexpr-3',
   'Constr-compattr-enclexpr-4',
   'Constr-compattr-id-1',
   'Constr-compattr-id-2',
   'constattrerr-1',
   'K2-ComputeConAttr-1',
   'K2-ComputeConAttr-2',
   'K2-ComputeConAttr-3',
   'K2-ComputeConAttr-4',
   'K2-ComputeConAttr-5',
   'K2-ComputeConAttr-6',
   'K2-ComputeConAttr-7',
   'K2-ComputeConAttr-8',
   'K2-ComputeConAttr-9',
   'K2-ComputeConAttr-10',
   'K2-ComputeConAttr-11',
   'K2-ComputeConAttr-12',
   'K2-ComputeConAttr-13',
   'K2-ComputeConAttr-14',
   'K2-ComputeConAttr-15',
   'K2-ComputeConAttr-16',
   'K2-ComputeConAttr-17',
   'K2-ComputeConAttr-18',
   'K2-ComputeConAttr-19',
   'K2-ComputeConAttr-20',
   'K2-ComputeConAttr-21',
   'K2-ComputeConAttr-22',
   'K2-ComputeConAttr-23',
   'K2-ComputeConAttr-24',
   'K2-ComputeConAttr-25',
   'K2-ComputeConAttr-26',
   'K2-ComputeConAttr-27',
   'K2-ComputeConAttr-28',
   'K2-ComputeConAttr-29',
   'K2-ComputeConAttr-30',
   'K2-ComputeConAttr-31',
   'K2-ComputeConAttr-32',
   'K2-ComputeConAttr-33',
   'K2-ComputeConAttr-34',
   'K2-ComputeConAttr-35',
   'K2-ComputeConAttr-36',
   'K2-ComputeConAttr-37',
   'K2-ComputeConAttr-38',
   'K2-ComputeConAttr-39',
   'K2-ComputeConAttr-40',
   'K2-ComputeConAttr-41',
   'K2-ComputeConAttr-42',
   'K2-ComputeConAttr-43',
   'K2-ComputeConAttr-44',
   'K2-ComputeConAttr-45',
   'K2-ComputeConAttr-46',
   'K2-ComputeConAttr-47',
   'K2-ComputeConAttr-48',
   'K2-ComputeConAttr-49',
   'K2-ComputeConAttr-50',
   'K2-ComputeConAttr-51',
   'K2-ComputeConAttr-52',
   'K2-ComputeConAttr-53',
   'K2-ComputeConAttr-54',
   'K2-ComputeConAttr-55',
   'K2-ComputeConAttr-56',
   'K2-ComputeConAttr-57',
   'K2-ComputeConAttr-58',
   'K2-ComputeConAttr-59',
   'K2-ComputeConAttr-60',
   'K2-ComputeConAttr-61',
   'comp-attr-bad-name-1',
   'comp-attr-bad-name-2',
   'comp-attr-bad-name-3',
   'comp-attr-bad-name-4',
   'comp-attr-bad-name-5',
   'comp-attr-bad-name-6',
   'comp-attr-bad-name-7',
   'cbcl-constr-compattr-001',
   'cbcl-constr-compattr-002',
   'cbcl-constr-compattr-003',
   'cbcl-constr-compattr-005',
   'cbcl-constr-compattr-006',
   'cbcl-constr-compattr-007',
   'cbcl-constr-compattr-008',
   'cbcl-constr-compattr-009'].
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
];
environment('DupNode',BaseDir) ->
[{'decimal-formats', []},
{sources, [{filename:join(BaseDir, "CompAttrConstructor/DupNode.xml"), ".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, []},
{modules, []}
].
'Constr-compattr-name-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute attr {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-name-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-name-2'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare namespace foo=\"http://www.example.com/foo\"; element elem {attribute foo:attr {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-name-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem xmlns:foo=\"http://www.example.com/foo\" foo:attr=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-name-3'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute foo:attr {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-name-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0081") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-name-4'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element x { attribute Q{http://example.com/x}y { } }",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-name-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert(Res,"exists($result[self::x/@*[local-name()='y' and namespace-uri()='http://example.com/x']])") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {()} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-2'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {'one', 'two'} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-3'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {xs:untypedAtomic('one'), xs:untypedAtomic('two')} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-4'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {//a} {'text'}}",
   {Env,Opts} = xqerl_test:handle_environment(environment('DupNode',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-4.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-5'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {1,2} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-5.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-6'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {123} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-6.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-7'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {xs:dateTime(\"1999-05-31T13:20:00\")} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-7.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-8'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   {skip,"Validation Environment"}.
'Constr-compattr-compname-9'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {xs:QName('aQname')} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-9.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem aQname=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-10'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {'attr'} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-10.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-11'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {'attr', ()} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-11.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-12'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {(), 'attr'} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-12.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-13'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem xmlns:foo=\"http://www.example.com/foo\">{element elem {attribute {'foo:attr'} {}}}</elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-13.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem xmlns:foo=\"http://www.example.com/foo\"><elem foo:attr=\"\"/></elem>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-14'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {'foo:attr'} {}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-14.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0074") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-15'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {xs:untypedAtomic('attr')} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-15.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-16'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem xmlns:foo=\"http://www.example.com/foo\">{attribute {xs:untypedAtomic('foo:attr')} {'text'}}</elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-16.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem xmlns:foo=\"http://www.example.com/foo\" foo:attr=\"text\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-17'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {xs:untypedAtomic('foo:elem')} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-17.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0074") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-18'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {'el em'} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-18.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0074") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-compname-19'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute {xs:untypedAtomic('el em')} {'text'}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-compname-19.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0074") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-doc-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute attr {., .}}",
   {Env,Opts} = xqerl_test:handle_environment(environment('DupNode',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-doc-1.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"texttext texttext\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-parent-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "count((attribute attr {})/..)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-parent-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"0") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-string-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:string(attribute attr {'a', element a {}, 'b'})",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-string-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "a  b") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-data-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:data(attribute attr {'a', element a {}, 'b'})",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-data-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "a  b") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-enclexpr-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute attr {1,'string',3.14,xs:float('1.2345e-2'),xs:dateTime('2002-04-02T12:00:00-01:00')}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-enclexpr-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"1 string 3.14 0.012345 2002-04-02T12:00:00-01:00\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-enclexpr-2'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute attr {<elem>123</elem>, (<elem attr='456'/>)/@attr, (<elem>789</elem>)/text()}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-enclexpr-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"123 456 789\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-enclexpr-3'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute attr {1,'',2}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-enclexpr-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"1  2\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-enclexpr-4'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute attr {1,<a/>,2}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-enclexpr-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem attr=\"1  2\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-id-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute xml:id {\"ncname\"}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-id-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem xml:id=\"ncname\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'Constr-compattr-id-2'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "element elem {attribute xml:id {\" ab c d \"}}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "Constr-compattr-id-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_xml(Res,"<elem xml:id=\"ab c d\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XQDY0091") of 
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
'constattrerr-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute xmlns {}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "constattrerr-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute \"name\" {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-2'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> <?target content ?> {attribute name {\"content\"}} </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-3'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> {\"a string\", attribute name {\"content\"}} </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-4'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> {\"a string\", attribute name {\"content\"}} </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-5'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> <![CDATA[]]> {attribute name {\"content\"}} </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-5.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-6'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> <![CDATA[content]]> {attribute name {\"content\"}} </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-6.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-7'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> <!-- content --> {attribute name {\"content\"}} </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-7.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-8'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> <!-- comment --> { \"a string\", 999, attribute name {\"content\"}, xs:hexBinary(\"FF\") } </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-8.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-9'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem> <!-- comment --> { \"a string\", 999, (\"another string\", attribute name {\"content\"}, 383), xs:hexBinary(\"FF\") } </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-9.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-10'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<a> <?target content?> {<b>{attribute name{\"content\"}}</b>} </a>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-10.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<a><?target content?><b name=\"content\"/></a>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-11'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<a>{(<?target content?>, attribute name{\"content\"})[2]} </a>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-11.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<a name=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-12'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<a> <!-- content --> {attribute name{\"content\"}} </a>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-12.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-13'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<foo > <doo/> {attribute name {\"content\"}} </foo>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-13.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-14'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() { <a/> }; <b> {local:myFunc()} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-14.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-15'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() { comment {\"content\"} }; <b> {local:myFunc()} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-15.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-16'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() as element()+ { <a/> }; <b> {local:myFunc()} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-16.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-17'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() as item() { <a/> }; <b> {local:myFunc()} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-17.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-18'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() as item() { <a/> }; <b> {local:myFunc()} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-18.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-19'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc($recurse as xs:integer) { <nested> { if ($recurse = 0) then () else local:myFunc($recurse - 1) } </nested> }; <b> {local:myFunc(3)} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-19.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-20'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc($recurse as xs:integer) as item() { <nested> { if ($recurse = 0) then () else local:myFunc($recurse - 1) } </nested> }; <b> {local:myFunc(3)} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-20.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-21'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() { <elem/>, attribute name {\"content\"} }; <b> {local:myFunc()} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-21.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-22'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare variable $myVar := (<elem/>, attribute name {\"content\"}); <b> {$myVar} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-22.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-23'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare variable $myVar := (<elem/>, attribute name {\"content\"}); <b> {$myVar[2]} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-23.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<b name=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-24'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare variable $myVar := (attribute name {\"content\"}, <elem/>); <b> {$myVar[2]} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-24.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<b><elem/></b>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-25'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc($recurse as xs:integer) { attribute {concat(\"name\", $recurse)} {\"content\"} , if ($recurse = 0) then () else local:myFunc($recurse - 1) }; <b> {local:myFunc(2)} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-25.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<b name2=\"content\" name1=\"content\" name0=\"content\" name=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-26'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() { attribute name {\"content\"}, <elem/> }; <b> {local:myFunc()} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-26.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<b name=\"content\"><elem/></b>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-27'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() { <elem/>, attribute name {\"content\"} }; <b> {local:myFunc()[2]} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-27.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<b name=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-28'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare variable $local:myVar := <a/>; <b> {$local:myVar} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-28.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-29'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare variable $local:myVar as item() := <a/>; <b> {$local:myVar} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-29.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-30'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare variable $local:myVar := attribute n2 {\"content\"}; <b> {$local:myVar} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-30.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<b n2=\"content\" name=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-31'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare function local:myFunc() { attribute n2 {\"content\"} }; <b> {local:myFunc()} {attribute name {\"content\"}} </b>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-31.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<b n2=\"content\" name=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-32'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute name {<anElement/>}, attribute name2 {\"content\"} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-32.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<e name=\"\" name2=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-33'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute name {\"content\"}, attribute name2 {\"content\"} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-33.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<e name=\"content\" name2=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-34'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute name {xs:hexBinary(\"ff\")}, attribute name2 {\"content\"} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-34.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<e name=\"FF\" name2=\"content\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-35'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<elem><![CDATA[]]>{attribute name {\"content\"}}<alem/> </elem>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-35.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<elem name=\"content\"><alem/></elem>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-36'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "count(<elem><![CDATA[]]></elem>/text())",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-36.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"0") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-37'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute xmlns:localName {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-37.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0081") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-38'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute {\"xmlns:localName\"} {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-38.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XQDY0074") of 
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
'K2-ComputeConAttr-39'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute aPrefix:localName {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-39.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0081") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-40'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute {\"aPrefix:localName\"} {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-40.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0074") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-41'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute {xs:untypedAtomic(\"aPrefix::localName\")} {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-41.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0074") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-42'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "
        declare namespace prefix = \"http://www.w3.org/2000/xmlns/\"; 
        <e>{attribute prefix:localName {\"content\"}}</e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-42.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0070") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-43'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare namespace prefix = \"http://www.w3.org/2000/xmlns/\"; <e>{attribute {\"prefix:localName\"} {\"content\"}}</e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-43.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0070") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-44'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute {\"xmlns\"} {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-44.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-45'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "attribute xmlns {\"content\"}",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-45.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-46'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare default element namespace \"http://www.example.com/\"; <e>{attribute xmlns {\"content\"}}</e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-46.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-47'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "data(attribute foo {\"content\"}) instance of xs:untypedAtomic",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-47.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-48'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "string(attribute xml:id {\" ab c d \"})",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-48.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_string_value(Res, "ab c d") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XQDY0091") of 
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
'K2-ComputeConAttr-49'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "declare namespace a = \"http://example.com/A\"; declare namespace b = \"http://example.com/A\"; <e> { attribute a:localName {()}, attribute b:localName {()} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-49.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0025") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-50'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute {QName(\"http://example.com/\", \"attr\")} {()}, attribute {QName(\"http://example.com/\", \"attr\")} {()} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-50.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0025") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-51'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute {QName(\"http://example.com/\", \"attr\")} {()} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-51.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_type(Res,"element(e)") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"$result/@*:attr=\"\"") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"namespace-uri($result/@*:attr)=\"http://example.com/\"") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-52'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e xmlns:p=\"http://example.com/\" p:attr=\"\"> { attribute {QName(\"http://example.com/\", \"p:attr\")} {()} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-52.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0025") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-53'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute {QName(\"http://example.com/\", \"attr\")} {()} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-53.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_type(Res,"element(e)") of 
      true -> {comment, "Correct type"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"$result/@*:attr=\"\"") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"namespace-uri($result/@*:attr)=\"http://example.com/\"") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "all-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-54'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "string-length(xs:NCName(prefix-from-QName(node-name(attribute {QName(\"http://example.com/\", \"attr\")} {()})))) > 0",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-54.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-55'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "prefix-from-QName(node-name(attribute {QName(\"http://www.w3.org/XML/1998/namespace\", \"attr\")} {()}))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-55.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "xml") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-56'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute {QName(\"http://www.w3.org/XML/1998/namespace\", \"space\")} {\"default\"} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-56.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<e xml:space=\"default\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-57'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e> { attribute {QName(\"http://www.w3.org/2000/xmlns/\", \"space\")} {\"default\"} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-57.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-58'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<e xmlns:p=\"http://example.com/\" p:attr1=\"value\"> { attribute {QName(\"http://example.com/\", \"attr2\")} {()} } </e>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-58.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<e xmlns:p=\"http://example.com/\" xmlns:ns0=\"http://example.com/\" p:attr1=\"value\" ns0:attr2=\"\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'K2-ComputeConAttr-59'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<a> { attribute xml:id {\"1\"} } </a>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-59.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_xml(Res,"<a xml:id=\"1\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XQDY0091") of 
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
'K2-ComputeConAttr-60'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "<a> { attribute xml:space {\"DEFAULT\"} } </a>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-60.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_xml(Res,"<a xml:space=\"DEFAULT\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XQDY0092") of 
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
'K2-ComputeConAttr-61'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "let $x := ( attribute a { \"a\" }, element b { \"b\" }, attribute c { \"c\" } ) return <foo> { $x } </foo>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "K2-ComputeConAttr-61.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0024") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'comp-attr-bad-name-1'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "(: 3.7.3.2 Computed Attribute Constructor per XQ.E19 XQDY0044 if namespace prefix is 'xmlns' Mary Holstege :) <result>{attribute {\"xmlns:error\"} {}}</result>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "comp-attr-bad-name-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XQDY0074") of 
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
'comp-attr-bad-name-2'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "(: 3.7.3.2 Computed Attribute Constructor per XQ.E19 XQDY0044 if no namespace prefix and local name is 'xmlns' Mary Holstege :) <result>{attribute {\"xmlns\"} {}}</result>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "comp-attr-bad-name-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'comp-attr-bad-name-3'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "(: 3.7.3.2 Computed Attribute Constructor per XQ.E19 XQDY0044 if namespace URI is 'http://www.w3.org/2000/xmlns/' Mary Holstege :) <result>{ attribute { fn:QName(\"http://www.w3.org/2000/xmlns/\",\"error\")} {} }</result>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "comp-attr-bad-name-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'comp-attr-bad-name-4'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "(: 3.7.3.2 Computed Attribute Constructor per XQ.E19 XQDY0044 if namespace URI is 'http://www.w3.org/2000/xmlns/' Mary Holstege :) <result>{ attribute { fn:QName(\"http://www.w3.org/2000/xmlns/\",\"foo:error\")} {} }</result>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "comp-attr-bad-name-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'comp-attr-bad-name-5'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "(: 3.7.3.2 Computed Attribute Constructor per XQ.E19 XQDY0044 if namespace prefix is 'xml' and namespace URI is not 'http://www.w3.org/XML/1998/namespace' Mary Holstege :) <result>{ attribute { fn:QName(\"http://example.com/not-XML-uri\",\"xml:error\") } {} }</result>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "comp-attr-bad-name-5.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'comp-attr-bad-name-6'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "(: 3.7.3.2 Computed Attribute Constructor per XQ.E19 XQDY0044 if namespace prefix is not 'xml' and namespace URI is 'http://www.w3.org/XML/1998/namespace' Mary Holstege :) <result>{ attribute { fn:QName(\"http://www.w3.org/XML/1998/namespace\",\"foo:error\")} {} }</result>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "comp-attr-bad-name-6.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'comp-attr-bad-name-7'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "(: 3.7.3.2 Computed Attribute Constructor per XQ.E19 XQDY0044 if namespace prefix is 'xmlns' Mary Holstege :) <result>{attribute {fn:QName(\"http://example.com/some-uri\",\"xmlns:error\")} {}}</result>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "comp-attr-bad-name-7.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-001'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "for $a in attribute { fn:QName(\"http://www.w3.org/2000/xmlns/\", \"namespace:foo\") } { \"bar\" } return name($a)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-001.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-002'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "for $a in attribute { fn:QName(\"http://www.example.com/\", \"xmlns:foo\") } { \"bar\" } return name($a)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-002.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-003'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "for $a in attribute { \"xmlns\" } { \"bar\" } return name($a)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-003.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-005'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "
      	for $a in attribute { fn:QName(\"http://www.example.com/\", \"xml:foo\") } { \"bar\" } 
      	return name($a)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-005.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-006'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "
      	for $a in attribute { fn:QName(\"http://www.w3.org/XML/1998/namespace\", \"sgml:foo\") } { \"bar\" } 
      	return name($a)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-006.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0044") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-007'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "
      	<element xmlns:sgml=\"http://www.example.com/other\"> { 
      		for $a in attribute { fn:QName(\"http://www.example.com/\", \"sgml:foo\") } { } 
      		return concat(name($a), \"=\", namespace-uri($a)) } 
      	</element>
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-007.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<element xmlns:sgml=\"http://www.example.com/other\">sgml:foo=http://www.example.com/</element>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-008'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "
      	declare function local:factorial($arg as xs:integer) as xs:integer { 
      		if ($arg le 1) then 1 else $arg * local:factorial($arg - 1) 
      	}; 
      	<element> { attribute { fn:QName(\"http://www.example.com/\", \"sgml:foo\") } { local:factorial(5) } } </element>
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-008.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<element xmlns:sgml=\"http://www.example.com/\" sgml:foo=\"120\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'cbcl-constr-compattr-009'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "
      	declare function local:even-range($arg as xs:integer) as xs:integer* { (1 to $arg)[. mod 2 = 9] }; 
      	<element> { attribute { 'attr' } { local:even-range(0) } } </element>
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "cbcl-constr-compattr-009.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<element attr=\"\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
