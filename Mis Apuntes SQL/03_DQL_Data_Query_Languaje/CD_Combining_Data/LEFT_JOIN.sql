/* -LEFT JOIN:
Incluye todas las filas de la tabla izquierda, independientemente de si encuentra una fila 
en la tabla derecha
 */

 -- 1. Muestra todos los usuarios y sus publicaciones (LA TABLA USERS ESTA A LA IZQUIERDA)
SELECT users.user_name, publication.text
FROM users
LEFT JOIN publication
ON  users.user_id = publication.user_id;