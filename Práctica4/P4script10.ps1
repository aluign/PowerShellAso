do {
    Write-Host "`n===== MENÚ ====="
    Write-Host "a) Crear una carpeta"
    Write-Host "b) Crear un fichero nuevo"
    Write-Host "c) Cambiar el nombre de un fichero o carpeta"
    Write-Host "d) Borrar un archivo o carpeta"
    Write-Host "e) Verificar si existe un fichero o carpeta"
    Write-Host "f) Mostrar el contenido de un directorio"
    Write-Host "g) Mostrar fecha y hora actuales"
    Write-Host "x) Salir"

    $opcion = Read-Host "Elige una opción"

    switch ($opcion) {
        "a" {
            $nombre = Read-Host "Nombre de la carpeta"
            New-Item -ItemType Directory -Name $nombre
        }
        "b" {
            $nombre = Read-Host "Nombre del fichero"
            New-Item -ItemType File -Name $nombre
        }
        "c" {
            $ruta = Read-Host "Ruta actual"
            $nuevo = Read-Host "Nuevo nombre"
            Rename-Item $ruta $nuevo
        }
        "d" {
            $ruta = Read-Host "Ruta a borrar"
            Remove-Item $ruta -Recurse -Force
        }
        "e" {
            $ruta = Read-Host "Ruta a comprobar"
            if (Test-Path $ruta) {
                Write-Host "Existe"
            } else {
                Write-Host "No existe"
            }
        }
        "f" {
            $ruta = Read-Host "Ruta del directorio"
            Get-ChildItem $ruta
        }
        "g" {
            Get-Date
        }
        "x" {
            Write-Host "Saliendo..."
        }
        default {
            Write-Host "Opción no válida"
        }
    }
} while ($opcion -ne "x")
