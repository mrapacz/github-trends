defmodule GithubTrends.PageController do
  use GithubTrends.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
