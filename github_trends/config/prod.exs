use Mix.Config

config :github_trends, GithubTrends.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "githubtrends.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :cors_plug,
  origin: ["githubtrends.herokuapp.com"],
  max_age: 86400,
  methods: ["GET", "POST"]

config :logger, level: :info

