defmodule SophosApp.Fibonacci do
  @moduledoc """
  Secuencia de Fibonacci
  Fib(n) = Fib(n-1) + Fib(n-2) n>=2 n0=0, n1=1
  """
  @doc """
  Fibonacci - Recursión de Pila
  """
  def sequence(0), do: 0
  def sequence(1), do: 1
  def sequence(n) do
    sequence(n - 1) + sequence(n - 2)
  end

  @doc """
  Fibonacci - Recursión de Cola
  """
  def sequenceTail(n) do
    sequenceTail(n, %{n1: 0, n2: 1} )
  end
  defp sequenceTail(0, %{n1: a, n2: b}), do: a
  defp sequenceTail(1, %{n1: a, n2: b}), do: b
  defp sequenceTail(n, map), do: sequenceTail(n - 1, %{n1: map.n2, n2: map.n1 + map.n2} )
end
