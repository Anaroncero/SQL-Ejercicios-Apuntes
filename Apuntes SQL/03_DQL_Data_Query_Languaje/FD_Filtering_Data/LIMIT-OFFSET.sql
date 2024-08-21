/* 
LIMIT: 
OFFSET: 
*/

-- 1. Selecciona el nombre y apellido de los primero cinco usuarios
SELECT first_name, surname FROM users LIMIT 5;

-- 2. Selecciona toda la informacion de los primero cinco usuarios (a partir de la fila 5 salta la pagina)
SELECT * FROM users LIMIT 5 OFFSET 5;

-- 3. Selecciona los primeros 3 usuarios a partir de la fila 4
SELECT * FROM users LIMIT 3 OFFSET 4;


