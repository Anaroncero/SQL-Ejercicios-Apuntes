use profesores;

-- --------------------------------------
-- Subconsultas
-- --------------------------------------

-- Datos de los jugadores con la mayor altura
SELECT * FROM jugador WHERE altura = (SELECT MAX(altura) FROM jugador);

-- Datos de los jugadores que tengan una altura mayor a la de los jugadores que miden más de dos metros
SELECT * FROM jugador WHERE altura > (SELECT altura FROM jugador WHERE altura > 2 ORDER BY altura DESC LIMIT 1);

-- Id del equipo para el equipo con nombre 'Caja Laboral'
SELECT id_equipo FROM equipo WHERE nombre = 'Caja Laboral';

-- Datos de los jugadores que pertenecen al equipo 'Caja Laboral'
SELECT * FROM jugador WHERE equipo = (SELECT id_equipo FROM equipo WHERE nombre = 'Caja Laboral');

-- Datos de los jugadores cuya altura es mayor a la de los jugadores del equipo 'Caja Laboral' más alto
SELECT * FROM jugador WHERE altura > (SELECT altura FROM jugador WHERE equipo = (SELECT id_equipo FROM equipo WHERE nombre = 'Caja Laboral') ORDER BY altura DESC LIMIT 1);

-- Datos de los jugadores con el salario máximo o mínimo
SELECT * FROM jugador WHERE salario = (SELECT MAX(salario) FROM jugador) OR salario = (SELECT MIN(salario) FROM jugador);

-- Equipos con más de 3 jugadores
SELECT equipo, COUNT(*) AS num_jugadores FROM jugador GROUP BY equipo HAVING COUNT(*) > 3;

-- Equipos que tienen más de 3 jugadores
SELECT * FROM equipo e WHERE EXISTS (SELECT 1 FROM jugador j WHERE j.equipo = e.id_equipo GROUP BY j.equipo HAVING COUNT(*) > 3);

-- Datos de los partidos donde el jugador juega como visitante
SELECT * FROM jugador j JOIN partido p ON j.equipo = p.visitante;

-- Contar partidos como local por equipo
SELECT e.*, COUNT(*) AS partidos_local FROM equipo e JOIN partido p ON e.id_equipo = p.local GROUP BY e.id_equipo;

-- Equipos que han jugado como visitantes al menos 3 veces
SELECT e.id_equipo FROM equipo e JOIN partido p ON e.id_equipo = p.visitante GROUP BY e.id_equipo HAVING COUNT(p.visitante) >= 3;

-- Datos de los jugadores de equipos que han jugado como visitantes al menos 3 veces
SELECT * FROM jugador j WHERE j.equipo IN (SELECT e.id_equipo FROM equipo e JOIN partido p ON e.id_equipo = p.visitante GROUP BY e.id_equipo HAVING COUNT(p.visitante) >= 3);

-- Mostrar asignaturas con créditos mayores a los créditos de la asignatura con código 'HI'
SELECT * FROM asignaturas WHERE creditos > (SELECT creditos FROM asignaturas WHERE codigo = 'HI');

-- Mostrar la descripción de la asignatura con más créditos
SELECT descripcion FROM asignaturas WHERE creditos = (SELECT MAX(creditos) FROM asignaturas);

-- Mostrar la descripción de la asignatura con créditos mayores o iguales a todos los créditos de las asignaturas
SELECT descripcion FROM asignaturas WHERE creditos >= ALL (SELECT creditos FROM asignaturas);

-- Mostrar la descripción de la asignatura con créditos diferentes a todos los créditos de las asignaturas
SELECT descripcion FROM asignaturas WHERE creditos != ALL (SELECT creditos FROM asignaturas);

-- Mostrar la descripción de la asignatura con créditos mayores que al menos uno de los créditos de las asignaturas
SELECT descripcion FROM asignaturas WHERE creditos > ANY (SELECT creditos FROM asignaturas);

-- Verificar si existen registros en la tabla imparte (retorna 1 si existen, 0 si no)
SELECT EXISTS(SELECT * FROM imparte);

-- Mostrar nombres de los profesores que están en la tabla prepara
SELECT nombre FROM profesores WHERE dni IN (SELECT dni FROM prepara);

-- Mostrar nombres de los profesores que no están en la tabla prepara
SELECT nombre FROM profesores WHERE dni NOT IN (SELECT dni FROM prepara);

-- Mostrar nombres de los profesores que no están en la tabla prepara ni en la tabla imparte
SELECT nombre FROM profesores WHERE dni NOT IN (SELECT dni FROM prepara) AND dni NOT IN (SELECT dni FROM imparte);

-- Mostrar nombres y dni de los profesores que preparan más de dos asignaturas
SELECT nombre, dni FROM profesores WHERE dni IN (SELECT dni FROM prepara GROUP BY dni HAVING COUNT(*) > 2);