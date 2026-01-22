$ruta = Read-Host "Introduce una ruta"

if (Test-Path $ruta -PathType Container) {
    Write-Host "Es un directorio. Contenido:"
    Get-ChildItem $ruta -Recurse
} else {
    Write-Host "No es un directorio"
}
