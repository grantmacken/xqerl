-module('fn_data_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['fn-dataint1args-1'/1]).
-export(['fn-dataint1args-2'/1]).
-export(['fn-dataint1args-3'/1]).
-export(['fn-dataintg1args-1'/1]).
-export(['fn-dataintg1args-2'/1]).
-export(['fn-dataintg1args-3'/1]).
-export(['fn-datadec1args-1'/1]).
-export(['fn-datadec1args-2'/1]).
-export(['fn-datadec1args-3'/1]).
-export(['fn-datadbl1args-1'/1]).
-export(['fn-datadbl1args-2'/1]).
-export(['fn-datadbl1args-3'/1]).
-export(['fn-dataflt1args-1'/1]).
-export(['fn-dataflt1args-2'/1]).
-export(['fn-dataflt1args-3'/1]).
-export(['fn-datalng1args-1'/1]).
-export(['fn-datalng1args-2'/1]).
-export(['fn-datalng1args-3'/1]).
-export(['fn-datausht1args-1'/1]).
-export(['fn-datausht1args-2'/1]).
-export(['fn-datausht1args-3'/1]).
-export(['fn-datanint1args-1'/1]).
-export(['fn-datanint1args-2'/1]).
-export(['fn-datanint1args-3'/1]).
-export(['fn-datapint1args-1'/1]).
-export(['fn-datapint1args-2'/1]).
-export(['fn-datapint1args-3'/1]).
-export(['fn-dataulng1args-1'/1]).
-export(['fn-dataulng1args-2'/1]).
-export(['fn-dataulng1args-3'/1]).
-export(['fn-datanpi1args-1'/1]).
-export(['fn-datanpi1args-2'/1]).
-export(['fn-datanpi1args-3'/1]).
-export(['fn-datanni1args-1'/1]).
-export(['fn-datanni1args-2'/1]).
-export(['fn-datanni1args-3'/1]).
-export(['fn-datasht1args-1'/1]).
-export(['fn-datasht1args-2'/1]).
-export(['fn-datasht1args-3'/1]).
-export(['K-DataFunc-1'/1]).
-export(['K-DataFunc-2'/1]).
-export(['K-DataFunc-3'/1]).
-export(['K-DataFunc-4'/1]).
-export(['K2-DataFunc-1'/1]).
-export(['K2-DataFunc-2'/1]).
-export(['K2-DataFunc-3'/1]).
-export(['K2-DataFunc-4'/1]).
-export(['K2-DataFunc-5'/1]).
-export(['K2-DataFunc-6'/1]).
-export(['fn-datacomplextype-1'/1]).
-export(['ST-Data001'/1]).
-export(['fn-data-1'/1]).
-export(['cbcl-data-001'/1]).
-export(['cbcl-data-002'/1]).
-export(['cbcl-data-003'/1]).
-export(['cbcl-data-004'/1]).
-export(['cbcl-data-005'/1]).
-export(['cbcl-data-006'/1]).
-export(['cbcl-data-007'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> erlang:erase().
init_per_suite(Config) -> ok
,Config.
all() -> [
   'fn-dataint1args-1',
   'fn-dataint1args-2',
   'fn-dataint1args-3',
   'fn-dataintg1args-1',
   'fn-dataintg1args-2',
   'fn-dataintg1args-3',
   'fn-datadec1args-1',
   'fn-datadec1args-2',
   'fn-datadec1args-3',
   'fn-datadbl1args-1',
   'fn-datadbl1args-2',
   'fn-datadbl1args-3',
   'fn-dataflt1args-1',
   'fn-dataflt1args-2',
   'fn-dataflt1args-3',
   'fn-datalng1args-1',
   'fn-datalng1args-2',
   'fn-datalng1args-3',
   'fn-datausht1args-1',
   'fn-datausht1args-2',
   'fn-datausht1args-3',
   'fn-datanint1args-1',
   'fn-datanint1args-2',
   'fn-datanint1args-3',
   'fn-datapint1args-1',
   'fn-datapint1args-2',
   'fn-datapint1args-3',
   'fn-dataulng1args-1',
   'fn-dataulng1args-2',
   'fn-dataulng1args-3',
   'fn-datanpi1args-1',
   'fn-datanpi1args-2',
   'fn-datanpi1args-3',
   'fn-datanni1args-1',
   'fn-datanni1args-2',
   'fn-datanni1args-3',
   'fn-datasht1args-1',
   'fn-datasht1args-2',
   'fn-datasht1args-3',
   'K-DataFunc-1',
   'K-DataFunc-2',
   'K-DataFunc-3',
   'K-DataFunc-4',
   'K2-DataFunc-1',
   'K2-DataFunc-2',
   'K2-DataFunc-3',
   'K2-DataFunc-4',
   'K2-DataFunc-5',
   'K2-DataFunc-6',
   'fn-datacomplextype-1',
   'ST-Data001',
   'fn-data-1',
   'cbcl-data-001',
   'cbcl-data-002',
   'cbcl-data-003',
   'cbcl-data-004',
   'cbcl-data-005',
   'cbcl-data-006',
   'cbcl-data-007'].
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
];
environment('mixed') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/fn/data/mixed.xml",".",""}]},
{schemas, [{"file:///C:/git/xqerl/test/QT3_1_0/fn/data/mixedcontent.xsd","http://www.w3.org/XQueryTest/mixedcontent"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('complexData') ->
[{sources, [{"file:///C:/git/xqerl/test/QT3_1_0/fn/data/complexData.xml",".",""}]},
{schemas, [{"file:///C:/git/xqerl/test/QT3_1_0/fn/data/complexData.xsd","http://www.cbcl.co.uk/XQueryTest/complexData"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
].
'fn-dataint1args-1'(_Config) ->
   Qry = "fn:data((xs:int(\"-2147483648\")))",
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
'fn-dataint1args-2'(_Config) ->
   Qry = "fn:data((xs:int(\"-1873914410\")))",
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
'fn-dataint1args-3'(_Config) ->
   Qry = "fn:data((xs:int(\"2147483647\")))",
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
'fn-dataintg1args-1'(_Config) ->
   Qry = "fn:data((xs:integer(\"-999999999999999999\")))",
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
'fn-dataintg1args-2'(_Config) ->
   Qry = "fn:data((xs:integer(\"830993497117024304\")))",
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
'fn-dataintg1args-3'(_Config) ->
   Qry = "fn:data((xs:integer(\"999999999999999999\")))",
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
'fn-datadec1args-1'(_Config) ->
   Qry = "fn:data((xs:decimal(\"-999999999999999999\")))",
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
'fn-datadec1args-2'(_Config) ->
   Qry = "fn:data((xs:decimal(\"617375191608514839\")))",
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
'fn-datadec1args-3'(_Config) ->
   Qry = "fn:data((xs:decimal(\"999999999999999999\")))",
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
'fn-datadbl1args-1'(_Config) ->
   Qry = "fn:data((xs:double(\"-1.7976931348623157E308\")))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1.7976931348623157E308
      ",
   case xqerl_types:string_value(Res) of
             "-1.7976931348623157E308" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-datadbl1args-2'(_Config) ->
   Qry = "fn:data((xs:double(\"0\")))",
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
'fn-datadbl1args-3'(_Config) ->
   Qry = "fn:data((xs:double(\"1.7976931348623157E308\")))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1.7976931348623157E308
      ",
   case xqerl_types:string_value(Res) of
             "1.7976931348623157E308" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-dataflt1args-1'(_Config) ->
   Qry = "fn:data((xs:float(\"-3.4028235E38\")))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -3.4028235E38
      ",
   case xqerl_types:string_value(Res) of
             "-3.4028235E38" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-dataflt1args-2'(_Config) ->
   Qry = "fn:data((xs:float(\"0\")))",
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
'fn-dataflt1args-3'(_Config) ->
   Qry = "fn:data((xs:float(\"3.4028235E38\")))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         3.4028235E38
      ",
   case xqerl_types:string_value(Res) of
             "3.4028235E38" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-datalng1args-1'(_Config) ->
   Qry = "fn:data((xs:long(\"-92233720368547758\")))",
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
'fn-datalng1args-2'(_Config) ->
   Qry = "fn:data((xs:long(\"-47175562203048468\")))",
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
'fn-datalng1args-3'(_Config) ->
   Qry = "fn:data((xs:long(\"92233720368547758\")))",
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
'fn-datausht1args-1'(_Config) ->
   Qry = "fn:data((xs:unsignedShort(\"0\")))",
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
'fn-datausht1args-2'(_Config) ->
   Qry = "fn:data((xs:unsignedShort(\"44633\")))",
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
'fn-datausht1args-3'(_Config) ->
   Qry = "fn:data((xs:unsignedShort(\"65535\")))",
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
'fn-datanint1args-1'(_Config) ->
   Qry = "fn:data((xs:negativeInteger(\"-999999999999999999\")))",
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
'fn-datanint1args-2'(_Config) ->
   Qry = "fn:data((xs:negativeInteger(\"-297014075999096793\")))",
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
'fn-datanint1args-3'(_Config) ->
   Qry = "fn:data((xs:negativeInteger(\"-1\")))",
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
'fn-datapint1args-1'(_Config) ->
   Qry = "fn:data((xs:positiveInteger(\"1\")))",
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
'fn-datapint1args-2'(_Config) ->
   Qry = "fn:data((xs:positiveInteger(\"52704602390610033\")))",
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
'fn-datapint1args-3'(_Config) ->
   Qry = "fn:data((xs:positiveInteger(\"999999999999999999\")))",
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
'fn-dataulng1args-1'(_Config) ->
   Qry = "fn:data((xs:unsignedLong(\"0\")))",
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
'fn-dataulng1args-2'(_Config) ->
   Qry = "fn:data((xs:unsignedLong(\"130747108607674654\")))",
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
'fn-dataulng1args-3'(_Config) ->
   Qry = "fn:data((xs:unsignedLong(\"184467440737095516\")))",
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
'fn-datanpi1args-1'(_Config) ->
   Qry = "fn:data((xs:nonPositiveInteger(\"-999999999999999999\")))",
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
'fn-datanpi1args-2'(_Config) ->
   Qry = "fn:data((xs:nonPositiveInteger(\"-475688437271870490\")))",
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
'fn-datanpi1args-3'(_Config) ->
   Qry = "fn:data((xs:nonPositiveInteger(\"0\")))",
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
'fn-datanni1args-1'(_Config) ->
   Qry = "fn:data((xs:nonNegativeInteger(\"0\")))",
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
'fn-datanni1args-2'(_Config) ->
   Qry = "fn:data((xs:nonNegativeInteger(\"303884545991464527\")))",
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
'fn-datanni1args-3'(_Config) ->
   Qry = "fn:data((xs:nonNegativeInteger(\"999999999999999999\")))",
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
'fn-datasht1args-1'(_Config) ->
   Qry = "fn:data((xs:short(\"-32768\")))",
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
'fn-datasht1args-2'(_Config) ->
   Qry = "fn:data((xs:short(\"-5324\")))",
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
'fn-datasht1args-3'(_Config) ->
   Qry = "fn:data((xs:short(\"32767\")))",
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
'K-DataFunc-1'(_Config) ->
   {skip,"XP20 XQ10"}.
'K-DataFunc-2'(_Config) ->
   Qry = "data(1, \"wrong param\")",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPST0017" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPST0017'}) end.
'K-DataFunc-3'(_Config) ->
   Qry = "count(data((1, 2, 3, 4, 5))) eq 5",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-DataFunc-4'(_Config) ->
   Qry = "empty(data( () ))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-DataFunc-1'(_Config) ->
   Qry = "1!data()",
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
'K2-DataFunc-2'(_Config) ->
   Qry = "data(1, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPST0017" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPST0017'}) end.
'K2-DataFunc-3'(_Config) ->
   Qry = "
         let $x := <e><f>1</f></e>
         return $x/data()
         
      ",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
        
          1
          xs:untypedAtomic
          
      ",
 case xqerl_types:string_value(Res) == "1" andalso xqerl_types:type(Res) == 'xs:untypedAtomic' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'K2-DataFunc-4'(_Config) ->
   Qry = "
         data()
         
      ",
   Env = xqerl_test:handle_environment(environment('empty')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
        
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPDY0002" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPDY0002'}) end.
'K2-DataFunc-5'(_Config) ->
   Qry = "
         (1, data#0)[data()]
         
      ",
   Env = xqerl_test:handle_environment(environment('empty')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
        
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "FOTY0013" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'FOTY0013'}) end.
'K2-DataFunc-6'(_Config) ->
   {skip,"Validation Environment"}.
'fn-datacomplextype-1'(_Config) ->
   {skip,"Validation Environment"}.
'ST-Data001'(_Config) ->
   {skip,"Validation Environment"}.
'fn-data-1'(_Config) ->
   {skip,"schemaImport"}.
'cbcl-data-001'(_Config) ->
   Qry = "fn:data(fn:error()) instance of xs:integer",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) orelse (is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "FOER0000") of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'cbcl-data-002'(_Config) ->
   {skip,"Validation Environment"}.
'cbcl-data-003'(_Config) ->
   {skip,"Validation Environment"}.
'cbcl-data-004'(_Config) ->
   {skip,"Validation Environment"}.
'cbcl-data-005'(_Config) ->
   {skip,"Validation Environment"}.
'cbcl-data-006'(_Config) ->
   {skip,"Validation Environment"}.
'cbcl-data-007'(_Config) ->
   {skip,"Validation Environment"}.
