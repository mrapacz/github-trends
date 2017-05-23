use Mix.Config

config :github_trends, GithubTrends.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q1yN3rDtz12HZQd2lMRsSAleXyhODIkr9VieI0UtI1VnzVaPhKSm8nmbFHWVUxda",
  render_errors: [view: GithubTrends.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GithubTrends.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
