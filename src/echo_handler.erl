-module(echo_handler).
-behavior(cowboy_handler).

-export([init/2]).

%% curl -i "http://localhost:8080/echo?msg=Hello%20World"

init(Req0=#{method := <<"GET">>}, State) ->
    handle_echo(Req0,  proplists:lookup(<<"msg">>, cowboy_req:parse_qs(Req0)), State);
init(Req0, State) ->
    Req = cowboy_req:reply(405, #{
			     <<"allow">> => <<"GET">>
			    }, Req0),
    {ok, Req, State}.

handle_echo(Req0, {_, ReqMsg}, State) ->
    RespMsg= list_to_binary(lists:flatten(io_lib:fwrite("you sent '~s'", [ReqMsg]))),
    lager:info(RespMsg),
    Req=cowboy_req:reply(200, #{
			   <<"content-type">> => <<"text/plain">>
			  }, 
			 RespMsg,
			 Req0),
    {ok, Req, State};
handle_echo(Req0, _, State) ->
    Req=cowboy_req:reply(400, #{
			   <<"content-type">> => <<"text/plain">>
			  }, 
			 <<"Please supply 'msg'">>,
			 Req0),
    {ok, Req, State}.

    

