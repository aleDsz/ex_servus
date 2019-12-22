defmodule Servus.Repo do
  use Ecto.Repo,
    otp_app: :servus,
    adapter: Ecto.Adapters.Postgres
end
