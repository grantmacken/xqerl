-module('fn_round_half_to_even_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['fn-round-half-to-evenint1args-1'/1]).
-export(['fn-round-half-to-evenint1args-2'/1]).
-export(['fn-round-half-to-evenint1args-3'/1]).
-export(['fn-round-half-to-evenintg1args-1'/1]).
-export(['fn-round-half-to-evenintg1args-2'/1]).
-export(['fn-round-half-to-evenintg1args-3'/1]).
-export(['fn-round-half-to-evendec1args-1'/1]).
-export(['fn-round-half-to-evendec1args-2'/1]).
-export(['fn-round-half-to-evendec1args-3'/1]).
-export(['fn-round-half-to-evendbl1args-1'/1]).
-export(['fn-round-half-to-evendbl1args-2'/1]).
-export(['fn-round-half-to-evendbl1args-3'/1]).
-export(['fn-round-half-to-evenflt1args-1'/1]).
-export(['fn-round-half-to-evenflt1args-2'/1]).
-export(['fn-round-half-to-evenflt1args-3'/1]).
-export(['fn-round-half-to-evenlng1args-1'/1]).
-export(['fn-round-half-to-evenlng1args-2'/1]).
-export(['fn-round-half-to-evenlng1args-3'/1]).
-export(['fn-round-half-to-evenusht1args-1'/1]).
-export(['fn-round-half-to-evenusht1args-2'/1]).
-export(['fn-round-half-to-evenusht1args-3'/1]).
-export(['fn-round-half-to-evennint1args-1'/1]).
-export(['fn-round-half-to-evennint1args-2'/1]).
-export(['fn-round-half-to-evennint1args-3'/1]).
-export(['fn-round-half-to-evenpint1args-1'/1]).
-export(['fn-round-half-to-evenpint1args-2'/1]).
-export(['fn-round-half-to-evenpint1args-3'/1]).
-export(['fn-round-half-to-evenulng1args-1'/1]).
-export(['fn-round-half-to-evenulng1args-2'/1]).
-export(['fn-round-half-to-evenulng1args-3'/1]).
-export(['fn-round-half-to-evennpi1args-1'/1]).
-export(['fn-round-half-to-evennpi1args-2'/1]).
-export(['fn-round-half-to-evennpi1args-3'/1]).
-export(['fn-round-half-to-evennni1args-1'/1]).
-export(['fn-round-half-to-evennni1args-2'/1]).
-export(['fn-round-half-to-evennni1args-3'/1]).
-export(['fn-round-half-to-evensht1args-1'/1]).
-export(['fn-round-half-to-evensht1args-2'/1]).
-export(['fn-round-half-to-evensht1args-3'/1]).
-export(['K-RoundEvenFunc-1'/1]).
-export(['K-RoundEvenFunc-2'/1]).
-export(['K-RoundEvenFunc-3'/1]).
-export(['K-RoundEvenFunc-4'/1]).
-export(['K-RoundEvenFunc-5'/1]).
-export(['K2-RoundEvenFunc-1'/1]).
-export(['K2-RoundEvenFunc-2'/1]).
-export(['K2-RoundEvenFunc-3'/1]).
-export(['K2-RoundEvenFunc-4'/1]).
-export(['K2-RoundEvenFunc-5'/1]).
-export(['K2-RoundEvenFunc-6'/1]).
-export(['K2-RoundEvenFunc-7'/1]).
-export(['K2-RoundEvenFunc-8'/1]).
-export(['K2-RoundEvenFunc-9'/1]).
-export(['K2-RoundEvenFunc-10'/1]).
-export(['K2-RoundEvenFunc-11'/1]).
-export(['K2-RoundEvenFunc-12'/1]).
-export(['K2-RoundEvenFunc-13'/1]).
-export(['K2-RoundEvenFunc-14'/1]).
-export(['K2-RoundEvenFunc-15'/1]).
-export(['K2-RoundEvenFunc-16'/1]).
-export(['K2-RoundEvenFunc-17'/1]).
-export(['K2-RoundEvenFunc-18'/1]).
-export(['K2-RoundEvenFunc-19'/1]).
-export(['K2-RoundEvenFunc-20'/1]).
-export(['K2-RoundEvenFunc-21'/1]).
-export(['K2-RoundEvenFunc-22'/1]).
-export(['K2-RoundEvenFunc-23'/1]).
-export(['K2-RoundEvenFunc-24'/1]).
-export(['K2-RoundEvenFunc-25'/1]).
-export(['K2-RoundEvenFunc-26'/1]).
-export(['K2-RoundEvenFunc-27'/1]).
-export(['K2-RoundEvenFunc-28'/1]).
-export(['fn-round-half-to-even-1'/1]).
-export(['fn-round-half-to-even-2'/1]).
-export(['fn-round-half-to-even-3'/1]).
-export(['fn-round-half-to-even-4'/1]).
-export(['fn-round-half-to-even-5'/1]).
-export(['fn-round-half-to-even-6'/1]).
-export(['fn-round-half-to-even-7'/1]).
-export(['fn-round-half-to-even-8'/1]).
-export(['fn-round-half-to-even-9'/1]).
-export(['fn-round-half-to-even-10'/1]).
-export(['fn-round-half-to-even-11'/1]).
-export(['fn-round-half-to-even-12'/1]).
-export(['fn-round-half-to-even-13'/1]).
-export(['fn-round-half-to-even-14'/1]).
-export(['fn-round-half-to-even-15'/1]).
-export(['fn-round-half-to-even-16'/1]).
-export(['fn-round-half-to-even-17'/1]).
-export(['fn-round-half-to-even-18'/1]).
-export(['fn-round-half-to-even-19'/1]).
-export(['fn-round-half-to-even-20'/1]).
-export(['fn-round-half-to-even-21'/1]).
-export(['fn-round-half-to-even-22'/1]).
-export(['fn-round-half-to-even-23'/1]).
-export(['fn-round-half-to-even-24'/1]).
-export(['fn-round-half-to-even-24a'/1]).
-export(['fn-round-half-to-even-25'/1]).
-export(['fn-round-half-to-even-26'/1]).
-export(['fn-round-half-to-even-27'/1]).
-export(['fn-round-half-to-even-28'/1]).
-export(['fn-round-half-to-even-29'/1]).
-export(['fn-round-half-to-even-30'/1]).
-export(['fn-round-half-to-even-31'/1]).
-export(['fn-round-half-to-even-32'/1]).
-export(['fn-round-half-to-even-33'/1]).
-export(['fn-round-half-to-even-34'/1]).
-export(['fn-round-half-to-even-35'/1]).
-export(['fn-round-half-to-even-36'/1]).
-export(['fn-round-half-to-even-37'/1]).
-export(['fn-round-half-to-even-38'/1]).
-export(['fn-round-half-to-even-39'/1]).
-export(['fn-round-half-to-even-40'/1]).
-export(['fn-round-half-to-even-41'/1]).
-export(['cbcl-round-half-to-even-001'/1]).
-export(['cbcl-round-half-to-even-002'/1]).
-export(['cbcl-round-half-to-even-003'/1]).
-export(['cbcl-round-half-to-even-004'/1]).
-export(['cbcl-round-half-to-even-005'/1]).
-export(['cbcl-round-half-to-even-006'/1]).
-export(['cbcl-round-half-to-even-007'/1]).
-export(['cbcl-round-half-to-even-008'/1]).
-export(['cbcl-round-half-to-even-009'/1]).
-export(['cbcl-round-half-to-even-010'/1]).
-export(['cbcl-round-half-to-even-011'/1]).
-export(['cbcl-round-half-to-even-012'/1]).
-export(['cbcl-round-half-to-even-013'/1]).
-export(['cbcl-round-half-to-even-014'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> erlang:erase().
init_per_suite(Config) -> ok
,Config.
all() -> [
   'fn-round-half-to-evenint1args-1',
   'fn-round-half-to-evenint1args-2',
   'fn-round-half-to-evenint1args-3',
   'fn-round-half-to-evenintg1args-1',
   'fn-round-half-to-evenintg1args-2',
   'fn-round-half-to-evenintg1args-3',
   'fn-round-half-to-evendec1args-1',
   'fn-round-half-to-evendec1args-2',
   'fn-round-half-to-evendec1args-3',
   'fn-round-half-to-evendbl1args-1',
   'fn-round-half-to-evendbl1args-2',
   'fn-round-half-to-evendbl1args-3',
   'fn-round-half-to-evenflt1args-1',
   'fn-round-half-to-evenflt1args-2',
   'fn-round-half-to-evenflt1args-3',
   'fn-round-half-to-evenlng1args-1',
   'fn-round-half-to-evenlng1args-2',
   'fn-round-half-to-evenlng1args-3',
   'fn-round-half-to-evenusht1args-1',
   'fn-round-half-to-evenusht1args-2',
   'fn-round-half-to-evenusht1args-3',
   'fn-round-half-to-evennint1args-1',
   'fn-round-half-to-evennint1args-2',
   'fn-round-half-to-evennint1args-3',
   'fn-round-half-to-evenpint1args-1',
   'fn-round-half-to-evenpint1args-2',
   'fn-round-half-to-evenpint1args-3',
   'fn-round-half-to-evenulng1args-1',
   'fn-round-half-to-evenulng1args-2',
   'fn-round-half-to-evenulng1args-3',
   'fn-round-half-to-evennpi1args-1',
   'fn-round-half-to-evennpi1args-2',
   'fn-round-half-to-evennpi1args-3',
   'fn-round-half-to-evennni1args-1',
   'fn-round-half-to-evennni1args-2',
   'fn-round-half-to-evennni1args-3',
   'fn-round-half-to-evensht1args-1',
   'fn-round-half-to-evensht1args-2',
   'fn-round-half-to-evensht1args-3',
   'K-RoundEvenFunc-1',
   'K-RoundEvenFunc-2',
   'K-RoundEvenFunc-3',
   'K-RoundEvenFunc-4',
   'K-RoundEvenFunc-5',
   'K2-RoundEvenFunc-1',
   'K2-RoundEvenFunc-2',
   'K2-RoundEvenFunc-3',
   'K2-RoundEvenFunc-4',
   'K2-RoundEvenFunc-5',
   'K2-RoundEvenFunc-6',
   'K2-RoundEvenFunc-7',
   'K2-RoundEvenFunc-8',
   'K2-RoundEvenFunc-9',
   'K2-RoundEvenFunc-10',
   'K2-RoundEvenFunc-11',
   'K2-RoundEvenFunc-12',
   'K2-RoundEvenFunc-13',
   'K2-RoundEvenFunc-14',
   'K2-RoundEvenFunc-15',
   'K2-RoundEvenFunc-16',
   'K2-RoundEvenFunc-17',
   'K2-RoundEvenFunc-18',
   'K2-RoundEvenFunc-19',
   'K2-RoundEvenFunc-20',
   'K2-RoundEvenFunc-21',
   'K2-RoundEvenFunc-22',
   'K2-RoundEvenFunc-23',
   'K2-RoundEvenFunc-24',
   'K2-RoundEvenFunc-25',
   'K2-RoundEvenFunc-26',
   'K2-RoundEvenFunc-27',
   'K2-RoundEvenFunc-28',
   'fn-round-half-to-even-1',
   'fn-round-half-to-even-2',
   'fn-round-half-to-even-3',
   'fn-round-half-to-even-4',
   'fn-round-half-to-even-5',
   'fn-round-half-to-even-6',
   'fn-round-half-to-even-7',
   'fn-round-half-to-even-8',
   'fn-round-half-to-even-9',
   'fn-round-half-to-even-10',
   'fn-round-half-to-even-11',
   'fn-round-half-to-even-12',
   'fn-round-half-to-even-13',
   'fn-round-half-to-even-14',
   'fn-round-half-to-even-15',
   'fn-round-half-to-even-16',
   'fn-round-half-to-even-17',
   'fn-round-half-to-even-18',
   'fn-round-half-to-even-19',
   'fn-round-half-to-even-20',
   'fn-round-half-to-even-21',
   'fn-round-half-to-even-22',
   'fn-round-half-to-even-23',
   'fn-round-half-to-even-24',
   'fn-round-half-to-even-24a',
   'fn-round-half-to-even-25',
   'fn-round-half-to-even-26',
   'fn-round-half-to-even-27',
   'fn-round-half-to-even-28',
   'fn-round-half-to-even-29',
   'fn-round-half-to-even-30',
   'fn-round-half-to-even-31',
   'fn-round-half-to-even-32',
   'fn-round-half-to-even-33',
   'fn-round-half-to-even-34',
   'fn-round-half-to-even-35',
   'fn-round-half-to-even-36',
   'fn-round-half-to-even-37',
   'fn-round-half-to-even-38',
   'fn-round-half-to-even-39',
   'fn-round-half-to-even-40',
   'fn-round-half-to-even-41',
   'cbcl-round-half-to-even-001',
   'cbcl-round-half-to-even-002',
   'cbcl-round-half-to-even-003',
   'cbcl-round-half-to-even-004',
   'cbcl-round-half-to-even-005',
   'cbcl-round-half-to-even-006',
   'cbcl-round-half-to-even-007',
   'cbcl-round-half-to-even-008',
   'cbcl-round-half-to-even-009',
   'cbcl-round-half-to-even-010',
   'cbcl-round-half-to-even-011',
   'cbcl-round-half-to-even-012',
   'cbcl-round-half-to-even-013',
   'cbcl-round-half-to-even-014'].
environment('empty') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('atomic') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/atomic.xml",".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/atomic.xsd","http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.w3.org/XQueryTest","atomic"}]},
{resources, []},
{modules, []}
];
environment('atomic-xq') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/atomic.xml",".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/atomic.xsd","http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-mod') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/works-mod.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/works.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('staff') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/staff.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-and-staff') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/works.xml","$works",""},
{"file:///C:/git/xqerl/test/QT3_1_0/docs/staff.xml","$staff",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('auction') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/auction.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.example.com/AuctionWatch","ma"},
{"http://www.w3.org/1999/xlink","xlink"},
{"http://www.example.com/auctioneers#anyzone","anyzone"},
{"http://www.example.com/auctioneers#eachbay","eachbay"},
{"http://www.example.com/auctioneers#yabadoo","yabadoo"}]},
{resources, []},
{modules, []}
];
environment('qname') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/QName-source.xml",".",""}]},
{schemas, [{"file:///C:/git/xqerl/test/QT3_1_0/docs/QName-schema.xsd","http://www.example.com/QNameXSD"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.example.com/QNameXSD",""}]},
{resources, []},
{modules, []}
];
environment('math') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/math","math"}]},
{resources, []},
{modules, []}
].
'fn-round-half-to-evenint1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:int(\"-2147483648\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -2147483648
      ",
 Tst = xqerl:run("-2147483648"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenint1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:int(\"-1873914410\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1873914410
      ",
 Tst = xqerl:run("-1873914410"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenint1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:int(\"2147483647\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         2147483647
      ",
 Tst = xqerl:run("2147483647"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenintg1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:integer(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenintg1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:integer(\"830993497117024304\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         830993497117024304
      ",
 Tst = xqerl:run("830993497117024304"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenintg1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:integer(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evendec1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:decimal(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evendec1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:decimal(\"617375191608514839\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         617375191608514839
      ",
 Tst = xqerl:run("617375191608514839"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evendec1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:decimal(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evendbl1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:double(\"-1.7976931348623157E308\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -1.7976931348623157E308
            
         
      ",
 case ( begin Tst1 = xqerl:run("-1.7976931348623157E308"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end) orelse (is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "FOCA0001") of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'fn-round-half-to-evendbl1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:double(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evendbl1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:double(\"1.7976931348623157E308\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            1.7976931348623157E308
            
         
      ",
 case ( begin Tst1 = xqerl:run("1.7976931348623157E308"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end) orelse (is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "FOCA0001") of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'fn-round-half-to-evenflt1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:float(\"-3.4028235E38\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            xs:float(\"-3.4028235E38\")
            
         
      ",
 case ( begin Tst1 = xqerl:run("xs:float(\"-3.4028235E38\")"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end) orelse (is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "FOCA0001") of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'fn-round-half-to-evenflt1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:float(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenflt1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:float(\"3.4028235E38\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            xs:float(\"3.4028235E38\")
            
         
      ",
 case ( begin Tst1 = xqerl:run("xs:float(\"3.4028235E38\")"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end) orelse (is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "FOCA0001") of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'fn-round-half-to-evenlng1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:long(\"-92233720368547758\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -92233720368547758
      ",
 Tst = xqerl:run("-92233720368547758"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenlng1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:long(\"-47175562203048468\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -47175562203048468
      ",
 Tst = xqerl:run("-47175562203048468"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenlng1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:long(\"92233720368547758\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         92233720368547758
      ",
 Tst = xqerl:run("92233720368547758"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenusht1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:unsignedShort(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenusht1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:unsignedShort(\"44633\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         44633
      ",
 Tst = xqerl:run("44633"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenusht1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:unsignedShort(\"65535\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         65535
      ",
 Tst = xqerl:run("65535"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennint1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:negativeInteger(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennint1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:negativeInteger(\"-297014075999096793\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -297014075999096793
      ",
 Tst = xqerl:run("-297014075999096793"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennint1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:negativeInteger(\"-1\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenpint1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:positiveInteger(\"1\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenpint1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:positiveInteger(\"52704602390610033\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         52704602390610033
      ",
 Tst = xqerl:run("52704602390610033"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenpint1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:positiveInteger(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenulng1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:unsignedLong(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenulng1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:unsignedLong(\"130747108607674654\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         130747108607674654
      ",
 Tst = xqerl:run("130747108607674654"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evenulng1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:unsignedLong(\"184467440737095516\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         184467440737095516
      ",
 Tst = xqerl:run("184467440737095516"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennpi1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:nonPositiveInteger(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennpi1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:nonPositiveInteger(\"-475688437271870490\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -475688437271870490
      ",
 Tst = xqerl:run("-475688437271870490"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennpi1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:nonPositiveInteger(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennni1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:nonNegativeInteger(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennni1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:nonNegativeInteger(\"303884545991464527\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         303884545991464527
      ",
 Tst = xqerl:run("303884545991464527"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evennni1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:nonNegativeInteger(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evensht1args-1'(_Config) ->
   Qry = "fn:round-half-to-even(xs:short(\"-32768\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -32768
      ",
 Tst = xqerl:run("-32768"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evensht1args-2'(_Config) ->
   Qry = "fn:round-half-to-even(xs:short(\"-5324\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -5324
      ",
 Tst = xqerl:run("-5324"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-evensht1args-3'(_Config) ->
   Qry = "fn:round-half-to-even(xs:short(\"32767\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         32767
      ",
 Tst = xqerl:run("32767"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K-RoundEvenFunc-1'(_Config) ->
   Qry = "round-half-to-even()",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPST0017" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPST0017'}) end.
'K-RoundEvenFunc-2'(_Config) ->
   Qry = "round-half-to-even(1.1, 3, \"wrong param\")",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPST0017" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPST0017'}) end.
'K-RoundEvenFunc-3'(_Config) ->
   Qry = "empty(round-half-to-even(()))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundEvenFunc-4'(_Config) ->
   Qry = "empty(round-half-to-even((), 3))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundEvenFunc-5'(_Config) ->
   Qry = "round-half-to-even(\"a string\")",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPTY0004" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPTY0004'}) end.
'K2-RoundEvenFunc-1'(_Config) ->
   Qry = "round-half-to-even(1) eq 1",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-2'(_Config) ->
   Qry = "round-half-to-even(1.0) eq 1",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-3'(_Config) ->
   Qry = "round-half-to-even(0.5) eq 0",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-4'(_Config) ->
   Qry = "round-half-to-even(1.5) eq 2",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-5'(_Config) ->
   Qry = "round-half-to-even(2.5) eq 2",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-6'(_Config) ->
   Qry = "round-half-to-even(3.567812E+3, 2) eq 3567.81E0",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-7'(_Config) ->
   Qry = "round-half-to-even(4.7564E-3, 2) eq 0.0E0",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-8'(_Config) ->
   Qry = "round-half-to-even(35612.25, -2) eq 35600",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-9'(_Config) ->
   Qry = "round-half-to-even(xs:double(\"-0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
 Tst = xqerl:run("-0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-10'(_Config) ->
   Qry = "round-half-to-even(xs:float(\"-0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
 Tst = xqerl:run("-0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundEvenFunc-11'(_Config) ->
   Qry = "round-half-to-even(xs:double(\"NaN\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         NaN
      ",
   case xqerl_types:string_value(Res) of
             "NaN" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'K2-RoundEvenFunc-12'(_Config) ->
   Qry = "round-half-to-even(xs:float(\"NaN\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         NaN
      ",
   case xqerl_types:string_value(Res) of
             "NaN" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'K2-RoundEvenFunc-13'(_Config) ->
   Qry = "round-half-to-even(xs:double(\"-INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -INF
      ",
   case xqerl_types:string_value(Res) of
             "-INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'K2-RoundEvenFunc-14'(_Config) ->
   Qry = "round-half-to-even(xs:float(\"-INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -INF
      ",
   case xqerl_types:string_value(Res) of
             "-INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'K2-RoundEvenFunc-15'(_Config) ->
   Qry = "round-half-to-even(xs:double(\"INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         INF
      ",
   case xqerl_types:string_value(Res) of
             "INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'K2-RoundEvenFunc-16'(_Config) ->
   Qry = "round-half-to-even(xs:float(\"INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         INF
      ",
   case xqerl_types:string_value(Res) of
             "INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'K2-RoundEvenFunc-17'(_Config) ->
   Qry = "round-half-to-even(xs:unsignedShort(\"0\")) instance of xs:unsignedShort",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-18'(_Config) ->
   Qry = "round-half-to-even(xs:unsignedLong(\"0\")) instance of xs:unsignedLong",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-19'(_Config) ->
   Qry = "round-half-to-even(xs:unsignedInt(\"0\")) instance of xs:unsignedInt",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-20'(_Config) ->
   Qry = "round-half-to-even(xs:unsignedByte(\"0\")) instance of xs:unsignedByte",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-21'(_Config) ->
   Qry = "round-half-to-even(xs:positiveInteger(\"1\")) instance of xs:positiveInteger",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-22'(_Config) ->
   Qry = "round-half-to-even(xs:nonPositiveInteger(\"0\")) instance of xs:nonPositiveInteger",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-23'(_Config) ->
   Qry = "round-half-to-even(xs:nonNegativeInteger(\"0\")) instance of xs:nonNegativeInteger",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-24'(_Config) ->
   Qry = "round-half-to-even(xs:negativeInteger(\"-1\")) instance of xs:negativeInteger",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-25'(_Config) ->
   Qry = "round-half-to-even(xs:long(\"0\")) instance of xs:long",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-26'(_Config) ->
   Qry = "round-half-to-even(xs:int(\"0\")) instance of xs:int",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-27'(_Config) ->
   Qry = "round-half-to-even(xs:short(\"0\")) instance of xs:short",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundEvenFunc-28'(_Config) ->
   Qry = "round-half-to-even(xs:byte(\"0\")) instance of xs:byte",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'fn-round-half-to-even-1'(_Config) ->
   Qry = "for $x in (1, xs:decimal(2), xs:float(3), xs:double(4)) 
            return if ((round-half-to-even($x)) instance of xs:integer) then \"integer\" 
           else if ((round-half-to-even($x)) instance of xs:decimal) then \"decimal\" 
           else if ((round-half-to-even($x)) instance of xs:float) then \"float\"
           else if ((round-half-to-even($x)) instance of xs:double) then \"double\" 
           else error()",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         \"integer\", \"decimal\", \"float\", \"double\"
      ",
 Tst = xqerl:run("\"integer\", \"decimal\", \"float\", \"double\""),
  ResVal = xqerl_types:string_value(Res),
  TstVal = xqerl_types:string_value(Tst),
  if ResVal == TstVal -> {comment, "assert-deep-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-even-2'(_Config) ->
   Qry = "for $x in (1, xs:decimal(2), xs:float(3), xs:double(4)) 
            return if ((round-half-to-even($x,1)) instance of xs:integer) then \"integer\" 
           else if ((round-half-to-even($x,1)) instance of xs:decimal) then \"decimal\" 
           else if ((round-half-to-even($x,1)) instance of xs:float) then \"float\"
           else if ((round-half-to-even($x,1)) instance of xs:double) then \"double\" 
           else error()",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         \"integer\", \"decimal\", \"float\", \"double\"
      ",
 Tst = xqerl:run("\"integer\", \"decimal\", \"float\", \"double\""),
  ResVal = xqerl_types:string_value(Res),
  TstVal = xqerl_types:string_value(Tst),
  if ResVal == TstVal -> {comment, "assert-deep-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-half-to-even-3'(_Config) ->
   Qry = "round-half-to-even(1.234567, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            1.23
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("1.23"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-4'(_Config) ->
   Qry = "round-half-to-even(1.000005e0, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            1
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("1"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-5'(_Config) ->
   Qry = "round-half-to-even(xs:float('1.000005e0'), 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            1
            xs:float
         
      ",
 case  begin Tst1 = xqerl:run("1"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:float' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-6'(_Config) ->
   Qry = "round-half-to-even(4561.234567, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4600
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("4600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-7'(_Config) ->
   Qry = "round-half-to-even(4561.000005e0, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4600
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("4600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-8'(_Config) ->
   Qry = "round-half-to-even(xs:float('4561.000005e0'), -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4600
            xs:float
         
      ",
 case  begin Tst1 = xqerl:run("4600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:float' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-9'(_Config) ->
   Qry = "round-half-to-even(4561234567, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4561234600
            xs:integer
         
      ",
 case  begin Tst1 = xqerl:run("4561234600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:integer' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-10'(_Config) ->
   Qry = "round-half-to-even(4561.234567, 0)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4561
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("4561"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-11'(_Config) ->
   Qry = "round-half-to-even(4561.000005e0, 0)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4561
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("4561"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-12'(_Config) ->
   Qry = "round-half-to-even(xs:float('4561.000005e0'), 0)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4561
            xs:float
         
      ",
 case  begin Tst1 = xqerl:run("4561"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:float' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-13'(_Config) ->
   Qry = "round-half-to-even(4561234567, 0)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            4561234567
            xs:integer
         
      ",
 case  begin Tst1 = xqerl:run("4561234567"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:integer' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-14'(_Config) ->
   Qry = "round-half-to-even(xs:float('0.05'), 1)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            0.1
            xs:float
         
      ",
 case  begin Tst1 = xqerl:run("0.1"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:float' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-15'(_Config) ->
   Qry = "round-half-to-even(xs:float('-0.05'), 1)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -0.1
            xs:float
         
      ",
 case  begin Tst1 = xqerl:run("-0.1"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:float' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-16'(_Config) ->
   Qry = "round-half-to-even(xs:float('3.75'), 1)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            3.8
            xs:float
         
      ",
 case  begin Tst1 = xqerl:run("3.8"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:float' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-17'(_Config) ->
   Qry = "round-half-to-even(123.355, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            123.36
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("123.36"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-18'(_Config) ->
   Qry = "round-half-to-even(123.365, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            123.36
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("123.36"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-19'(_Config) ->
   Qry = "round-half-to-even(123.375, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            123.38
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("123.38"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-20'(_Config) ->
   Qry = "round-half-to-even(123.385, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            123.38
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("123.38"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-21'(_Config) ->
   Qry = "round-half-to-even(-123.355, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -123.36
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-123.36"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-22'(_Config) ->
   Qry = "round-half-to-even(-123.365, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -123.36
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-123.36"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-23'(_Config) ->
   Qry = "round-half-to-even(-123.375, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -123.38
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-123.38"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-24'(_Config) ->
   Qry = "round-half-to-even(-123.385, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -123.38
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-123.38"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-24a'(_Config) ->
   Qry = "round-half-to-even(12350.00, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-25'(_Config) ->
   Qry = "round-half-to-even(-12350.00, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-26'(_Config) ->
   Qry = "round-half-to-even(12450.00, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-27'(_Config) ->
   Qry = "round-half-to-even(-12450.00, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-28'(_Config) ->
   Qry = "round-half-to-even(12550.00, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12600
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("12600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-29'(_Config) ->
   Qry = "round-half-to-even(-12550.00, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12600
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-30'(_Config) ->
   Qry = "round-half-to-even(12350, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-31'(_Config) ->
   Qry = "round-half-to-even(-12350, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-32'(_Config) ->
   Qry = "round-half-to-even(12450, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-33'(_Config) ->
   Qry = "round-half-to-even(-12450, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12400
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-34'(_Config) ->
   Qry = "round-half-to-even(12550, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12600
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("12600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-35'(_Config) ->
   Qry = "round-half-to-even(-12550, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12600
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-36'(_Config) ->
   Qry = "round-half-to-even(12350e0, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12400
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-37'(_Config) ->
   Qry = "round-half-to-even(-12350e0, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12400
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("-12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-38'(_Config) ->
   Qry = "round-half-to-even(12450e0, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12400
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-39'(_Config) ->
   Qry = "round-half-to-even(-12450e0, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12400
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("-12400"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-40'(_Config) ->
   Qry = "round-half-to-even(12550e0, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12600
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("12600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-half-to-even-41'(_Config) ->
   Qry = "round-half-to-even(-12550e0, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12600
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("-12600"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'cbcl-round-half-to-even-001'(_Config) ->
   Qry = "fn:round-half-to-even(3.567812E+3, 4294967296)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         3567.812
      ",
   case xqerl_types:string_value(Res) of
             "3567.812" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-002'(_Config) ->
   Qry = "fn:round-half-to-even(12345, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12345
      ",
   case xqerl_types:string_value(Res) of
             "12345" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-003'(_Config) ->
   Qry = "fn:round-half-to-even(12345, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12300
      ",
   case xqerl_types:string_value(Res) of
             "12300" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-004'(_Config) ->
   Qry = "fn:round-half-to-even(xs:short(12345), 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12345
      ",
   case xqerl_types:string_value(Res) of
             "12345" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-005'(_Config) ->
   Qry = "fn:round-half-to-even(xs:short(12345), -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12300
      ",
   case xqerl_types:string_value(Res) of
             "12300" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-006'(_Config) ->
   Qry = "fn:round-half-to-even(12345.6, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12345.6
      ",
   case xqerl_types:string_value(Res) of
             "12345.6" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-007'(_Config) ->
   Qry = "fn:round-half-to-even(12345.6, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12300
      ",
   case xqerl_types:string_value(Res) of
             "12300" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-008'(_Config) ->
   Qry = "fn:round-half-to-even(xs:float(12345.6), 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12345.6
      ",
   case xqerl_types:string_value(Res) of
             "12345.6" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-009'(_Config) ->
   Qry = "fn:round-half-to-even(xs:float(12345.6), -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         12300
      ",
   case xqerl_types:string_value(Res) of
             "12300" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-010'(_Config) ->
   Qry = "fn:round-half-to-even(123456e-2, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1234.56
      ",
   case xqerl_types:string_value(Res) of
             "1234.56" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-011'(_Config) ->
   Qry = "fn:round-half-to-even(123456e-2, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1200
      ",
   case xqerl_types:string_value(Res) of
             "1200" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-012'(_Config) ->
   Qry = "fn:round-half-to-even(3.567812, 4294967296)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         3.567812
      ",
   case xqerl_types:string_value(Res) of
             "3.567812" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'cbcl-round-half-to-even-013'(_Config) ->
   Qry = "fn:boolean(fn:round-half-to-even(5, 1))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'cbcl-round-half-to-even-014'(_Config) ->
   Qry = "fn:round-half-to-even(123456e-2, \"two\")",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPTY0004" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPTY0004'}) end.
