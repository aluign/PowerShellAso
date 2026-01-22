$tipo = Read-Host "¿Quieres una pizza vegetariana? (si/no)"

if ($tipo -eq "si") {
    Write-Host "Ingredientes disponibles:"
    Write-Host "1. Pimiento"
    Write-Host "2. Tofu"
    $ing = Read-Host "Elige un ingrediente"
    $ingrediente = if ($ing -eq 1) { "Pimiento" } else { "Tofu" }
    Write-Host "Pizza vegetariana con mozzarella, tomate y $ingrediente"
} else {
    Write-Host "Ingredientes disponibles:"
    Write-Host "1. Peperoni"
    Write-Host "2. Jamón"
    Write-Host "3. Salmón"
    $ing = Read-Host "Elige un ingrediente"
    switch ($ing) {
        1 { $ingrediente = "Peperoni" }
        2 { $ingrediente = "Jamón" }
        3 { $ingrediente = "Salmón" }
    }
    Write-Host "Pizza no vegetariana con mozzarella, tomate y $ingrediente"
}
