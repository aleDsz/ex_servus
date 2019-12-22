defmodule ServusWeb.PageController do
  use ServusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
