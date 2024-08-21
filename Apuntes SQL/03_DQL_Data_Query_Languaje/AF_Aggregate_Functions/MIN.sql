/* 
MIN: Encontrar el valor minimo
 */

 -- 1. Selecciona el usuario mas joven
 SELECT MIN(age) as min_user FROM users;

 -- 2. Selecciona la publicacion con menos comentarios
SELECT MIN(num_commments) AS min_comentarios FROM publication;
