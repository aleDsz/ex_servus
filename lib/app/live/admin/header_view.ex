defmodule App.Live.Admin.HeaderView do
  use App, :view
  use Phoenix.LiveView

  # import App.Router.Helpers

  @doc false
  def mount(session, %Phoenix.LiveView.Socket{} = socket) do
    props = [
      session: session
    ]

    {:ok, assign(socket, props)}
  end

  def render("admin", assigns) do
    ~L"""
    <header id="header">
      <nav class="grey darken-3">
        <div class="nav-wrapper fluid-container">
          <a href="#!" class="brand-logo">
            <div class="servus logo">
              <img src="<%= @logo %>" class="responsive-img" alt="Servus CMS">
            </div>
          </a>
          <ul class="right hide-on-med-and-down">
            <li>
              <a class="dropdown-trigger" href="#!" data-target="profile_dropdown">
               <i class="material-icons white-text">menu</i>
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </header>

    <ul id="profile_dropdown" class="dropdown-content grey darken-3">
      <li class="disabled">
        <div class="profile">
          <img src="http://tcap.pbworks.com/f/1435170280/myAvatar.png"
            alt="" class="circle responsive-img profile-img" />
          <span class="profile-name white-text">
            Alexandre de Souza
          </span>
        <div>
      </li>
      <li><a href="#!" class="white-text">Dashboard</a></li>
      <li><a href="#!" class="white-text">Users</a></li>
      <li><a href="#!" class="white-text">Permissions</a></li>
      <li><a href="#!" class="white-text">Settings</a></li>
      <li class="divider"></li>
      <li><a href="#!" class="white-text">Logout</a></li>
    </ul>
    """
  end
end
