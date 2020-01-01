defmodule App.Live.Admin.DashboardView do
  use Phoenix.LiveView

  import App.Router.Helpers

  defp get_logo(socket), do: static_path(socket, "/images/logos/logo_admin.png")

  @doc false
  def mount(session, %Phoenix.LiveView.Socket{} = socket) do
    props = [
      session: session,
      logo: get_logo(socket)
    ]

    {:ok, assign(socket, props)}
  end

  @spec render(%{socket: Phoenix.LiveView.Socket.t()}) :: Phoenix.LiveView.Rendered.t()
  def render(%{socket: %Phoenix.LiveView.Socket{}} = assigns) do
    ~L"""
    <section id="dashboard">
      <div class="servus logo">
        <img src="<%= @logo %>" class="responsive-img" alt="Servus CMS">
      </div>
    </section>
    """
  end
end
