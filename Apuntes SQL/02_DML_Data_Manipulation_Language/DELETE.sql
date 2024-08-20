/* 
Con DELETE se puede eliminar:
filas especificas, toas las filas, filas con join, filas basadas en subconsultas.

*/

-- Borrar una publicacion ----------------------------------------
DELETE FROM publication WHERE publication_id = 1;
DELETE FROM publication WHERE text LIKE '%PERRO SANXE%';
