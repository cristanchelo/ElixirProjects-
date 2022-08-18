defmodule SophosApp.Application do
  use Application

  def start(_type, _args) do
    SophosApp.FactorialSupervisor.start_link([])
    SophosApp.FibonacciSupervisor.start_link([])
  end
end
