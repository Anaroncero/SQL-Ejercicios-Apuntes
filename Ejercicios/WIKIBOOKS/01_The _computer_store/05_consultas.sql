-- 1. Seleccione los nombres de todos los productos de la tienda.
SELECT name FROM Products;

-- 2. Seleccione los nombres y los precios de todos los productos de la tienda.
SELECT name, price FROM Products;

-- 3. Seleccione el nombre de los productos con precio menor o igual a $200.
SELECT name FROM Products WHERE price <= 200;

-- 4. Seleccione todos los productos con un precio entre $60 y $120.
SELECT * from Products WHERE price BETWEEN 60 and 120;

-- 5. Seleccione el nombre y el precio en centavos (es decir, el precio debe multiplicarse por 100).
SELECT name, price * 100 AS cents FROM Products;

-- 6. Calcula el precio promedio de todos los productos.
SELECT AVG(price) FROM Products;

-- 7. Calcule el precio promedio de todos los productos con código de fabricante igual a 2.
SELECT AVG(price) FROM Products WHERE Code = 2;

-- 8. Calcule el número de productos con un precio mayor o igual a $180.
SELECT COUNT(*) FROM Products WHERE price >= 180;

-- 9. Seleccione el nombre y el precio de todos los productos con un precio mayor o igual a $180, y ordene primero por precio (en orden descendente) y luego por nombre (en orden ascendente).
SELECT name, price FROM Products WHERE price >= 180 ORDER BY price DESC, name ASC;

-- 10. Seleccione todos los datos de los productos, incluidos todos los datos del fabricante de cada producto.
SELECT * FROM Products 
LEFT JOIN Manufacturers
ON Manufacturers.Code = Products.Code;

-- 11. Seleccione el nombre del producto, el precio y el nombre del fabricante de todos los productos
SELECT Products.name, Products.price,  Manufacturers.name FROM Products
INNER JOIN Manufacturers 
ON Manufacturers.Code = Products.Code;

-- 12. Seleccione el precio promedio de los productos de cada fabricante, mostrando solo el código del fabricante.
SELECT AVG(price), Manufacter FROM Products GROUP BY Manufacter;

-- 13. Seleccione el precio promedio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT AVG(price), Manufacturers.name FROM Products       
INNER JOIN Manufacturers 
on Manufacturers.code = Products.code
GROUP BY Manufacturers.name;

-- 14. Seleccione los nombres de los fabricantes cuyos productos tengan un precio promedio mayor o igual a $150
SELECT AVG(price), Manufacturers.name FROM Products
INNER JOIN Manufacturers 
ON Products.Manufacter = Manufacturers.Code
GROUP BY Manufacturers.name HAVING AVG(price) >= 150;

-- 15. Seleccione el nombre y el precio del producto más barato
SELECT name, price FROM Products ORDER BY price ASC LIMIT 1;/*SELECCIONA SOLO 1 */
SELECT name, price FROM Products WHERE price = (SELECT MIN(price) FROM Products);

-- 16. Seleccione el nombre de cada fabricante junto con el nombre y el precio de su producto más caro.
SELECT Manufacturers.name, Products.name, Products.price FROM Products
INNER JOIN Manufacturers
on Products.Manufacter = Manufacturers.Code 
AND Products.price = (select max(price) from Products  where Products.Manufacter = Manufacturers.code);

-- 17. Seleccione el nombre de cada fabricante que tenga un precio promedio superior a $145 y que contenga al menos 2 productos diferentes.
SELECT Manufacturers.name, AVG(price) as p_price, COUNT(Products.Manufacter) as m_count
FROM Manufacturers, Products 
WHERE Products.Manufacter = Manufacturers.code 
GROUP BY Manufacturers.name, Products.manufacter
HAVING AVG(Products.price) >= 150 and COUNT(Products.Manufacter) >=2;

-- 18. Agregar un nuevo producto: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products(name, price, Manufacter) VALUES ('Loudspeakers', 70, 2);

-- 19. Actualice el nombre del producto 8 a "Impresora láser".
UPDATE Products SET name = 'Laser Printer' WHERE Code = 8;

-- 20. Aplicar un 10% de descuento a todos los productos.
UPDATE Products SET price = price - (price * 0.1);

-- 21. Aplicar un 10% de descuento a todos los productos con un precio mayor o igual a $120.
