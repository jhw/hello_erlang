-module(hello_erlang).

-export([start/0]).

start() ->
    application:ensure_all_started(?MODULE).
