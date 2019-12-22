defmodule App.Web.PageController do
  use App, :controller

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, _params) do
    conn |> put_layout("web.html") |> render("index.html")
  end
end
