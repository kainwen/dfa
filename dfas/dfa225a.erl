-module(dfa225a).

-include_lib("eunit/include/eunit.hrl").

-behaviour(gen_statem).

-export([start/0, stop/0, input/1, get_state/0, is_accept/1, input_string/1]).

-export([terminate/3, code_change/4, init/1, callback_mode/0]).

-export([state_1/3,state_2/3,state_3/3,state_4/3,state_5/3,state_6/3,state_7/3,state_8/3,state_9/3,state_10/3,state_11/3,state_12/3,state_13/3,state_14/3,state_15/3,state_16/3,state_17/3,state_18/3,state_19/3,state_20/3,state_21/3,state_22/3,state_23/3,state_24/3,state_25/3,state_26/3,state_27/3,state_28/3,state_29/3,state_30/3,state_31/3,state_32/3,state_33/3,state_34/3,state_35/3,state_36/3,state_37/3,state_38/3,state_39/3,state_40/3,state_41/3,state_42/3,state_43/3,state_44/3,state_45/3,state_46/3,state_47/3,state_48/3,state_49/3,state_50/3,state_51/3,state_52/3,state_53/3,state_54/3,state_55/3,state_56/3,state_57/3,state_58/3,state_59/3,state_60/3,state_61/3,state_62/3,state_63/3]).

-define(SERVER, ?MODULE).

%%%%%%%%%%%%%%%%%%%%%%%%% APIs %%%%%%%%%%%%%%%%%%%%%%%%%%%
is_accept(State) ->
    Ac_set = sets:from_list([state_32,state_33,state_34,state_35,state_36,state_37,state_38,state_39,state_40,state_41,state_42,state_43,state_44,state_45,state_46,state_48,state_49,state_50,state_51,state_52,state_53,state_54,state_56,state_57,state_58,state_60]),
    sets:is_element(State, Ac_set).

start() ->
    gen_statem:start({local, ?SERVER}, ?MODULE, [], []).

stop() ->
    gen_statem:stop(?SERVER).

get_state() ->
    get_current_state().

input(C) ->
    gen_statem:call(?SERVER, C).

input_string([]) -> ok;
input_string([C|String]) ->
    input(C),
    input_string(String).

%%%%%%%%%%%%%%%%%%%%%%% Callbacks %%%%%%%%%%%%%%%%%%%%%%%%

terminate(_Reason, _State, _Data) ->
    void.

code_change(_Vsn, State, Data, _Extra) ->
    {ok, State, Data}.

init([]) ->
    State = state_1,
    {ok, State, []}.

callback_mode() -> state_functions.

%%%%%%%%%%%%%%%%%%%%%% state callbacks %%%%%%%%%%%%%%%%%%%%%

state_1({call, From}, 0, Data) ->
    {next_state, state_2, Data, [{reply, From, ok}]};
state_1({call, From}, 1, Data) ->
    {next_state, state_3, Data, [{reply, From, ok}]}.


state_2({call, From}, 0, Data) ->
    {next_state, state_4, Data, [{reply, From, ok}]};
state_2({call, From}, 1, Data) ->
    {next_state, state_5, Data, [{reply, From, ok}]}.


state_3({call, From}, 0, Data) ->
    {next_state, state_6, Data, [{reply, From, ok}]};
state_3({call, From}, 1, Data) ->
    {next_state, state_7, Data, [{reply, From, ok}]}.


state_4({call, From}, 0, Data) ->
    {next_state, state_8, Data, [{reply, From, ok}]};
state_4({call, From}, 1, Data) ->
    {next_state, state_9, Data, [{reply, From, ok}]}.


state_5({call, From}, 0, Data) ->
    {next_state, state_10, Data, [{reply, From, ok}]};
state_5({call, From}, 1, Data) ->
    {next_state, state_11, Data, [{reply, From, ok}]}.


state_6({call, From}, 0, Data) ->
    {next_state, state_12, Data, [{reply, From, ok}]};
state_6({call, From}, 1, Data) ->
    {next_state, state_13, Data, [{reply, From, ok}]}.


state_7({call, From}, 0, Data) ->
    {next_state, state_14, Data, [{reply, From, ok}]};
state_7({call, From}, 1, Data) ->
    {next_state, state_15, Data, [{reply, From, ok}]}.


state_8({call, From}, 0, Data) ->
    {next_state, state_16, Data, [{reply, From, ok}]};
state_8({call, From}, 1, Data) ->
    {next_state, state_17, Data, [{reply, From, ok}]}.


state_9({call, From}, 0, Data) ->
    {next_state, state_18, Data, [{reply, From, ok}]};
