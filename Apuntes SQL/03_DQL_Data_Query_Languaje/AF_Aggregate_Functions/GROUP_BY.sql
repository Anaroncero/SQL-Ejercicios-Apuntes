/* 
GROUP BY: Se utiliza para agrupar filas que tienen los mismos valores en las columnas 
especificadas.

Se suele usar con COUNT, SUM, AVG, MAX Y MIN
*/

-- 1. Cuenta las publicaciones por usuario
SELECT user_id, COUNT(*) AS publicaciones_por_usuario FROM publication GROUP BY user_id;

