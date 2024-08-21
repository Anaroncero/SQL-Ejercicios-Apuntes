/* 
HAVING: Se utiliza para filtrar grupos despues de hacer un group by es como where para los group by

Se utiliza con GROUP BY
*/

-- 1. Muestra los usuarios con mas de dos publicaciones
SELECT user_id, COUNT(*) AS publicaciones_totales FROM publication
GROUP BY user_id HAVING COUNT(*) > 2;

