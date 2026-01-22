$edad = [int](Read-Host "Introduce la edad")

if ($edad -lt 4) {
    Write-Host "Entrada gratuita"
} elseif ($edad -le 18) {
    Write-Host "Precio: 5€"
} else {
    Write-Host "Precio: 10€"
}
