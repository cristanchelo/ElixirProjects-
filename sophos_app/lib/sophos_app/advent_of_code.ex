defmodule SophosApp.AdventOfCode.Day1 do
  @moduledoc """
  Módulo para ejercicio de AdventOfCode 2015 Día 1:
  Saber la ubicación de Santa en un edificio en una cadena de texto con los siguientes valores
  ( = Un piso hacia arriba +1
  ) = Un piso hacia abajo -1
  """
  @alias
  alias SophosApp.MyList
  @impl
  import String, only: [split: 3]
  @doc """
  Sumar las coincidencias partiendo de un valor en cero.
  Hace uso de funciones privadas y pattern matching.
  """
  def deliver_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |> evaluate(0)
  end

  @doc """
  Sumar las coincidencias partiendo de la suma de los elementos de una lista
  transformada en valores equivalentes a cada uno de los dos caracteres.
  Hace uso de funciones privadas y pattern matching.
  """
  def deliver_2_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |> transform([])
    |> MyList.sum()
  end

  @doc """
  Uso del módulo Enum y la función reduce para resolver el ejercicio 1
  del número de piso según la cadena de caracteres.
  Enum.reduce(list, 0, fn
      "(", acc -> acc + 1
      ")", acc -> acc - 1
    end
  """
  def deliver_3_enum_reduce_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |>Enum.reduce(0, fn
      "(", acc -> acc + 1
      ")", acc -> acc - 1
    end)
  end

  @doc """
  Uso del módulo Enum y las funciones map y sum para resolver el ejercicio 1
  del número de piso según la cadena de caracteres.
  Enum.map(lista, fn
      "(" -> 1
      ")" -> -1
    end)
  |>Enum.sum()
  """
  def deliver_3_enum_sum_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |> Enum.map(fn
      "(" -> 1
      ")" -> -1
    end)
    |>Enum.sum()
  end

  @doc """
  Uso del módulo Enum y las funciones map y sum para resolver el ejercicio 1
  de la primera ubicación de la bodega o piso -1 dentro la cadena de caracteres.
  Enum.map(lista, fn
      "(" -> 1
      ")" -> -1
    end)
  |>Enum.sum()
  """
  def position_start_2(instructions, pos) do
    instructions
    |> split("", trim: true)
    |> Enum.map(fn
      "(" -> 1
      ")" -> -1
    end)
    |> transform_pos(0, 0, pos)
  end

  defp evaluate([], floor), do: floor
  defp evaluate([h | t], floor) do
    evaluate(t, walk(floor, h))
  end

  defp walk(floor, "("), do: floor+1
  defp walk(floor, ")"), do: floor-1

  defp transform([], list), do: list
  defp transform(["(" | t], list) do
    transform(t, list ++ [1])
  end
  defp transform([")" | t], list) do
    transform(t, [-1] ++ list )
  end

  defp transform_pos([h | t], floor, pos, val) when floor != val, do: transform_pos(t, floor + h, pos + 1, val)
  defp transform_pos(list, floor, pos, val) when list == [] or floor == -1, do: pos
end
