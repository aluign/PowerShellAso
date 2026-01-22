$numeroSecreto = 42

do {
    $intento = [int](Read-Host "Adivina el número (0-100)")
    
    if ($intento -lt $numeroSecreto) {
        Write-Host "El número es mayor"
    } elseif ($intento -gt $numeroSecreto) {
        Write-Host "El número es menor"
    } else {
        Write-Host "¡Enhorabuena! Has adivinado el número"
    }
} while ($intento -ne $numeroSecreto)
