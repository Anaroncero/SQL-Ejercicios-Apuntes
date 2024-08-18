-- --------------------------------------
-- Consultas de agrupación
-- --------------------------------------

-- 1. Calcular cuántos partidos se jugaron en noviembre.
SELECT COUNT(*) AS cuantos FROM partido WHERE MONTH(fecha) = 11;

-- 2. Calcular el salario medio de todos los jugadores.
SELECT equipo, AVG(salario) AS media FROM jugador GROUP BY equipo;

-- 3. Mostrar el id del equipo y suma de las alturas de sus jugadores que sean superior a 5 metros.
SELECT equipo, SUM(altura) AS suma_altura FROM jugador GROUP BY equipo HAVING suma_altura > 5;

-- 4. Calcular el número de jugadores que miden más de dos metros.
SELECT COUNT(*) AS numero FROM jugador WHERE altura > 2;

-- 5. Mostrar para cada equipo, cuántos jugadores están asignados a cada posición.
SELECT equipo, posicion, COUNT(*) AS numero FROM jugador GROUP BY equipo, posicion HAVING numero > 1;

-- 6. Id del equipo y salario total de cada equipo para equipos con más de 4 jugadores registrados
SELECT equipo, SUM(salario) AS salario_total FROM jugador GROUP BY equipo HAVING COUNT(id_jugador) > 4;

-- 7. Hallar el número de ciudades en las que hay equipos registrados
SELECT COUNT(DISTINCT ciudad) AS numero_ciudad FROM equipo;

-- 8. Encontrar el salario más alto, el más bajo y la diferencia entre ambos para cada equipo.
SELECT equipo, MAX(salario) AS salario_maximo, MIN(salario) AS salario_minimo, MAX(salario) - MIN(salario) AS diferencia_salario FROM jugador GROUP BY equipo;

-- 9. Seleccionar el salario medio de cada equipo, pero solo para aquellos cuya media sea superior a 50.000.
SELECT equipo, AVG(salario) AS salario_medio FROM jugador GROUP BY equipo HAVING salario_medio > 50000;
