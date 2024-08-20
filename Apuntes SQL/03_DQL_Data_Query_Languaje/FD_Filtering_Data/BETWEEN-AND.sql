-- 1. Selecciona los usuarios con edad entre 16 y 25
SELECT * FROM users WHERE age BETWEEN 16 AND 25;

-- 1. Selecciona los usuarios que no tengan de edad entre 16 y 25
SELECT * FROM users WHERE age NOT BETWEEN 16 AND 25;

-- 2. Selecciona el nombre y la edad de los primeros 3 usuarios 
SELECT first_name, age FROM users WHERE user_id BETWEEN 1 AND 5;