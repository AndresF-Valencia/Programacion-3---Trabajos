defmodule EnvioPaquete do
  def main do
    cliente = "Ingrese el nombre del cliente: " |> Util.ingresar(:texto)
    peso = "Ingrese el peso del paquete en kg: " |> Util.ingresar(:real)
    tipo_envio = "Ingrese el tipo de envío (Económico, Express, Internacional): "
                 |> Util.ingresar(:texto)
                 |> String.downcase()

    # Usando case con pattern matching
    costo_total = case tipo_envio do
      "economico" -> calcular_economico(peso)
      "express" -> calcular_express(peso)
      "internacional" -> calcular_internacional(peso)
      _ -> 0.0
    end

    generar_mensaje(cliente, peso, tipo_envio, costo_total)
    |> Util.mostrar_mensaje()

    {cliente, peso, tipo_envio, costo_total}
  end

  # Usando cond
  defp calcular_economico(peso) do
    cond do
      peso > 0 -> 5000 * peso
      true -> 0.0
    end
  end

  # Usando cond
  defp calcular_express(peso) do
    cond do
      peso > 0 -> 8000 * peso
      true -> 0.0
    end
  end

  # Usando if
  defp calcular_internacional(peso) do
    if peso <= 5 do
      15000 * peso
    else
      12000 * peso
    end
  end

  defp generar_mensaje(cliente, peso, tipo_envio, costo_total) do
    costo_formateado = :erlang.float_to_binary(costo_total, decimals: 0)
                      |> String.replace(~r/\B(?=(\d{3})+(?!\d))/, ".")
    "Cliente: #{cliente}, Peso: #{peso} kg, Tipo: #{String.capitalize(tipo_envio)}, Costo: $#{costo_formateado}"
  end
end

EnvioPaquete.main()
