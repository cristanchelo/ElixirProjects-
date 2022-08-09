defmodule SophosApp.FactorialServer do
  alias SophosApp.Factorial
  def start() do
    spawn(__MODULE__, :loop, [{0}])
  end

  def start_link() do
    spawn_link(__MODULE__, :loop, [{0}])
  end

  def start_monitor() do
    spawn_monitor(__MODULE__, :loop, [{0}])
  end

  def loop({counter} = state) do
    receive do
      {:compute, caller, n} ->
        result = Factorial.of(n)
        send(caller, {:compute, n, result})
        loop(counter + 1)

      {:status, caller} ->
        send(caller, {:ok, state})
        loop(state)

      {:exit, reason} ->
        IO.puts("bye for #{inspect(reason)}")

      _message ->
        IO.puts("Bad operation")
        loop(state)
      #after
      #  1500 -> IO.puts("Se acabó")
    end
  end
end
