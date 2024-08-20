/* 
Con UPDATE se puede actualizar:
los valores de uno o mas campos, filas, valores nulos, fechas

*/

UPDATE publication SET text = REPLACE(text, 'VOX', 'amigos') WHERE text LIKE '%VOX%';
