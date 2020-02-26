defmodule App.Plugs.Admin.Auth do
  @moduledoc """
  Validate authentication to use Admin Panel
  """
  require Logger
  use Plug.Builder

  import Phoenix.Controller

  def init(opts), do: opts

  def call(%Plug.Conn{} = conn, :admin) do
    conn
    |> get_flash(:user)
    |> case do
      nil ->
        conn
        |> get_session(:user)
        |> case do
          %{"id" => user_id} when is_binary(user_id) ->
            conn

          _not_authenticated ->
            Logger.warn("[#{__MODULE__}] User not authenticated, redirecting...")

            conn
            |> redirect(to: "/admin/login")
            |> halt()
        end

      %{"id" => user_id} = user when is_binary(user_id) ->
        conn
        |> put_session(:user, user)
    end
  end
  def call(%Plug.Conn{} = conn, :login) do
    conn
    |> get_flash(:user)
    |> case do
      nil ->
        conn
        |> get_session(:user)
        |> case do
          %{"id" => user_id} when is_binary(user_id) ->
            Logger.debug("[#{__MODULE__}] User already authenticated, redirecting...")

            conn
            |> redirect(to: "/admin")
            |> halt()

          _not_authenticated ->
            Logger.warn("[#{__MODULE__}] User not authenticated")

            conn
        end

        conn

      %{"id" => user_id} = user when is_binary(user_id) ->
        Logger.debug("[#{__MODULE__}] User already authenticated, redirecting...")

        conn
        |> put_session(:user, user)
        |> redirect(to: "/admin")
        |> halt()
    end
  end
end
