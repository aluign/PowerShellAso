$num = [int](Read-Host "Introduce un número entero positivo")

for ($i = $num; $i -ge 0; $i--) {
    Write-Host -NoNewline "$i"
    if ($i -ne 0) { Write-Host -NoNewline ", " }
}
Write-Host
