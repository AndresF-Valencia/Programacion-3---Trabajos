defmodule ConsumoCombustible do
  def main do
    nombre_conductor =
      "Ingrese el nombre del conductor:"
      |> Util.ingresar(:texto)

    distancia_recorrida =
      "Ingrese la distancia recorrida en kilometros:"
      |> Util.ingresar(:real)

    combustible_consumido =
      "Ingrese el combustible consumido en litros:"
      |> Util.ingresar(:real)

    rendimiento_combustible = calcular_rendimiento({distancia_recorrida, combustible_consumido})
    generar_mensaje(nombre_conductor,rendimiento_combustible)
    |> Util.mostrar_mensaje()
  end
  defp calcular_rendimiento({distancia, combustible}) do
    distancia/combustible
  end
  defp generar_mensaje(nombre,rendimiento) do
    rendimiento = rendimiento |> Float.round(2)
    "Hola #{nombre} tu rendimiento de gasolina es de: #{rendimiento}km/L"
  end
end

ConsumoCombustible.main()
