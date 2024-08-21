/* 
-FULL JOIN: se muestran todas las filas de ambas tablas, independientemente de si existe una 
fila en una tabla y no en la otra.

En mysql no se puede hacer FULL JOIN pero se puede simular combinando LEFT JOIN Y RIGHT JOIN con Union
 */

-- 1. Muestra el id del usuario, nombre, id de publicacion y el texto de la publicacion
SELECT users.user_id, users.user_name, publication.publication_id, publication.text
FROM users
FULL OUTER JOIN publication 
ON users.user_id = publication.user_id;
