defmodule GithubTrends.GithubSearchController do
  use GithubTrends.Web, :controller

  alias GithubTrends.HTTPGithub
  HTTPGithub.start

  @expected_fields ~w(
    stargazers_count watchers full_name description language html_url forks_count
  )

  def get_most_popular_repositories(conn, params) do
    q_param =
      case Map.take(params, ["language", "created"]) do
        %{"language" => language, "created" => created} ->
          "language:" <> language <> " created:>" <> created
        %{"language" => language} ->
          "language:" <> language
        %{"created" => created} ->
          "created:>" <> created
        _ ->
          nil
      end

    params =
      case q_param do
        nil ->
          params
          |> Map.take(["sort", "order"])
        _ ->
          params
          |> Map.take(["sort", "order"])
          |> Map.put("q", q_param)
      end

    request = HTTPGithub.get!("search/repositories", [], params: params)

    data =
      case request do
        %{body: [items: items, total_count: total_count], headers: headers} -> items
        _ -> []
      end

    case data do
      data ->
        data = Enum.map data, fn x -> Map.take x, @expected_fields end
        json conn, data
      [] ->
        json conn, []
    end

  end

end
