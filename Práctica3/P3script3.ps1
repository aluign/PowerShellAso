$num1 = [int](Read-Host "Introduce el primer número")
$num2 = [int](Read-Host "Introduce el segundo número")

if ($num1 -gt $num2) {
    Write-Host "El primer número es mayor"
} elseif ($num1 -lt $num2) {
    Write-Host "El primer número es menor"
} else {
    Write-Host "Ambos números son iguales"
}
