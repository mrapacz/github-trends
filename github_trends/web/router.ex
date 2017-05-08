defmodule GithubTrends.Router do
  use GithubTrends.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :fetch_session
    plug :fetch_flash
    plug :is_user_logged?
    plug :accepts, ["json"]
  end

  scope "/", GithubTrends do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", GithubTrends do
    pipe_through :browser # Use the default browser stack

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
  end

  scope "/api", GithubTrends do
    pipe_through :api

    get "/me", UserController, :get_user_info
    get "/repositories/most_popular", GithubSearchController, :get_most_popular_repositories
  end

  defp is_user_logged?(conn, _) do
    user = get_session(conn, :current_user)
    case user do
      nil -> 
        conn
        |> redirect(to: "/")
        |> halt
      _ -> 
        conn
    end
  end
end
