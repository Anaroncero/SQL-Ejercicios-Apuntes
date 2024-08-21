/* 
AS: Para asignar un alias a una columna o tabla 
*/

-- 1. Selecciona el nombre y el apelido de los usuarios mayores de 18 años con el alias nombre, apellidos
SELECT u.first_name AS nombre, u.surname AS apellido FROM users u WHERE u.age > 18;