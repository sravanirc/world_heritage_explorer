defmodule WorldHeritageExplorer.Repo do
  use Ecto.Repo,
    otp_app: :world_heritage_explorer,
    adapter: Ecto.Adapters.Postgres
end
