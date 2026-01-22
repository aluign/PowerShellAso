

$horas = Read-Host "Introduce el número de horas trabajadas"
$coste = Read-Host "Introduce el coste por hora"

$horas = [double]$horas
$coste = [double]$coste

$salario = $horas * $coste

Write-Host "El salario a pagar es: $salario €"



