defmodule SophosApp.Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi #{name}"
    end
  end
end
