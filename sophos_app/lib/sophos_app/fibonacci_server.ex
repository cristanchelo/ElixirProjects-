defmodule SophosApp.FibonacciServer do
  alias SophosApp.Fibonacci

  def handle_message({:sequence, n}, caller) do
    result = Fibonacci.sequence(n)
    send(caller, {:fibonacci, n, result})
  end
  def handle_message({:status, n},caller) do
    send(caller, {:ok, caller})
  end
end
