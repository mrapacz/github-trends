defmodule GithubTrends do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(GithubTrends.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: GithubTrends.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    GithubTrends.Endpoint.config_change(changed, removed)
    :ok
  end
end
