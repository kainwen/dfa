-module(dfa224a).

-include_lib("eunit/include/eunit.hrl").

-behaviour(gen_statem).

-export([start/0, stop/0, input/1, get_state/0, is_accept/1, input_string/1]).

-export([terminate/3, code_change/4, init/1, callback_mode/0]).

-export([state_A/3,state_B/3,state_C/3]).

-define(SERVER, ?MODULE).

%%%%%%%%%%%%%%%%%%%%%%%%% APIs %%%%%%%%%%%%%%%%%%%%%%%%%%%
is_accept(State) ->
    Ac_set = sets:from_list([state_C]),
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
    State = state_A,
    {ok, State, []}.

callback_mode() -> state_functions.

%%%%%%%%%%%%%%%%%%%%%% state callbacks %%%%%%%%%%%%%%%%%%%%%

state_A({call, From}, 0, Data) ->
    {next_state, state_B, Data, [{reply, From, ok}]};
state_A({call, From}, 1, Data) ->
    {next_state, state_A, Data, [{reply, From, ok}]}.


state_B({call, From}, 0, Data) ->
    {next_state, state_C, Data, [{reply, From, ok}]};
state_B({call, From}, 1, Data) ->
    {next_state, state_A, Data, [{reply, From, ok}]}.


state_C({call, From}, 0, Data) ->
    {next_state, state_C, Data, [{reply, From, ok}]};
state_C({call, From}, 1, Data) ->
    {next_state, state_A, Data, [{reply, From, ok}]}.




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
	    false
    end.

gen_test_input(0) -> [[]];
gen_test_input(L) when L > 0 ->
    {List1, List2} = lists:unzip([{[0|Input_string],
			     [1|Input_string]}
			    || Input_string <- gen_test_input(L-1)]),
    List1 ++ List2.

bin_to_string(Blist) ->
    [B+$0 || B <- Blist].    
%%%%%%%%%%%%%%%%%%%%%%%%%%Unit Test%%%%%%%%%%%%%%%%%%%%%%%%%
dfa_test() ->
    Test_inputs = lists:foldl(fun (E, Acc) -> E ++ Acc end, [], [gen_test_input(L) || L <- lists:seq(0, 11)]),
    Test_results = [(length(Ti) >= 2) andalso
		    (lists:nth(length(Ti), Ti) =:= 0) andalso
                    (lists:nth(length(Ti) - 1, Ti) =:= 0)
		    || Ti <- Test_inputs],
    Test_pairs = lists:zip(Test_inputs, Test_results),
    loop(Test_pairs).
