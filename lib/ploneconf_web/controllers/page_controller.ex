defmodule PloneconfWeb.PageController do
  use PloneconfWeb, :controller
  alias Ploneconf.GPad

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def storage(conn, _params) do
    settings = GPad.get_setting_by_name!("GPad")
    render(conn, "storage.html", value: settings.value)
  end

  def memory(conn, _params) do
    value = GPad.Memory.get_value("GPad")
    render(conn, "memory.html", value: value)
  end

  def const(conn, _params) do
    value = GPad.Const.what_is_it("GPad")
    render(conn, "const.html", value: value)
  end
end
