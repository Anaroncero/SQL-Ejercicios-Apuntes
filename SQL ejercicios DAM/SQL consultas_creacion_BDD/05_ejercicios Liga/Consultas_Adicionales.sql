use liga;

-- --------------------------------------
-- Consultas Adicionales Tercera Relación
-- --------------------------------------

-- 1. Mostrar todos los partidos jugados en febrero
select * from partido where month(fecha) = 2;

-- 2. Mostrar el nombre y apellido de los jugadores en mayúsculas en una columna llamada 'Nombre Completo'
select upper(concat(nombre, ' ', apellido)) as "Nombre Completo" from jugador;

-- 3. Mostrar los enlaces de las webs de los equipos que NO tengan "www"
select web from equipo where web not like '%www%';

-- 4. Mostrar los enlaces de las webs de los equipos cuya dirección incluya la palabra ‘basket’
select * from equipo where web like '%basket%';

-- 5. Mostrar los enlaces de las webs de los equipos sin 'http://'
select TRIM(LEADING 'http://' FROM web) as web_sin_http from equipo;

-- 6. Mostrar una línea que describa al jugador con nombre y apellidos y su posición
select concat('El jugador con nombre y apellidos: ', nombre, ' ', apellido, ' juega en la posición: ', posicion) as descripcion from jugador;

-- 7. Mostrar los datos de los equipos cuyo nombre tenga no más de 12 caracteres
select * from equipo where length(nombre) <= 12;

-- 8. Mostrar los datos de los jugadores que fueron dados de alta en 2008 o 2011
select * from jugador where year(fecha_alta) in (2008, 2011);

-- 9. Mostrar los enlaces de las webs de los equipos comenzando por 'https://' en vez de 'http://'
select concat('https://', TRIM(LEADING 'http://' FROM web)) as web_https from equipo;