state_9({call, From}, 1, Data) ->
    {next_state, state_19, Data, [{reply, From, ok}]}.


state_10({call, From}, 0, Data) ->
    {next_state, state_20, Data, [{reply, From, ok}]};
state_10({call, From}, 1, Data) ->
    {next_state, state_21, Data, [{reply, From, ok}]}.


state_11({call, From}, 0, Data) ->
    {next_state, state_22, Data, [{reply, From, ok}]};
state_11({call, From}, 1, Data) ->
    {next_state, state_23, Data, [{reply, From, ok}]}.


state_12({call, From}, 0, Data) ->
    {next_state, state_24, Data, [{reply, From, ok}]};
state_12({call, From}, 1, Data) ->
    {next_state, state_25, Data, [{reply, From, ok}]}.


state_13({call, From}, 0, Data) ->
    {next_state, state_26, Data, [{reply, From, ok}]};
state_13({call, From}, 1, Data) ->
    {next_state, state_27, Data, [{reply, From, ok}]}.


state_14({call, From}, 0, Data) ->
    {next_state, state_28, Data, [{reply, From, ok}]};
state_14({call, From}, 1, Data) ->
    {next_state, state_29, Data, [{reply, From, ok}]}.


state_15({call, From}, 0, Data) ->
    {next_state, state_30, Data, [{reply, From, ok}]};
state_15({call, From}, 1, Data) ->
    {next_state, state_31, Data, [{reply, From, ok}]}.


state_16({call, From}, 0, Data) ->
    {next_state, state_32, Data, [{reply, From, ok}]};
state_16({call, From}, 1, Data) ->
    {next_state, state_33, Data, [{reply, From, ok}]}.


state_17({call, From}, 0, Data) ->
    {next_state, state_34, Data, [{reply, From, ok}]};
state_17({call, From}, 1, Data) ->
    {next_state, state_35, Data, [{reply, From, ok}]}.


state_18({call, From}, 0, Data) ->
    {next_state, state_36, Data, [{reply, From, ok}]};
state_18({call, From}, 1, Data) ->
    {next_state, state_37, Data, [{reply, From, ok}]}.


state_19({call, From}, 0, Data) ->
    {next_state, state_38, Data, [{reply, From, ok}]};
state_19({call, From}, 1, Data) ->
    {next_state, state_39, Data, [{reply, From, ok}]}.


state_20({call, From}, 0, Data) ->
    {next_state, state_40, Data, [{reply, From, ok}]};
state_20({call, From}, 1, Data) ->
    {next_state, state_41, Data, [{reply, From, ok}]}.


state_21({call, From}, 0, Data) ->
    {next_state, state_42, Data, [{reply, From, ok}]};
state_21({call, From}, 1, Data) ->
    {next_state, state_43, Data, [{reply, From, ok}]}.


state_22({call, From}, 0, Data) ->
    {next_state, state_44, Data, [{reply, From, ok}]};
state_22({call, From}, 1, Data) ->
    {next_state, state_45, Data, [{reply, From, ok}]}.


state_23({call, From}, 0, Data) ->
    {next_state, state_46, Data, [{reply, From, ok}]};
state_23({call, From}, 1, Data) ->
    {next_state, state_47, Data, [{reply, From, ok}]}.


state_24({call, From}, 0, Data) ->
    {next_state, state_48, Data, [{reply, From, ok}]};
state_24({call, From}, 1, Data) ->
    {next_state, state_49, Data, [{reply, From, ok}]}.


state_25({call, From}, 0, Data) ->
    {next_state, state_50, Data, [{reply, From, ok}]};
state_25({call, From}, 1, Data) ->
    {next_state, state_51, Data, [{reply, From, ok}]}.


state_26({call, From}, 0, Data) ->
    {next_state, state_52, Data, [{reply, From, ok}]};
state_26({call, From}, 1, Data) ->
    {next_state, state_53, Data, [{reply, From, ok}]}.


state_27({call, From}, 0, Data) ->
    {next_state, state_54, Data, [{reply, From, ok}]};
state_27({call, From}, 1, Data) ->
    {next_state, state_55, Data, [{reply, From, ok}]}.


state_28({call, From}, 0, Data) ->
    {next_state, state_56, Data, [{reply, From, ok}]};
state_28({call, From}, 1, Data) ->
    {next_state, state_57, Data, [{reply, From, ok}]}.


state_29({call, From}, 0, Data) ->
    {next_state, state_58, Data, [{reply, From, ok}]};
state_29({call, From}, 1, Data) ->
    {next_state, state_59, Data, [{reply, From, ok}]}.


state_30({call, From}, 0, Data) ->
    {next_state, state_60, Data, [{reply, From, ok}]};
