$altura = [int](Read-Host "Introduce la altura")

for ($i = 1; $i -le $altura; $i++) {
    Write-Host ("*" * $i)
}
