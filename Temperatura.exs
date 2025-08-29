defmodule Temperatura do
  def main do
    nombre = Util.ingresar("Ingrese el nombre del usuario: ", :texto)

    celsius = Util.ingresar("Ingrese la temperatura en grados Celsius: ", :real)

    {fahrenheit, kelvin} = calcular_las_temperaturas(celsius)

    generar_mensaje(nombre, fahrenheit, kelvin)
    |> Util.mostrar_mensaje()
  end

  defp calcular_las_temperaturas(celsius)do
    fahrenheit = (celsius * 9/5) + 32
    kelvin = celsius + 237.15
    {fahrenheit, kelvin}
  end

  defp generar_mensaje(nombre, fahrenheit, kelvin)do
  "#{nombre} la temperatura es: #{fahrenheit} °F #{kelvin} K"
 end
end

Temperatura.main()
