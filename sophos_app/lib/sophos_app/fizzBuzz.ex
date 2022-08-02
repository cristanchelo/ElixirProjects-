defmodule SophosApp.FizzBuzz do
  @moduledoc """
  Módulo para el juego de FizzBuzz
  Dada una lista de 1 hasta N elementos, se debe generar una nueva lista considerando:
    a. Múltiplos de 15 se reemplazan con :fizzBuzz
    b. Múltiplos de 3 y a la vez de 5 se reemplazan con :fizzBuzz
    c. Múltiplos de 3 se reemplazan con :fizz
    d. Múltiplos de 5 se reemplazan con :buzz
    e. En caso de que el número no sea múltiplo de 3 ni de múltiplo de 5 no se modifica.
  """
  @doc """
  Función que inicializa el juego, generando números de 1 hasta N
  Genera un alias de la función SophosApp.MyList.generate
  """
  def exec_fizz_buzz(n) when n > 0 do
    alias SophosApp.MyList, as: MyList
    fizz_buzz(MyList.generate(n))
  end
  defp fizz_buzz(list) do
    fizz_buzz(list, [])
  end
  defp fizz_buzz([], list), do: list
  defp fizz_buzz([h|t], list), do: fizz_buzz(t, list ++ [fizz_buzz_sel(h)])

  @doc """
  Función que valida si n es múltiplo de 15
  """
  defp fizz_buzz_sel(n) when rem(n,15) == 0, do: :fizzBuzz
  @doc """
  Función que valida si n es múltiplo de 3 y múltiplo de 5
  """
  defp fizz_buzz_sel(n) when rem(n,3) == 0 and rem(n,5) == 0, do: :fizzBuzz
  @doc """
  Función que valida si n es múltiplo de 3
  """
  defp fizz_buzz_sel(n) when rem(n,3) == 0, do: :fizz
  @doc """
  Función que valida si n es múltiplo de 5
  """
  defp fizz_buzz_sel(n) when rem(n,5) == 0, do: :buzz
  @doc """
  Función que valida si n no es múltiplo de 3 ni múltiplo de 5
  """
  defp fizz_buzz_sel(n) when rem(n,3) != 0 or rem(n,5) != 0, do: n
end
