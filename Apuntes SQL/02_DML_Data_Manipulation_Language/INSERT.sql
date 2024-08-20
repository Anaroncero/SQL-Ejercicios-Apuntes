/* 
INSERT se utiliza para agregar nuevos 
registros(filas) en una tabla

Estructura:
INSERT INTO nombre_tabla (columna1, columna2, columna3, ...)
VALUES (valor1, valor2, valor3, ...);
 */

- INSERTAR DATOS EN LAS TABLAS ----------------------------------------
INSERT INTO users (user_name, first_name, surname, age, email, phone_number, follower_count, country) VALUES
('jgarcia', 'Juan', 'García', 18, 'jgarcia@example.com', '600123456', 3, 'Spain'),
('mlopez', 'María', 'López', 22, 'mlopez@example.com', '600234567', 1, 'Spain'),
('fmartinez', 'Fernando', 'Martínez', 16, 'fmartinez@gmail.com', '600345678', 2, 'Spain'),
('jsanchez', 'Jose', 'García', 22, 'jsanchez@example.com', '600456789', 2, 'Spain'),
('abeatriz', 'Ana', 'Beatriz', 31, 'abeatriz@example.com', '600567890', 1, 'Spain'),
('lramos', 'Luis', 'García', 23, 'lramos@example.com', '600678901', 2, 'Spain'),
('egarcia', 'Elena', 'García', 29, 'egarcia@gmail.com', '600789012', 2, 'Spain'),
('jhernandez', 'Javier', 'Hernández', 40, 'jhernandez@example.com', '600890123', 2, 'Spain'),
('amcruz', 'Ana Maria', 'Cruz', 36, 'amcruz@example.com', '600901234', 1, 'Spain'),
('lsuarez', 'Laura', 'Suárez', 33, 'lsuarez@gmail.com', '600012345', 2, 'Spain');


INSERT INTO followers(follower_id, following_id) VALUES
(1, 2), (2, 1), (4, 1), (5, 1), (6, 3), (7, 3), (8, 4), (9, 4), (10, 5),
(1, 6), (2, 7), (3, 8), (4, 9), (5, 10), (6, 8), (8, 10), (9, 6), (10, 7);

INSERT INTO publication(user_id, text) VALUES
(1, 'Primera publicación en la playa! 🏖️'),
(2, '☕ Café en la mañana con VOX. 😊'),
(8, 'Atardecer en la montaña. 🏞️'),
(4, '📸 Vacaciones en la ciudad de Barcelona. 🇪🇸'),
(3, 'ME CAE MAL PERRO SANXE'),
(2, '📚 Nuevo libro que estoy leyendo de VOX.'),
(3, '🍝 Receta de pasta casera.'),
(8, 'Entrenamiento en el gimnasio. 💪'),
(2, 'Exposición de arte moderna. 🖼️'),
(10, '🎶 Concierto en el parque. 🎸');


INSERT INTO publication_likes(user_id, publication_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 4), (7, 5), (8, 5), (9, 6), (10, 7),
(1, 8), (2, 8), (3, 9), (4, 10), (5, 10), (6, 10), (7, 1), (8, 3), (9, 4), (10, 2);
