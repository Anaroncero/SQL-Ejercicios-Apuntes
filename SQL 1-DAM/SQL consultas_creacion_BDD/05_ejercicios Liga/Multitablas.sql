use liga;

-- --------------------------------------
-- Multitablas
-- --------------------------------------

-- 1. Equipos con más de 3 jugadores
SELECT equipo, COUNT(*) AS num_jugadores 
FROM jugador 
GROUP BY equipo 
HAVING COUNT(*) > 3;

-- 2. Equipos que tienen más de 3 jugadores
SELECT * 
FROM equipo e 
WHERE EXISTS (SELECT 1 
              FROM jugador j 
              WHERE j.equipo = e.id_equipo 
              GROUP BY j.equipo 
              HAVING COUNT(*) > 3);

-- 3. Datos de los partidos donde el jugador juega como visitante
SELECT * 
FROM jugador j 
JOIN partido p ON j.equipo = p.visitante;

-- 4. Contar partidos como local por equipo
SELECT e.*, COUNT(*) AS partidos_local 
FROM equipo e 
JOIN partido p ON e.id_equipo = p.local 
GROUP BY e.id_equipo;

-- 5. Datos de los jugadores con el salario máximo o mínimo
SELECT e.*, MAX(j.salario) AS salario_maximo 
FROM equipo e 
JOIN jugador j ON e.id_equipo = j.equipo 
GROUP BY e.id_equipo;

-- 6. Nombre de jugador, nombre de equipo y puesto del mismo
SELECT j.nombre AS nombre_jugador, e.nombre AS nombre_equipo, j.puesto 
FROM jugador j 
JOIN equipo e ON j.equipo = e.id_equipo;

-- 7. Nombre de equipo, nombre de su capitán(es) para cada equipo
SELECT e.nombre AS nombre_equipo, j.nombre AS nombre_capitan 
FROM equipo e 
JOIN jugador j ON e.capitan = j.id_jugador;