-module(hello_erlang_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
				      {'_', [{"/echo", echo_handler, []}]},
				      {'_', [{"/", hello_handler, []}]}
				     ]),
    {_, Port}=application:get_env(hello_erlang, port),
    {ok, _} = cowboy:start_clear(my_http_listener,
				 [{port, Port}],
				 #{env => #{dispatch => Dispatch}}
				),
    hello_erlang_sup:start_link().

stop(_State) ->
	ok.
