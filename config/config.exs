# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :oban_repo,
  ecto_repos: [ObanRepo.Repo]

# Configures the endpoint
config :oban_repo, ObanRepoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AMFEH7CSWHO8mFQzUO6ew8pSywhOZhdIfVf6YaS+jg27P6WQhsHqE5YQlguvREKV",
  render_errors: [view: ObanRepoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ObanRepo.PubSub,
  live_view: [signing_salt: "aKlU9+jC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :oban_repo, Oban,
  repo: ObanRepo.Repo,
  plugins: [],
  queues: [default: 10]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
