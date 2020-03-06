defmodule BinaPubSub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
        %{
          id: Phoenix.PubSub.PG2,
          start: {Phoenix.PubSub.PG2, :start_link, [:store, []]}
        }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BinaPubSub.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
