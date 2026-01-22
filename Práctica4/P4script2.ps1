$edad = [int](Read-Host "Introduce tu edad")

for ($i = 1; $i -le $edad; $i++) {
    Write-Host $i
}
