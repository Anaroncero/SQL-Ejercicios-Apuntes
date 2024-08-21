/* 
ORDER BY: Ordernar el resultado de una consulta

Se utiliza con: ASC (ascendente) y DESC (Descendente)
*/

-- 1. Selecciona los usuarios ordenados por nombre ascendente
SELECT * FROM users ORDER BY first_name ASC;

-- 2. Selecciona los usuarios ordenados por apellido descendente
SELECT * FROM users ORDER BY surname ASC;

-- 3. Selecciona los ultimos 4 usuarios ordenados por edad de mayores a menores
SELECT * FROM users ORDER BY age DESC LIMIT 4;

-- 4. Selecciona los cinco primeros usuarios ordenados alfabeticamente por apellido
SELECT * FROM users ORDER BY surname ASC LIMIT 5;

-- 5. Selecciona los siguentes cinco usuarios ordenados alfabeticamente por apellido
SELECT * FROM users ORDER BY surname ASC LIMIT 5 offset 5;

-- 6. Selecciona todos los apellidos sin repetir de los usuarios y ordenados alfabeticamente
SELECT DISTINCT surname FROM users ORDER BY surname ASC;

