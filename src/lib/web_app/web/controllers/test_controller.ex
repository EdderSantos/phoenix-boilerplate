defmodule WebApp.Web.TestController do
  @moduledoc """
  Test controller
  """

  use WebApp.Web, :controller

  require Logger

  action_fallback WebApp.Web.FallbackController

  @doc """
  Test html method
  """
  @spec test_html(map, map) :: String.t
  def test_html(conn, _params) do
    Logger.info "Test"
    render(conn, "index.html")
  end

  @doc """
  Test api method
  """
  @spec test_api(map, map) :: String.t
  def test_api(conn, _params) do
    Logger.info "Test"
    render(conn, "index.json")
  end
end
