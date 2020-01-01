defmodule App.Live.Admin.LoginView do
  use Phoenix.LiveView

  import App.Router.Helpers

  alias App.Components.Admin.Button
  alias App.Components.Admin.Field

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
        {:noreply, assign(socket, email_error: Gettext.gettext(App.Gettext, "Password can't be empty"))}

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
      <div class="servus login">
        <div class="servus logo">
          <img src="<%= @logo %>" class="responsive-img" alt="Servus CMS">
        </div>

        <form phx-submit="login" class="card">
          <div class="card-content">
            <span class="card-title center">Acesso ao Painel Administrativo</span>

            <div class="row">
              <%= live_component @socket, Field, id: "email", error: @email_error, value: @email, size: "s12", icon: "email", type: "email", label: "E-mail" %>
            </div>

            <div class="row">
              <%= live_component @socket, Field, id: "password", error: @password_error, value: @password, size: "s12", icon: "lock_outline", type: "password", label: "Senha" %>
            </div>
          </div>
          <div class="card-action indigo lighten-5">
            <div class="servus buttons">
              <%= live_component @socket, Button, id: "btEntrar", classes: ~w(right orange darken-4), label: "Entrar" %>
            </div>
          </div>
        </form>
      </div>
    </section>
    """
  end
end
