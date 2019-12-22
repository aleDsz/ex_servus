defmodule App.Admin.LoginController do
  use App, :controller

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, _params) do
    conn |> put_layout("admin.html") |> render("index.html")
  end
end
