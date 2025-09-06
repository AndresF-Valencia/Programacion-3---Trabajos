defmodule SalarioNeto do
  def main do
  nombre =("Ingrese el nombre del empleado: ")
    |> Util.ingresar(:texto)

  salario_base =
    ("Ingrese el salario base del empleado: ")
    |> Util.ingresar(:real)

  horas_extras =
    ("Ingrese las horas extras trabajadas: ")
    |> Util.ingresar(:entero)

  if horas_extras > 0 do
    valor_hora_extra =
      ("Ingrese el valor por horas extras: ")
      |> Util.ingresar(:entero)

    salario_total = calcular_salario(salario_base, horas_extras, valor_hora_extra)

    generar_mensaje(nombre, salario_total)
    |> Util.mostrar_mensaje()
  else
    generar_mensaje(nombre, salario_base)
    |> Util.mostrar_mensaje()
  end
end
  defp calcular_salario(salario_base, horas_extras, valor) do
    salario = salario_base
    pago_extra = horas_extras * valor * 1.5
    salario + pago_extra
  end
  def generar_mensaje(nombre, salario_total) do
    "El salario total de #{nombre} es de $" <>
    :erlang.float_to_binary(salario_total, decimals: 0)
  end
end

SalarioNeto.main()
