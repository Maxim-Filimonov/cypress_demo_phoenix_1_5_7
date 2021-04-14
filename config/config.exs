# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cypress_demo,
  ecto_repos: [CypressDemo.Repo]

# Configures the endpoint
config :cypress_demo, CypressDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1wqu9/ki9un5z1REhP9s8HyOWzyvcz1itqkfRHEDm/xyoGCc9s7XYLVUaQ2Qq9zL",
  render_errors: [view: CypressDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CypressDemo.PubSub,
  live_view: [signing_salt: "03ZYJ4uw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
