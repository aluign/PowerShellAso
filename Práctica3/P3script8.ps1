$nombre = Read-Host "Introduce tu nombre"
$sexo = Read-Host "Introduce tu sexo (H/M)"

$letra = $nombre.Substring(0,1).ToUpper()

if (($sexo -eq "M" -and $letra -lt "M") -or ($sexo -eq "H" -and $letra -gt "N")) {
    Write-Host "Perteneces al grupo A"
} else {
    Write-Host "Perteneces al grupo B"
}
