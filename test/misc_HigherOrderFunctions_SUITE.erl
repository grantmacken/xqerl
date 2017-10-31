-module('misc_HigherOrderFunctions_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['hof-001'/1]).
-export(['hof-002'/1]).
-export(['hof-003'/1]).
-export(['hof-004'/1]).
-export(['hof-005'/1]).
-export(['hof-006'/1]).
-export(['hof-007'/1]).
-export(['hof-008'/1]).
-export(['hof-009'/1]).
-export(['hof-010'/1]).
-export(['hof-011'/1]).
-export(['hof-012'/1]).
-export(['hof-013'/1]).
-export(['hof-014'/1]).
-export(['hof-015'/1]).
-export(['hof-016'/1]).
-export(['hof-017'/1]).
-export(['hof-018'/1]).
-export(['hof-019'/1]).
-export(['hof-020'/1]).
-export(['hof-021'/1]).
-export(['hof-022'/1]).
-export(['hof-023'/1]).
-export(['hof-024'/1]).
-export(['hof-025'/1]).
-export(['hof-026'/1]).
-export(['hof-027'/1]).
-export(['hof-028'/1]).
-export(['hof-029'/1]).
-export(['hof-030'/1]).
-export(['hof-031'/1]).
-export(['hof-032'/1]).
-export(['hof-033'/1]).
-export(['hof-034'/1]).
-export(['hof-035'/1]).
-export(['hof-036'/1]).
-export(['hof-037'/1]).
-export(['hof-038'/1]).
-export(['hof-039'/1]).
-export(['hof-040'/1]).
-export(['hof-041'/1]).
-export(['hof-042'/1]).
-export(['hof-043'/1]).
-export(['hof-044'/1]).
-export(['hof-045'/1]).
-export(['hof-046'/1]).
-export(['hof-047'/1]).
-export(['hof-048'/1]).
-export(['hof-049'/1]).
-export(['hof-050'/1]).
-export(['hof-051'/1]).
-export(['hof-052'/1]).
-export(['hof-053'/1]).
-export(['hof-901'/1]).
-export(['hof-902'/1]).
-export(['hof-903'/1]).
-export(['hof-904'/1]).
-export(['hof-905'/1]).
-export(['hof-906'/1]).
-export(['hof-907'/1]).
-export(['hof-908'/1]).
-export(['hof-909'/1]).
-export(['hof-910'/1]).
-export(['hof-911'/1]).
-export(['hof-912'/1]).
-export(['hof-913'/1]).
-export(['hof-914'/1]).
-export(['hof-915'/1]).
-export(['hof-916'/1]).
-export(['hof-917'/1]).
-export(['hof-918'/1]).
-export(['hof-919'/1]).
-export(['function-item-1'/1]).
-export(['function-item-2'/1]).
-export(['function-item-3'/1]).
-export(['function-item-4'/1]).
-export(['function-item-5'/1]).
-export(['function-item-6'/1]).
-export(['function-item-7'/1]).
-export(['function-item-8'/1]).
-export(['function-item-9'/1]).
-export(['function-item-10'/1]).
-export(['function-item-11'/1]).
-export(['function-item-12'/1]).
-export(['function-item-13'/1]).
-export(['function-item-14'/1]).
-export(['function-item-15'/1]).
-export(['function-item-16'/1]).
-export(['function-item-17'/1]).
-export(['inline-function-1'/1]).
-export(['inline-function-2'/1]).
-export(['inline-function-3'/1]).
-export(['inline-function-4'/1]).
-export(['inline-function-5'/1]).
-export(['inline-function-6'/1]).
-export(['inline-function-7'/1]).
-export(['inline-function-8'/1]).
-export(['inline-function-9'/1]).
-export(['inline-function-10'/1]).
-export(['inline-function-11'/1]).
-export(['inline-function-12'/1]).
-export(['inline-function-11a'/1]).
-export(['inline-function-12a'/1]).
-export(['inline-function-13'/1]).
-export(['inline-function-14'/1]).
-export(['inline-function-15'/1]).
-export(['inline-function-16'/1]).
-export(['xqhof1'/1]).
-export(['xqhof2'/1]).
-export(['xqhof3'/1]).
-export(['xqhof4'/1]).
-export(['xqhof5'/1]).
-export(['xqhof6'/1]).
-export(['xqhof7'/1]).
-export(['xqhof8'/1]).
-export(['xqhof9'/1]).
-export(['xqhof10'/1]).
-export(['xqhof11'/1]).
-export(['xqhof12'/1]).
-export(['xqhof13'/1]).
-export(['xqhof14'/1]).
-export(['xqhof15'/1]).
-export(['xqhof16'/1]).
-export(['xqhof17'/1]).
-export(['xqhof18'/1]).
-export(['xqhof19'/1]).
-export(['xqhof20'/1]).
-export(['xqhof21'/1]).
-export(['xqhof22'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> erlang:erase().
init_per_suite(Config) -> ok
, try  xqerl:compile("C:/git/zadean/xquery-3.1/QT3-test-suite/misc/HigherOrderFunctions/module-hof-003.xq") catch _:_ -> ok end
, try  xqerl:compile("C:/git/zadean/xquery-3.1/QT3-test-suite/misc/HigherOrderFunctions/functional.xq") catch _:_ -> ok end
, try  xqerl:compile("C:/git/zadean/xquery-3.1/QT3-test-suite/misc/HigherOrderFunctions/module-xqhof16.xq") catch _:_ -> ok end,Config.
all() -> [
   'hof-001',
   'hof-002',
   'hof-003',
   'hof-004',
   'hof-005',
   'hof-006',
   'hof-007',
   'hof-008',
   'hof-009',
   'hof-010',
   'hof-011',
   'hof-012',
   'hof-013',
   'hof-014',
   'hof-015',
   'hof-016',
   'hof-017',
   'hof-018',
   'hof-019',
   'hof-020',
   'hof-021',
   'hof-022',
   'hof-023',
   'hof-024',
   'hof-025',
   'hof-026',
   'hof-027',
   'hof-028',
   'hof-029',
   'hof-030',
   'hof-031',
   'hof-032',
   'hof-033',
   'hof-034',
   'hof-035',
   'hof-036',
   'hof-037',
   'hof-038',
   'hof-039',
   'hof-040',
   'hof-041',
   'hof-042',
   'hof-043',
   'hof-044',
   'hof-045',
   'hof-046',
   'hof-047',
   'hof-048',
   'hof-049',
   'hof-050',
   'hof-051',
   'hof-052',
   'hof-053',
   'hof-901',
   'hof-902',
   'hof-903',
   'hof-904',
   'hof-905',
   'hof-906',
   'hof-907',
   'hof-908',
   'hof-909',
   'hof-910',
   'hof-911',
   'hof-912',
   'hof-913',
   'hof-914',
   'hof-915',
   'hof-916',
   'hof-917',
   'hof-918',
   'hof-919',
   'function-item-1',
   'function-item-2',
   'function-item-3',
   'function-item-4',
   'function-item-5',
   'function-item-6',
   'function-item-7',
   'function-item-8',
   'function-item-9',
   'function-item-10',
   'function-item-11',
   'function-item-12',
   'function-item-13',
   'function-item-14',
   'function-item-15',
   'function-item-16',
   'function-item-17',
   'inline-function-1',
   'inline-function-2',
   'inline-function-3',
   'inline-function-4',
   'inline-function-5',
   'inline-function-6',
   'inline-function-7',
   'inline-function-8',
   'inline-function-9',
   'inline-function-10',
   'inline-function-11',
   'inline-function-12',
   'inline-function-11a',
   'inline-function-12a',
   'inline-function-13',
   'inline-function-14',
   'inline-function-15',
   'inline-function-16',
   'xqhof1',
   'xqhof2',
   'xqhof3',
   'xqhof4',
   'xqhof5',
   'xqhof6',
   'xqhof7',
   'xqhof8',
   'xqhof9',
   'xqhof10',
   'xqhof11',
   'xqhof12',
   'xqhof13',
   'xqhof14',
   'xqhof15',
   'xqhof16',
   'xqhof17',
   'xqhof18',
   'xqhof19',
   'xqhof20',
   'xqhof21',
   'xqhof22'].
environment('empty') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('atomic') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/atomic.xml",".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/atomic.xsd","http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, [{"http://www.w3.org/XQueryTest","atomic"}]},
{resources, []},
{modules, []}
];
environment('atomic-xq') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/atomic.xml",".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/atomic.xsd","http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-mod') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/works-mod.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/works.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('staff') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/staff.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-and-staff') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/works.xml","$works",""},
{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/staff.xml","$staff",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('auction') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/auction.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, [{"http://www.example.com/AuctionWatch","ma"},
{"http://www.w3.org/1999/xlink","xlink"},
{"http://www.example.com/auctioneers#anyzone","anyzone"},
{"http://www.example.com/auctioneers#eachbay","eachbay"},
{"http://www.example.com/auctioneers#yabadoo","yabadoo"},
{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{resources, []},
{modules, []}
];
environment('qname') ->
[{sources, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/QName-source.xml",".",""}]},
{schemas, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/QName-schema.xsd","http://www.example.com/QNameXSD"}]},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, [{"http://www.example.com/QNameXSD",""}]},
{resources, []},
{modules, []}
];
environment('math') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/math","math"}]},
{resources, []},
{modules, []}
];
environment('array') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"}]},
{resources, []},
{modules, []}
];
environment('map') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{resources, []},
{modules, []}
];
environment('array-and-map') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/catalog.xml"}]},
{params, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"},
{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{resources, []},
{modules, []}
];
environment('user-defined-types') ->
[{sources, []},
{schemas, [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/docs/userdefined.xsd","http://www.w3.org/XQueryTest/userDefinedTypes"}]},
{collections, []},
{'static-base-uri', [{"file:///C:/git/zadean/xquery-3.1/QT3-test-suite/misc/HigherOrderFunctions.xml"}]},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
].
'hof-001'(_Config) ->
   Qry = "
        declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
        let $f := local:f#1 return $f(2)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"3") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-002'(_Config) ->
   Qry = "
      	declare function local:f() as xs:integer { 42 }; 
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	let $f := local:f#0 return $f()
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"42") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-003'(_Config) ->
   Qry = "
        import module namespace m=\"http://example.com/hof-003\"; 
        let $f := m:f#1 return $f(17)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"18") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-004'(_Config) ->
   Qry = "let $f := fn:round#1 return $f(1.2345)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"1") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-005'(_Config) ->
   Qry = "let $f := concat#8 return $f('a','b','c','d','e','f','g','h')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "abcdefgh") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-006'(_Config) ->
   Qry = "
      declare default function namespace \"http://example.com/hof-006\"; 
      declare function g($x as xs:integer) as xs:integer { $x + 1 }; 
      let $f := g#1 return $f(21)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"22") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-007'(_Config) ->
   Qry = "
      declare default function namespace \"http://www.w3.org/2001/XMLSchema\"; 
      let $f := date#1 return $f('2008-01-31')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "2008-01-31") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-008'(_Config) ->
   Qry = "let $f := xs:date#1 return $f('2008-01-31')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "2008-01-31") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-009'(_Config) ->
   {skip,"schemaImport"}.
'hof-010'(_Config) ->
   Qry = "
      declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      let $f as function(*) := local:f#1 return $f(2)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"3") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-011'(_Config) ->
   Qry = "
      declare function local:f($x as xs:integer) as xs:integer { $x + 3 }; 
      let $f as function(xs:integer) as xs:integer := local:f#1 
      return $f(2)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"5") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-012'(_Config) ->
   Qry = "
      declare function local:f($x as xs:integer, $y as xs:long) as xs:integer { $x + $y }; 
      let $f as function(xs:integer, xs:long) as xs:integer := local:f#2 
      return $f(2, xs:long(5))
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"7") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-013'(_Config) ->
   Qry = "
      declare function local:f($x as xs:integer) as xs:integer { $x + 3 }; 
      declare function local:g($x as xs:integer) as xs:integer { $x + 4 }; 
      declare function local:h($x as xs:integer) as xs:integer { $x + 5 }; 
      let $f as (function(xs:integer) as xs:integer)* := (local:f#1, local:g#1, local:h#1) return $f[3](2)[1]
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"7") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-014'(_Config) ->
   Qry = "
      declare function local:case($x as xs:boolean) as function(*) 
      	{ if ($x) then fn:upper-case#1 else fn:lower-case#1 }; 
      local:case(true())(\"Mike\"), local:case(false())(\"Mike\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MIKE mike") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-015'(_Config) ->
   Qry = "
      declare function local:case($x as xs:boolean) as function(xs:string?) as xs:string 
      	{ if ($x) then fn:upper-case#1 else fn:lower-case#1 }; 
      local:case(true())(\"Mike\"), local:case(false())(\"Mike\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MIKE mike") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-016'(_Config) ->
   Qry = "
      declare function local:case($x as function(*), $y as xs:string) as xs:string { $x($y) }; 
      local:case(upper-case#1, \"Mike\"), local:case(lower-case#1, \"Mike\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MIKE mike") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-017'(_Config) ->
   Qry = "
      declare function local:case($x as function(xs:string?) as xs:string, $y as xs:string) as xs:string { $x($y) }; 
      local:case(upper-case#1, \"Mike\"), local:case(lower-case#1, \"Mike\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MIKE mike") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-018'(_Config) ->
   Qry = "
      declare function local:scramble($x as function(xs:string) as xs:string, $y as xs:string) as xs:string 
      	{ $x($y) }; 
      declare function local:rot13($x as xs:string) as xs:string 
      	{ translate($x, \"abcdefghijklmnopqrstuvwxyz\", \"nopqrstuvwxyzabcdefghijklm\") }; 
      local:scramble(local:rot13#1, \"mike\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "zvxr") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-019'(_Config) ->
   Qry = "
      declare function local:scramble($x as function(*), $y as xs:string) as xs:string { $x($y) }; 
      declare function local:rot13($x as xs:string) as xs:string { translate($x, \"abcdefghijklmnopqrstuvwxyz\", \"nopqrstuvwxyzabcdefghijklm\") }; 
      local:scramble(local:rot13#1, \"mike\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "zvxr") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-020'(_Config) ->
   Qry = "
      declare function local:scramble($x as function(*), $y as xs:string) as xs:string { $x($y) }; 
      local:scramble(function($x){translate($x, \"abcdefghijklmnopqrstuvwxyz\", \"nopqrstuvwxyzabcdefghijklm\")}, \"john\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "wbua") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-021'(_Config) ->
   Qry = "
      declare function local:scramble($x as function(xs:string) as xs:string, $y as xs:string) as xs:string { $x($y) }; 
      local:scramble(function($x){translate($x, \"abcdefghijklmnopqrstuvwxyz\", \"nopqrstuvwxyzabcdefghijklm\")}, \"john\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "wbua") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-022'(_Config) ->
   Qry = "
      declare function local:scramble($x as function(xs:string) as xs:string, $y as xs:string) as xs:string { $x($y) }; 
      let $n := function-name(local:scramble#2) 
      return (local-name-from-QName($n), namespace-uri-from-QName($n), function-arity(local:scramble#2))
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "scramble http://www.w3.org/2005/xquery-local-functions 2") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-023'(_Config) ->
   Qry = "
        let $f := fn:function-name#1, $n := function-name($f) 
        return (local-name-from-QName($n), namespace-uri-from-QName($n), function-arity($f))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "function-name http://www.w3.org/2005/xpath-functions 1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-024'(_Config) ->
   Qry = "
        let $f := xs:dateTime#1, $n := function-name($f) 
        return (local-name-from-QName($n), namespace-uri-from-QName($n), function-arity($f))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "dateTime http://www.w3.org/2001/XMLSchema 1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-025'(_Config) ->
   Qry = "let $f := concat#123456, $n := function-name($f) 
        return (local-name-from-QName($n), namespace-uri-from-QName($n), function-arity($f))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "concat http://www.w3.org/2005/xpath-functions 123456") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-026'(_Config) ->
   Qry = "
        let $f := function($x as xs:string) as xs:string { upper-case($x) } 
        let $n := function-name($f) 
        return <a loc=\"{local-name-from-QName($n)}\" uri=\"{namespace-uri-from-QName($n)}\"
        			arity=\"{function-arity($f)}\" eloc=\"{empty(local-name-from-QName($n))}\" euri=\"{empty(namespace-uri-from-QName($n))}\"/>
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<a uri=\"\" loc=\"\" euri=\"true\" eloc=\"true\" arity=\"1\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-027'(_Config) ->
   Qry = "
        let $f := fn:contains(?, \"e\") 
        return for $s in (\"Mike\", \"John\", \"Dave\", \"Mary\", \"Jane\") return $f($s)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "true false true false true") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-028'(_Config) ->
   Qry = "
      declare function local:splitter() as (function(xs:string) as xs:string*) { function($x as xs:string) { tokenize($x, '\\s') } }; 
      string-join(local:splitter()(\"A nice cup of tea\"), '|')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "A|nice|cup|of|tea") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-029'(_Config) ->
   Qry = "
      declare function local:splitter() as (function(xs:string) as xs:string+)? 
      { function($x as xs:string) { for $i in tokenize($x, '\\s') return upper-case($i)} }; 
      string-join(local:splitter()(\"A nice cup of tea\"), '|')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "A|NICE|CUP|OF|TEA") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-030'(_Config) ->
   Qry = "
      declare variable $sep as xs:string := \"\\s\"; 
      declare function local:splitter() as (function(xs:string) as xs:string*)? 
      	{ function($x as xs:string) { for $i in tokenize($x, $sep) return upper-case($i)} }; 
      string-join(local:splitter()(\"A nice cup of tea\"), '|')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "A|NICE|CUP|OF|TEA") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-031'(_Config) ->
   Qry = "
      declare function local:splitter($sep as xs:string) as (function(xs:string) as xs:string*) 
      	{ function($x as xs:string) { for $i in tokenize($x, $sep) return upper-case($i)} }; 
      string-join(local:splitter(\"\\s\")(\"A nice cup of tea\"), '|')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "A|NICE|CUP|OF|TEA") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-032'(_Config) ->
   Qry = "(if (current-date() gt xs:date('2000-12-31')) then upper-case#1 else lower-case#1)(\"Mike\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MIKE") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-033'(_Config) ->
   Qry = "local-name-from-QName(function-name((upper-case#1, lower-case#1)[.(\"Mike\") = \"MIKE\"]))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "upper-case") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-034'(_Config) ->
   Qry = "local-name-from-QName(function-name((upper-case#1, lower-case#1)[ordered{.}(\"Mike\") = \"MIKE\"]))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "upper-case") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-035'(_Config) ->
   Qry = "local-name-from-QName(function-name((upper-case#1, lower-case#1)[ordered{.}(\"Mike\") = \"MIKE\"]))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "upper-case") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-036'(_Config) ->
   Qry = "(<a b=\"3\"/>/(string(@b), upper-case#1, 17))[. instance of xs:anyAtomicType]",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "3 17") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-037'(_Config) ->
   Qry = "
        declare function local:f($x as xs:long, $y as xs:NCName) as element(e) { 
            <e x=\"{$x}\" y=\"{$y}\"/> 
        }; 
        local:f#2 instance of function(*), 
        local:f#2 instance of function(xs:long, xs:NCName) as element(e), 
        local:f#2 instance of function(xs:anyAtomicType?, xs:anyAtomicType?) as element(e), 
        local:f#2 instance of function(item()*, item()*) as element(e)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "true true false false") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-038'(_Config) ->
   Qry = "
        declare function local:f($x as xs:long?, $y as xs:NCName?) as element(e) { 
            <e x=\"{$x}\" y=\"{$y}\"/> 
        }; 
        local:f#2 instance of function(xs:int?, xs:NCName?) as element(e), 
        local:f#2 instance of function(xs:long?) as element(e), 
        local:f#2 instance of function(xs:long?, xs:NCName?, item()*) as element(e), 
        local:f#2 instance of function(xs:long, xs:anyAtomicType?) as element(e), 
        local:f#2 instance of function(item()+, item()+) as element(e)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "true false false false false") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-039'(_Config) ->
   {skip,"typedData"}.
'hof-040'(_Config) ->
   Qry = "
      declare function local:apply($fns as (function(xs:string) as xs:string)*, $s as xs:string) as xs:string* { for $f in $fns return $f($s) }; 
      let $ops := (upper-case#1, lower-case#1, function($x){translate($x, 'e', 'i')}, substring-before(?, ' ')) 
      return string-join(local:apply($ops, 'Michael Kay'), '~')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MICHAEL KAY~michael kay~Michail Kay~Michael") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-041'(_Config) ->
   Qry = "
      declare function local:ops() as (function(xs:string) as xs:string)*
      	{ (upper-case#1, lower-case#1, function($x){translate($x, 'e', 'i')}, substring-before(?, ' ')) }; 
      string-join(for $f in local:ops() return $f('Michael Kay'), '~')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MICHAEL KAY~michael kay~Michail Kay~Michael") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-042'(_Config) ->
   Qry = "
        declare function local:lower-case($x as xs:string) as xs:string { concat(\"'\", fn:lower-case($x), \"'\") }; 
        declare function local:ops() as (function(xs:string) as xs:string)* 
        	{ (upper-case#1, local:lower-case#1, function($x){translate($x, 'e', 'i')}, substring-before(?, ' ')) }; 
        string-join(for $f in local:ops() return $f(<a name=\"Michael Kay\"/>/@name), '~')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "MICHAEL KAY~'michael kay'~Michail Kay~Michael") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-043'(_Config) ->
   Qry = "
      declare function local:round($x as xs:double) as xs:double 
      	{ fn:floor($x) }; 
      declare function local:ops() as (function(xs:double) as xs:double)* 
      	{ (abs#1, local:round#1, function($x){$x+1}, round-half-to-even(?, 2)) }; 
      string-join(for $f in local:ops() return string($f(xs:untypedAtomic('123.456'))), '~')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "123.456~123~124.456~123.46") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-044'(_Config) ->
   Qry = "
      declare function local:round($x as xs:double) as xs:double { fn:floor($x) }; 
      declare function local:ops() as (function(xs:double) as xs:double)* 
      	{ (abs#1, local:round#1, function($x as xs:double){$x+1}, round-half-to-even(?, 2)) }; 
      string-join(for $f in local:ops() return string(round-half-to-even($f(xs:decimal('123.456')), 4)), '~')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "123.456~123~124.456~123.46") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-045'(_Config) ->
   Qry = "
      declare function local:round($x as xs:double, $algorithm as (function(xs:double) as xs:double)) as xs:double { $algorithm($x) }; 
      declare variable $roundToCeiling := local:round(?, ceiling#1); $roundToCeiling(12.4)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"13") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-046'(_Config) ->
   Qry = "
        declare function local:splitter($x as xs:string) as (function() as xs:string*)* { 
            for $sep in ('\\s', ',', '!') 
            return function() { for $i in tokenize($x, $sep) return upper-case($i) } 
        }; 
        <out>{ 
            for $f as function(*) in local:splitter(\"How nice! Thank you, I enjoyed that.\") 
            return <tokens>{ for $t in $f() 
                             return <t>{$t}</t> 
                   }</tokens> 
       }</out>
    ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out><tokens><t>HOW</t><t>NICE!</t><t>THANK</t><t>YOU,</t><t>I</t><t>ENJOYED</t><t>THAT.</t></tokens><tokens><t>HOW NICE! THANK YOU</t><t> I ENJOYED THAT.</t></tokens><tokens><t>HOW NICE</t><t> THANK YOU, I ENJOYED THAT.</t></tokens></out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-047'(_Config) ->
   Qry = "
        declare function local:splitter($x as xs:string) as (function() as xs:string*)* { 
            for $sep in ('\\s', ',', '!') return function() { 
                for $i in tokenize($x, $sep) return 
                    let $f := function(){ concat($sep, ':', upper-case($i)) } 
                    return $f() } 
        }; 
        <out>{ 
            for $f as function(*) in local:splitter(\"How nice! Thank you, I enjoyed that.\") 
            return <tokens>{ for $t in $f() 
                             return <t>{$t}</t> }</tokens> 
        }</out>
     ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out><tokens><t>\\s:HOW</t><t>\\s:NICE!</t><t>\\s:THANK</t><t>\\s:YOU,</t><t>\\s:I</t><t>\\s:ENJOYED</t><t>\\s:THAT.</t></tokens><tokens><t>,:HOW NICE! THANK YOU</t><t>,: I ENJOYED THAT.</t></tokens><tokens><t>!:HOW NICE</t><t>!: THANK YOU, I ENJOYED THAT.</t></tokens></out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-048'(_Config) ->
   Qry = "
        declare function local:do() as xs:integer { (local:f#1)(5) }; 
        declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
        local:do()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"6") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-049'(_Config) ->
   Qry = "
        declare function local:tf($i as xs:integer) as function () as xs:boolean { 
            if ($i) then true#0 else false#0 
        }; 
        <out>{(local:tf(0)(), local:tf(1)())}</out>
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>false true</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-050'(_Config) ->
   Qry = "let $f := fn:substring-before#2(?, '-') return <out>{$f('the-end-of-the-world')}</out>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>the</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-051'(_Config) ->
   Qry = "
        let $f := function($a as xs:string, $b as xs:string) { 
            starts-with($a, $b) and ends-with($a, $b)}(?, 'a') 
        return <out>{$f('abracadabra')}</out>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>true</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-052'(_Config) ->
   Qry = "let $f := fn:concat#3(?, '*', ?) let $g := $f('[', ?) return <out>{$g(']')}</out>",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>[*]</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-053'(_Config) ->
   {skip,"typedData"}.
'hof-901'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	let $f := local:g#1 return $f(2)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-902'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	let $f := local:f#3 return $f(2)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-903'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	let $f := xs:date#2 return $f('2008-03-01')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-904'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	let $f := concat#1 return $f('2008-03-01')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-905'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	string(local:f#1)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FOTY0014") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-906'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	exists(data(local:f#1))
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FOTY0013") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-907'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	deep-equal((1,2,3,4,local:f#1), (1,2,3,4,local:f#1))
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FOTY0015") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-908'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	local:f#1 eq 3
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FOTY0013") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-909'(_Config) ->
   Qry = "
      	declare function local:f($x as xs:integer) as xs:integer { $x + 1 }; 
      	number(local:f#1)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FOTY0013") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-910'(_Config) ->
   Qry = "
        declare function local:f($x as xs:integer) as xs:integer {
            $x + 1
        };
        let $f as function(xs:integer) := local:f#1
        return $f(3)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-911'(_Config) ->
   Qry = "<a b=\"3\"/>/(@b, upper-case#1)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0018") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-912'(_Config) ->
   Qry = "
        declare function local:apply($fns as (function(xs:string) as xs:string)*, $s as xs:string) as xs:string* 
        { for $f in $fns return $f($s) };
        let $ops := (upper-case#1, lower-case#1, function($x){translate($x, 'e', 'i')}, 
            substring-before(?, ' ', ?)) 
        return string-join(local:apply($ops, 'Michael Kay'), '~')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-913'(_Config) ->
   Qry = "
        declare function local:apply($fns as (function(xs:string) as xs:string)*, $s as xs:string) as xs:string* 
        { for $f in $fns return $f($s) }; 
        let $ops := (upper-case#1, lower-case#1, function($x){translate($x, 'e', 'i')}, 
            string-length#1) 
        return string-join(local:apply($ops, 'Michael Kay'), '~')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-914'(_Config) ->
   Qry = "
        declare function local:apply($fns as (function(xs:string) as xs:string)*, $s as xs:string) as xs:string* 
        { for $f in $fns return $f($s) }; 
        let $ops := (upper-case#1, lower-case#1, function($x as xs:double){string($x)}) 
        return string-join(local:apply($ops, 'Michael Kay'), '~')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-915'(_Config) ->
   Qry = "let $ops := substring-before('abc', ' ', (), ?) return $ops('Michael Kay')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-916'(_Config) ->
   Qry = "let $ops := substring-before(?, ?) return $ops('Michael Kay')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-917'(_Config) ->
   Qry = "let $ops := substring-before(?, 2) return $ops('Michael Kay')",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-918'(_Config) ->
   Qry = "
        declare function local:round($x as xs:double, $algorithm as (function(xs:double) as xs:double)) as xs:double 
        { $algorithm($x) }; 
        declare variable $roundToCeiling := local:round(?, upper-case#1); 
        $roundToCeiling(12.4)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'hof-919'(_Config) ->
   Qry = "
      declare function local:round($x as xs:double) as xs:double { fn:floor($x) }; 
      declare function local:ops() as (function(xs:double) as xs:double)* 
      	{ (abs#1, local:round#1, function($x as xs:float){$x+1}, round-half-to-even(?, 2)) }; 
      string-join(for $f in local:ops() return string(round-half-to-even($f(xs:decimal('123.456')), 4)), '~')
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-1'(_Config) ->
   Qry = "concat#64 instance of function(*)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-2'(_Config) ->
   Qry = "string-join#1((\"a\", \"b\", \"c\", \"d\", \"e\", \"f\", \"g\", \"h\", \"i\", \"j\"))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "abcdefghij") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-3'(_Config) ->
   Qry = "string-join#1 is string-join#1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-4'(_Config) ->
   Qry = "string-join#1 eq string-join#1",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FOTY0013") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-5'(_Config) ->
   Qry = "element a { avg#1 }",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQTY0105") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-6'(_Config) ->
   Qry = "attribute a { avg#1 }",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FOTY0013") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-7'(_Config) ->
   Qry = "(let $a := 92, $b := true() return function($c) { $a, $b, $c })(\"lala\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"92, true(), \"lala\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-8'(_Config) ->
   Qry = "function-name(function-name#1)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"xs:QName(\"fn:function-name\")") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-9'(_Config) ->
   Qry = "function-name(let $a := 92, $b := true() return function($c) { $a, $b, $c })",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_count(Res, "0") of 
      true -> {comment, "Count correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-10'(_Config) ->
   Qry = "(let $a := 92, $b := true() return function($c) { $a, $b, $c }) instance of function(item()*) as item()*",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-11'(_Config) ->
   Qry = "(let $a := 92, $b := true() return function($c) { $a, $b, $c })((xs:QName(\"foo\"), 5.0e3))",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"92, true(), fn:QName(\"\",\"foo\"), 5000") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-12'(_Config) ->
   Qry = "function($a as item()) as item() { $a } instance of function(*)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-13'(_Config) ->
   Qry = "function($a as item()) as xs:integer { $a } instance of function(item()) as item()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-14'(_Config) ->
   Qry = "function($a as item()) as item() { $a } instance of function(xs:string) as item()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-15'(_Config) ->
   Qry = "function($a as item()) as item() { $a } instance of function() as item()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-16'(_Config) ->
   Qry = "function($a as item()) as xs:integer { $a } instance of function(item(), item()) as item()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'function-item-17'(_Config) ->
   Qry = "function($a as xs:string) as item() { $a } instance of function(item()) as item()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "False"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-1'(_Config) ->
   Qry = "function() { 5 } instance of function(*)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-2'(_Config) ->
   Qry = "function-name(function() { 5 })",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_count(Res, "0") of 
      true -> {comment, "Count correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-3'(_Config) ->
   Qry = "function() as xs:integer { 5 }()",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"5") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-4'(_Config) ->
   Qry = "function($a as xs:integer) as xs:integer { $a + 5 }(3)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"8") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-5'(_Config) ->
   Qry = "function($a as xs:integer, $b as xs:double) as xs:double { $a * $b + 5 }(3, 2)",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"11") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-6'(_Config) ->
   Qry = "function($a, $b as xs:double) as xs:double { $a * $b + 5 } instance of function(item()*, xs:double) as xs:double",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-7'(_Config) ->
   Qry = "function($a as node()+, $b) as xs:double { $a * $b + 5 } instance of function(node(), item()*) as xs:double",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-8'(_Config) ->
   Qry = "function($a as node()+) { $a + 5 } instance of function(node()) as item()*",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-9'(_Config) ->
   Qry = "function() { true() } instance of function() as item()*",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "True"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-10'(_Config) ->
   Qry = "function($a) { \"lala\", $a }, $a",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0008") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-11'(_Config) ->
   Qry = "let $a := \"monkey\" return function($a) { \"lala\", $a }(\"gibbon\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"lala\", \"gibbon\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-12'(_Config) ->
   Qry = "$a, function($a) { \"lala\", $a }",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0008") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-11a'(_Config) ->
   Qry = "function($a) { let $a := \"monkey\" return (\"lala\", $a) }(\"gibbon\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"lala\", \"monkey\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-12a'(_Config) ->
   Qry = "function($a, $a) { \"lala\", $a }(\"gibbon\", \"monkey\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0039") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-13'(_Config) ->
   Qry = "function($local:foo, $local:bar, $local:foo) { \"lala\", $local:foo, $local:bar }(\"gibbon\", \"monkey\", \"ape\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0039") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-14'(_Config) ->
   Qry = "function($local:foo, $local:bar, $fn:foo) { \"lala\", $local:foo, $local:bar }(\"gibbon\", \"monkey\", \"ape\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"lala\", \"gibbon\", \"monkey\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-15'(_Config) ->
   Qry = "function($Q{http://local/}foo, $Q{http://local/}bar, $Q{http://local/}foo) { 
              \"lala\", $Q{http://local/}foo, $Q{http://local/}bar }(\"gibbon\", \"monkey\", \"ape\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQST0039") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'inline-function-16'(_Config) ->
   Qry = "function($Q{http://local/}foo, $Q{http://local/}bar, $fn:foo) { 
               \"lala\", $Q{http://local/}foo, $Q{http://local/}bar }(\"gibbon\", \"monkey\", \"ape\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"lala\", \"gibbon\", \"monkey\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof1'(_Config) ->
   Qry = "
declare namespace map = \"http://snelson.org.uk/functions/map\";

declare function map:key($pair as function() as item()+) as item()
{
  $pair()[1]
};

declare function map:value($pair as function() as item()+) as item()*
{
  subsequence($pair(), 2)
};

declare function map:contains($map as (function() as item()+)*, $key as item())
  as xs:boolean
{
  map:process($map, $key, function($a) { true() }, false(),
    function($a) { () })
};

declare function map:get($map as (function() as item()+)*, $key as item())
  as item()*
{
  map:process($map, $key, map:value#1, (), function($a) { () })
};

declare function map:process(
  $map as (function() as item()+)*,
  $key as item(),
  $found as function(function() as item()+) as item()*,
  $notfound as item()*,
  $unused as function((function() as item()+)*) as item()*
) as item()*
{
  if(empty($map)) then $notfound
  else

  let $length := count($map)
  let $middle := $length idiv 2 + 1
  let $pair := $map[$middle]
  let $pair_key := $pair()[1]
  return
    if($pair_key eq $key) then (
      $unused(subsequence($map, 1, $middle - 1)),
      $found($pair),
      $unused(subsequence($map, $middle + 1))
    )
    else if($pair_key gt $key) then (
      map:process(subsequence($map, 1, $middle - 1), $key,
        $found, $notfound, $unused),
      $unused(subsequence($map, $middle))
    )
    else (
      $unused(subsequence($map, 1, $middle)),
      map:process(subsequence($map, $middle + 1), $key,
        $found, $notfound, $unused)
    )
};

declare function map:pair($key as item(), $value as item()*)
  as function() as item()+
{
  function() { $key, $value }
};

declare function map:put(
  $map as (function() as item()+)*,
  $key as item(),
  $value as item()*
) as (function() as item()+)+
{
  let $pair := map:pair($key, $value)
  return
    map:process($map, $key, function($a) { $pair }, $pair,
      function($a) { $a })
};

string-join(let $map := map:put(map:put(map:put(map:put(map:put(map:put((),
  \"a\", \"aardvark\"),
  \"z\", \"zebra\"),
  \"e\", (\"elephant\", \"eagle\")),
  \"o\", \"osterich\"),
  \"t\", \"terrapin\"),
  \"a\", \"antelope\")
return (
  map:get($map, \"o\"),

  for $m in $map
  return concat(\"key: \", map:key($m), \", value: (\",
    string-join(map:value($m), \", \"), \")\"))
, \"
\")
",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"\"osterich
key: a, value: (antelope)
key: e, value: (elephant, eagle)
key: o, value: (osterich)
key: t, value: (terrapin)
key: z, value: (zebra)\"") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof2'(_Config) ->
   Qry = "
         import module namespace func = \"http://snelson.org.uk/functions/functional\";
         
         let $f := func:curry(concat#5)
         return $f(\"foo\")(\" bar\")(\" baz\")(\" what's\")(\" next?\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"\"foo bar baz what's next?\"") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof3'(_Config) ->
   Qry = "
import module namespace func = \"http://snelson.org.uk/functions/functional\";

declare function local:fib2_aux($result as xs:integer, $next as xs:integer, $n) as xs:integer*
{
  if($n eq 0) then () else (
  $result, local:fib2_aux($next, $next + $result, $n - 1))
};

declare function local:fib2($n) as xs:integer*
{
  local:fib2_aux(0, 1, $n)
};

declare function local:map-pairs($f,$a,$b)
{
  for-each-pair($a,$b,$f)
};

string-join(
for $a in subsequence(

let $interleave := func:curry(local:map-pairs#3)(function($a, $b) { $a, $b })
let $enumerate := $interleave(0 to 49)
return
$enumerate(local:fib2(50))

, 1, 100)
return string($a)
, \"
\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"\"0
0
1
1
2
1
3
2
4
3
5
5
6
8
7
13
8
21
9
34
10
55
11
89
12
144
13
233
14
377
15
610
16
987
17
1597
18
2584
19
4181
20
6765
21
10946
22
17711
23
28657
24
46368
25
75025
26
121393
27
196418
28
317811
29
514229
30
832040
31
1346269
32
2178309
33
3524578
34
5702887
35
9227465
36
14930352
37
24157817
38
39088169
39
63245986
40
102334155
41
165580141
42
267914296
43
433494437
44
701408733
45
1134903170
46
1836311903
47
2971215073
48
4807526976
49
7778742049\"") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof4'(_Config) ->
   Qry = "
         declare function local:hof($s, $f as function(*)) {
           $f($s[1], $s[2])
         };
         
         local:hof(('1', '2'), concat#2)
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"\"12\"") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof5'(_Config) ->
   Qry = "
         let $a := string-join(?, \"\")
         return $a((\"foo\", \"bar\", \"baz\"))
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"\"foobarbaz\"") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof6'(_Config) ->
   Qry = "
         declare function local:curry($f as function(item()*, item()*) as item()*) as function(item()*) as function(item()*) as item()*
         {
           function($a) { $f($a, ?) }
         };
         
         local:curry(substring-after#2)(\"foobar\")(\"foo\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"\"bar\"") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof7'(_Config) ->
   Qry = "concat#3(\"one\", \"two\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof8'(_Config) ->
   Qry = "concat#4(\"one\", ?, \"three\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof9'(_Config) ->
   Qry = "concat#2(\"one\", ?, \"three\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof10'(_Config) ->
   Qry = "
         for $f in (concat(\"one \", ?, \" three\"), substring-before(\"one two three\", ?), matches(?, \"t.*o\"), xs:NCName(?))
         return $f(\"two\")
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"one two three\", \"one \", true(), xs:NCName(\"two\")") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof11'(_Config) ->
   Qry = "()(\"two\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof12'(_Config) ->
   Qry = "(concat(\"one \", ?, \" three\"), substring-before(\"one two three\", ?), matches(?, \"t.*o\"), xs:NCName(?))(\"two\")",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof13'(_Config) ->
   Qry = "
         let $f := function($a) { node-name(.), $a }
         return <a/>/$f(5)
      
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPDY0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof14'(_Config) ->
   Qry = "
         let $f := name#0
         return <a/>/$f()
      
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPDY0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof15'(_Config) ->
   Qry = "
         let $f := <b/>/name#0
         return <a/>/$f()
      
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"\"b\"") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof16'(_Config) ->
   Qry = "
         declare base-uri \"main\";
         import module namespace lib = \"lib\";
         
         lib:getfun()(),
         fn:static-base-uri#0(),
         fn:static-base-uri()
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"fn:ends-with($result[1], \"lib\")") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"fn:ends-with($result[2], \"main\")") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"fn:ends-with($result[3], \"main\")") of 
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
'xqhof17'(_Config) ->
   Qry = "
         import module namespace lib = \"lib\";
         
         <main/>/lib:getfun2()(),
         <main/>/name#0(),
         <main/>/name()
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"lib\", \"main\", \"main\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof18'(_Config) ->
   Qry = "
         declare base-uri \"main\";
         import module namespace lib = \"lib\";
         
         lib:getfun3()(xs:QName(\"fn:static-base-uri\"),0)(),
         function-lookup#2(xs:QName(\"fn:static-base-uri\"),0)(),
         function-lookup(xs:QName(\"fn:static-base-uri\"),0)()
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case lists:all(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert(Res,"fn:ends-with($result[1], \"lib\")") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"fn:ends-with($result[2], \"main\")") of 
      true -> {comment, "Correct results"};
      {false, F} -> F 
   end,
   case xqerl_test:assert(Res,"fn:ends-with($result[3], \"main\")") of 
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
'xqhof19'(_Config) ->
   Qry = "
         import module namespace lib = \"lib\";
         
         <main/>/lib:getfun3()(xs:QName(\"fn:name\"),0)(),
         <main/>/function-lookup#2(xs:QName(\"fn:name\"),0)(),
         <main/>/function-lookup(xs:QName(\"fn:name\"),0)()
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"lib\", \"main\", \"main\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof20'(_Config) ->
   Qry = "
          let $m := map {
                \"Tuesday\" : true(),
                \"Wednesday\" : true(),
                \"Thursday\" : false(),
                \"Friday\" : true(),
                \"Monday\" : true(),
                \"Sunday\" : false(),
                \"Saturday\" : false() }
          let $days := (\"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\", \"Sunday\")     
          return fn:filter($days,$m)        
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"\"Monday\", \"Tuesday\", \"Wednesday\", \"Friday\"") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof21'(_Config) ->
   Qry = "
          let $m := map {
                \"Tuesday\" : true(),
                \"Wednesday\" : true(),
                \"Friday\" : true(),
                \"Monday\" : true(),
                \"Sunday\" : false(),
                \"Saturday\" : false() }
          let $days := (\"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\", \"Sunday\")     
          return fn:filter($days,$m)        
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
'xqhof22'(_Config) ->
   Qry = "
          let $m := array {
                true(),
                true(),
                false(),
                true(),
                true(),
                false(),
                false() }
          let $indices := (1 to 7)
          return fn:filter($indices,$m)        
      ",
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try xqerl:run(Qry1) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_deep_eq(Res,"1, 2, 4, 5") of 
      true -> {comment, "Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.
