/* -RIGHT JOIN:
Incluye todas las filas de la tabla derecha, independientemente de si encuentra una fila 
en la tabla izquierda
 */

  -- 1. Muestra todos los usuarios aunque no tengan publicaciones (LA TABLA users ESTA A LA DERECHA)
SELECT publication.text, users.user_name
FROM publication
RIGHT JOIN users
ON publication.user_id = users.user_id;