/* 
MAX: Obtener el maximo
*/

 -- 1.Selecciona la edad máxima de todos los usuarios
 SELECT MAX(age) AS edad_maxima from users;

 -- 2. Cual es la publicacion con mas likes
 SELECT max(num_likes) AS max_likes FROM publication;
