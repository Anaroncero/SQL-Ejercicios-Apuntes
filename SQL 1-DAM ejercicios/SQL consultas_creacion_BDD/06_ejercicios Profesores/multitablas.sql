use profesores;

-- --------------------------------------
-- Multitablas
-- --------------------------------------

-- Mostrar todo el contenido de las tablas profesores e imparte donde p.dni = i.dni
SELECT * FROM profesores p, imparte i WHERE p.dni = i.dni;

-- Mostrar solo el nombre de los profesores y la asignatura de las tablas profesores e imparte
SELECT p.nombre, i.asignatura FROM profesores p, imparte i WHERE p.dni = i.dni;

-- Unir la tabla profesores con imparte donde p.dni = i.dni y filtrar por categoría 'TEU'
SELECT * FROM profesores p JOIN imparte i ON p.dni = i.dni AND p.categoria = 'TEU';

-- Unir la tabla profesores con imparte usando la clave foránea dni
SELECT * FROM profesores p JOIN imparte i USING(dni);

-- Unir la tabla profesores con imparte usando natural join (asumiendo que tienen la misma columna clave)
SELECT * FROM profesores NATURAL JOIN imparte;

-- Unir la tabla profesores con imparte usando natural join y filtrar por categoría 'TEU'
SELECT * FROM profesores NATURAL JOIN imparte WHERE categoria = 'TEU';

-- Unir la tabla imparte con asignaturas en base al código de asignatura
SELECT * FROM imparte i JOIN asignaturas a ON i.asignatura = a.codigo;

-- Calcular la suma de créditos por dni de los profesores
SELECT dni, SUM(creditos) FROM imparte i JOIN asignaturas a ON i.asignatura = a.codigo GROUP BY dni;

-- Contar el número de asignaturas por profesor excluyendo las de código 'FDB'
SELECT p.dni, COUNT(*) FROM profesores p JOIN imparte i ON p.dni = i.dni WHERE i.asignatura != 'FDB' GROUP BY p.dni;

-- Unir las tres tablas asignaturas, imparte y profesores
SELECT * FROM (asignaturas a JOIN imparte i ON a.codigo = i.asignatura) JOIN profesores p ON p.dni = i.dni;

-- Unir las tres tablas asignaturas, profesores e imparte usando múltiples condiciones de unión
SELECT * FROM asignaturas a, profesores p, imparte i WHERE a.codigo = i.asignatura AND p.dni = i.dni;

-- Mostrar una concatenación descriptiva del profesor y la asignatura que imparte
SELECT CONCAT('El profesor con nombre ', p.nombre, ' imparte la asignatura ', a.asignatura) AS descripcion
FROM asignaturas a, profesores p, imparte i WHERE a.codigo = i.asignatura AND p.dni = i.dni;

-- Realizar una unión izquierda entre profesores e imparte para mostrar todos los profesores y sus asignaturas (si existen)
SELECT * FROM profesores p LEFT JOIN imparte i ON p.dni = i.dni;