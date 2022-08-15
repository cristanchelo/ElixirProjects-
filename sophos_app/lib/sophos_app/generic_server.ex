defmodule SophosApp.GenericServer do
  @moduledoc """
  Módulo con las funciones generales para ejecución de procesos.
  """

  @doc """
  Función para crear un proceso vinculado con estado.
  """
  def start(module, init, caller \\ self()) do
    Process.flag(:trap_exit, true)
    spawn_link(__MODULE__, :loop, [module, caller, init])
  end

  @doc """
  Función para llamar a la función handle_message al momento de recibir un mensaje de un proceso.
  Obtiene el resultado y el estado del proceso.
  """
  def loop(module, caller, state) do
    receive do
      msg ->
        {:ok, result, new_state} = module.handle_message(msg, caller, state)
        send(caller, result)
        loop(module, caller, new_state)
    end
  end

  @doc """
  Función para crear un proceso con estado.
  Se relaciona con una función que recibe otro proceso y un mensaje.
  """
  def start_process(module, init, caller \\ self()) do
    Process.flag(:trap_exit, true)
    spawn(__MODULE__, :loop_change_process, [module, caller, init])
  end

  @doc """
  Función para llamar a la función handle_message al momento de recibir un proceso y su mensaje.
  Obtiene el resultado del proceso y hace un nuevo envio de mensaje con el proceso recibido por el anterior.
  """
  def loop_change_process(module, caller, state) do
    receive do
      {pid_sender, msg} ->
        {:ok, result, new_state} = module.handle_message({pid_sender, msg}, caller, state)
        send(pid_sender, result)
        loop_change_process(module, pid_sender, new_state)
    end
  end
end
