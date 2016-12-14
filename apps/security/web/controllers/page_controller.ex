defmodule Security.PageController do
  use Security.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
