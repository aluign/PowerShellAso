

$num1 = Read-Host "Introduce el primer número"
$num2 = Read-Host "Introduce el segundo número"

$num1 = [double]$num1
$num2 = [double]$num2

Write-Host "Suma: " ($num1 + $num2)
Write-Host "Resta: " ($num1 - $num2)
Write-Host "Multiplicación: " ($num1 * $num2)

if ($num2 -ne 0) {
    Write-Host "División: " ($num1 / $num2)
    Write-Host "Resto: " ($num1 % $num2)
} else {
    Write-Host "No se puede dividir entre cero"
}
