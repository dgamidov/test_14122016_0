defmodule Health.PageController do
  use Health.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
