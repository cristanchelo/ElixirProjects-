defmodule SophosApp.FibonacciGenServer do
  @moduledoc """
  Módulo con el llamado del módulo SophosApp.Fibonacci usando
  la macro GenServer
  """
  use GenServer
  alias SophosApp.Fibonacci

  #Client API

  @doc """
  Función para iniciar el proceso GenServer con start_link
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @doc """
  Función para llamar a la implementación de la función handle_cast
  para llamados asincronos de una función.
  """
  def compute(n) do
    GenServer.cast(__MODULE__, {:sequence, n})
  end

  @doc """
  Función para llamar a la implementación de la función handle_call
  para llamados síncronos de una función que termina un proceso.
  """
  def crash() do
    GenServer.call(__MODULE__, :crash)
  end

  @doc """
  Función para llamar a la implementación de la función handle_call
  para llamados síncronos de una función que devuelve el estado del proceso.
  """
  def status() do
    GenServer.call(__MODULE__, {:status})
  end

  #Callbacks

  @doc """
  Función Callback con la implementación de la función init
  que inicia un proceso y lo deja en espera de mensajes.
  """
  def init(_args) do
    {:ok, %{}}
  end

  @doc """
  Función Callback con la implementación de la función handle_call para llamados síncronos
  que finaliza el proceso que lo llamó.
  """
  def handle_call(:crash, _from, state) do
    Process.exit(self(), :kill)
    {:reply, 0, state}
  end

  @doc """
  Función Callback con la implementación de la función handle_call para llamados síncronos
  que llama una función y almacena el resultado de la misma en un estado.
  """
  def handle_call({:sequence, n}, _from, state) when n >= 0 do
    result = compute_sequence(n, state)
    new_state = Map.put_new(state, n, result)
    {:reply, result, new_state}
  end

  @doc """
  Función Callback con la implementación de la función handle_call para llamados síncronos
  que devuelve los estados de ejecución de un proceso.
  """
  def handle_call({:status}, _from, state) do
    {:reply, state, state}
  end

  @doc """
  Función Callback con la implementación de la función handle_cast para llamados asíncronos
  que llama una función y almacena el resultado de la misma en un estado.
  """
  def handle_cast({:sequence, n}, state) do
    result = compute_sequence(n, state)
    new_state = Map.put_new(state, n, result)
    {:noreply, new_state}
  end

  @doc """
  Función Callback con la implementación de la función handle_info
  que devuelve información de mensajes que llegan a un proceso, que pueden ser asíncronos o síncronos.
  """
  def handle_info(msg, state) do
    IO.inspect(msg)
    {:noreply, state}
  end

  defp compute_sequence(n, state) do
      state
      |>Map.fetch(n)
      |>case do
        {:ok, r} -> r
        :error -> Fibonacci.sequence(n)
      end
  end
end
