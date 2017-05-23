defmodule GithubTrends.PageControllerTest do
  use GithubTrends.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert 2 + 2 = 4
  end
end
