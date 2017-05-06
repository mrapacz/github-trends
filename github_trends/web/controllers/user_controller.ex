defmodule GithubTrends.UserController do
  use GithubTrends.Web, :controller

  def get_user_info(conn, _params) do
    user = get_session(conn, :current_user)
    json conn, user
  end
end
