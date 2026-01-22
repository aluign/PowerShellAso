$renta = [double](Read-Host "Introduce tu renta anual")

if ($renta -lt 10000) {
    Write-Host "Tipo impositivo: 5%"
} elseif ($renta -lt 20000) {
    Write-Host "Tipo impositivo: 15%"
} elseif ($renta -lt 35000) {
    Write-Host "Tipo impositivo: 20%"
} elseif ($renta -lt 60000) {
    Write-Host "Tipo impositivo: 30%"
} else {
    Write-Host "Tipo impositivo: 45%"
}
