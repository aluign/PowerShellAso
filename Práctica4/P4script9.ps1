$correcta = "contraseña"
$entrada = ""

while ($entrada -ne $correcta) {
    $entrada = Read-Host "Introduce la contraseña"
}

Write-Host "Contraseña correcta"
