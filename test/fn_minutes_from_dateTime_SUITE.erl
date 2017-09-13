-module('fn_minutes_from_dateTime_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['fn-minutes-from-dateTime1args-1'/1]).
-export(['fn-minutes-from-dateTime1args-2'/1]).
-export(['fn-minutes-from-dateTime1args-3'/1]).
-export(['fn-minutes-from-dateTime-1'/1]).
-export(['fn-minutes-from-dateTime-2'/1]).
-export(['fn-minutes-from-dateTime-3'/1]).
-export(['fn-minutes-from-dateTime-4'/1]).
-export(['fn-minutes-from-dateTime-5'/1]).
-export(['fn-minutes-from-dateTime-6'/1]).
-export(['fn-minutes-from-dateTime-7'/1]).
-export(['fn-minutes-from-dateTime-8'/1]).
-export(['fn-minutes-from-dateTime-9'/1]).
-export(['fn-minutes-from-dateTime-10'/1]).
-export(['fn-minutes-from-dateTime-11'/1]).
-export(['fn-minutes-from-dateTime-12'/1]).
-export(['fn-minutes-from-dateTime-13'/1]).
-export(['fn-minutes-from-dateTime-14'/1]).
-export(['fn-minutes-from-dateTime-15'/1]).
-export(['fn-minutes-from-dateTime-16'/1]).
-export(['fn-minutes-from-dateTime-17'/1]).
-export(['fn-minutes-from-dateTime-18'/1]).
-export(['fn-minutes-from-dateTime-19'/1]).
-export(['K-MinutesFromDateTimeFunc-1'/1]).
-export(['K-MinutesFromDateTimeFunc-2'/1]).
-export(['K-MinutesFromDateTimeFunc-3'/1]).
-export(['K-MinutesFromDateTimeFunc-4'/1]).
-export(['K-MinutesFromDateTimeFunc-5'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> erlang:erase().
init_per_suite(Config) -> ok
,Config.
all() -> [
   'fn-minutes-from-dateTime1args-1',
   'fn-minutes-from-dateTime1args-2',
   'fn-minutes-from-dateTime1args-3',
   'fn-minutes-from-dateTime-1',
   'fn-minutes-from-dateTime-2',
   'fn-minutes-from-dateTime-3',
   'fn-minutes-from-dateTime-4',
   'fn-minutes-from-dateTime-5',
   'fn-minutes-from-dateTime-6',
   'fn-minutes-from-dateTime-7',
   'fn-minutes-from-dateTime-8',
   'fn-minutes-from-dateTime-9',
   'fn-minutes-from-dateTime-10',
   'fn-minutes-from-dateTime-11',
   'fn-minutes-from-dateTime-12',
   'fn-minutes-from-dateTime-13',
   'fn-minutes-from-dateTime-14',
   'fn-minutes-from-dateTime-15',
   'fn-minutes-from-dateTime-16',
   'fn-minutes-from-dateTime-17',
   'fn-minutes-from-dateTime-18',
   'fn-minutes-from-dateTime-19',
   'K-MinutesFromDateTimeFunc-1',
   'K-MinutesFromDateTimeFunc-2',
   'K-MinutesFromDateTimeFunc-3',
   'K-MinutesFromDateTimeFunc-4',
   'K-MinutesFromDateTimeFunc-5'].
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
'fn-minutes-from-dateTime1args-1'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T00:00:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_types:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime1args-2'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1996-04-07T01:40:52Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         40
      ",
   case xqerl_types:string_value(Res) of
             "40" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime1args-3'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"2030-12-31T23:59:59Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         59
      ",
   case xqerl_types:string_value(Res) of
             "59" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-1'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1999-05-31T13:20:00-05:00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         20
      ",
   case xqerl_types:string_value(Res) of
             "20" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-2'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1999-05-31T13:30:00+05:30\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         30
      ",
   case xqerl_types:string_value(Res) of
             "30" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-3'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1999-12-31T21:20:00-05:00\")) lt fn:minutes-from-dateTime(xs:dateTime(\"1999-12-31T21:20:00-05:00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',false} -> {comment, "assert-false"};
           _ -> ct:fail({Res,Exp}) end.
'fn-minutes-from-dateTime-4'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1999-12-31T21:20:00-05:00\")) le fn:minutes-from-dateTime(xs:dateTime(\"1999-12-31T21:20:00-05:00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'fn-minutes-from-dateTime-5'(_Config) ->
   Qry = "fn:count(fn:minutes-from-dateTime(()))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_types:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-6'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1999-05-31T20:00:00-05:00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_types:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-7'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1999-05-31T23:59:00-05:00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         59
      ",
   case xqerl_types:string_value(Res) of
             "59" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-8'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T00:00:00Z\")) + fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:00:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_types:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-9'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T00:00:00Z\")) - fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:00:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_types:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-10'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T02:02:00Z\")) * fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:03:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         6
      ",
   case xqerl_types:string_value(Res) of
             "6" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-11'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T02:10:00Z\")) div fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:05:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         2
      ",
   case xqerl_types:string_value(Res) of
             "2" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-12'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\")) idiv fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T02:05:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         2
      ",
   case xqerl_types:string_value(Res) of
             "2" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-13'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\")) mod fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T03:10:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_types:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-14'(_Config) ->
   Qry = "+fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         10
      ",
   case xqerl_types:string_value(Res) of
             "10" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-15'(_Config) ->
   Qry = "-fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -10
      ",
   case xqerl_types:string_value(Res) of
             "-10" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_types:string_value(Res),Exp}) end.
'fn-minutes-from-dateTime-16'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\")) eq fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'fn-minutes-from-dateTime-17'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\")) ne fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',false} -> {comment, "assert-false"};
           _ -> ct:fail({Res,Exp}) end.
'fn-minutes-from-dateTime-18'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\")) le fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'fn-minutes-from-dateTime-19'(_Config) ->
   Qry = "fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\")) ge fn:minutes-from-dateTime(xs:dateTime(\"1970-01-01T10:10:00Z\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-MinutesFromDateTimeFunc-1'(_Config) ->
   Qry = "minutes-from-dateTime()",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPST0017" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPST0017'}) end.
'K-MinutesFromDateTimeFunc-2'(_Config) ->
   Qry = "minutes-from-dateTime((), \"Wrong param\")",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPST0017" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPST0017'}) end.
'K-MinutesFromDateTimeFunc-3'(_Config) ->
   Qry = "empty(minutes-from-dateTime(()))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-MinutesFromDateTimeFunc-4'(_Config) ->
   Qry = "minutes-from-dateTime(()) instance of xs:integer?",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-MinutesFromDateTimeFunc-5'(_Config) ->
   Qry = "minutes-from-dateTime(xs:dateTime(\"2001-02-03T08:23:12.43\")) eq 23",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
