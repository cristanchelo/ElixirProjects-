defmodule SophosApp.MyList do
  def sum(list) do
    sum(list, 0)
  end
  defp sum([], n), do: n
  defp sum([h|t], n), do: sum(t, n + h)

  def length(list) do
    length(list, 0)
  end
  defp length([], n), do: n
  defp length([_|t], n), do: length(t, n + 1)
end
