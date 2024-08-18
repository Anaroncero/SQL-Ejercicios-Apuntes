use cine;

-- 1. Listado de actores ordenados por nombre.
select * from actor order by nombre;

-- 2. Datos de películas con una duración de al menos 120 minutos.
select * from pelicula where duracion < 120;

-- 3. Seleccionar el título, duración y año de las películas estrenadas después del año 2000 de nacionalidad España.
select titulo, duracion, anyo from pelicula where nacionalidad = 'Espa├▒a' and anyo > 2000;
select * from pelicula;

-- 4. Listado de las diferentes nacionalidades de películas disponibles en la base de datos.
select distinct nacionalidad from pelicula;

-- 5. Mostrar los datos de las 5 películas más taquilleras.
select titulo, anyo, taquilla from pelicula where taquilla is not null order by taquilla desc limit 5;

-- 6.  
SELECT * FROM actor WHERE YEAR(fnacimiento) < 1960;

-- 7. Calcular cuantas películas hay en la bases de datos por nacionalidad y por año de estreno a partir del año 2000.
select count(nacionalidad) from pelicula where anyo > 2000;

-- 8. Datos de películas cuyo título empiecen por la palabra 'El'.
select * from pelicula where titulo LIKE 'El%' ;

-- 9. Datos de actores con nombres que no excedan los 12 caracteres.
select * from actor WHERE LENGTH(nombre) <= 12;

-- 10. Datos de actores que nacieron en 1929 o 1957.
select * from actor WHERE (fnacimiento) between '1929-01-01' and '1957-01-01'; 

-- 11. Datos de actores que nacieron entre 1929 y 1957.
select * from actor WHERE (fnacimiento) between '1929-01-01' and '1957-01-01'; 

-- 12. Usar alguna función de cadenas para crear una consulta que devuelva una salida con esta estructura en cada línea, en una columna llamada "Detalle": EL ACTOR CON NOMBRE KEVIN COSTNER NACIÓ EN EL AÑO 1955
SELECT CONCAT('El actor con nombre: ', nombre, ' nacio en el año: ', year(Fnacimiento)) AS Detalle FROM actor WHERE nombre LIKE 'Kevin%';

-- 13. Reemplaza el lugar de nacimiento de los actores de aquellos que hayan nacido en 'New York' por 'NK'
select replace(Lnacimiento,'New York','NK') as Lugar_Nacimiento from actor;

-- 14. Calcular cuantos actores hay por cada nacionalidad
-- corregido:

select nacionalidad, count(*) as cantidad_actores from actor group by nacionalidad;

-- 15. Calcular la suma de la taquilla total de las películas por año para aquellas que hayan superado los 35 millones .
-- corregido:
select anyo, sum(taquilla) as suma from pelicula group by anyo having suma > 35000;

-- 16. Identificar años en los que se estrenaron 2 películas
-- corregido:
select anyo, count(*) from pelicula group by anyio having count(*) = 2;

-- 17. Nacionalidad de la película y taquilla total de cada nacionalidad para películas con una duración de más de 120 minutos
-- agrupar por nacionalidad corregido:
select nacionalidad, sum(taquilla) as suma from pelicula where duracion > 120 group by nacionalidad;

-- 18. Lista de los actores que todavía no han fallecido.
-- corregido:
select * from actor where fmuerte is null;

-- 19. Eliminar del inicio del título de una película la palabra ('El')
SELECT REPLACE(titulo, 'El ', '') FROM pelicula;

-- 20. Obtener las tres primeras letras de las nacionalidades de los actores sin que se repitan
-- corregido:
select distinct(substr(nacionalidad,1,3)) from actor; -- distrinct para que no se repita

