defmodule App.Plugs.Admin.Assets do
  @moduledoc """
  Retrieve global assets to use on Admin Panel
  """
  require Logger
  use Plug.Builder

  def init(opts), do: opts

  def call(%Plug.Conn{} = conn, _opts) do
    if Code.ensure_loaded?(App.Router.Helpers) do
      conn
      |> assign(:logo, App.Router.Helpers.static_path(conn, "/images/logos/logo_admin.png"))
    else
      conn
    end
  end
end
