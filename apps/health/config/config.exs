# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :health,
  ecto_repos: [Health.Repo]

# Configures the endpoint
config :health, Health.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KcZpEBFbw321Bm3xXh0NhbdBUHnO7AnAW4hKAnI7riUO8gU4Mmf1dZQlwYfqaOA9",
  render_errors: [view: Health.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Health.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
