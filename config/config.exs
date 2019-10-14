# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :movie_search_ui, MovieSearchUiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aXpFVdMiBywgghgZINXjHzjIm6gcUnMk/7Jso6g0KawEhVPVjeOc5WD6trrY1hhb",
  render_errors: [view: MovieSearchUiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MovieSearchUi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "iHKlGSGqDIAu9E6FUnwghRgFWcYmv8MP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix,
  json_library: Jason,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
