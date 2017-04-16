defmodule :hooks do
  require Logger
  def migrate do
    {:ok, _} = Application.ensure_all_started(:web_app)
    path = Application.app_dir(:web_app, "priv/repo/migrations")
    Ecto.Migrator.run(WebApp.Repo, path, :up, all: true)
    :init.stop()
  end
end
