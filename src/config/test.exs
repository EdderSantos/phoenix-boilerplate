use Mix.Config

config :web_app, WebApp.Web.Endpoint,
  server: false

config :logger, level: :warn

config :web_app, WebApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_NAME"),
  hostname: System.get_env("DB_HOST"),
  port: System.get_env("DB_PORT"),
  pool: Ecto.Adapters.SQL.Sandbox
