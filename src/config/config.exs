use Mix.Config

config :web_app,
  ecto_repos: [WebApp.Repo]

config :web_app, WebApp.Web.Endpoint,
  http: [port: 4000],
  url: [host: "localhost"],
  render_errors: [view: WebApp.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WebApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
 
import_config "#{Mix.env}.exs"
