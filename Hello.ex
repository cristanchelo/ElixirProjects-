defmodule Hello do
  def saludo(name \\ "tu") do
    "Hello #{name} !!!"
  end
end

IO.puts(Hello.saludo("Cristian"))
