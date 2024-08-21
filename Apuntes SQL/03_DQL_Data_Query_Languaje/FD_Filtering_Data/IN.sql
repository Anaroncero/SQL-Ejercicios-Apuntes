/* 
IN: 
*/

-- 1. Selecciona los Usuarios de Spain y Scotland
SELECT * FROM users WHERE country IN ('Spain', 'Scotland');

-- 2 Muestrame las publicaciones de los usuarios 2, 4 y 6
SELECT * FROM publication WHERE user_id IN (2, 4, 6);

-- 3. Muestrame los usuarios que NO son de 
SELECT * FROM users WHERE country NOT IN ('Spain');
