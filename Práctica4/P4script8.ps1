$altura = [int](Read-Host "Introduce la altura")

for ($i = $altura; $i -ge 1; $i--) {
    Write-Host ("*" * $i)
}
