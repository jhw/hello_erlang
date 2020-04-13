PROJECT = hello_erlang
PROJECT_DESCRIPTION = New project
PROJECT_VERSION = 0.1.0

DEPS = cowboy lager

dep_cowboy_commit = 2.6.3
dep_lager_commit = 3.6.8

DEP_PLUGINS = cowboy

include erlang.mk

ERLC_COMPILE_OPTS= +debug_info +'{parse_transform, lager_transform}'
ERLC_OPTS += $(ERLC_COMPILE_OPTS)

