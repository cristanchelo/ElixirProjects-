defmodule SophosApp.PingPongPr do
  @game_finish 11
  def start_game do
    receive do
      {_pid_send, _move, @game_finish} ->
        IO.puts "Ping Pong has finished..."
      {pid_send, move, turn} ->
        hit_to_opponent(pid_send, switch(move), turn + 1)
        start_game
    after
      10_000 -> IO.puts "time out player #{inspect player_pid}"
    end
  end

  def hit_to_opponent(pid_opp, action, turn) do
    IO.puts "PID #{inspect pid_opp}, Move: #{inspect action}, Turn #{inspect turn}"
    send(pid_opp, {player_pid(), action, turn})
  end

  defp switch(action) do
    case action do
      :ping -> :pong
      _____ -> :ping
    end
  end

  defp player_pid, do: self
end
