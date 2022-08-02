defmodule SophosApp.ProjectEuler do
  alias SophosApp.MyList
  import String, only: [split: 3]
  def project_1(n) do
    n
    |> MyList.generate()
    |> filter()
  end

  defp filter(numbers) do
    do_filter(numbers, [])
  end

  defp do_filter([], filtered), do: filtered
  defp do_filter([h|t], filtered) do
    include_number = evaluate(h)
    do_filter(t, [include_number | filtered])
  end
  defp evaluate(h) when rem(h,5) == 0, do: h
  defp evaluate(h) when rem(h,3) == 0, do: h
  defp evaluate(_h), do: 0
end
