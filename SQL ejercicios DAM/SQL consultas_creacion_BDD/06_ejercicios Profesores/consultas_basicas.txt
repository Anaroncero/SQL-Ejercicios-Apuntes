use profesores;

-- --------------------------------------
-- Consultas Basicas
-- --------------------------------------

-- Mostrar toda la columna descripción de la tabla asignaturas
SELECT descripcion FROM asignaturas;

-- Mostrar todo lo que hay en la tabla asignaturas
SELECT * FROM asignaturas;

-- Mostrar toda la información de la tabla profesores
USE profesores;
SELECT * FROM profesores;

-- Mostrar toda la información de la tabla imparte
SELECT * FROM imparte;

-- Mostrar toda la información combinada de las tablas profesores y asignaturas sin condiciones de unión
SELECT * FROM profesores, asignaturas;

-- Mostrar nombre y categoría de la tabla profesores
SELECT nombre, categoria FROM profesores;

-- Mostrar nombres de profesores con categoría "teu"
SELECT nombre FROM profesores WHERE categoria = "teu";

-- Mostrar los primeros 3 registros de la tabla asignaturas
SELECT * FROM asignaturas LIMIT 3;

-- Mostrar asignaturas con créditos mayores o iguales a 6 y creditosp mayores a 3
SELECT * FROM asignaturas WHERE creditos >= 6 AND creditosp > 3;

-- Mostrar asignaturas con créditos mayores o iguales a 6 o creditosp mayores a 3
SELECT * FROM asignaturas WHERE creditos >= 6 OR creditosp > 3;

-- Ordenar las asignaturas por créditos en orden ascendente
SELECT * FROM asignaturas ORDER BY creditos;

-- Mostrar todas las categorías únicas de la tabla profesores
SELECT DISTINCT categoria FROM profesores;

-- Ordenar las asignaturas por créditos en orden descendente y mostrar 4 registros después de omitir los 2 primeros
SELECT * FROM asignaturas ORDER BY creditos DESC LIMIT 2, 4;

-- Mostrar la resta de las columnas creditos y creditosp en la tabla asignaturas
SELECT creditos - creditosp FROM asignaturas;

-- Mostrar la columna código y la resta de las columnas creditos y creditosp en la tabla asignaturas
SELECT codigo, creditos - creditosp AS RESTA FROM asignaturas;

-- Mostrar todos los profesores que ingresaron antes del 1 de enero de 1990
SELECT * FROM profesores WHERE ingreso < '1990-01-01';

-- Contar el número de profesores que ingresaron después del 1 de enero de 1990
SELECT COUNT(*) FROM profesores WHERE ingreso > '1990-01-01';

-- Contar el número de profesores que ingresaron después del 1 de enero de 1990 y renombrar el resultado como "total"
SELECT COUNT(*) AS total FROM profesores WHERE ingreso > '1990-01-01';

-- Mostrar asignaturas cuya descripción empiece por "FUNDAMENTOS"
SELECT * FROM asignaturas WHERE descripcion LIKE 'FUNDAMENTOS%';

-- Mostrar profesores que ingresaron entre el 1 de enero de 1989 y el 1 de enero de 1992
SELECT * FROM profesores WHERE ingreso BETWEEN '1989-01-01' AND '1992-01-01';