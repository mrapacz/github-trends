defmodule GithubTrends.Endpoint do
  use Phoenix.Endpoint, otp_app: :github_trends

  plug Plug.Static,
    at: "/", from: :github_trends, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_github_trends_key",
    signing_salt: "iw6A7H5q"

  plug GithubTrends.Router
end
