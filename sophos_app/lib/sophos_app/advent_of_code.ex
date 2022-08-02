defmodule SophosApp.AdventOfCode.Day1 do
  alias SophosApp.MyList
  import String, only: [split: 3]
  def deliver_star1(instructions) do
    instructions
    |> split("", trim: true)
    |> evaluate(0)
  end

  def deliver2_star1(instructions) do
    instructions
    |> split("", trim: true)
    |> transform([])
    |> MyList.sum()
  end

  def position_start2(instructions, pos) do
    instructions
    |> split("", trim: true)
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

  defp transform_pos([h | t], floor, pos, val) when floor != val, do: transform_pos(t, walk(floor, h), pos+1, val)
  defp transform_pos(list, floor, pos, val) when list == [] or floor == -1, do: pos
end
