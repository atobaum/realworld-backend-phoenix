# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :real_world,
  ecto_repos: [RealWorld.Repo]

# Configures the endpoint
config :real_world, RealWorldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tTupELr/rKonjb8ISuvnp8pJzO6xdI8Y8V13rwX2xthuu22mLl0QbNfVibyvrDI/",
  render_errors: [view: RealWorldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RealWorld.PubSub,
  live_view: [signing_salt: "E6cLukKC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
