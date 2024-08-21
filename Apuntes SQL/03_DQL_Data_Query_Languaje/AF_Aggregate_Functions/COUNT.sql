/* 
COUNT: contar
*/

-- 1. Cuenta cuantos usuarios hay en total
SELECT COUNT(user_id) AS n_total_usuaios FROM users;

-- 2. Cuenta cuantos usuarios hay en cada pais
SELECT country, COUNT(user_id) AS n_total_usuarios_pais FROM users GROUP BY country;