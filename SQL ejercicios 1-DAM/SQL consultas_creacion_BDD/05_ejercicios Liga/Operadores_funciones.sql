use liga;

-- --------------------------------------
-- Consultas con operadores y funciones
-- --------------------------------------

-- 1. Datos de los partidos jugados en febrero.
SELECT * FROM partido WHERE MONTH(fecha) = 2;

-- 2. Escribir en una línea el nombre y apellido, en mayúsculas y en una columna que se llame ‘Nombre Completo’.
SELECT UPPER(CONCAT(nombre, ' ', apellido)) AS 'Nombre Completo' FROM jugador;

-- 3. Mostrar los enlaces de las webs de los equipos que NO tengan "www".
SELECT * FROM equipo WHERE web NOT LIKE '%www%';

-- 4. Datos de los equipos cuya dirección de la web incluya la palabra ‘basket’.
SELECT * FROM equipo WHERE web LIKE '%basket%';

-- 5. Mostrar los enlaces de las webs de los equipos pero sin http://
SELECT TRIM(LEADING 'http://' FROM web) AS web_sin_http FROM equipo;

-- 6. Crear una consulta que devuelva una salida en una línea como esta estructura de ejemplo: El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta
SELECT CONCAT('El jugador con nombre ', nombre, ' y apellido ', apellido, ' juega en la posición ', posicion) AS salida FROM jugador;

-- 7. Datos de los equipos cuyo nombre tenga no más de 12 caracteres.
SELECT * FROM equipo WHERE LENGTH(nombre) <= 12;

-- 8. Datos de los jugadores que fueron dados de alta en 2008 o 2011
SELECT * FROM jugador WHERE YEAR(fecha_alta) IN (2008, 2011);

-- 9. Mostrar un listado de las páginas web de los equipos, pero comenzando por https:// en vez http://.
SELECT REPLACE(web, 'http://', 'https://') AS web_segura FROM equipo;