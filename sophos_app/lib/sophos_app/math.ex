defmodule SophosApp.Math do
  @moduledoc """
  Implementación básica del módulo de matemáticas de Sophos
  """
  @pi 3.1426
  @doc """
  Suma dos números cualquiera
  """
  def sum(a, b) do
    a + b
  end
  @doc """
  Calcula el máximo común divisor
  """
  def mcd(a, 0), do: a
  def mcd(a, b), do: mcd(b, rem(a, b))

  @doc """
  Determina si un número es cero, negativo o positivo
  """
  def kind(n) when n < 0, do: :negative
  def kind(0), do: :zero
  def kind(n) when n > 0, do: :positive

  @doc """
  Determina el área de la circunferencia
  """
  def circunference(r), do: 2 * r * @pi

  defmodule Geometry.Rectangle do
    @moduledoc """
    Módulo para cálculo de fórmulas geométricas
    """
    @doc """
    Obtiene el área de un cuadrilatero de la misma longitud en ambos lados
    """
    def area(a), do: area(a, a)
    @doc """
    Obtiene el área de un cuadrilatero con ancho y largo de diferente longitud
    """
    def area(a, b), do: a * b
  end
end
