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
  Fibonacci - Recursión de Cola Versión Map
  """
  def sequenceTail(n) do
    sequenceTail(n, %{n1: 0, n2: 1} )
  end
  defp sequenceTail(0, %{n1: a, n2: b}), do: a
  defp sequenceTail(1, %{n1: a, n2: b}), do: b
  defp sequenceTail(n, map), do: sequenceTail(n - 1, %{n1: map.n2, n2: map.n1 + map.n2} )

  @doc """
  Fibonacci - Recursión de Cola Versión Listas
  """
  def sequenceTail_List(n) do
    do_sequenceTail_list(n, 1, [1, 0] )
  end
  defp do_sequenceTail_list(n, n, [h | _]), do: h
  defp do_sequenceTail_list(n, i, [n2, n1 | _t] = l) do
    do_sequenceTail_list(n, i + 1, [n1 + n2 | l])
  end
end
