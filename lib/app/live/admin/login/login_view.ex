defmodule App.Admin.LoginView do
  use Phoenix.LiveView

  alias App.Components.Button
  alias App.Components.Field

  defp get_logo(socket), do: App.Router.Helpers.static_path(socket, "/images/logos/logo_admin.png")

  def mount(session, %Phoenix.LiveView.Socket{} = socket) do
    props = [
      session: session,
      logo: get_logo(socket)
    ]

    {:ok, assign(socket, props)}
  end

  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <section id="login">
      <div class="servus login">
        <div class="servus logo">
          <img src="<%= @logo %>" class="responsive-img" alt="Servus CMS">
        </div>

        <form action="" method="post" class="card">
          <div class="card-content">
            <span class="card-title center">Acesso ao Painel Administrativo</span>

            <div class="row">
              <%= live_component @socket, Field, id: "email", size: "s12", icon: "email", type: "email", label: "E-mail" %>
            </div>

            <div class="row">
              <%= live_component @socket, Field, id: "password", size: "s12", icon: "lock_outline", type: "password", label: "Senha" %>
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
