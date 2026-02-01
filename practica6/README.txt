# Instalación y configuración de Active Directory – empresa.local

## 1. Objetivo del ejercicio
El objetivo de este ejercicio es instalar y configurar un Directorio Activo
en Windows Server, creando de forma automática la estructura organizativa
de una empresa mediante un script en PowerShell y archivos CSV.

El dominio utilizado es:

empresa.local

---

## 2. Instalación del Directorio Activo

La instalación se ha realizado siguiendo las indicaciones del recurso:

https://angelabserrano.github.io/aso/wserver-directorio-activo

Pasos resumidos:
1. Abrir el Administrador del Servidor
2. Agregar roles y características
3. Instalar Servicios de dominio de Active Directory (AD DS)
4. Promover el servidor a controlador de dominio
5. Crear un nuevo bosque con el dominio empresa.local
6. Reiniciar el servidor

---

## 3. Archivos CSV utilizados

### departamentos.csv
Contiene los departamentos de la empresa con una descripción asociada.

Columnas:
- departamento
- descripcion

Separador: punto y coma (;)

### empleados.csv
Contiene los empleados de la empresa y el departamento al que pertenecen.

Columnas:
- departamento
- nombre
- apellido

Separador: punto y coma (;)

---

## 4. Estructura creada en Active Directory

- Dominio: empresa.local
- Unidad Organizativa principal: Empresa
- Dentro de Empresa:
  - Una OU por cada departamento del archivo departamentos.csv
- Dentro de cada OU de departamento:
  - Un grupo de seguridad de ámbito global con el nombre del departamento
  - Los usuarios correspondientes a ese departamento

---

## 5. Usuarios

- El nombre de inicio de sesión se compone de:
  
  nombre.apellido (en minúsculas)

  Ejemplo:
  Carla Mateu → carla.mateu

- Si el nombre contiene espacios, estos se eliminan:
  
  Juan Antonio Perez → juanantonio.perez

- Contraseña por defecto:
  
  aso2025.

- El usuario debe cambiar la contraseña en el siguiente inicio de sesión.

---

## 6. Script PowerShell

El script crear_estructura_ad.ps1:
- Crea la OU Empresa
- Crea las OUs de los departamentos
- Crea los grupos globales
- Crea los usuarios
- Asigna cada usuario a su grupo de departamento

El script debe ejecutarse como Administrador en el controlador de dominio.

---

## 7. Autor
Ejercicio realizado para el módulo de Administración de Sistemas Operativos.
