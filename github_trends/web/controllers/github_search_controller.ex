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
    parsed_data =
      params
      |> parse_q_parameters(["language", "created"])
      |> parse_parameters(params)
      |> make_request("search/repositories")
      |> extract_data
      |> parse_data(@expected_repositories_fields)

    json conn, parsed_data
  end

  def get_most_popular_users(conn, params) do
    parsed_data =
      params
      |> parse_q_parameters(["followers", "repos"])
      |> parse_parameters(params)
      |> make_request("search/users")
      |> extract_data
      |> parse_data(@expected_users_fields)

    json conn, parsed_data
  end

  def get_most_popular_issues(conn, params) do
    parsed_data =
      params
      |> parse_q_parameters(["language", "comments"])
      |> parse_parameters(params)
      |> make_request("search/issues")
      |> extract_data
      |> parse_data(@expected_issues_fields)

    json conn, parsed_data
  end

  defp parse_q_parameters(params, q_params_list) do
    case Map.take(params, q_params_list) do
      params ->
        Enum.reduce params, "", fn({key, value}, acc) ->
          cond do
            key in ["created", "repos", "followers", "comments"] ->
              acc <> key <> ":>" <> value <> " "
            key == "language" ->
              acc <> key <> ":" <> value <> " "
          end
        end
      _ ->
        nil
    end
  end

  defp parse_parameters(q_params, params) do
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
