defmodule SophosApp.FibonacciServer do
  @moduledoc """
  Módulo que llama la definición del módulo Fibonacci
  a través de la gestión de procesos de Elixir.
  """
  alias SophosApp.Fibonacci
  @doc """
  Función para llamar a Fibonacci usando SophosApp.GenericServer
  """
  def handle_message({:sequence, n}, _caller, state) do
    result = Fibonacci.sequence(n)
    {:ok, result, [result | state]}
  end
  @doc """
  Función para obtener el estado del proceso que llama a Fibonacci usando SophosApp.GenericServer
  """
  def handle_message({:status}, _caller, state ) do
    {:ok, state, state}
  end
end
