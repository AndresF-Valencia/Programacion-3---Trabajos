defmodule Libro do
  def main do
    titulo = "Ingrese el titulo del libro: "
    |> Util.ingresar(:texto)

    unidades = "Ingrese la cantidaddeunidades disponibles: "
    |> Util.ingresar(:entero)

    precio = "Ingrese el precio unitario: "
    |> Util.ingresar(:real)


    precio_inventario = calcular_precio_inventario(unidades, precio)
    generar_mensaje(titulo, unidades,precio_inventario)
    |> Util.mostrar_mensaje()
  end

defp calcular_precio_inventario(unidades, precio)do
 unidades * precio
end

defp generar_mensaje(titulo, unidades,precio_inventario)do
"El Libro #{titulo} tiene #{unidades}, con un valor de #{precio_inventario}"
end
end

Libro.main()
