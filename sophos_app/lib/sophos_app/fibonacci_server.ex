defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci
  def loop() do
    receive do
      {:sequence, caller, n} ->
        result = Fibonacci.sequence(n)
        send(caller, {:fibonacci, n, result})
        loop()

      {:status, caller, msg} ->
        send(caller, {:status, :ok, msg})
        loop()

      {:exit, reason} ->
        IO.puts("bye for #{inspect(reason)}")

      _message ->
        IO.puts("Bad operation")
        loop()
      #after
      #  1500 -> IO.puts("Se acabó")
    end
  end
end
