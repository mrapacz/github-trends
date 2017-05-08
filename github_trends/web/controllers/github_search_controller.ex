defmodule GithubTrends.GithubSearchController do
  use GithubTrends.Web, :controller

  alias GithubTrends.HTTPGithub
  HTTPGithub.start

  @expected_repositories_fields ~w(
    stargazers_count watchers full_name description language html_url forks_count
  )

  @expected_users_fields ~w(
    login avatar_url html_url score
  )

  @expected_issues_fields ~w(
    html_url title state comments
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

    parsed_data =
      params
      |> parse_parameters(q_param)
      |> make_request("search/repositories")
      |> extract_data
      |> parse_data(@expected_repositories_fields)

    json conn, parsed_data
  end

  def get_most_popular_users(conn, params) do
    q_param =
      case Map.take(params, ["followers", "repos"]) do
        %{"followers" => followers, "repos" => repos} ->
          "followers:>" <> followers <> " repos:>" <> repos
        %{"followers" => followers} ->
          "followers:>" <> followers
        %{"repos" => repos} ->
          "repos:>" <> repos
        _ ->
          nil
      end

    parsed_data =
      params
      |> parse_parameters(q_param)
      |> make_request("search/users")
      |> extract_data
      |> parse_data(@expected_users_fields)

    json conn, parsed_data
  end

  def get_most_popular_issues(conn, params) do
    q_param =
      case Map.take(params, ["language", "comments"]) do
        %{"language" => language, "comments" => comments} ->
          "language:" <> language <> " comments:>" <> comments
        %{"language" => language} ->
          "language:" <> language
        %{"comments" => comments} ->
          "comments:>" <> comments
        _ ->
          nil
      end
    parsed_data =
      params
      |> parse_parameters(q_param)
      |> make_request("search/issues")
      |> extract_data
      |> parse_data(@expected_issues_fields)

    json conn, parsed_data
  end

  defp parse_parameters(params, q_params) do
    regular_params = Map.take(params, ["sort", "order"])
    case q_params do
      nil ->
        regular_params
      _ ->
        Map.put(regular_params, "q", q_params)
      end
  end

  defp make_request(params, endpoint) do
    HTTPGithub.get!(endpoint, [], params: params)
  end

  defp extract_data(request) do
    case request do
      %{body: [items: items, total_count: _], headers: _} -> items
      _ -> []
    end
  end

  defp parse_data(data, fields) do
    case data do
      data ->
        Enum.map data, fn x -> Map.take x, fields end
      [] ->
        []
    end
  end
end
