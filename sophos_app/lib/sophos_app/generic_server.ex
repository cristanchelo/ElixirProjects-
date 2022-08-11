defmodule SophosApp.GenericServer do
  def start(module, caller_1) do
    spawn( fn -> loop(module, caller_1, 0) end)
  end

  def start_processes(module, caller_1, caller_2) do
    spawn( fn -> loop_processes(module, caller_1, caller_2, 0) end)
  end

  def loop(module, caller_1, state) do
    receive do
      msg ->
        {:ok, result, new_state} = module.handle_message(msg, caller_1, state)
        send(caller_1, result)
        loop(module, caller_1, new_state)
    end
  end

  def loop_processes(module, caller_1, caller_2, state) do
    receive do
      msg ->
        {:ok, result, new_state} = module.handle_message(msg, caller_1, state)
        send(caller_2, result)
        loop_processes(module, caller_2, caller_1, new_state)
    end
  end
end