state_30({call, From}, 1, Data) ->
    {next_state, state_61, Data, [{reply, From, ok}]}.


state_31({call, From}, 0, Data) ->
    {next_state, state_62, Data, [{reply, From, ok}]};
state_31({call, From}, 1, Data) ->
    {next_state, state_63, Data, [{reply, From, ok}]}.


state_32({call, From}, 0, Data) ->
    {next_state, state_32, Data, [{reply, From, ok}]};
state_32({call, From}, 1, Data) ->
    {next_state, state_33, Data, [{reply, From, ok}]}.


state_33({call, From}, 0, Data) ->
    {next_state, state_34, Data, [{reply, From, ok}]};
state_33({call, From}, 1, Data) ->
    {next_state, state_35, Data, [{reply, From, ok}]}.


state_34({call, From}, 0, Data) ->
    {next_state, state_36, Data, [{reply, From, ok}]};
state_34({call, From}, 1, Data) ->
    {next_state, state_37, Data, [{reply, From, ok}]}.


state_35({call, From}, 0, Data) ->
    {next_state, state_38, Data, [{reply, From, ok}]};
state_35({call, From}, 1, Data) ->
    {next_state, state_39, Data, [{reply, From, ok}]}.


state_36({call, From}, 0, Data) ->
    {next_state, state_40, Data, [{reply, From, ok}]};
state_36({call, From}, 1, Data) ->
    {next_state, state_41, Data, [{reply, From, ok}]}.


state_37({call, From}, 0, Data) ->
    {next_state, state_42, Data, [{reply, From, ok}]};
state_37({call, From}, 1, Data) ->
    {next_state, state_43, Data, [{reply, From, ok}]}.


state_38({call, From}, 0, Data) ->
    {next_state, state_44, Data, [{reply, From, ok}]};
state_38({call, From}, 1, Data) ->
    {next_state, state_45, Data, [{reply, From, ok}]}.


state_39({call, From}, 0, Data) ->
    {next_state, state_46, Data, [{reply, From, ok}]};
state_39({call, From}, 1, Data) ->
    {next_state, state_47, Data, [{reply, From, ok}]}.


state_40({call, From}, 0, Data) ->
    {next_state, state_48, Data, [{reply, From, ok}]};
state_40({call, From}, 1, Data) ->
    {next_state, state_49, Data, [{reply, From, ok}]}.


state_41({call, From}, 0, Data) ->
    {next_state, state_50, Data, [{reply, From, ok}]};
state_41({call, From}, 1, Data) ->
    {next_state, state_51, Data, [{reply, From, ok}]}.


state_42({call, From}, 0, Data) ->
    {next_state, state_52, Data, [{reply, From, ok}]};
state_42({call, From}, 1, Data) ->
    {next_state, state_53, Data, [{reply, From, ok}]}.


state_43({call, From}, 0, Data) ->
    {next_state, state_54, Data, [{reply, From, ok}]};
state_43({call, From}, 1, Data) ->
    {next_state, state_55, Data, [{reply, From, ok}]}.


state_44({call, From}, 0, Data) ->
    {next_state, state_56, Data, [{reply, From, ok}]};
state_44({call, From}, 1, Data) ->
    {next_state, state_57, Data, [{reply, From, ok}]}.


state_45({call, From}, 0, Data) ->
    {next_state, state_58, Data, [{reply, From, ok}]};
state_45({call, From}, 1, Data) ->
    {next_state, state_59, Data, [{reply, From, ok}]}.


state_46({call, From}, 0, Data) ->
    {next_state, state_60, Data, [{reply, From, ok}]};
state_46({call, From}, 1, Data) ->
    {next_state, state_61, Data, [{reply, From, ok}]}.


state_47({call, From}, 0, Data) ->
    {next_state, state_47, Data, [{reply, From, ok}]};
state_47({call, From}, 1, Data) ->
    {next_state, state_47, Data, [{reply, From, ok}]}.


state_48({call, From}, 0, Data) ->
    {next_state, state_32, Data, [{reply, From, ok}]};
state_48({call, From}, 1, Data) ->
    {next_state, state_33, Data, [{reply, From, ok}]}.


state_49({call, From}, 0, Data) ->
    {next_state, state_34, Data, [{reply, From, ok}]};
state_49({call, From}, 1, Data) ->
    {next_state, state_35, Data, [{reply, From, ok}]}.


state_50({call, From}, 0, Data) ->
    {next_state, state_36, Data, [{reply, From, ok}]};
state_50({call, From}, 1, Data) ->
    {next_state, state_37, Data, [{reply, From, ok}]}.


