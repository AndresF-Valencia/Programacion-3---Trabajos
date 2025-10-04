defmodule Recursividad do
  def main do
    lista = [7, 10, 15, 22, 30]
    matriz = [
      [1, 8, 3],
      [4, 3, 9],
      [2, 5, 7]
    ]

    IO.inspect(contar_pares(lista), label: "Punto 1 (pares)")
    IO.inspect(invertir(lista), label: "Punto 2 (invertida)")
    IO.inspect(suma(matriz), label: "Punto 3 (suma matriz)")
    IO.inspect(transponer(matriz), label: "Punto 4 (transpuesta)")
    IO.inspect(suma_objetivo(lista, 25), label: "Punto 5 (suma objetivo 25)")
  end


  @doc """
  Punto 1
  """
  def contar_pares([]), do: 0

  def contar_pares([head | tail]) when rem(head, 2) == 0 do
    1 + contar_pares(tail)
  end

  def contar_pares([_head | tail]) do
    contar_pares(tail)
  end

  @doc """
  Punto 2
  """
  def invertir([]), do: []

  def invertir([head | tail]) do
    invertir(tail) ++ [head]
  end

  @doc """
  Punto 3
  """
  def suma([]), do: 0

  def suma([fila | resto]) do
    Enum.sum(fila) + suma(resto)
  end

  @doc """
  Punto 4
  """
  def transponer([]), do: []

  def transponer([[] | _]), do: []

  def transponer(matriz) do
    columna = Enum.map(matriz, fn [head | _] -> head end)
    resto = Enum.map(matriz, fn [_ | tail] -> tail end)

    [columna | transponer(resto)]
  end
  @doc """
  Punto 5
  """
  def suma_objetivo(_, 0), do: true

  def suma_objetivo([], _objetivo), do: false

  def suma_objetivo([head | tail], objetivo) do
    suma_objetivo(tail, objetivo - head) or suma_objetivo(tail, objetivo)
  end
end

Recursividad.main()
