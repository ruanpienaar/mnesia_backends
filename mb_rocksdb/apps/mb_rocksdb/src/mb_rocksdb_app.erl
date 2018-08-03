-module(mb_rocksdb_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

-include("mb_rocksdb.hrl").

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->

    % mnesia_rocksdb init
    ok = mnesia:start(),
    {ok,rocksdb_copies} = mnesia_rocksdb:register(),


    ok = mnesia_cluster_lib:start(),
    mb_rocksdb_sup:start_link().

stop(_State) ->
    ok.
