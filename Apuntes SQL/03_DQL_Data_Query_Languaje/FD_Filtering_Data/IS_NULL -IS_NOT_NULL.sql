-- 1. Muestra todos los usuarios que no tengan una conuntry null
SELECT * FROM users WHERE country IS NOT NULL;

-- 2. Muestra los usuarios que tienen una country nula
SELECT * FROM users WHERE country IS NULL;