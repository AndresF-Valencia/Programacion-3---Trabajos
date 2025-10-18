defmodule Sudoku do
  @doc """
  Este módulo resuelve un Sudoku 4x4 usando el algoritmo de backtracking.
  El número 0 representa una celda vacía.
  """

  # -------------------------
  # FUNCION PRINCIPAL
  # -------------------------
  def resolver(tablero) do
    posicion_vacia = buscar_vacio(tablero)

    if posicion_vacia == nil do
      # Si no hay celdas vacías, el Sudoku está resuelto
      tablero
    else
      {fila, columna} = posicion_vacia
      probar_numeros(tablero, fila, columna, 1)
    end
  end

  # -------------------------
  # PROBAR NUMEROS EN UNA CELDA (CON IMPRESIÓN)
  # -------------------------
  defp probar_numeros(tablero, fila, columna, numero) do
    if numero > 4 do
      IO.puts("↩️ No hay más opciones válidas para (#{fila}, #{columna}), retrocediendo...")
      nil
    else
      if es_valido(tablero, fila, columna, numero) do
        IO.puts("🧠 Intentando colocar #{numero} en posición (#{fila}, #{columna})")
        nuevo_tablero = poner_numero(tablero, fila, columna, numero)
        imprimir_tablero(nuevo_tablero)

        resultado = resolver(nuevo_tablero)

        if resultado != nil do
          resultado
        else
          IO.puts("❌ #{numero} en (#{fila}, #{columna}) no lleva a solución, probando siguiente número...")
          probar_numeros(tablero, fila, columna, numero + 1)
        end
      else
        # Si el número no es válido, pasa al siguiente
        probar_numeros(tablero, fila, columna, numero + 1)
      end
    end
  end

  # -------------------------
  # BUSCAR CELDA VACIA
  # -------------------------
  defp buscar_vacio(tablero) do
    Enum.reduce_while(0..3, nil, fn fila, _ ->
      indice_columna = Enum.find_index(Enum.at(tablero, fila), fn valor -> valor == 0 end)

      if indice_columna == nil do
        {:cont, nil}
      else
        {:halt, {fila, indice_columna}}
      end
    end)
  end

  # -------------------------
  # COLOCAR UN NUMERO EN EL TABLERO
  # -------------------------
  defp poner_numero(tablero, fila, columna, numero) do
    nueva_fila = List.replace_at(Enum.at(tablero, fila), columna, numero)
    List.replace_at(tablero, fila, nueva_fila)
  end

  # -------------------------
  # VERIFICAR SI UN NUMERO ES VALIDO
  # -------------------------
  defp es_valido(tablero, fila, columna, numero) do
    no_en_fila = not Enum.member?(Enum.at(tablero, fila), numero)
    no_en_columna = revisar_columna(tablero, columna, numero)
    no_en_cuadro = revisar_cuadro(tablero, fila, columna, numero)

    no_en_fila and no_en_columna and no_en_cuadro
  end

  # -------------------------
  # REVISAR COLUMNA
  # -------------------------
  defp revisar_columna(tablero, columna, numero) do
    Enum.all?(tablero, fn fila -> Enum.at(fila, columna) != numero end)
  end

  # -------------------------
  # REVISAR CUADRO 2x2
  # -------------------------
  defp revisar_cuadro(tablero, fila, columna, numero) do
    fila_inicio = div(fila, 2) * 2
    columna_inicio = div(columna, 2) * 2
    Enum.all?(fila_inicio..(fila_inicio + 1), fn f ->
      Enum.all?(columna_inicio..(columna_inicio + 1), fn c ->
        Enum.at(Enum.at(tablero, f), c) != numero
      end)
    end)
  end

  # -------------------------
  # IMPRIMIR TABLERO
  # -------------------------
  def imprimir_tablero(tablero) do
    Enum.each(tablero, fn fila ->
      fila
      |> Enum.map(&Integer.to_string/1)
      |> Enum.join(" ")
      |> IO.puts()
    end)
    IO.puts("----------------")
  end
end

# -------------------------
# EJEMPLO DE USO
# -------------------------
tablero = [
  [1, 4, 0, 0],
  [0, 0, 0, 1],
  [0, 2, 0, 0],
  [3, 0, 0, 0]
]

IO.puts("🧩 Sudoku inicial:")
Sudoku.imprimir_tablero(tablero)

IO.puts("🚀 Iniciando resolución...\n")
solucion = Sudoku.resolver(tablero)

IO.puts("✅ Sudoku resuelto:")
Sudoku.imprimir_tablero(solucion)
