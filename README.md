# Introducción T-SQL
## Taller teórico práctico - Clase 01

### Que es una base de datos
* Conjunto de datos del mismo contexto y almacenados sistemáticamente para su posterior uso
* Tipos de bases de datos
  * Bases de datos jerárquicas: La información se almacena como arbol, ej. Adabas
  * Bases de datos noSQL:
    * Documentales: Ej. MongoDb, CouchDB, Redis
  * Bases de datos Relacionales

### Que es una base de datos relacional
* Tipo de base de datos que cumple con el “modelo relacional”
* Modelo de datos basado en lógica de predicados y teoría de conjuntos
* Propuesta en 1970 por Edgar Frank Codd, en los laboratorios de IBM
* Ventajas
  * Evita la duplicidad de datos
  * Asegura la integridad referencial
  * Favorece la normalización lo que clarifica su comprensión
* Desventajas
  * Es deficiente para datos gráficos
  * Transacciones lentas

### BDR - Características
* Una base de datos se compone de varias tablas o relaciones.
* No pueden existir dos tablas con el mismo nombre ni registro.
* Cada tabla es a su vez un conjunto de campos (columnas) y registros (filas).
* La relación entre una tabla padre y un hijo se lleva a cabo por medio de las claves primarias y claves foráneas (o ajenas).
* Las claves primarias son la clave principal de un registro dentro de una tabla y estas deben cumplir con la integridad de datos.
* Las claves ajenas se colocan en la tabla hija, contienen el mismo valor que la clave primaria del registro padre; por medio de estas se hacen las formas relacionales.

### Normalización de BDR
Primera Forma Normal (1FN)
* Todos los atributos son atómicos. Un atributo es atómico si los elementos del dominio son simples e indivisibles.
* La tabla contiene una clave primaria única.
* La clave primaria no contiene atributos nulos.
* No debe existir variación en el número de columnas.
* Los Campos no clave deben identificarse por la clave (Dependencia Funcional)
* Debe Existir una independencia del orden tanto de las filas como de las columnas, es decir, si los datos cambian de orden no deben cambiar sus significados

