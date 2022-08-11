defmodule SophosApp.PingPongProc do

  def handle_message({:message, msg}, caller, state) do
    IO.puts "PID #{inspect caller}, turn #{inspect msg}"
    :timer.sleep(500)
    {:ok, switch(msg), state + 1}
  end

  def handle_message({:status}, caller, state ) do
    {:ok, state, state}
  end

  def switch(action) when action != :pong and action != :ping, do: :ping
  def switch(action) when action == :ping, do: :pong
  def switch(action) when action == :pong, do: :ping

  def start do
    ping_pid = spawn(__MODULE__, :switch, [:ping])
    pong_pid = spawn(__MODULE__, :switch, [:pong])
    {ping_pid, pong_pid}
  end
end
