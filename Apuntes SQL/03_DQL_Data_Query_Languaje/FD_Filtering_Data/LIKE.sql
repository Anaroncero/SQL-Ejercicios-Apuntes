-- 1 Selecciona todos los usuarios que incluya el nombre Ana
SELECT * FROM users WHERE first_name LIKE "%ana%";

-- 2 Selecciona todos los usuarios que su apellido sea García
SELECT * FROM users WHERE surname LIKE = "García";

--3 Selecciona todos los usuarios con nombre diferente a Fernando
SELECT * FROM users WHERE first_name != 'Fernando';

--4 Selecciona todos los usuarios con dominio de correo gmail
SELECT * FROM users WHERE email NOT LIKE "%gmail%"