defmodule SophosApp.GenericServer do
  def start(module, caller) do
    spawn(module, :handle_message, [caller])
  end

  def start_link(module, caller) do
    spawn_link(module, :handle_message, [caller])
  end

  def start_monitor(module, caller) do
    spawn_monitor(module, :handle_message, [caller])
  end
end
