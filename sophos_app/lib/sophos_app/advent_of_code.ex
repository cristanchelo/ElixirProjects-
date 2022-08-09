defmodule SophosApp.AdventOfCode.Day1 do
  @moduledoc """
  Módulo para ejercicio de AdventOfCode 2015 Día 1:
  Saber la ubicación de Santa en un edificio en una cadena de texto con los siguientes valores
  ( = Un piso hacia arriba +1
  ) = Un piso hacia abajo -1
  """
  @alias
  alias SophosApp.MyList
  @impl
  import String, only: [split: 3]

  @doc """
  Advent of Code 2015: Día 1 - Estrella 1
  Sumar las coincidencias partiendo de un valor en cero.
  Hace uso de funciones privadas y pattern matching.
  """
  def deliver_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |> evaluate(0)
  end

  @doc """
  Advent of Code 2015: Día 1 - Estrella 1
  Sumar las coincidencias partiendo de la suma de los elementos de una lista
  transformada en valores equivalentes a cada uno de los dos caracteres.
  Hace uso de funciones privadas y pattern matching.
  """
  def deliver_2_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |> transform([])
    |> MyList.sum()
  end

  @doc """
  Advent of Code 2015: Día 1 - Estrella 1
  Uso del módulo Enum y la función reduce para resolver el ejercicio 1
  del número de piso según la cadena de caracteres.
  Enum.reduce(list, 0, fn
      "(", acc -> acc + 1
      ")", acc -> acc - 1
    end
  """
  def deliver_3_enum_reduce_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |>Enum.reduce(0, fn
      "(", acc -> acc + 1
      ")", acc -> acc - 1
    end)
  end

  @doc """
  Advent of Code 2015: Día 1 - Estrella 1
  Uso del módulo Enum y las funciones map y sum para resolver el ejercicio 1
  del número de piso según la cadena de caracteres.
  Enum.map(lista, fn
      "(" -> 1
      ")" -> -1
    end)
  |>Enum.sum()
  """
  def deliver_3_enum_sum_star_1(instructions) do
    instructions
    |> split("", trim: true)
    |> Enum.map(fn
      "(" -> 1
      ")" -> -1
    end)
    |>Enum.sum()
  end

  @doc """
  Advent of Code 2015: Día 1 - Estrella 2
  Uso del módulo Enum y las funciones map y sum para resolver el ejercicio 2
  de la primera ubicación de la bodega o piso -1 dentro la cadena de caracteres.
  Enum.map(lista, fn
      "(" -> 1
      ")" -> -1
    end)
  |>Enum.sum()
  """
  def position_start_2(instructions, pos) do
    instructions
    |> split("", trim: true)
    |> Enum.map(fn
      "(" -> 1
      ")" -> -1
    end)
    |> transform_pos(0, 0, pos)
  end

  defp evaluate([], floor), do: floor
  defp evaluate([h | t], floor) do
    evaluate(t, walk(floor, h))
  end

  defp walk(floor, "("), do: floor+1
  defp walk(floor, ")"), do: floor-1

  defp transform([], list), do: list
  defp transform(["(" | t], list) do
    transform(t, list ++ [1])
  end
  defp transform([")" | t], list) do
    transform(t, [-1] ++ list )
  end

  defp transform_pos([h | t], floor, pos, val) when floor != val, do: transform_pos(t, floor + h, pos + 1, val)
  defp transform_pos(list, floor, pos, val) when list == [] or floor == -1, do: pos
end

