defmodule MovieSearchUiWeb.MovieListLive.Index do
  use Phoenix.LiveView

  alias MovieSearchUi.MovieSearch
  alias MovieSearchUiWeb.MovieListView

  def mount(_session, socket) do
    MovieSearch.subscribe()
    {:ok, fetch(socket)}
  end

  defp fetch(socket) do
    movies = []
    assign(socket, movies: movies)
  end

  def render(assigns), do: MovieListView.render("index.html", assigns)

  def handle_info({MovieSearch, [:search, :successful], results}, socket) do
    IO.inspect(results)
    {:noreply, assign(socket, movies: results)}
  end
end
