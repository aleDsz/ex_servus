use Mix.Config

# Configure your database
config :servus, Servus.Repo,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :servus, App.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  live_view: [signing_salt: "nC0WzRbuZQgRnkB0VIRllW5YTmv2/mJa"],
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js", "--mode", "development", "--watch-stdin",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

# Live reload configuration
config :servus, App.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/app/views/.*(ex)$",
      ~r"lib/app/live/.*(ex)$",
      ~r"lib/app/components/.*(ex)$",
      ~r"lib/app/templates/.*(eex)$"
    ]
  ]

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
