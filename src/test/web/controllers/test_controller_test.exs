defmodule WebApp.Web.TestControllerTest do
  use WebApp.Web.ConnCase

  test "test html", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome"
  end

  test "test api", %{conn: conn} do
    conn = get conn, test_path(conn, :test_api)
    assert json_response(conn, 200)["data"] == nil
  end
end
