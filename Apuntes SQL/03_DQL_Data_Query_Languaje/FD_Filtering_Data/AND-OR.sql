/* 
AND:
OR:
*/

-- 1. Muestrame los usuarios de Spain o de edad 16
SELECT * FROM users WHERE country = 'España' OR age = 16;

-- 2. Muestrame los usuarios de Francia o los nulos
SELECT * FROM users WHERE country = 'France' OR country IS NULL;

-- 3. Muestrame los usuarios de Scotland o England, menores de 25
SELECT * FROM users WHERE (country = 'Scotland' OR country = 'England') AND age < 25;

