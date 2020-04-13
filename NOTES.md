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