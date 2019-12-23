defmodule App.Router do
  use App, :router

  pipeline :admin do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {App.Admin.LayoutView, "main.html"}
  end

  pipeline :web do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {App.Web.LayoutView, "main.html"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", App.Web do
    pipe_through :web

    get "/", PageController, :index
  end

  scope "/admin", App.Admin do
    pipe_through :admin

    get "/login", LoginController, :index
  end

  scope "/v1", App.Api.V1 do
    pipe_through :api

    post "/", LoginController, :login
  end
end
