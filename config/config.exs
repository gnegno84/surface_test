# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :stest,
  ecto_repos: [Stest.Repo]

# Configures the endpoint
config :stest, StestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "emUZh/ric8idD6OUS9YjpWXJTStAbWF4FzrZFy83TJ4Q3tRWAEMCF4Nd/lMGguSu",
  render_errors: [view: StestWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Stest.PubSub,
  live_view: [signing_salt: "TFV4Kjg8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
