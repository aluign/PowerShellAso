# =========================
# FUNCIONES
# =========================

function Sumar ($a, $b) {
    return $a + $b
}

function Restar ($a, $b) {
    return $a - $b
}

function Multiplicar ($a, $b) {
    return $a * $b
}

function Dividir ($a, $b) {
    if ($b -eq 0) {
        return "Error: no se puede dividir entre 0"
    } else {
        return $a / $b
    }
}

# =========================
# PROGRAMA PRINCIPAL
# =========================

do {
    Write-Host "****** CALCULADORA ********"
    Write-Host "1. Sumar"
    Write-Host "2. Restar"
    Write-Host "3. Multiplicar"
    Write-Host "4. Dividir"
    Write-Host "5. Salir"

    $opcion = Read-Host "¿Qué desea hacer? Elige una opción"

    if ($opcion -ge 1 -and $opcion -le 4) {
        $num1 = [double](Read-Host "Introduce el primer número")
        $num2 = [double](Read-Host "Introduce el segundo número")
    }

    switch ($opcion) {
        1 { Write-Host "Resultado: $(Sumar $num1 $num2)" }
        2 { Write-Host "Resultado: $(Restar $num1 $num2)" }
        3 { Write-Host "Resultado: $(Multiplicar $num1 $num2)" }
        4 { Write-Host "Resultado: $(Dividir $num1 $num2)" }
        5 { Write-Host "Saliendo de la calculadora..." }
        default { Write-Host "Opción no válida" }
    }

    Write-Host ""

} while ($opcion -ne 5)
