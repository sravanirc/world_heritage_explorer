defmodule WorldHeritageExplorer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WorldHeritageExplorerWeb.Telemetry,
      WorldHeritageExplorer.Repo,
      {DNSCluster,
       query: Application.get_env(:world_heritage_explorer, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WorldHeritageExplorer.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: WorldHeritageExplorer.Finch},
      # Start a worker by calling: WorldHeritageExplorer.Worker.start_link(arg)
      # {WorldHeritageExplorer.Worker, arg},
      # Start to serve requests, typically the last entry
      WorldHeritageExplorerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WorldHeritageExplorer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WorldHeritageExplorerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
