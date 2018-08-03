-module(mb_eleveldb_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-include("mb_eleveldb.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    mb_eleveldb_sup:start_link().

stop(_State) ->
    ok.
