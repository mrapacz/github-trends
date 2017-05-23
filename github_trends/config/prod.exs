use Mix.Config

config :github_trends, GithubTrends.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "http", host: "githubtrends.herokuapp.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")


config :logger, level: :info

import_config "prod.secret.exs"
