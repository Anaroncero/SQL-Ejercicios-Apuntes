/* 
INSERT se utiliza para agregar nuevos 
registros(filas) en una tabla

Estructura:
INSERT INTO nombre_tabla (columna1, columna2, columna3, ...)
VALUES (valor1, valor2, valor3, ...);
 */


-- INSERTAR DATOS EN LA TABLA ----------------------------------------
INSERT INTO users(user_name, first_name, surname, age, email, phone_number) VALUES
('jgarcia', 'Juan', 'García', 28, 'jgarcia@example.com', '600123456'),
('mlopez', 'María', 'López', 34, 'mlopez@example.com', '600234567'),
('fmartinez', 'Fernando', 'Martínez', 45, 'fmartinez@example.com', '600345678'),
('jsanchez', 'Jose', 'Sánchez', 22, 'jsanchez@example.com', '600456789'),
('abeatriz', 'Ana', 'Beatriz', 31, 'abeatriz@example.com', '600567890'),
('lramos', 'Luis', 'Ramos', 27, 'lramos@example.com', '600678901'),
('egarcia', 'Elena', 'García', 29, 'egarcia@example.com', '600789012'),
('jhernandez', 'Javier', 'Hernández', 40, 'jhernandez@example.com', '600890123'),
('ccruz', 'Carmen', 'Cruz', 36, 'ccruz@example.com', '600901234'),
('lsuarez', 'Laura', 'Suárez', 33, 'lsuarez@example.com', '600012345');