-module('op_gYear_equal_SUITE').
-include_lib("common_test/include/ct.hrl").
-compile({nowarn_unused_function,[environment/2]}).
-export([all/0,
         suite/0]).
-export([init_per_suite/1,
         end_per_suite/1]).
-export(['op-gYear-equal2args-1'/1]).
-export(['op-gYear-equal2args-2'/1]).
-export(['op-gYear-equal2args-3'/1]).
-export(['op-gYear-equal2args-4'/1]).
-export(['op-gYear-equal2args-5'/1]).
-export(['op-gYear-equal2args-6'/1]).
-export(['op-gYear-equal2args-7'/1]).
-export(['op-gYear-equal2args-8'/1]).
-export(['op-gYear-equal2args-9'/1]).
-export(['op-gYear-equal2args-10'/1]).
-export(['op-gYear-equal-1'/1]).
-export(['op-gYear-equal-2'/1]).
-export(['op-gYear-equalNew-3'/1]).
-export(['op-gYear-equalNew-4'/1]).
-export(['op-gYear-equal-5'/1]).
-export(['op-gYear-equalNew-6'/1]).
-export(['op-gYear-equalNew-7'/1]).
-export(['op-gYear-equal-8'/1]).
-export(['op-gYear-equalNew-9'/1]).
-export(['op-gYear-equal-10'/1]).
-export(['op-gYear-equal-11'/1]).
-export(['op-gYear-equalNew-12'/1]).
-export(['op-gYear-equal-13'/1]).
-export(['op-gYear-equal-14'/1]).
-export(['K-gYearEQ-1'/1]).
-export(['K-gYearEQ-2'/1]).
-export(['K-gYearEQ-3'/1]).
-export(['K-gYearEQ-4'/1]).
-export(['K-gYearEQ-5'/1]).
-export(['K-gYearEQ-6'/1]).
-export(['K-gYearEQ-7'/1]).
-export(['K-gYearEQ-8'/1]).
-export(['cbcl-gYear-equal-001'/1]).
-export(['cbcl-gYear-equal-002'/1]).
-export(['cbcl-gYear-equal-003'/1]).
-export(['cbcl-gYear-equal-004'/1]).
-export(['cbcl-gYear-equal-005'/1]).
-export(['cbcl-gYear-equal-006'/1]).
-export(['cbcl-gYear-equal-007'/1]).
-export(['cbcl-gYear-equal-008'/1]).
-export(['cbcl-gYear-equal-009'/1]).
-export(['cbcl-gYear-equal-010'/1]).
-export(['cbcl-gYear-equal-011'/1]).
-export(['cbcl-gYear-equal-012'/1]).
-export(['cbcl-gYear-equal-013'/1]).
-export(['cbcl-gYear-equal-014'/1]).
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
   __BaseDir = filename:join(TD, "op"),
   [{base_dir, __BaseDir}|Config].
