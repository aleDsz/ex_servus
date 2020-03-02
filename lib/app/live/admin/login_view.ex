defmodule App.Live.Admin.LoginView do
  use Phoenix.LiveView

  import App.Router.Helpers

  alias App.Components.Admin.{Text, Logo, Input, Button}

  alias Servus.Services.ServusUsers

  defp get_logo(socket), do: static_path(socket, "/images/logos/logo_admin.png")

  @doc false
  def mount(session, %Phoenix.LiveView.Socket{} = socket) do
    props = [
      session: session,
      logo: get_logo(socket),
      email: nil,
      email_error: nil,
      password: nil,
      password_error: nil
    ]

    {:ok, assign(socket, props)}
  end

  @doc false
  def handle_info({:invalid_field, %{email: nil, message: error}}, socket) do
    {:noreply, assign(socket, email_error: Gettext.gettext(App.Gettext, error))}
  end

  @doc false
  def handle_info({:valid_field, %{email: value, message: error}}, socket) do
    {:noreply, assign(socket, email: value, email_error: error)}
  end
  def handle_info({:valid_field, %{password: value, message: error}}, socket) do
    {:noreply, assign(socket, password: value, password_error: error)}
  end

  @doc false
  def handle_event("validation", _params, %Phoenix.LiveView.Socket{} = socket), do: {:noreply, socket}

  def handle_event("login", _params, %Phoenix.LiveView.Socket{assigns: assigns} = socket) do
    cond do
      is_nil(assigns.email) ->
        {:noreply, assign(socket, email_error: Gettext.gettext(App.Gettext, "E-mail can't be empty"))}

      is_nil(assigns.password) ->
        {:noreply, assign(socket, password_error: Gettext.gettext(App.Gettext, "Password can't be empty"))}

      true ->
        case ServusUsers.get_by_email(assigns.email) do
          {:ok, user} ->
            if user.password == assigns.password do
              socket =
                socket
                |> put_flash(:user, user)
                |> redirect(to: live_path(socket, App.Live.Admin.DashboardView))

              {:stop, socket}
            else
              {:noreply, assign(socket, password_error: Gettext.gettext(App.Gettext, "Invalid password"))}
            end

          {:error, :not_found} ->
            {:noreply, assign(socket, email_error: Gettext.gettext(App.Gettext, "E-mail not found"))}
        end
    end
  end

  @spec render(%{socket: Phoenix.LiveView.Socket.t()}) :: Phoenix.LiveView.Rendered.t()
  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <section id="login">
      <div class="login background">
        <%= live_component @socket, Logo, id: "logo", classes: ~w() %>
      </div>
      <div class="login form">
        <div class="container">
          <div class="title align-left">
            <%= live_component @socket, Text, id: "title1", classes: ~w(headline1), value: Gettext.gettext(App.Gettext, "Welcome to") %>
            <%= live_component @socket, Text, id: "title2", classes: ~w(brand damion primary-color), value: "Servus" %>
          </div>
          <div class="subtitle">
            <%= live_component @socket, Text, id: "subtitle1", classes: ~w(headline3), value: Gettext.gettext(App.Gettext, "Access now your administration system") %>
          </div>
          <form phx-submit="login">
            <div class="grid items-1">
              <%= live_component @socket, Input, id: "email", error: @email_error, value: @email, icon: "user", type: "email", label: Gettext.gettext(App.Gettext, "E-mail") %>
              <%= live_component @socket, Input, id: "password", error: @password_error, value: @password, icon: "key", type: "password", label: Gettext.gettext(App.Gettext, "Password") %>
            </div>
            <div class="actions">
              <div class="grid">
                <%= live_component @socket, Button, id: "login", type: "submit", classes: ~w(primary-background white-text), label: Gettext.gettext(App.Gettext, "Sign in") %>
              </div>
            </div>
            <%= live_component @socket, Text, id: "forgot-password", classes: ~w(damion secondary-color), value: Gettext.gettext(App.Gettext, "Forgot password") %>
          </form>
        </div>
      </div>
    </section>
    """
  end
end
