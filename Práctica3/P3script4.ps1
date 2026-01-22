Write-Host "****** CALCULADORA ******"
Write-Host "1. Sumar"
Write-Host "2. Restar"
Write-Host "3. Multiplicar"
Write-Host "4. Dividir"

$opcion = Read-Host "Elige una opción"
$num1 = [double](Read-Host "Introduce el primer número")
$num2 = [double](Read-Host "Introduce el segundo número")

switch ($opcion) {
    1 { Write-Host "Resultado:" ($num1 + $num2) }
    2 { Write-Host "Resultado:" ($num1 - $num2) }
    3 { Write-Host "Resultado:" ($num1 * $num2) }
    4 {
        if ($num2 -ne 0) {
            Write-Host "Resultado:" ($num1 / $num2)
        } else {
            Write-Host "No se puede dividir entre cero"
        }
    }
    default { Write-Host "Opción no válida" }
}
