-- 1. Muestra la tabla personas
SELECT * FROM persona;

-- 2. Muestra los que son de tipo profesor de la tabla personas
SELECT * FROM persona WHERE tipo = 'profesor';

-- 3. Muestra nombre y apellidos de la tabla personas que sean profesores
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor';

-- 4. Mostrar todos los nombres de las asignaturas sin que se repitan
SELECT DISTINCT nombre FROM asignatura;

-- 5. Cuenta el número total de asignaturas
SELECT COUNT(*) AS total_asignaturas FROM asignatura;

-- 6. Cuenta todas las personas por tipo
SELECT tipo, COUNT(*) AS total_por_tipo FROM persona GROUP BY tipo;

-- 7. Cuenta todas las personas por sexo (cuántas m y cuántas f)
SELECT sexo, COUNT(*) AS total_por_sexo FROM persona GROUP BY sexo;

-- 8. Lo mismo que la anterior pero solo cuenta los alumnos por sexo
SELECT sexo, COUNT(*) AS total_por_sexo_alumnos FROM persona WHERE tipo = 'alumno' GROUP BY sexo;

-- 9. Suma todos los créditos de la tabla asignatura agrupados por tipo
SELECT tipo, SUM(creditos) AS suma_creditos FROM asignatura GROUP BY tipo;

-- 10. Muestra la asignatura con menos créditos
SELECT MIN(creditos) AS min_creditos FROM asignatura;

-- 11. Muestra la asignatura con más créditos
SELECT MAX(creditos) AS max_creditos FROM asignatura;

-- 12. Las dos anteriores juntas
SELECT MIN(creditos) AS min_creditos, MAX(creditos) AS max_creditos FROM asignatura;

-- 13. Concatena el nombre y apellido de los profesores
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS nombre_completo FROM persona WHERE tipo = 'profesor';

-- 14. Hacer la media de todos los créditos de la tabla asignaturas
SELECT AVG(creditos) AS media_creditos FROM asignatura;

-- 15. Muestra todas las filas de la tabla persona ordenadas en ascendente y solo las 6 primeras
SELECT * FROM persona ORDER BY nombre ASC LIMIT 6;

-- 16. Muestra el nombre y el tipo de asignatura ordenado por créditos descendientes
SELECT nombre, tipo FROM asignatura ORDER BY creditos DESC;

-- 17. Muestra todas las filas de persona donde el nombre empiece por 'a' y el id sea de mayor a menor
SELECT * FROM persona WHERE nombre LIKE 'a%' ORDER BY id DESC;

-- 18. Muestra el nombre, fecha nacimiento y sexo de los alumnos de la tabla personas que nacieron entre 1995 y 2000 ordenados por nombre
SELECT sexo, nombre, fecha_nacimiento FROM persona WHERE fecha_nacimiento BETWEEN '1995-01-01' AND '2000-12-31' AND tipo = 'alumno' ORDER BY nombre ASC;

-- 19. Muestra la tabla departamento ordenada alfabéticamente por nombre
SELECT * FROM departamento ORDER BY nombre ASC;

-- 20. Muestra los últimos 3 registros de la tabla profesor ordenados por fecha de nacimiento de manera descendente
SELECT * FROM persona WHERE tipo = 'profesor' ORDER BY fecha_nacimiento DESC LIMIT 3;

-- 21. Cuenta el número de asignaturas por tipo (básica, obligatoria, optativa) y solo muestra las que tengan más de 5 asignaturas
SELECT tipo, COUNT(*) AS total_asignaturas FROM asignatura GROUP BY tipo HAVING total_asignaturas > 5;

-- 22. Lista sin repetir los nombres de los grados que hay
SELECT DISTINCT nombre FROM grado;

-- 23. Muestra personas que nacieron después de 1995, son hombres y que sean alumnos
SELECT * FROM persona WHERE fecha_nacimiento > '1995-01-01' AND sexo = 'M' AND tipo = 'alumno';

-- 24. Obtiene los alumnos cuyos nombres no tengan más de tres caracteres
SELECT * FROM persona WHERE LENGTH(nombre) <= 3;

-- 25. Mostrar nombre y dirección de los alumnos, cambiando 'C/' por 'Calle'
SELECT nombre, REPLACE(direccion, 'C/', 'Calle') AS direccion FROM persona WHERE tipo = 'alumno';

-- 26. Calcular cuántas mujeres tenemos guardadas en la tabla persona
SELECT COUNT(*) AS mujeres_total FROM persona WHERE sexo = 'F';

-- 27. Calcular la media de créditos que hay en el tercer curso del grado número 4
SELECT AVG(creditos) AS media_creditos FROM asignatura WHERE curso = 3 AND id_grado = 4;

-- 28. Mostrar cuántas asignaturas de cada tipo hay en la universidad en cualquier curso y grado
SELECT tipo, COUNT(*) AS cantidad_asignaturas FROM asignatura GROUP BY tipo;

-- 29. Calcular el número de asignaturas que hay en cada curso y grado
SELECT curso, id_grado, COUNT(*) FROM asignatura GROUP BY curso, id_grado;

-- 30. Mostrar cuántos alumnos y cuántos profesores hay
SELECT tipo, COUNT(*) AS cantidad FROM persona WHERE tipo IN ('alumno', 'profesor') GROUP BY tipo;

-- 31. En cuántos cursos de la universidad se dan 12 asignaturas o más. Mostrar además de la cantidad, el grado y curso
SELECT id_grado, curso, COUNT(*) AS cantidad_asignaturas FROM asignatura GROUP BY id_grado, curso HAVING COUNT(*) >= 12;

-- 32. Teniendo en cuenta que el crédito está a 12.60€, calcular el coste de cada grado
SELECT g.nombre AS grado, SUM(a.creditos) * 12.60 AS coste_total
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre;

-- 33. Calcular si algún curso de alguno de los grados ofrecidos cuesta más de 800€ (Teniendo en cuenta que el crédito está a 12.60€)
SELECT g.nombre AS grado, a.curso, SUM(a.creditos) * 12.60 AS coste_total
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.curso
HAVING SUM(a.creditos) * 12.60 > 800;