all() -> [
'op-gYear-equal2args-1', 
'op-gYear-equal2args-2', 
'op-gYear-equal2args-3', 
'op-gYear-equal2args-4', 
'op-gYear-equal2args-5', 
'op-gYear-equal2args-6', 
'op-gYear-equal2args-7', 
'op-gYear-equal2args-8', 
'op-gYear-equal2args-9', 
'op-gYear-equal2args-10', 
'op-gYear-equal-1', 
'op-gYear-equal-2', 
'op-gYear-equalNew-3', 
'op-gYear-equalNew-4', 
'op-gYear-equal-5', 
'op-gYear-equalNew-6', 
'op-gYear-equalNew-7', 
'op-gYear-equal-8', 
'op-gYear-equalNew-9', 
'op-gYear-equal-10', 
'op-gYear-equal-11', 
'op-gYear-equalNew-12', 
'op-gYear-equal-13', 
'op-gYear-equal-14', 
'K-gYearEQ-1', 
'K-gYearEQ-2', 
'K-gYearEQ-3', 
'K-gYearEQ-4', 
'K-gYearEQ-5', 
'K-gYearEQ-6', 
'K-gYearEQ-7', 
'K-gYearEQ-8', 
'cbcl-gYear-equal-001', 
'cbcl-gYear-equal-002', 
'cbcl-gYear-equal-003', 
'cbcl-gYear-equal-004', 
'cbcl-gYear-equal-005', 
'cbcl-gYear-equal-006', 
'cbcl-gYear-equal-007', 
'cbcl-gYear-equal-008', 
'cbcl-gYear-equal-009', 
'cbcl-gYear-equal-010', 
'cbcl-gYear-equal-011', 
'cbcl-gYear-equal-012', 
'cbcl-gYear-equal-013', 
'cbcl-gYear-equal-014'
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
].
'op-gYear-equal2args-1'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1970Z\") eq xs:gYear(\"1970Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-2'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"2012Z\") eq xs:gYear(\"1970Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-3'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"2030Z\") eq xs:gYear(\"1970Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-4'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1970Z\") eq xs:gYear(\"2012Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-5'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1970Z\") eq xs:gYear(\"2030Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-5.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-6'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1970Z\") ne xs:gYear(\"1970Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-6.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-7'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"2012Z\") ne xs:gYear(\"1970Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-7.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-8'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"2030Z\") ne xs:gYear(\"1970Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-8.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-9'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1970Z\") ne xs:gYear(\"2012Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-9.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal2args-10'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1970Z\") ne xs:gYear(\"2030Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal2args-10.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-1'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"2005-12:00\") eq xs:gYear(\"2005+12:00\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-2'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"1976-05:00\") eq xs:gYear(\"1976-05:00\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equalNew-3'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:not((xs:gYear(\"1995Z\") eq xs:gYear(\"1995Z\")))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equalNew-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equalNew-4'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:not(xs:gYear(\"2005Z\") ne xs:gYear(\"2006Z\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equalNew-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-5'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:not(xs:gYear(\"2000Z\") eq xs:gYear(\"2001Z\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-5.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equalNew-6'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:not(xs:gYear(\"2005Z\") ne xs:gYear(\"2005Z\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equalNew-6.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equalNew-7'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"2000Z\") eq xs:gYear(\"2000Z\")) and (xs:gYear(\"2001Z\") eq xs:gYear(\"2001Z\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equalNew-7.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-8'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"2000Z\") ne xs:gYear(\"2000Z\")) and (xs:gYear(\"1975Z\") ne xs:gYear(\"1975Z\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-8.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equalNew-9'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"2000Z\") eq xs:gYear(\"2000Z\")) or (xs:gYear(\"1976Z\") eq xs:gYear(\"1976Z\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equalNew-9.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-10'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"1976Z\") ne xs:gYear(\"1976Z\")) or (xs:gYear(\"1980Z\") ne xs:gYear(\"1980Z\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-10.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-11'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"1980Z\") eq xs:gYear(\"1980Z\")) or (fn:true())", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-11.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equalNew-12'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"2000Z\") ne xs:gYear(\"2000Z\")) or (fn:true())", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equalNew-12.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-13'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"1980Z\") eq xs:gYear(\"1980Z\")) or (fn:false())", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-13.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'op-gYear-equal-14'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(xs:gYear(\"1980Z\") ne xs:gYear(\"1980Z\")) or (fn:false())", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "op-gYear-equal-14.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-1'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\" 1956 \") eq xs:gYear(\"1956\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-2'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "not(xs:gYear(\"1956\") eq xs:gYear(\"1958\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-3'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1956\") ne xs:gYear(\"1958\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-4'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "not(xs:gYear(\"1956\") ne xs:gYear(\"1956\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-4.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-5'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1956-00:00\") eq xs:gYear(\"1956Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-5.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-6'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1956+00:00\") eq xs:gYear(\"1956Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-6.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-7'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1956Z\") eq xs:gYear(\"1956Z\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-7.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K-gYearEQ-8'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xs:gYear(\"1956-00:00\") eq xs:gYear(\"1956+00:00\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K-gYearEQ-8.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-001'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "declare function local:gYear($year as xs:integer) { xs:gYear(string(2000 + $year)) }; not(local:gYear(7) eq xs:gYear(\"2008\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-001.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-002'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('PT9M'))
            then xs:gYear(\"2008\") eq xs:gYear(\"2008+09:01\")
            else xs:gYear(\"2008\") eq xs:gYear(\"2008+09:00\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-002.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-003'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('PT9M'))
            then xs:gYear(\"2008+09:01\") eq xs:gYear(\"2008\")
            else xs:gYear(\"2008+09:00\") eq xs:gYear(\"2008\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-003.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-004'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('-PT9M'))
            then xs:gYear(\"2008\") eq xs:gYear(\"2008-09:01\")
            else xs:gYear(\"2008\") eq xs:gYear(\"2008-09:00\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-004.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-005'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('-PT9M'))
            then xs:gYear(\"2008-09:01\") eq xs:gYear(\"2008\")
            else xs:gYear(\"2008-09:00\") eq xs:gYear(\"2008\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-005.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-006'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "declare function local:gYear($year as xs:integer) { xs:gYear(string(2000 + $year)) }; not(local:gYear(7) ne xs:gYear(\"2008\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-006.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-007'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('PT9M'))
            then xs:gYear(\"2008\") ne xs:gYear(\"2008+09:01\")
            else xs:gYear(\"2008\") ne xs:gYear(\"2008+09:00\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-007.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-008'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('PT9M'))
            then xs:gYear(\"2008+09:01\") ne xs:gYear(\"2008\")
            else xs:gYear(\"2008+09:00\") ne xs:gYear(\"2008\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-008.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-009'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('-PT9M'))
            then xs:gYear(\"2008\") ne xs:gYear(\"2008-09:01\")
            else xs:gYear(\"2008\") ne xs:gYear(\"2008-09:00\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-009.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-010'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "if (implicit-timezone() eq xs:dayTimeDuration('-PT9M'))
            then xs:gYear(\"2008-09:01\") ne xs:gYear(\"2008\")
            else xs:gYear(\"2008-09:00\") ne xs:gYear(\"2008\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-010.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-011'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "declare function local:gYear($gYear as xs:gYear, $null as xs:boolean) { if ($null) then () else $gYear }; exists(local:gYear(xs:gYear(\"1972\"), fn:true()) eq xs:gYear(\"1972\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-011.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-012'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "declare function local:gYear($gYear as xs:gYear, $null as xs:boolean) { if ($null) then () else $gYear }; local:gYear(xs:gYear(\"1972\"), fn:false()) ne xs:gYear(\"1972\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-012.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-013'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "declare function local:gYear($gYear as xs:gYear, $null as xs:boolean) { if ($null) then () else $gYear }; exists(local:gYear(xs:gYear(\"1972\"), fn:true()) ne xs:gYear(\"1972\"))", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-013.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-gYear-equal-014'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "declare function local:gYear($gYear as xs:gYear, $null as xs:boolean) { if ($null) then () else $gYear }; local:gYear(xs:gYear(\"1972\"), fn:false()) ne xs:gYear(\"1972\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-gYear-equal-014.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.