defmodule SophosApp.GenericServer do
  def start(module, args) do
    spawn(module, :loop, args)
  end

  def start_link(module, args) do
    spawn_link(module, :loop, args)
  end

  def start_monitor(module, args) do
    spawn_monitor(module, :loop, args)
  end
end
