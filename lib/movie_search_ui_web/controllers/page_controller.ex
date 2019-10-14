defmodule MovieSearchUiWeb.PageController do
  use MovieSearchUiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
