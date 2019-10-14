defmodule MovieSearchUi.MovieSearch do
  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(MovieSearchUi.PubSub, @topic)
  end

  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(MovieSearchUi.PubSub, @topic, {__MODULE__, event, result})
    {:ok, result}
  end

  def search(query) do
    # results = [%{:title => "Iron Man"}, %{:title => "Iron Man 2"}]
    results = MovieApi.Search.search(query)
    broadcast_change({:ok, results}, [:search, :successful])
  end
end
