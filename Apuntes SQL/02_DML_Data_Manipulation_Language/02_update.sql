-- Actualizar ----------------------------------------
SET SQL_SAFE_UPDATES = 0;
UPDATE publication SET text = REPLACE(text, 'VOX', 'amigos') WHERE text LIKE '%VOX%';
SET SQL_SAFE_UPDATES = 1;