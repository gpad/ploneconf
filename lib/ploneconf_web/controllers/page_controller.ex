defmodule PloneconfWeb.PageController do
  use PloneconfWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
