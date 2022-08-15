defmodule SophosApp.ProjectEuler do
  @moduledoc """
  Módulo con funciones relacionadas con la solución de ejercicio de ProjectEuler
  https://projecteuler.net/
  """
  alias SophosApp.MyList
  import String, only: [split: 3]

  @doc """
  Función para obtener la lista de números de 0...n
  Usando IO_inspect se visualiza una nueva lista solo con los números
  múltiplos de 3 y de 5, y los demás en 0.
  Adicional, obtiene la lista de dichos números.
  """
  def list_three_five_nums_with_sum(n) do
    n - 1
    |> MyList.generate()
    |> transform()
    |> IO.inspect()
    |> MyList.sum()
  end

  @doc """
  Función para obtener la lista de números de 0...n
  Usando IO_inspect se visualiza una nueva lista solo con los números
  múltiplos de 3 y de 5, filtrando la lista para excluir los demás números.
  Adicional, obtiene la lista de dichos números.
  """
  def list_three_five_nums_with_sum_filter(n) do
    n - 1
    |> MyList.generate()
    |> filter()
    |> IO.inspect()
    |> MyList.sum()
  end

  defp transform(numbers) do
    do_transform(numbers, [])
  end

  defp do_transform([], transformed), do: transformed
  defp do_transform([h|t], transformed) do
    include_number = evaluate(h)
    do_transform(t, [include_number | transformed])
  end
  defp evaluate(h) when rem(h,5) == 0, do: h
  defp evaluate(h) when rem(h,3) == 0, do: h
  defp evaluate(_h), do: 0

  defp filter(numbers) do
    #filter_fun = fn n -> rem(n,5) == 0 or rem(n,3) == 0 end
    do_filter(numbers, [])
  end

  defp do_filter([], filter_list), do: filter_list
  defp do_filter([h | t], filter_list) do
    do_filter(t, apply_filter(h, filter_list))
  end
  defp apply_filter(h, list)
      when rem(h,5) == 0 or rem(h,3) == 0,
      do: [h | list]
  defp apply_filter(_h, list), do: list

end
