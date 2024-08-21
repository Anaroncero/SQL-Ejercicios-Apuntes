-- 1. Selecciona todas las publicaciones de los usuarios que tienen más de 2 seguidores.
SELECT publication_id, text, user_id
FROM publication 
WHERE user_id IN(
	SELECT following_id
	from followers 
	group by following_id
	HAVING COUNT(*)  > 2
);

-- 2. Muestra el numero total de publicaciones de cada usuario que tenga mas de una
SELECT user_id, total_publications
FROM (
    SELECT user_id, COUNT(publication_id) AS total_publications
    FROM publication
    GROUP BY user_id
) AS user_publications
WHERE total_publications > 1;

-- 3. Muestra los usuarios que tienen mas seguidores de la media de usuarios
SELECT user_name, follower_count
FROM users u 
WHERE follower_count > (
    SELECT AVG(follower_count)
    FROM users
);

-- 4. Muestra los paises que tienen mas de 1 usuario con publicaciones
SELECT u.country
FROM users u
JOIN publication p ON u.user_id = p.user_id
GROUP BY u.country
HAVING COUNT(DISTINCT u.user_id) > 1;