defmodule SophosApp.PingPongProc do
  @moduledoc """
  Módulo para ejecutar Ping Pong de procesos

  Basado en los siguientes ejemplos:
  https://github.com/oelizondo/pingpong/blob/master/pingpong.exs
  https://github.com/aviabird/elixir-beginner/blob/master/ping-pong.exs
  """
  @doc """
  Función para recibir el proceso a validar con su mensaje
  """
  def handle_message({pid_sender, turn}, caller, state) do
    IO.puts "PID #{inspect pid_sender}, turn #{inspect turn}"
    :timer.sleep(1000)
    result = switch(turn)
    {:ok, {self, result}, [result | state]}
  end

  @doc """
  Función para ejecutar estado de proceso
  """
  def handle_message({:status}, caller, state ) do
    {:ok, state, state}
  end

  @doc """
  Función para cambiar turno: en caso de que la acción no sea :ping ni :pong, por defecto será :ping
  """
  def switch(action) when action != :pong and action != :ping, do: :ping

  @doc """
  Función para cambiar turno en caso de que la acción sea :ping, cambiará el turno a :pong
  """
  def switch(action) when action == :ping, do: :pong

  @doc """
  Función para cambiar turno en caso de que la acción sea :pong, cambiará el turno a :ping
  """
  def switch(action) when action == :pong, do: :ping

  @doc """
  Función para crear procesos basados en el método switch. Usado solo de ejemplo.
  """
  def start do
    ping_pid = spawn(__MODULE__, :switch, [:ping])
    pong_pid = spawn(__MODULE__, :switch, [:pong])
    {ping_pid, pong_pid}
  end
end
