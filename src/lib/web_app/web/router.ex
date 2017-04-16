defmodule WebApp.Web.Router do
  use WebApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WebApp.Web do
    pipe_through :browser

    get "/", TestController, :test_html
  end

  scope "/api/v1", WebApp.Web do
    pipe_through :api

    get "/test", TestController, :test_api
  end
end
