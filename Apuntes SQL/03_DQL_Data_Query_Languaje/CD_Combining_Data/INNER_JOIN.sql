/* 
-INNER JOIN: 
Combina los registros incluyendo solo las filas que tienen valores en ambas tablas.
 */

-- 1.  Muestra solo los usuarios que tienen publicaciones y el contenido de la publicacion
SELECT users.user_name, publication.text
FROM users
INNER JOIN publication
ON users.user_id = publication.user_id;
