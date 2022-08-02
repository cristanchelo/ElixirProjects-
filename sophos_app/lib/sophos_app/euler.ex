defmodule SophosApp.ProjectEuler do
  alias SophosApp.MyList
  import String, only: [split: 3]
  def project_1(n) do
    n - 1
    |> MyList.generate()
    |> transform()
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
end
