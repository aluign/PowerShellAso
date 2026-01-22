$ruta = Read-Host "Introduce el nombre del fichero o carpeta"

if (Test-Path $ruta) {
    Write-Host "Existe"
} else {
    Write-Host "No existe"
}
