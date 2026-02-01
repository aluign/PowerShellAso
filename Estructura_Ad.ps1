<#
SCRIPT: crear_estructura_ad.ps1
DESCRIPCIÓN:
    Script para crear la estructura de Active Directory del dominio empresa.local
    a partir de archivos CSV.

    - Crea la OU Empresa
    - Crea OUs por departamento
    - Crea grupos globales por departamento
    - Crea usuarios
    - Asigna usuarios a su grupo correspondiente
#>

Import-Module ActiveDirectory

# =========================
# Variables
# =========================

$Dominio = "DC=empresa,DC=local"
$OU_Empresa = "OU=Empresa,$Dominio"

$RutaDepartamentos = ".\departamentos.csv"
$RutaEmpleados = ".\empleados.csv"

$Password = ConvertTo-SecureString "aso2025." -AsPlainText -Force

# =========================
# Crear OU Empresa
# =========================

if (-not (Get-ADOrganizationalUnit -Filter "Name -eq 'Empresa'" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "Empresa" -Path $Dominio
}

# =========================
# Crear OUs y grupos
# =========================

$Departamentos = Import-Csv $RutaDepartamentos -Delimiter ";"

foreach ($Depto in $Departamentos) {

    $OU_Departamento = "OU=$($Depto.departamento),$OU_Empresa"

    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$($Depto.departamento)'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit `
            -Name $Depto.departamento `
            -Path $OU_Empresa `
            -Description $Depto.descripcion
    }

    if (-not (Get-ADGroup -Filter "Name -eq '$($Depto.departamento)'" -ErrorAction SilentlyContinue)) {
        New-ADGroup `
            -Name $Depto.departamento `
            -GroupScope Global `
            -GroupCategory Security `
            -Path $OU_Departamento
    }
}

# =========================
# Crear usuarios
# =========================

$Empleados = Import-Csv $RutaEmpleados -Delimiter ";"

foreach ($Empleado in $Empleados) {

    # Eliminar espacios del nombre y convertir a minúsculas
    $NombreLimpio = $Empleado.nombre -replace " ", ""
    $Login = ($NombreLimpio + "." + $Empleado.apellido).ToLower()

    $OU_Usuario = "OU=$($Empleado.departamento),$OU_Empresa"

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$Login'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name "$($Empleado.nombre) $($Empleado.apellido)" `
            -GivenName $Empleado.nombre `
            -Surname $Empleado.apellido `
            -SamAccountName $Login `
            -UserPrincipalName "$Login@empresa.local" `
            -Path $OU_Usuario `
            -AccountPassword $Password `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Add-ADGroupMember `
            -Identity $Empleado.departamento `
            -Members $Login
    }
}

Write-Host "Estructura de Active Directory creada correctamente"
