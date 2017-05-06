defmodule GithubTrends.PageController do
  use GithubTrends.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:current_user, get_session(conn, :current_user))
    |> render "index.html"
  end
end
