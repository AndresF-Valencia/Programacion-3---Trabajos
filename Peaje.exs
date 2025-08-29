defmodule Peaje do
  def main do
    placa = Util.ingresar("Ingrese la placa del vehículo: ", :texto)
    tipo = Util.ingresar("Ingrese el tipo de vehículo: ", :texto)
    peso = Util.ingresar("Ingrese el peso del vehículo: ", :real)

    {tipo, peso} = calcular_tarifa_final(tipo,peso)

    generar_mensaje(placa, tipo, tarifa_final)
    |> Util.mostrar_mensaje()
  end

  defp calcular_tarifa_final(tipo, peso)do
    cond do
    tipo == "carro" -> {tipo, 10000}
    tipo == "moto" -> {tipo, 5000}
    tipo == "camion" -> {tipo, 20000 + 2000 * peso}
    true -> {tipo, 0}
   end
  end

  defp generar_mensaje(placa, tipo, tarifa_final)do
  "Vehiculo #{placa} (#{tipo}) debe pagar #{tarifa_final}"
 end
end

Peaje.main()
