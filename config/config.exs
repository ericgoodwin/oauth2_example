# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the namespace used by Phoenix generators
config :oauth2_example,
  app_namespace: OAuth2Example,
  ecto_repos: [OAuth2Example.Repo]

# Configures the endpoint
config :oauth2_example, OAuth2Example.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zWoDIUN+sA1X958CxqY38CE42MrplMBZtnCOs+d1DoE05sJ++vfrrAU8OKm3JPL+",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: OAuth2Example.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :oauth2_example, Lightspeed,
  client_id: System.get_env("LIGHTSPEED_CLIENT_ID"),
  client_secret: System.get_env("LIGHTSPEED_CLIENT_SECRET"),
  redirect_uri: System.get_env("LIGHTSPEED_REDIRECT_URI")

config :oauth2_example, GitHub,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET"),
  redirect_uri: System.get_env("GITHUB_REDIRECT_URI")

config :oauth2_example, Google,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET"),
  redirect_uri: System.get_env("GOOGLE_REDIRECT_URI")

config :oauth2_example, Facebook,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET"),
  redirect_uri: System.get_env("FACEBOOK_REDIRECT_URI")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
