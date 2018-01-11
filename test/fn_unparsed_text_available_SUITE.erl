-module('fn_unparsed_text_available_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['fn-unparsed-text-available-001'/1]).
-export(['fn-unparsed-text-available-002'/1]).
-export(['fn-unparsed-text-available-003'/1]).
-export(['fn-unparsed-text-available-004'/1]).
-export(['fn-unparsed-text-available-005'/1]).
-export(['fn-unparsed-text-available-006'/1]).
-export(['fn-unparsed-text-available-007'/1]).
-export(['fn-unparsed-text-available-008'/1]).
-export(['fn-unparsed-text-available-009'/1]).
-export(['fn-unparsed-text-available-010'/1]).
-export(['fn-unparsed-text-available-011'/1]).
-export(['fn-unparsed-text-available-012'/1]).
-export(['fn-unparsed-text-available-013'/1]).
-export(['fn-unparsed-text-available-014'/1]).
-export(['fn-unparsed-text-available-015'/1]).
-export(['fn-unparsed-text-available-016'/1]).
-export(['fn-unparsed-text-available-017'/1]).
-export(['fn-unparsed-text-available-018'/1]).
-export(['fn-unparsed-text-available-019'/1]).
-export(['fn-unparsed-text-available-020'/1]).
-export(['fn-unparsed-text-available-021'/1]).
-export(['fn-unparsed-text-available-022'/1]).
-export(['fn-unparsed-text-available-023'/1]).
-export(['fn-unparsed-text-available-024'/1]).
-export(['fn-unparsed-text-available-025'/1]).
-export(['fn-unparsed-text-available-026'/1]).
-export(['fn-unparsed-text-available-027'/1]).
-export(['fn-unparsed-text-available-028'/1]).
-export(['fn-unparsed-text-available-029'/1]).
-export(['fn-unparsed-text-available-030'/1]).
-export(['fn-unparsed-text-available-031'/1]).
-export(['fn-unparsed-text-available-032'/1]).
-export(['fn-unparsed-text-available-033'/1]).
-export(['fn-unparsed-text-available-034'/1]).
-export(['fn-unparsed-text-available-035'/1]).
-export(['fn-unparsed-text-available-036'/1]).
-export(['fn-unparsed-text-available-037'/1]).
-export(['fn-unparsed-text-available-038'/1]).
-export(['fn-unparsed-text-available-039'/1]).
-export(['fn-unparsed-text-available-040'/1]).
-export(['fn-unparsed-text-available-041'/1]).
-export(['fn-unparsed-text-available-042'/1]).
-export(['fn-unparsed-text-available-043'/1]).
-export(['fn-unparsed-text-available-044'/1]).
-export(['fn-unparsed-text-available-045'/1]).
-export(['fn-unparsed-text-available-046'/1]).
-export(['fn-unparsed-text-available-047'/1]).
-export(['fn-unparsed-text-available-048'/1]).
-export(['fn-unparsed-text-available-049'/1]).
-export(['fn-unparsed-text-available-050'/1]).
-export(['fn-unparsed-text-available-051'/1]).
-export(['fn-unparsed-text-available-052'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> ct:timetrap({seconds,60}), xqerl_module:unload(all).
init_per_suite(Config) -> 
   DD = filename:dirname(filename:dirname(proplists:get_value(data_dir, Config))),
   TD = filename:join(DD, "QT3-test-suite"),
   BaseDir = filename:join(TD, "fn")

,[{base_dir, BaseDir}|Config].
all() -> [
   'fn-unparsed-text-available-001',
   'fn-unparsed-text-available-002',
   'fn-unparsed-text-available-003',
   'fn-unparsed-text-available-004',
   'fn-unparsed-text-available-005',
   'fn-unparsed-text-available-006',
   'fn-unparsed-text-available-007',
   'fn-unparsed-text-available-008',
   'fn-unparsed-text-available-009',
   'fn-unparsed-text-available-010',
   'fn-unparsed-text-available-011',
   'fn-unparsed-text-available-012',
   'fn-unparsed-text-available-013',
   'fn-unparsed-text-available-014',
   'fn-unparsed-text-available-015',
   'fn-unparsed-text-available-016',
   'fn-unparsed-text-available-017',
   'fn-unparsed-text-available-018',
   'fn-unparsed-text-available-019',
   'fn-unparsed-text-available-020',
   'fn-unparsed-text-available-021',
   'fn-unparsed-text-available-022',
   'fn-unparsed-text-available-023',
   'fn-unparsed-text-available-024',
   'fn-unparsed-text-available-025',
   'fn-unparsed-text-available-026',
   'fn-unparsed-text-available-027',
   'fn-unparsed-text-available-028',
   'fn-unparsed-text-available-029',
   'fn-unparsed-text-available-030',
   'fn-unparsed-text-available-031',
   'fn-unparsed-text-available-032',
   'fn-unparsed-text-available-033',
   'fn-unparsed-text-available-034',
   'fn-unparsed-text-available-035',
   'fn-unparsed-text-available-036',
   'fn-unparsed-text-available-037',
   'fn-unparsed-text-available-038',
   'fn-unparsed-text-available-039',
   'fn-unparsed-text-available-040',
   'fn-unparsed-text-available-041',
   'fn-unparsed-text-available-042',
   'fn-unparsed-text-available-043',
   'fn-unparsed-text-available-044',
   'fn-unparsed-text-available-045',
   'fn-unparsed-text-available-046',
   'fn-unparsed-text-available-047',
   'fn-unparsed-text-available-048',
   'fn-unparsed-text-available-049',
   'fn-unparsed-text-available-050',
   'fn-unparsed-text-available-051',
   'fn-unparsed-text-available-052'].
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
environment('unparsed-text-available',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{vars, []},
{namespaces, []},
{resources, [{filename:join(BaseDir, "unparsed-text/text-plain-utf-8.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-utf-8-bom.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-bom.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-utf-16le-bom.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-16le-bom.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-utf-16be-bom.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-16be-bom.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-iso-8859-1.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-iso-8859-1.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-iso-8859-1.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-invalid.txt"},
{filename:join(BaseDir, "unparsed-text/text-xml-utf-8.xml"),"http://www.w3.org/fots/unparsed-text/text-xml-utf-8.xml"},
{filename:join(BaseDir, "unparsed-text/text-xml-utf-16.xml"),"http://www.w3.org/fots/unparsed-text/text-xml-utf-16.xml"},
{filename:join(BaseDir, "unparsed-text/text-xml-iso-8859-1.xml"),"http://www.w3.org/fots/unparsed-text/text-xml-iso-8859-1.xml"},
{filename:join(BaseDir, "unparsed-text/non-xml-character.txt"),"http://www.w3.org/fots/unparsed-text/non-xml-character.txt"},
{filename:join(BaseDir, "unparsed-text/invalid-xml.xml"),"http://www.w3.org/fots/unparsed-text/invalid-xml.xml"},
{filename:join(BaseDir, "unparsed-text/unknown-encoding.txt"),"http://www.w3.org/fots/unparsed-text/unknown-encoding.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-utf-8-lines.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-lines.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-utf-8-bom-lines.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-bom-lines.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-utf-16le-bom-lines.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-16le-bom-lines.txt"},
{filename:join(BaseDir, "unparsed-text/text-plain-utf-16be-bom-lines.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-16be-bom-lines.txt"}]},
{modules, []}
];
environment('unparsed-text-available-with-base-uri',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"http://www.w3.org/fots/unparsed-text/"}]},
{params, []},
{vars, []},
{namespaces, []},
{resources, [{filename:join(BaseDir, "unparsed-text/text-plain-utf-8.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt"}]},
{modules, []}
];
environment('unparsed-text-available-with-base-uri-2',BaseDir) ->
[{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt"}]},
{params, []},
{vars, []},
{namespaces, []},
{resources, [{filename:join(BaseDir, "unparsed-text/text-plain-utf-8.txt"),"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt"}]},
{modules, []}
].
'fn-unparsed-text-available-001'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-001.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-002'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available#0",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-002.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-003'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:exists( fn:unparsed-text-available#1 )",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-003.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-004'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:exists( fn:unparsed-text-available#2 )",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-004.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-005'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(static-base-uri(), \"utf-8\", \"\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-005.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-006'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available#3",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-006.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-007'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   {skip,"staticTyping"}.
'fn-unparsed-text-available-008'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "( fn:unparsed-text-available(
                if (current-date() eq xs:date('1900-01-01'))
                then \"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\"
                else 1 ),
              fn:unparsed-text-available( 
                if (current-date() eq xs:date('1900-01-01'))
                then 1
                else \"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\") )",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-008.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-009'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   {skip,"staticTyping"}.
'fn-unparsed-text-available-010'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "( fn:unparsed-text-available( 
                \"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\",
                if (current-date() eq xs:date('1900-01-01'))
                then \"utf-8\"
                else 1 ),
              fn:unparsed-text-available( 
                \"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\",
                if (current-date() eq xs:date('1900-01-01'))
                then 1
                else \"utf-8\") )",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-010.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-011'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   {skip,"staticTyping"}.
'fn-unparsed-text-available-012'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "( fn:unparsed-text-available( 
                \"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\",
                if (current-date() eq xs:date('1900-01-01'))
                then \"utf-8\"
                else () ),
              fn:unparsed-text-available( 
                \"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\",
                if (current-date() eq xs:date('1900-01-01'))
                then ()
                else \"utf-8\") )",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-012.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-013'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.example.org/#fragment\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-013.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-014'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.example.org/#fragment\", \"utf-8\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-014.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-015'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.example.org/%gg\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-015.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-016'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.example.org/%gg\", \"utf-8\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-016.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-017'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\":/\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-017.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-018'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\":/\", \"utf-8\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-018.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-019'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available( \"http://www.w3.org/fots/unparsed-text/does-not-exist.txt\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-019.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-020'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available( \"http://www.w3.org/fots/unparsed-text/does-not-exist.txt\", \"utf-8\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-020.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-021'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"surely-nobody-supports-this:/path.txt\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-021.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-022'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"surely-nobody-supports-this:/path.txt\", \"utf-8\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-022.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-023'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"unparsed-text/text-plain-utf-8.txt\")",
   {Env,Opts} = xqerl_test:handle_environment([{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"#UNDEFINED"}]},
{'context-item', [""]},
{vars, []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
]),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-023.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-024'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"unparsed-text/text-plain-utf-8.txt\", \"utf-8\")",
   {Env,Opts} = xqerl_test:handle_environment([{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"#UNDEFINED"}]},
{'context-item', [""]},
{vars, []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
]),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-024.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-025'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"does-not-exist.txt\")",
   {Env,Opts} = xqerl_test:handle_environment([{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"http://www.w3.org/fots/unparsed-text/"}]},
{'context-item', [""]},
{vars, []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
]),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-025.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-026'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"does-not-exist.txt\", \"utf-8\")",
   {Env,Opts} = xqerl_test:handle_environment([{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"http://www.w3.org/fots/unparsed-text/"}]},
{'context-item', [""]},
{vars, []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
]),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-026.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-027'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"text-plain-utf-8.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available-with-base-uri',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-027.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-028'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"text-plain-utf-8.txt\", \"utf-8\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available-with-base-uri',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-028.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-029'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"C:\\file-might-exist.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available-with-base-uri',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-029.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-030'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"C:\\file-might-exist.txt\", \"utf-8\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available-with-base-uri',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-030.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-031'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available-with-base-uri-2',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-031.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-032'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"\", \"utf-8\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available-with-base-uri-2',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-032.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-033'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"\")",
   {Env,Opts} = xqerl_test:handle_environment([{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"http://www.w3.org/fots/unparsed-text/does-not-exists.txt"}]},
{'context-item', [""]},
{vars, []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
]),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-033.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-034'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"\", \"utf-8\")",
   {Env,Opts} = xqerl_test:handle_environment([{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"http://www.w3.org/fots/unparsed-text/does-not-exists.txt"}]},
{'context-item', [""]},
{vars, []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
]),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-034.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-035'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\", \"123\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-035.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-036'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/unknown-encoding.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-036.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-037'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-invalid.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-037.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-038'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/non-xml-character.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-038.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-039'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/invalid-xml.xml\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-039.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-040'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-8.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-040.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-041'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-bom.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-041.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-042'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-16le-bom.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-042.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-043'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-16be-bom.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-043.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-044'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-iso-8859-1.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-044.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-045'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-xml-utf-8.xml\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-045.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-046'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-xml-utf-16.xml\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-046.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-047'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-xml-iso-8859-1.xml\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-047.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-048'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-lines.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-048.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-049'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-8-bom-lines.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-049.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-050'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-16le-bom-lines.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-050.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-051'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available(\"http://www.w3.org/fots/unparsed-text/text-plain-utf-16be-bom-lines.txt\")",
   {Env,Opts} = xqerl_test:handle_environment(environment('unparsed-text-available',BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-051.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'fn-unparsed-text-available-052'(Config) ->
   BaseDir = proplists:get_value(base_dir, Config),
   Qry = "fn:unparsed-text-available($href)",
   {Env,Opts} = xqerl_test:handle_environment([{'decimal-formats', []},
{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"#UNDEFINED"}]},
{'context-item', [""]},
{vars, [{"href","xs:string","'unparsed-text/text-plain-utf-8.txt'"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
]),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(BaseDir, "fn-unparsed-text-available-052.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
