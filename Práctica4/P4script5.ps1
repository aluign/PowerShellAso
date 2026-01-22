$num = [int](Read-Host "Introduce un número")

for ($i = 1; $i -le 10; $i++) {
    Write-Host "$num x $i = " ($num * $i)
}
