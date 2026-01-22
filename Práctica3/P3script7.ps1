$contrasena = "contraseña"
$entrada = Read-Host "Introduce la contraseña"

if ($entrada.ToLower() -eq $contrasena.ToLower()) {
    Write-Host "Contraseña correcta"
} else {
    Write-Host "Contraseña incorrecta"
}