defmodule SophosApp.AdventOfCode.Day2 do
  @moduledoc """
  Módulo para ejercicio de AdventOfCode 2015 Día 2:
  Calcular la cantidad de papel necesario para envolver un presente, de la forma de prisma rectangular recto:
  length l, width w, height h
  """
  @impl
  import String, only: [split: 3]

  @doc """
  Advent of Code 2015: Día 2 - Estrella 1
  Dado una lista de cadenas de la forma LxWxH, que representan las dimensiones de todos
  las cajas usadas para los presentes de navidad, de la forma de un prisma reactangular recto,
  obtener el área superficial de la caja más el área mínima de una de las caras
  para calcular el total de área total superficial necesaria de papel para
  cada uno de los regalos.
  """
  def total_paper_sup_areas_star_1(list_box_dimension) do
    split_scape_char(list_box_dimension)
    |>Enum.map(&box_superficial_area/1)
    |>Enum.sum()
  end

  @doc """
  Dado un string de la forma L*W*H, obtener una lista de enteros [L, W, H] que representan
  los lados de un prisma rectangular recto, obtener el área superficial total necesaria de
  papel para poder cubrir la caja.
  """
  defp box_superficial_area(box_dimension) do
    box_dimension
    |>split_integer_list
    |>get_paper_sup_area
  end

  @doc """
  Dada una una lista de enteros [L, W, H] que representan
  los lados de un prisma rectangular recto,
  obtener el área superficial total necesaria de papel para poder cubrir la caja.
  """
  defp get_paper_sup_area ([l, w, h]) do
    sup_areas =  [l*w, w*h, h*l]
    total_sup_area = 2 * Enum.sum(sup_areas)
    min_area = Enum.min(sup_areas)
    paper_sup_area = total_sup_area + min_area
  end

  @doc """
  Advent of Code 2015: Día 2 - Estrella 2
  Dado una lista de cadenas de la forma L*W*H, obtener, por cada cadena, una lista [L, W, H].
  Luego, obtener el perímetro mínimo de una de las caras
  para poder cruzar la cinta más el volumen de cada caja con el cual
  calcular la cantidad de cinta a envolver por todos los presentes.
  """
  def total_ribbon_star_2(list_box_dimension) do
    split_scape_char(list_box_dimension)
    |>Enum.map(&box_perimeter/1)
    |>Enum.sum()
  end

  @doc """
  Dado un string de la forma L*W*H, obtener una lista de enteros [L, W, H] que representan
  los lados de un prisma rectangular recto.
  Luego, obtener el perímetro mínimo de una de las caras
  para poder cruzar la cinta más el volumen de cada caja con el cual
  calcular la cantidad de cinta a envolver por todos los presentes.
  """
  defp box_perimeter(box_dimension) do
    box_dimension
    |>split_integer_list
    |>get_ribbon_required
  end

  @doc """
  Dado una lista de enteros [L, W, H] que representan los lados de un prisma rectangular recto,
  obtener el perímetro mínimo de uno de los lados.
  Luego sumar el producto de los lados del prisma.
  """
  defp get_ribbon_required([l, w, h] = dimension) do
    min_perimeters = [2*l + 2*w, 2*w + 2*h, 2*h + 2*l] |> Enum.min()
    total_ribbon = min_perimeters + Enum.product(dimension)
  end

  @doc """
  Dada una cadena de la forma "LxWxH" donde L, W y H son enteros
  obtener una lista de enteros [L, W, H]
  """
  defp split_integer_list(string_val) do
    string_val
    |>split("x", trim: true)
    |>Enum.map(&String.to_integer/1) #Función llamada con el operador & y de paridad 1
  end

  @doc """
  Dada cadena de la forma "L1xW1xH1\r\nL2xW2xH2\r\n...LnxWnxHn"
  obtener una lista de cadenas de la forma ["L1xW1xH1", L2xW2xH2, ..., LnxWnxHn]
  """
  defp split_scape_char(string_val) do
    Regex.replace(~r/\n/, string_val, "")
    |>split("\r", trim: true)
  end
end

defmodule SophosApp.AdventOfCode.Day3 do
  @moduledoc """
  Módulo para ejercicio de AdventOfCode 2015 Día 3:
  Calcular el número de casas que visita Santa para entregar, al menos, un regalo.
  https://windmaomao.medium.com/kotlin-day-3-e41f300e23c0
  """
  @impl
  import String, only: [split: 3]

  @doc """
  Advent of Code 2015: Día 3 - Estrella 1
  Dado una serie de indicaciones por coordenadas, indicar el número de casas en las cuales
  se entregó al menos un regalo.
  ^ -> Norte -> [0, 1]
  v -> Sur   -> [0, -1]
  > -> Este  -> [1, 0]
  < -> Oeste -> [-1, 0]
  """
  def get_houses_number_star_1(list_routes) do
    list_directions = [[0,0] | split(list_routes,"", trim: true)|>get_route_information()]
    list_directions
    |>Enum.scan(fn ([x,y], [dx,dy]) -> [x+dx,y+dy] end)
    |>Enum.uniq()
    |>Enum.count()
  end

  @doc """
  Dado un carácter, obtener la lista de enteros [X, Y] que representa el
  movimiento que hace Santa para dirigirse a la próxima casa a entregar un presente
  """
  defp get_route_information(route), do: Enum.map(route, fn
    "^" -> [0,1]
    "v" -> [0,-1]
    ">" -> [1,0]
    "<" -> [-1,0]
  end)

  @doc """
  Advent of Code 2015: Día 3 - Estrella 2
  Dado una serie de indicaciones por coordenadas, indicar el número de casas en las cuales
  se entregó al menos un regalo, teniendo en cuenta que los entregan Santa y Robo-Santa
  empezando en [0,0] y cada uno se turna para realizar la respectiva entrega en las ubicaciones
  indicadas
  ^ -> Norte -> [0, 1]
  v -> Sur   -> [0, -1]
  > -> Este  -> [1, 0]
  < -> Oeste -> [-1, 0]
  """
  def get_two_houses_number_star_2(list_routes) do
    list_directions = [[0,0] | split(list_routes,"", trim: true)|>get_route_information()]
    two_routes = list_directions
    |>Enum.with_index()
    |>Enum.group_by(fn {_,y}  -> rem(y,2) == 0 end)
    list_first_partner = Map.get(two_routes, :true)
                         |>Enum.map(fn {value, _} -> value end)
    list_second_partner = Map.get(two_routes, :false)
                         |>Enum.map(fn {value, _} -> value end)
    include_total_routes = get_complete_houses_info(list_first_partner) ++ get_complete_houses_info(list_second_partner)
    include_total_routes
    |>Enum.uniq()
    |>Enum.count()
  end

  @doc """
  Dado una lista con unas determinadas coordenadas [[x,y], [x1,y1], ...,[xn,yn]]
  obtener una lista única con los pasos o recorridos acumulados desde [x,y] hasta [xn, yn]
  """
  defp get_complete_houses_info(list_routes_index) do
    list_routes_index
    |>Enum.scan(fn ([x,y], [dx,dy]) -> [x+dx,y+dy] end)
    |>Enum.uniq()
  end
end
