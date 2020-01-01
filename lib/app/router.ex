defmodule App.Router do
  use App, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin_private do
    plug :put_layout, {App.Admin.LayoutView, :private}
    plug App.Plugs.Admin.Auth, :admin
  end

  pipeline :admin_public do
    plug :put_layout, {App.Admin.LayoutView, :public}
    plug App.Plugs.Admin.Auth, :login
  end

  pipeline :web do
    plug :put_layout, {App.Web.LayoutView, :main}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", App.Live.Admin do
    pipe_through [:browser, :admin_public]

    live "/login", LoginView
  end

  scope "/admin", App.Live.Admin do
    pipe_through [:browser, :admin_private]

    live "/", DashboardView
  end
end
