defmodule App.Admin.LoginController do
  use App, :controller

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, _params) do
    conn
    |> live_render(App.Admin.LoginView, session: %{})
  end
end
