use Mix.Config

config :github_trends, GithubTrends.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "http", host: "githubtrends.herokuapp.com", port: 80],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: System.get_env("SECRET_KEY_BASE")


config :logger, level: :info

