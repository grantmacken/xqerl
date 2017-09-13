-module('fn_serialize_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['serialize-xml-001'/1]).
-export(['serialize-xml-002'/1]).
-export(['serialize-xml-003'/1]).
-export(['serialize-xml-004'/1]).
-export(['serialize-xml-005'/1]).
-export(['serialize-xml-006'/1]).
-export(['serialize-xml-007'/1]).
-export(['serialize-xml-007a'/1]).
-export(['serialize-xml-008'/1]).
-export(['serialize-xml-009'/1]).
-export(['serialize-xml-010'/1]).
-export(['serialize-xml-011'/1]).
-export(['serialize-xml-012'/1]).
-export(['serialize-xml-013'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> erlang:erase().
init_per_suite(Config) -> ok
,Config.
all() -> [
   'serialize-xml-001',
   'serialize-xml-002',
   'serialize-xml-003',
   'serialize-xml-004',
   'serialize-xml-005',
   'serialize-xml-006',
   'serialize-xml-007',
   'serialize-xml-007a',
   'serialize-xml-008',
   'serialize-xml-009',
   'serialize-xml-010',
   'serialize-xml-011',
   'serialize-xml-012',
   'serialize-xml-013'].
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
'serialize-xml-001'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-002'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-003'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-004'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-005'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-006'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-007'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-007a'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-008'(_Config) ->
   Qry = "
          let $params := 
              <output:serialization-parameters
                   xmlns:output=\"http://www.w3.org/2010/xslt-xquery-serialization\">
                <output:method value=\"xml\"/>   
                <output:indent value=\"yes\"/>
                <output:suppress-indentation value=\"p\"/>
              </output:serialization-parameters>
          return serialize(., $params)
        ",
   Env = xqerl_test:handle_environment(environment('')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
            
                matches($result,'\\n\\s+<title>')
                matches($result,'\\n\\s+<p>')
                not(matches($result,'\\n\\s+<code>'))
            
        ",
 case    (xqerl_seq2:singleton_value(xqerl:run("declare variable $result external;"++"matches($result,'\\n\\s+<title>')",Options)) == {xqAtomicValue,'xs:boolean',true}) andalso    (xqerl_seq2:singleton_value(xqerl:run("declare variable $result external;"++"matches($result,'\\n\\s+<p>')",Options)) == {xqAtomicValue,'xs:boolean',true}) andalso    (xqerl_seq2:singleton_value(xqerl:run("declare variable $result external;"++"not(matches($result,'\\n\\s+<code>'))",Options)) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'serialize-xml-009'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-010'(_Config) ->
   Qry = "serialize(name#1)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
            
        ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "SENR0001" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'SENR0001'}) end.
'serialize-xml-011'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-012'(_Config) ->
   {skip,"Validation Environment"}.
'serialize-xml-013'(_Config) ->
   {skip,"Validation Environment"}.
