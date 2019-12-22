defmodule App.Api.V1.LoginController do
  use App, :controller

  @spec login(Plug.Conn.t(), map) :: Plug.Conn.t()
  def login(%Plug.Conn{} = conn, %{"email" => email, "password" => password}) when is_binary(email) and is_binary(password) do
    conn |> put_status(200) |> json(%{})
  end
end
