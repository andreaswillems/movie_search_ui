defmodule MovieSearchUiWeb.MovieListLive.Search do
  @moduledoc false

  use Phoenix.LiveView

  alias MovieSearchUi.MovieSearch
  alias MovieSearchUiWeb.MovieListView

  def mount(_session, socket) do
    {:ok, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, movies: 1..12)
  end

  def render(assigns), do: MovieListView.render("search.html", assigns)

  def handle_event("search", %{"search_args" => search_args}, socket) do
    query = search_args["query"]
    MovieSearch.search(query)
    {:noreply, socket}
  end
end
