$puntuacion = [double](Read-Host "Introduce la puntuación")

if ($puntuacion -eq 0.0) {
    $nivel = "Inaceptable"
} elseif ($puntuacion -eq 0.4) {
    $nivel = "Aceptable"
} elseif ($puntuacion -ge 0.6) {
    $nivel = "Meritorio"
} else {
    Write-Host "Puntuación no válida"
    exit
}

$dinero = 2400 * $puntuacion
Write-Host "Nivel:" $nivel
Write-Host "Cantidad recibida:" $dinero "€"
