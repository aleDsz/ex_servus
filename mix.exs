defmodule Servus.MixProject do
  use Mix.Project

  def project(), do: [
    app: :servus,
    version: "0.1.0",
    elixir: "~> 1.8",
    elixirc_paths: elixirc_paths(Mix.env()),
    compilers: [:phoenix, :gettext] ++ Mix.compilers(),
    start_permanent: Mix.env() == :prod,
    aliases: aliases(),
    deps: deps()
  ]

  def application(), do: [
    mod: {Servus.Application, []},
    extra_applications: [:logger, :runtime_tools]
  ]

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps(), do: [
    # Server
    {:phoenix, "~> 1.4.6"},
    {:plug_cowboy, "~> 2.0"},

    # PubSub
    {:phoenix_pubsub, "~> 1.1"},

    # HTML
    {:phoenix_html, "~> 2.11"},
    {:phoenix_live_reload, "~> 1.2", only: :dev},

    # Database
    {:phoenix_ecto, "~> 4.0"},
    {:ecto_sql, "~> 3.0"},
    {:postgrex, ">= 0.0.0"},

    # Internationalization
    {:gettext, "~> 0.11"},

    # JSON/CSV
    {:jason, "~> 1.0"}
  ]

  defp aliases(), do: [
    setup: ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate --quiet", "run priv/repo/seeds.exs"]
  ]
end
