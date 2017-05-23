use Mix.Config

config :github_trends, GithubTrends.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
