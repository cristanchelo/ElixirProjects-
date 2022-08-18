defmodule SophosApp.FibonacciSupervisor do
  @moduledoc """
  Módulo para asociar un Supervisor al proceso que es generado
  por el módulo SophosApp.FibonacciGenServer
  """
  use Supervisor
  alias SophosApp.FibonacciGenServer

  @doc """
  Función para crear el proceso Supervisor
  """
  def start_link(args) do
    Supervisor.start_link(__MODULE__, args)
  end

  @doc """
  Función para inicializar el proceso Supervisor con el módulo SophosApp.FibonacciGenServer
  """
  def init(_args) do
    children = [FibonacciGenServer]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
