
$num = [int](Read-Host "Introduce un número entero positivo")

for ($i = 1; $i -le $num; $i += 2) {
    Write-Host -NoNewline "$i"
    if ($i + 2 -le $num) { Write-Host -NoNewline ", " }
}
Write-Host
