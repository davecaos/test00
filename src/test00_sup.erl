%%%-------------------------------------------------------------------
%% @doc test00 top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(test00_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
Factorial =
  {factorial_server,
    {factorial_server, start_link, []},
    permanent,
    5000,
    worker,
    [factorial_server]
  },
    {ok, { {one_for_all, 0, 1}, [Factorial]} }.

%%====================================================================
%% Internal functions
%%====================================================================
