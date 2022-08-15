defmodule SophosApp.Hello do
  @moduledoc """
  Módulo con un ejemplo para la definición de Macros en Elixir
  """
  defmacro __using__(opts) do #Se coloca _ para ignorar el parámetro
    greet = Keyword.get(opts, :greetings, "Hi")
    quote do
      def hello(name), do: unquote(greet) <> ", " <> name
    end
  end
end
