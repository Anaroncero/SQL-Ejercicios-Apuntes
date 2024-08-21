-- 1. Obtener todos los usuarios
SELECT * FROM users;

-- 2. Usuarios con mas de 30 años
SELECT * FROM users WHERE age > 30;

-- 3. Primeros 5 usuarios ordenados por nombre de usuario alfabeticamente 
SELECT * FROM users ORDER BY user_name ASC LIMIT 5;

-- 4. Contar el numero total de publicaciones
SELECT COUNT(*) AS numero_publicaciones FROM publication;

-- 5. Obten el usuario mas joven
SELECT user_name, MIN(age) AS youngest_age FROM users;

-- 7.  Muestra todos los usuarios que siguen al usuario con id 1
SELECT follower_id FROM followers WHERE following_id = 1;

-- 8. Cuenta todos los seguidores que siguen al usuario con id 1
SELECT COUNT(follower_id) AS followers FROM followers WHERE following_id = 1;

-- 9. Muestra los 3 usuarios con mas seguidores
SELECT following_id, COUNT(follower_id) AS followers
FROM followers
GROUP BY following_id 
ORDER BY followers DESC
LIMIT 3;

-- 10 Selecciona id de publicacion y cuenta cuantos like tiene cada publicacion con el alias like
SELECT publication_id, COUNT(*) AS likes
FROM publication_likes
GROUP BY publication_id;


