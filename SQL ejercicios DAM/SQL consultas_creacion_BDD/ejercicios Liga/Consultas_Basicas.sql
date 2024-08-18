-- --------------------------------------
-- Consultas básicas
-- --------------------------------------

-- 1. Datos de jugadores del equipo 3 ordenados por apellido.
SELECT * FROM jugador WHERE equipo = '3' ORDER BY apellido DESC;

-- 2. Datos de los jugadores que sean pívot ordenados por su identificador.
SELECT * FROM jugador WHERE posicion = 'pivot' ORDER BY id_jugador;

-- 3. Datos de jugadores de más de dos metros y ganen al menos 50.000 euros.
SELECT * FROM jugador WHERE altura > 2 AND salario >= 50000;

-- 4. Seleccionar el nombre de los jugadores pívot que ganen más de 100.000 euros.
SELECT nombre FROM jugador WHERE posicion = 'pivot' AND salario >= 100000;

-- 5. Seleccionar el nombre de jugadores de los equipos 1 y 2 que jueguen como base.
SELECT nombre FROM jugador WHERE posicion = 'base' AND (equipo = 2 OR equipo = 1);

-- 6. Datos de jugadores de los equipos 1 y 2 que ganen más de 80.000 euros al mes.
SELECT * FROM jugador WHERE equipo IN (1, 2) AND salario > 80000;

-- 7. Listado de las posiciones posibles a ocupar por un jugador dentro de nuestros equipos.
SELECT DISTINCT posicion FROM jugador;

-- 8. Mostrar todos los datos de los 5 jugadores más altos de todos los equipos.
SELECT * FROM jugador WHERE apellido IS NOT NULL ORDER BY altura DESC LIMIT 5;

-- 9. Calcular en una columna llamada “SALARIO NETO ANUAL” el sueldo neto de cada jugador, teniendo en cuenta que, si el IRPF es del 18%, esto supone que se obtiene calculando el 82% del sueldo bruto.
SELECT *, salario * 0.82 AS "SALARIO NETO" FROM jugador;

-- 10. Datos de los jugadores cuyo salario neto anual sea al menos 70.000.
SELECT *, salario * 0.82 AS "SALARIO NETO" FROM jugador WHERE salario * 0.82 >= 70000;

-- 11. Contar el número de partidos jugados en noviembre.
SELECT COUNT(*) AS cuantos FROM partido WHERE MONTH(fecha) = 11;

-- 12. Mostrar el equipo y la suma de la altura de los jugadores por equipo, solo si la suma es mayor a 5.
SELECT equipo, SUM(altura) AS suma FROM jugador GROUP BY equipo HAVING suma > 5;

-- 13. Mostrar los nombres de los jugadores que juegan como 'pivot' y tienen un salario mayor a 10,000.
SELECT nombre FROM jugador WHERE posicion = 'pivot' AND salario > 10000;

-- 14. Mostrar los nombres de los jugadores que juegan como 'base' y pertenecen a los equipos 1 o 2.
SELECT nombre FROM jugador WHERE posicion = 'base' AND equipo IN (1, 2);

-- 15. Mostrar las distintas posiciones de los jugadores.
SELECT DISTINCT posicion FROM jugador;

-- 16. Mostrar los 5 jugadores con el apellido no nulo y mayor altura.
SELECT * FROM jugador WHERE apellido IS NOT NULL ORDER BY altura DESC LIMIT 5;

-- 17. Mostrar todos los detalles de los jugadores y su salario neto (después de aplicar un descuento del 18%).
SELECT *, salario * 0.82 AS "SALARIO NETO" FROM jugador;

-- 18. Mostrar los nombres de los jugadores y su salario neto (después de aplicar un descuento del 18%).
SELECT nombre, salario * 0.82 AS "SALARIO NETO" FROM jugador;

-- 19. Mostrar todos los detalles de los jugadores cuyo salario neto es mayor o igual a 70,000.
SELECT * FROM jugador WHERE salario * 0.82 >= 70000;
