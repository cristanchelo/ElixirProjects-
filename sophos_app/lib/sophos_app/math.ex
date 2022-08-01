defmodule SophosApp.Math do
  def sum(a, b) do
    a + b
  end
end

defmodule SophosApp.Geometry.Rectangle do
  def area(a), do: area(a, a)
  def area(a, b), do: a * b
end
