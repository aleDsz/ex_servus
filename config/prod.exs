use Mix.Config

# Configure your database
config :servus, Servus.Repo,
  pool_size: 10

config :servus, App.Endpoint,
  url: [host: {:system, "HOSTNAME"}, port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/cache_manifest.json"
  server: true

# Do not print debug messages in production
config :logger, level: :info
