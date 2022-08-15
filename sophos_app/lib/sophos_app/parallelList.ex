defmodule SophosApp.ParallelList do
  @moduledoc """
  Módulo para ejecutar un procesos en paralelo que aplican una función
  a cada elemento de una lista
  """
  @doc """
  Función con una lista de procesos que ejecutan una función pasada por parámetro.
  """
  def pmap(list, fun) do
    list
    |> Enum.map(&spawn_process(&1, self(), fun)) #Lista de procesos que ejecutaron algo
    |> Enum.map(&await/1) #Se recibe cada proceso, se compara o espera el que es con ^ y regresa el resultado
  end

  defp spawn_process(e, caller, fun) do
    spawn_link(fn ->
      send(caller, {self(), fun.(e)})
    end
    )
  end

  defp await(pid) do
    receive do
      {^pid, result} -> result
    end
  end
end
