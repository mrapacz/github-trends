defmodule GithubTrends.GithubSearchController do
  use GithubTrends.Web, :controller

  alias GithubTrends.HTTPGithub
  HTTPGithub.start

  @expected_fields ~w(
      stargazers_count watchers full_name description language html_url forks_count
  )

  def get_most_popular_repositories(conn, params) do
    IO.inspect params
    %{body: body} = HTTPGithub.get!("search/repositories?q=language:javascript%20created:%3E2017-05-01&sort=stars&order=desc")

    case body[:items] do
      data ->
        data = Enum.map data, fn x -> Map.take x, @expected_fields end
        json conn, data
      _ -> "Page not found"
    end

  end

end
