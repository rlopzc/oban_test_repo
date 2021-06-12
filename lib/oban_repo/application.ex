defmodule ObanRepo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ObanRepo.Repo,
      # Start the Telemetry supervisor
      ObanRepoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ObanRepo.PubSub},
      # Start the Endpoint (http/https)
      ObanRepoWeb.Endpoint,
      # Start a worker by calling: ObanRepo.Worker.start_link(arg)
      # {ObanRepo.Worker, arg}
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ObanRepo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ObanRepoWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp oban_config do
    Application.fetch_env!(:oban_repo, Oban)
  end
end
