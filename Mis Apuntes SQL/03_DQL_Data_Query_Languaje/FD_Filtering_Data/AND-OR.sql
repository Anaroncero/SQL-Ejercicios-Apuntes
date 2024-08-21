/* 
AND: tienen que cumplir todas las condiciones especificadas
OR: puede cumplir una condicion u otra
*/

-- 1. Muestrame los usuarios de Spain o de edad 16
SELECT * FROM users WHERE country = 'España' OR age = 16;

-- 2. Muestrame los usuarios de Francia o los nulos
SELECT * FROM users WHERE country = 'France' OR country IS NULL;

-- 3. Muestrame los usuarios de Scotland o England, menores de 25
SELECT * FROM users WHERE (country = 'Scotland' OR country = 'England') AND age < 25;

-- 4. Selecciona los usuarios que sean de Spain o France;
SELECT * FROM users WHERE country = 'Spain' OR country = 'France';

-- 5. Selecciona los usuarios de 22 años o con mas de 5 seguidores
SELECT * FROM users WHERE age = 22 OR follower_count >= 5;

-- 6. Selecciona los usuarios que se apelliden Martínez o se llame Ana
SELECT * FROM users WHERE surname = 'Suárez' OR first_name = 'Ana';
