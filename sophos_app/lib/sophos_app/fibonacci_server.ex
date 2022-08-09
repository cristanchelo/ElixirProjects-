defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def handle_message(caller) do
    receive do
      {:sequence, n} ->
        result = Fibonacci.sequence(n)
        send(caller, {:fibonacci, n, result})
        handle_message(caller)

      {:status} ->
        send(caller, {:ok, "ok"})
        handle_message(caller)

      {:exit, reason} ->
        IO.puts("bye for #{inspect(reason)}")

      _message ->
        IO.puts("Bad operation")
        handle_message(caller)
      #after
      #  1500 -> IO.puts("Se acabó")
    end
  end
end
