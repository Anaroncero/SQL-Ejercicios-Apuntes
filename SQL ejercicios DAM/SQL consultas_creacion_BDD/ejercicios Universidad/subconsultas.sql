use universidad;

-- SUBCONSULTAS ---------------------------------------------

-- 1. Datos del alumno con más edad
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento ASC LIMIT 1;

-- 2. Mostrar datos de las asignaturas que tienen más créditos que todas las demás
SELECT * FROM asignatura WHERE creditos = (SELECT MAX(creditos) FROM asignatura);

-- 3. Mostrar datos de las asignaturas con menos créditos
SELECT * FROM asignatura WHERE creditos = (SELECT MIN(creditos) FROM asignatura);

-- 6. Calcular el número de asignaturas que hay en cada curso y grado (No hace falta que aparezca el nombre de cada grado, basta con el id)
SELECT curso, id_grado, COUNT(*) FROM asignatura GROUP BY curso, id_grado;

-- 7. En cuántos cursos y grados de la universidad se dan 12 asignaturas o más. Mostrar además de la cantidad, el curso y el id_grado
SELECT curso, id_grado, COUNT(*) FROM asignatura GROUP BY curso, id_grado HAVING COUNT(*) >= 12;

-- 8. Mostrar cuántos alumnos y cuántos profesores hay
SELECT tipo, COUNT(*) AS cantidad FROM persona WHERE tipo IN ('alumno', 'profesor') GROUP BY tipo;

-- 9. Datos de los profesores que imparten alguna asignatura
SELECT p.* FROM persona p JOIN asignatura a ON p.id = a.id_profesor WHERE a.id_profesor IS NOT NULL;

-- 10. Calcular el número de asignaturas que hay en cada grado mostrando el nombre del grado
SELECT g.nombre, COUNT(*) AS suma FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre;

-- 12. Datos de las asignaturas donde se hayan matriculado al menos 5 alumnos
SELECT a.*
FROM asignatura a
JOIN alumno_se_matricula_asignatura asma ON a.id = asma.id_asignatura
GROUP BY a.id
HAVING COUNT(asma.id_alumno) >= 5;

-- 13. Cantidad de créditos que imparte cada profesor según su nif
SELECT p.nif, SUM(a.creditos) AS suma_creditos
FROM persona p
JOIN asignatura a ON a.id_profesor = p.id
GROUP BY p.nif;

-- 21. Cuenta el número de asignaturas por tipo (básica, obligatoria, optativa) y solo muestra las que tengan más de 5 asignaturas
SELECT tipo, COUNT(*) AS total_asignaturas FROM asignatura GROUP BY tipo HAVING total_asignaturas > 5;

-- 22. Lista sin repetir los nombres de los grados que hay
SELECT DISTINCT nombre FROM grado;

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