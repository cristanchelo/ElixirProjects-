defmodule SophosApp.FactorialServer do
  @moduledoc """
  Módulo que llama la definición del módulo Factorial
  a través de la gestión de procesos de Elixir.
  """
  alias SophosApp.Factorial
  @doc """
  Función para llamar a Factorial usando SophosApp.GenericServer
  """
  def handle_message({:compute, n}, _caller, state) do
    result = Factorial.of(n)
    {:ok, result , [result | state]}
  end
  @doc """
  Función para obtener el estado del proceso que llama a Factorial usando SophosApp.GenericServer
  """
  def handle_message({:status} , _caller, state) do
    {:ok, state, state}
  end
end
