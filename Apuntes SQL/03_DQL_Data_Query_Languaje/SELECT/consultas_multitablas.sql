-- 1. Selecciona el nombre de usuario y el texto de todos los usuarios que hayan realizado publicaciones.
SELECT u.user_name, p.text
FROM users u
INNER JOIN publication p ON u.user_id = p.user_id;

-- 2. Muestra todos los usuarios y el texto de las publicaciones independientemente de si han realizado publicaciones o no
SELECT u.user_name, p.text
FROM users u
LEFT JOIN publication p ON u.user_id = p.user_id;

-- 3. Cuenta cuantas publicaciones ha realizado cada usuario
SELECT u.user_name, COUNT(p.publication_id) AS numero_publicaciones
FROM users u 
LEFT JOIN publication p ON u.user_id = p.user_id
GROUP BY u.user_name;

-- 4. Obten el nombre de usuario y los nombres de los seguidores
SELECT u.user_name AS usuario_seguido, f.user_name AS usuario_seguidor
FROM users u
JOIN followers fl ON u.user_id = fl.following_id
JOIN users f ON fl.follower_id = f.user_id;

-- 6. Selecciona el nombre de usuario y el país para usuarios que han hecho publicaciones
SELECT DISTINCT u.user_name, u.country 
FROM users u
JOIN publication p ON u.user_id = p.user_id;

-- 7. Selecciona el pais y muestra el pais con mas publicaciones
SELECT u.country AS pais, COUNT(p.publication_id) AS cantidad_publicaciones
FROM users u 
JOIN publication p ON u.user_id = p.user_id
GROUP BY u.country
ORDER BY cantidad_publicaciones DESC;