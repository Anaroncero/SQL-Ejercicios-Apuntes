/* 
Con  DROP se puede borrar:
Usuarios, claves primarias, claves foráneas, secuencias,
bases de datos, tablas, indices, vistas, procedimientos, funciones, disparadores y esquemas.

Se puede usar con IF EXISTS o solo.
*/

-- Borrar Base de datos
DROP DATABASE IF EXISTS red_social;
-- Borrar Tabla
DROP TABLE IF EXISTS users;