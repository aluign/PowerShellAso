# Leer el archivo CSV
$Usuarios = Import-Csv ".\usuarios.csv"

# Recorrer los usuarios con foreach
foreach ($Usuario in $Usuarios) {

    Write-Host "Nombre: $($Usuario.nombre)"
    Write-Host "Apellidos: $($Usuario.apellidos)"
    Write-Host "Grupo: $($Usuario.grupo)"
    Write-Host "-----------------------------"
}
