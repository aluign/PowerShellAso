$num = [int](Read-Host "Introduce un número")

if ($num % 2 -eq 0) {
    Write-Host "El número es PAR"
} else {
    Write-Host "El número es IMPAR"
}
