defmodule SophosApp.GenericServer do
  def start(module, [caller]) do
    spawn(module, :loop, [caller])
  end

  def start_link(module, [caller]) do
    spawn_link(module, :loop, [caller])
  end

  def start_monitor(module, [caller]) do
    spawn_monitor(module, :loop, [caller])
  end
end
