defmodule SophosApp.Factorial do
  @moduledoc """
  Cálculo del factorial
  n! = 1*2*3*4*5...*n
  """
  @doc """
  Factorial - Recursión de pila
  """
  def of(0), do: 1
  def of(n) when n >= 0, do: n * of(n - 1)

  @doc """
  Factorial - Recursión de cola
  """
  def of2(n), do: compute(n, 1)
  defp compute(1, accum), do: accum
  defp compute(n, accum), do: compute(n - 1, accum * n)
end