state_51({call, From}, 0, Data) ->
    {next_state, state_38, Data, [{reply, From, ok}]};
state_51({call, From}, 1, Data) ->
    {next_state, state_39, Data, [{reply, From, ok}]}.


state_52({call, From}, 0, Data) ->
    {next_state, state_40, Data, [{reply, From, ok}]};
state_52({call, From}, 1, Data) ->
    {next_state, state_41, Data, [{reply, From, ok}]}.


state_53({call, From}, 0, Data) ->
    {next_state, state_42, Data, [{reply, From, ok}]};
state_53({call, From}, 1, Data) ->
    {next_state, state_43, Data, [{reply, From, ok}]}.


state_54({call, From}, 0, Data) ->
    {next_state, state_44, Data, [{reply, From, ok}]};
state_54({call, From}, 1, Data) ->
    {next_state, state_45, Data, [{reply, From, ok}]}.


state_55({call, From}, 0, Data) ->
    {next_state, state_55, Data, [{reply, From, ok}]};
state_55({call, From}, 1, Data) ->
    {next_state, state_55, Data, [{reply, From, ok}]}.


state_56({call, From}, 0, Data) ->
    {next_state, state_48, Data, [{reply, From, ok}]};
state_56({call, From}, 1, Data) ->
    {next_state, state_49, Data, [{reply, From, ok}]}.


state_57({call, From}, 0, Data) ->
    {next_state, state_50, Data, [{reply, From, ok}]};
state_57({call, From}, 1, Data) ->
    {next_state, state_51, Data, [{reply, From, ok}]}.


state_58({call, From}, 0, Data) ->
    {next_state, state_52, Data, [{reply, From, ok}]};
state_58({call, From}, 1, Data) ->
    {next_state, state_53, Data, [{reply, From, ok}]}.


state_59({call, From}, 0, Data) ->
    {next_state, state_59, Data, [{reply, From, ok}]};
state_59({call, From}, 1, Data) ->
    {next_state, state_59, Data, [{reply, From, ok}]}.


state_60({call, From}, 0, Data) ->
    {next_state, state_56, Data, [{reply, From, ok}]};
state_60({call, From}, 1, Data) ->
    {next_state, state_57, Data, [{reply, From, ok}]}.


state_61({call, From}, 0, Data) ->
    {next_state, state_61, Data, [{reply, From, ok}]};
state_61({call, From}, 1, Data) ->
    {next_state, state_61, Data, [{reply, From, ok}]}.


state_62({call, From}, 0, Data) ->
    {next_state, state_62, Data, [{reply, From, ok}]};
state_62({call, From}, 1, Data) ->
    {next_state, state_62, Data, [{reply, From, ok}]}.


state_63({call, From}, 0, Data) ->
    {next_state, state_63, Data, [{reply, From, ok}]};
state_63({call, From}, 1, Data) ->
    {next_state, state_63, Data, [{reply, From, ok}]}.




%%%%%%%%%%%%%%%%%%%%% Internal Helpers %%%%%%%%%%%%%%%%%%%%%
get_current_state() ->
    St = sys:get_status(?SERVER),
    {_, {State, _}} = lists:nth(1,
    		                element(2,
				        lists:nth(3,
					          lists:nth(5,
						            element(4,
							            St))))),
    State.

loop([]) -> true;
loop([{Input_string, Result}|Pairs]) ->
    start(),
    ok = input_string(Input_string),
    State = get_state(),
    stop(),
    case is_accept(State) of
	Result ->
	    loop(Pairs);
	_ ->
	    io:format("~p~n", [{Input_string, Result}]),
	    false
    end.

gen_test_input(0) -> [[]];
gen_test_input(L) when L > 0 ->
    {List1, List2} = lists:unzip([{[0|Input_string],
			     [1|Input_string]}
			    || Input_string <- gen_test_input(L-1)]),
    List1 ++ List2.

every_5_block(L) when length(L) < 5 -> false;
every_5_block(L) when length(L) =:= 5->
    length([B || B <- L, B =:= 0]) >= 2;
every_5_block(L=[_|Tl]) ->
    every_5_block(lists:sublist(L, 5)) andalso every_5_block(Tl).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%Unit Test%%%%%%%%%%%%%%%%%%%%%%%%%
dfa_test() ->
    Test_inputs = lists:foldl(fun (E, Acc) -> E ++ Acc end, [], [gen_test_input(L) || L <- lists:seq(0, 11)]),
    Test_results = [every_5_block(Ti) || Ti <- Test_inputs],
    Test_pairs = lists:zip(Test_inputs, Test_results),
    ?assert(loop(Test_pairs)).
