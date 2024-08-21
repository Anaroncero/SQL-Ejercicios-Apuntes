/* 
En mysql
UNION: Lo mismo que FULL JOIN, muestra todas las filas de ambas tablas, incluso cuando no hay coincidencias.

En mysql no se puede hacer FULL JOIN pero se puede simular combinando LEFT JOIN Y RIGHT JOIN con Union
*/

-- 1. Muestra la informacion de usuarios y las publicaciones
SELECT user_name AS description, email AS info
FROM users
UNION
SELECT text AS contenido, email AS correo
FROM publication;