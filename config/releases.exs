import Config

config :ploneconf, Ploneconf.Repo,
  username: System.get_env("POSTGRES_USER", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "postgres"),
  database: System.get_env("PG_DB", "ploneconf_prod"),
  hostname: System.get_env("PG_HOST", "localhost"),
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.

config :ploneconf, PloneconfWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: "bWIsZDVWkcd/aScJeYHCq5hglqV1JoJXmXIlvn1F5QqhplRjV1CP5yFL6tZ34Wac"

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :ploneconf, PloneconfWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