### BDR - EJEMPLO
![alt text](https://github.com/enunezf/TallerSQL/blob/master/img/Modelo001.png "Ejemplo modelo relacional")

### Ejemplo Práctico
- https://github.com/enunezf/TallerSQL.git
- git@github.com:enunezf/TallerSQL.git

## Clase 02 - creación de bases de datos y Tablas
### Acceso a servidor mediante Management Studio
![alt text](https://github.com/enunezf/TallerSQL/blob/master/img/clase002-001.png "Acceso a servidor mediante Management Studio")

### Crear Base de datos de ejemplo
Creación mediante el asistente gráfico
![alt text](https://github.com/enunezf/TallerSQL/blob/master/img/clase002-003.png "Acceso a servidor mediante Management Studio")

### Crear Base de datos de ejemplo
Instrucción CREATE DATABASE  
[CREATE DATABASE (Transac-SQL)](https://msdn.microsoft.com/es-es/library/ms176061.aspx "Referencia Microsoft")

```SQL
CREATE DATABASE database_name   
[ CONTAINMENT = { NONE | PARTIAL } ]  
[ ON   
      [ PRIMARY ] <filespec> [ ,...n ]   
      [ , <filegroup> [ ,...n ] ]   
      [ LOG ON <filespec> [ ,...n ] ]   
]   
[ COLLATE collation_name ]  
[ WITH  <option> [,...n ] ]  
[;]  
  
<option> ::=  
{  
      FILESTREAM ( <filestream_option> [,...n ] )  
    | DEFAULT_FULLTEXT_LANGUAGE = { lcid | language_name | language_alias }  
    | DEFAULT_LANGUAGE = { lcid | language_name | language_alias }  
    | NESTED_TRIGGERS = { OFF | ON }  
    | TRANSFORM_NOISE_WORDS = { OFF | ON}  
    | TWO_DIGIT_YEAR_CUTOFF = <two_digit_year_cutoff>   
    | DB_CHAINING { OFF | ON }  
    | TRUSTWORTHY { OFF | ON }  
}  
  
<filestream_option> ::=  
{  
      NON_TRANSACTED_ACCESS = { OFF | READ_ONLY | FULL }  
    | DIRECTORY_NAME = 'directory_name'   
}  
  
<filespec> ::=   
{  
(  
    NAME = logical_file_name ,  
    FILENAME = { 'os_file_name' | 'filestream_path' }   
    [ , SIZE = size [ KB | MB | GB | TB ] ]   
    [ , MAXSIZE = { max_size [ KB | MB | GB | TB ] | UNLIMITED } ]   
    [ , FILEGROWTH = growth_increment [ KB | MB | GB | TB | % ] ]  
)  
}  
  
<filegroup> ::=   
{  
FILEGROUP filegroup name [ [ CONTAINS FILESTREAM ] [ DEFAULT ] | CONTAINS MEMORY_OPTIMIZED_DATA ]  
    <filespec> [ ,...n ]  
}  
  
<service_broker_option> ::=  
{  
    ENABLE_BROKER  
  | NEW_BROKER  
  | ERROR_BROKER_CONVERSATIONS  
}
```
#### Ejemplos de instrucción CREATE TABLE
En este ejemplose crea la base de datos tallerSQL2 con los valores definidos por defecto en el servidor, los archivos de datos y log de transacciones se definirán en la ruta por defecto y la intercalación será la del servidor.

``` SQL
USE master;  
GO  
CREATE DATABASE tallerSQL2;  
GO  
-- Verify the database files and sizes  
SELECT name, size, size*1.0/128 AS [Size in MBs]   
FROM sys.master_files  
WHERE name = N'tallerSQL2';  
GO
```
---
Crear una base de datos que especifica los archivos de datos y de registro de transacciones
En el ejemplo siguiente se crea la base de datos tallerSQL3. Debido a que no se usa la palabra clave PRIMARY, el primer archivo (tallerSQL3_dat) se convierte en el archivo principal. Dado que no se especifica MB ni KB en el parámetro de tamaño para el archivo tallerSQL3_dat se utiliza MB y se asigna en megabytes. El tallerSQL3_log se asigna en megabytes porque el MB sufijo se indica explícitamente en la SIZE parámetro.
``` SQL
USE master;  
GO  
CREATE DATABASE tallerSQL3  
ON   
( NAME = tallerSQL3_dat,  
    FILENAME = 'D:\MSSQLSERVER\DATA\tallerSQL3.mdf',  
    SIZE = 10,  
    MAXSIZE = 50,  
    FILEGROWTH = 5 )  
LOG ON  
( NAME = tallerSQL3_log,  
    FILENAME = 'D:\MSSQLSERVER\DATA\tallerSQL3.ldf',  
    SIZE = 5MB,  
    MAXSIZE = 25MB,  
    FILEGROWTH = 5MB ) ;  
GO
```
### Crear tablas de ejemplo
Instrucción CREATE TABLE
[CREATE TABLE (Transac-SQL)](https://msdn.microsoft.com/es-es/library/ms174979.aspx "Referencia Microsoft")
```SQL
CREATE TABLE   
    [ database_name . [ schema_name ] . | schema_name . ] table_name   
    ( { <column_definition> } [ ,...n ] )   
[ ; ]
```
---
#### Creación tabla con restricción de clave primaria y restricción de unicidad.

```SQL
CREATE TABLE dbo.Parametros (
  parametro_id smallint NOT NULL PRIMARY KEY CLUSTERED,
  codigo varchar(15) NOT NULL ,
  valor varchar(50) NOT NULL,
  CONSTRAINT PK_Parametros PRIMARY KEY CLUSTERED (parametro_id),
  CONSTRAINT IX_Parametros_Codigo UNIQUE NONCLUSTERED (codigo),
)
ON [PRIMARY]
```
#### Creación tabla con restricción de clave primaria y clave foranea y valor por defecto.

```SQL
CREATE TABLE dbo.UbicacionGeo (
  UbicacionId varchar(15) NOT NULL,
  TipoUbicacionId varchar(15) NULL,
  Abreviacion varchar(10) NULL,
  Secuencia smallint NOT NULL DEFAULT (0),
  Descripcion varchar(50) NOT NULL,
  CONSTRAINT PK_UbicacionGeo PRIMARY KEY CLUSTERED (UbicacionId),
  CONSTRAINT FK_Tipo_UbicacionGeo FOREIGN KEY (TipoUbicacionId) REFERENCES dbo.TipoUbicacionGeo (TipoUbicacionId)
)
ON [PRIMARY]
```

