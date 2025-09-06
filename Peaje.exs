defmodule Peaje do
  def main do
    placa =
      "Ingrese la placa del vehículo: "
      |> Util.ingresar(:texto)

    tipo =
      "Ingrese el tipo de vehículo: "
      |> Util.ingresar(:texto)
      |> String.downcase()

    peso =
      "Ingrese el peso del vehículo: "
      |> Util.ingresar(:real)

    {tipo_calculado, tarifa} = calcular_tarifa_final(tipo, peso)

    generar_mensaje(placa, tipo_calculado, tarifa)
    |> Util.mostrar_mensaje()

    {placa, tipo_calculado, tarifa}
  end

  defp calcular_tarifa_final(tipo, peso) do
    cond do
      tipo == "carro" -> {tipo, 10000.0}
      tipo == "moto" -> {tipo, 5000.0}
      tipo == "camion" -> {tipo, 20000.0 + 2000.0 * peso}
      true -> {tipo, 0.0}
    end
  end

  defp generar_mensaje(placa, tipo, tarifa) do
    tarifa_formateada = :erlang.float_to_binary(tarifa, decimals: 0)
                        |> String.replace(~r/\B(?=(\d{3})+(?!\d))/, ".")

    "Vehículo #{placa} (#{String.capitalize(tipo)}) debe pagar $#{tarifa_formateada}"
  end
end

Peaje.main()
