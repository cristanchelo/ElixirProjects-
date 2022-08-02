defmodule SophosApp.MyList do
  @moduledoc """
  Módulo con funciones para aplicar sobre listas
  """
  @doc """
  Sumar los elementos de una lista
  """
  def sum(list) do
    sum(list, 0)
  end
  defp sum([], n), do: n
  defp sum([h|t], n), do: sum(t, n + h)

  @doc """
  Conocer el tamaño de una lista
  """
  def length(list) do
    length(list, 0)
  end
  defp length([], n), do: n
  defp length([_|t], n), do: length(t, n + 1)

  @doc """
  Generar una lista de número de 1 hasta N
  """
  def generate(n) when n >= 0 do
    generate(n, [])
  end

  defp generate(0, list), do: list
  defp generate(n, list), do: generate(n - 1, [n|list] )

  @doc """
  Aplicar una función sobre cada uno de los elementos de una lista
  """
  def apply_function(list, function) do
    apply_function(list, [], function)
  end
  defp apply_function([], list, function), do: list
  defp apply_function([h|t], list, function), do: apply_function(t, list ++ [function.(h)], function)
end
