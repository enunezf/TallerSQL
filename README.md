# Introducción T-SQL
## Taller teórico práctico

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

### Ejemplo Práctico
https://github.com/enunezf/TallerSQL.git
git@github.com:enunezf/TallerSQL.git

