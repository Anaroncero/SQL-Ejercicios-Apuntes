/* 
INSERT se utiliza para agregar nuevos 
registros(filas) en una tabla

Estructura:
INSERT INTO nombre_tabla (columna1, columna2, columna3, ...)
VALUES (valor1, valor2, valor3, ...);
 */



-- INSERTAR DATOS EN LAS TABLAS ----------------------------------------
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


INSERT INTO followers(follower_id, following_id) VALUES
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 3),
(7, 3),
(8, 4),
(9, 4),
(10, 5),
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10),
(6, 8),
(7, 9),
(8, 10),
(9, 6),
(10, 7);

INSERT INTO publication(user_id, text) VALUES
(1, 'Primera publicación en la playa! 🏖️'),
(2, '☕ Café en la mañana con amigos. 😊'),
(3, 'Atardecer en la montaña. 🏞️'),
(4, '📸 Vacaciones en la ciudad de Barcelona. 🇪🇸'),
(5, '🎉 ¡Festejando el cumpleaños de mi perro! 🐶🎂'),
(6, '📚 Nuevo libro que estoy leyendo.'),
(7, '🍝 Receta de pasta casera.'),
(8, 'Entrenamiento en el gimnasio. 💪'),
(9, 'Exposición de arte moderna. 🖼️'),
(10, '🎶 Concierto en el parque. 🎸');