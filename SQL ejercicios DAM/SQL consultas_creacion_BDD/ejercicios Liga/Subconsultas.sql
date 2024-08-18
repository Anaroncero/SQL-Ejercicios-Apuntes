-- --------------------------------------
-- Subconsultas
-- --------------------------------------
USE liga;

-- --------------------------------------
-- Subconsultas
-- --------------------------------------

-- 1. Datos del jugador más alto
SELECT * 
FROM jugador 
WHERE altura = (SELECT MAX(altura) FROM jugador);

-- 2. Datos de jugadores del Caja Laboral
SELECT * 
FROM jugador 
WHERE equipo = (SELECT id_equipo FROM equipo WHERE nombre = 'Caja Laboral');

-- 3. Suma de alturas de los jugadores que sean del CAI o del Madrid
SELECT SUM(altura) 
FROM jugador 
WHERE equipo IN 
    (SELECT id_equipo 
     FROM equipo 
     WHERE nombre IN ('CAI', 'Madrid'));

-- 4. Datos de jugadores que midan más que todos los del Caja Laboral
SELECT * 
FROM jugador 
WHERE altura > (SELECT MAX(altura) 
                FROM jugador 
                WHERE equipo = (SELECT id_equipo 
                                FROM equipo 
                                WHERE nombre = 'Caja Laboral'));

-- 5. Datos de los jugadores mejor y peor pagados
SELECT * 
FROM jugador 
WHERE salario = (SELECT MAX(salario) FROM jugador) 
   OR salario = (SELECT MIN(salario) FROM jugador);

-- 6. Datos del jugador más antiguo en los equipos
SELECT * 
FROM jugador 
WHERE fecha_ingreso = (SELECT MIN(fecha_ingreso) FROM jugador);

-- 7. Datos de los jugadores cuya altura es mayor a la de los jugadores que miden más de dos metros
SELECT * 
FROM jugador 
WHERE altura > (SELECT altura 
                FROM jugador 
                WHERE altura > 2 
                ORDER BY altura DESC 
                LIMIT 1);

-- 8. Datos de los jugadores de equipos que hayan jugado algún partido contra el Valencia en casa
SELECT * 
FROM jugador j 
WHERE j.equipo IN 
    (SELECT p.local 
     FROM partido p 
     WHERE p.visitante = (SELECT id_equipo 
                          FROM equipo 
                          WHERE nombre = 'Valencia'));