use Mix.Config

config :web_app, WebApp.Web.Endpoint,
  http: [port: "${PORT}"],
  url: [host: "${HOST}", port: "${PORT}"],
  secret_key_base: "${SECRET_KEY_BASE}",
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config[:version]

config :logger, level: :info

config :web_app, WebApp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "${DB_USERNAME}",
  password: "${DB_PASSWORD}",
  database: "${DB_NAME}",
  hostname: "${DB_HOST}",
  port: "${DB_PORT}",
  pool_size: 20,
  ssl: true
