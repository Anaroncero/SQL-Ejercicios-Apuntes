/* 
DISTINCT: Para no mostrar valores duplicados, devuelve valores únicos 
Ejemplo: si hay varios usuarios de Spain en lugar de mostrar todas las veces Spain lo muestra solo una
*/
-- 1. Seleccionar Todos los Nombres de Usuario Únicos
SELECT DISTINCT user_name FROM users;

-- 2. SELECT DISTINCT country FROM users;
SELECT DISTINCT country FROM users;

-- 3. Muestra todos los paises sin repetir
SELECT DISTINCT country FROM users;

-- 4. Cuenta los paises que hay sin repetir y muestralos en una columna llamada paises 
SELECT COUNT(DISTINCT country) AS numero_paises FROM users;