-- Borrar una publicacion ----------------------------------------
SET SQL_SAFE_UPDATES = 0;
DELETE FROM publication WHERE publication_id = 1;
DELETE FROM publication WHERE text LIKE '%PERRO SANXE%';
SET SQL_SAFE_UPDATES = 1;
