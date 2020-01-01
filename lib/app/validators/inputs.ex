defmodule App.Validators.Inputs do
  import Phoenix.LiveView

  @spec email(value :: String.t(), socket :: Phoenix.LiveView.Socket.t()) :: {:ok, String.t(), Phoenix.LiveView.Socket.t()}
  def email("", %Phoenix.LiveView.Socket{} = socket), do:
    {:ok, "", assign(socket, email: "")}

  def email(value, %Phoenix.LiveView.Socket{} = socket) when is_binary(value) do
    ~r/^[\w+.]+@\w+\.\w{2,}(?:\.\w{2})?$/
    |> Regex.match?(value)
    |> if do
      {:ok, value, assign(socket, email: value)}
    else
      {:ok, value, assign(socket, email: nil, message: "Invalid e-mail")}
    end
  end

  @spec password(value :: String.t(), socket :: Phoenix.LiveView.Socket.t()) :: {:ok, String.t(), Phoenix.LiveView.Socket.t()}
  def password(value, %Phoenix.LiveView.Socket{} = socket) when is_binary(value), do:
    {:ok, Base.encode64(value), assign(socket, password: value)}
end
