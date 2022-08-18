defmodule SophosApp.FactorialSupervisor do
  @moduledoc """
  Módulo para asociar un Supervisor al proceso que es generado
  por el módulo SophosApp.FactorialGenServer
  """
  use Supervisor
  alias SophosApp.FactorialGenServer

  @doc """
  Función para crear el proceso Supervisor, para SophosApp.FactorialSupervisor
  """
  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @doc """
  Función para inicializar el proceso Supervisor con el módulo SophosApp.FactorialSupervisor
  """
  def init(_args) do
    children = [FactorialGenServer]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
