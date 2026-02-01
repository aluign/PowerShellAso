<#
SCRIPT: recursos_compartidos_empresa.ps1
DESCRIPCIÓN:
    - Crea la estructura de carpetas en C:\Empresa
    - Asigna permisos NTFS según la política indicada
    - Comparte la carpeta Empresa en red
    - Usa departamentos.csv para automatizar el proceso
#>

Import-Module ActiveDirectory

# =========================
# Variables
# =========================

$RutaBase = "C:\Empresa"
$RutaDepartamentos = ".\departamentos.csv"
$Dominio = "EMPRESA"

# =========================
# 1. Crear estructura de carpetas
# =========================

# Crear carpeta principal Empresa
if (-not (Test-Path $RutaBase)) {
    New-Item -Path "C:\" -Name "Empresa" -ItemType Directory
}

# Importar departamentos
$Departamentos = Import-Csv $RutaDepartamentos -Delimiter ";"

# Crear carpeta por cada departamento
foreach ($Depto in $Departamentos) {
    $RutaDepto = Join-Path $RutaBase $Depto.departamento

    if (-not (Test-Path $RutaDepto)) {
        New-Item -Path $RutaBase -Name $Depto.departamento -ItemType Directory
    }
}

# =========================
# 2. Asignación de permisos NTFS
# =========================

# --- Permisos en C:\Empresa ---
$AclEmpresa = Get-Acl $RutaBase

# Desactivar herencia
$AclEmpresa.SetAccessRuleProtection($true, $false)

# Limpiar permisos existentes
$AclEmpresa.Access | ForEach-Object {
    $AclEmpresa.RemoveAccessRule($_)
}

# Usuarios del dominio → Lectura
$ReglaUsuarios = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "$Dominio\Usuarios del dominio",
    "ReadAndExecute",
    "ContainerInherit,ObjectInherit",
    "None",
    "Allow"
)

# Administradores → Control total
$ReglaAdmins = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "Administradores",
    "FullControl",
    "ContainerInherit,ObjectInherit",
    "None",
    "Allow"
)

$AclEmpresa.AddAccessRule($ReglaUsuarios)
$AclEmpresa.AddAccessRule($ReglaAdmins)

Set-Acl -Path $RutaBase -AclObject $AclEmpresa

# --- Permisos por departamento ---
foreach ($Depto in $Departamentos) {

    $RutaDepto = Join-Path $RutaBase $Depto.departamento
    $AclDepto = Get-Acl $RutaDepto

    # Desactivar herencia
    $AclDepto.SetAccessRuleProtection($true, $false)

    # Limpiar permisos
    $AclDepto.Access | ForEach-Object {
        $AclDepto.RemoveAccessRule($_)
    }

    # Grupo del departamento → Modificar
    $ReglaGrupo = New-Object System.Security.AccessControl.FileSystemAccessRule(
        "$Dominio\$($Depto.departamento)",
        "Modify",
        "ContainerInherit,ObjectInherit",
        "None",
        "Allow"
    )

    # Administradores → Control total
    $ReglaAdmins = New-Object System.Security.AccessControl.FileSystemAccessRule(
        "Administradores",
        "FullControl",
        "ContainerInherit,ObjectInherit",
        "None",
        "Allow"
    )

    # Usuarios del dominio → Lectura
    $ReglaUsuarios = New-Object System.Security.AccessControl.FileSystemAccessRule(
        "$Dominio\Usuarios del dominio",
        "ReadAndExecute",
        "ContainerInherit,ObjectInherit",
        "None",
        "Allow"
    )

    $AclDepto.AddAccessRule($ReglaGrupo)
    $AclDepto.AddAccessRule($ReglaAdmins)
    $AclDepto.AddAccessRule($ReglaUsuarios)

    Set-Acl -Path $RutaDepto -AclObject $AclDepto
}

# =========================
# 3. Compartir el recurso en red
# =========================

if (-not (Get-SmbShare -Name "Empresa" -ErrorAction SilentlyContinue)) {

    New-SmbShare `
        -Name "Empresa" `
        -Path $RutaBase `
        -FullAccess "Administradores" `
        -ReadAccess "$Dominio\Usuarios del dominio"
}

Write-Host "✔ Recursos compartidos creados y configurados correctamente"
