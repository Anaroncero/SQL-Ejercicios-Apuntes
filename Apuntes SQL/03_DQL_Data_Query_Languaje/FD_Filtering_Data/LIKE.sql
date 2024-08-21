/* 
LIKE: Para buscar texto que no es exacto

Se suele usar con %: este se pone para ocupar lugar de texto que no sabemos cual es

%: Representa cero o más caracteres.
_: Representa un solo carácter.

*/

-- 1 Selecciona todos los usuarios que incluya el nombre Ana
SELECT * FROM users WHERE first_name LIKE "%ana%";

-- 2 Selecciona todos los usuarios que su apellido sea García
SELECT * FROM users WHERE surname LIKE = "García";

--3 Selecciona todos los usuarios con nombre diferente a Fernando
SELECT * FROM users WHERE first_name != 'Fernando';

--4 Selecciona todos los usuarios con dominio de correo gmail
SELECT * FROM users WHERE email NOT LIKE "%gmail%"

--5. Busca al usuario femenino o masculino Fernand@
SELECT * FROM users WHERE first_name LIKE 'fernand_';