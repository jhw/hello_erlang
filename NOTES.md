### start/stop release 13/4/20

```
justin@justin-XPS-13-9360:~/work/hello_erlang$ ./_rel/hello_erlang_release/bin/hello_erlang_release start
justin@justin-XPS-13-9360:~/work/hello_erlang$ ./_rel/hello_erlang_release/bin/hello_erlang_release stop
ok
```

### articles 13/4/20

- https://www.pluralsight.com/guides/10-essential-erlang-tools-for-erlang-developers
- https://medium.com/erlang-battleground/erlang-lessons-fe800c51af4f

### shell 12/4/20

```
SHELL_DEPS = sync

SHELL_OPTS = \
  -s $(PROJECT) \
  -s sync \
  -config dev.config
```

### ignore_src 12/4/20

##### relx.config

```
{include_src, false}.
```
### shell 12/4/20

```
SHELL_OPTS = \
  -s $(PROJECT) \
  -config config/sys.config
```

```
Erlang/OTP 21 [erts-10.1] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

{"init terminating in do_boot",{undef,[{hello_erlang,start,[],[]},{init,start_em,1,[]},{init,do_boot,3,[]}]}}
init terminating in do_boot ({undef,[{hello_erlang,start,[],[]},{init,start_em,1,[]},{init,do_boot,3,[]}]})

Crash dump is being written to: erl_crash.dump...done
erlang.mk:7177: recipe for target 'shell' failed
make: *** [shell] Error 1
```

##### src/hello_erlang.erl

```
-module(hello_erlang).

-export([start/0]).

start() ->
    application:ensure_all_started(?MODULE).
```

### lager 12/4/20

- changed `config/vm.args` to use `sname`
- added `lager` and `sasl` config to `sys.config`
- added lager hello world message to hello handler

```
justin@justin-XPS-13-9360:~/work/hello_erlang$ curl http://localhost:8080
Hello Erlang!justin@justin-XPS-13-9360:~/work/hello_erlang$ more _rel/hello_erlang_release/log/info.log 
2020-04-13 20:32:50.322 [info] <0.588.0>@hello_handler:init:11 Hello Erlang!
2020-04-13 20:34:00.310 [info] <0.590.0>@hello_handler:init:11 Hello Erlang!
2020-04-13 20:35:06.200 [info] <0.593.0>@hello_handler:init:11 Hello Erlang!
```

### hello world 12/4/20

- https://ninenines.eu/docs/en/cowboy/2.6/guide/getting_started/

```
justin@justin-XPS-13-9360:~/work/hello_erlang$ curl http://localhost:8080
Hello Erlang!justin@justin-XPS-13-9360:~/work/hello_erlang$ 
```