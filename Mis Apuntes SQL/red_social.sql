-- -------------------------------------------
-- Creacion BBDD
-- -------------------------------------------

/*Eliminar Base de datos si existe (para que no haya problemas)*/
DROP DATABASE IF EXISTS red_social;

/*Crear Base de datos*/
CREATE DATABASE red_social;

/*Usar Base de datos*/
USE red_social;

/*Mostrar las bases de datos que hay*/
SHOW DATABASES;

-- CREAR TABLAS ----------------------------------------
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    age INT(2) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number CHAR(10) NOT NULL UNIQUE,
    follower_count INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT(NOW())
);


-- CREAR TABLA ----------------------------------------
DROP TABLE IF EXISTS followers;
CREATE TABLE followers(
		follower_id  INT NOT NULL,
        following_id INT NOT NULL,
        PRIMARY KEY(follower_id, following_id), -- ambos los ponemos como primary key porque no se pueden repetir (un usuario no se puede seguir a si mismo)
        FOREIGN KEY(follower_id) REFERENCES users(user_id),
        FOREIGN KEY(following_id) REFERENCES users(user_id)
);

DROP TABLE IF EXISTS publication;
CREATE TABLE publication(
	publication_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    text VARCHAR(200) NOT NULL,
    num_commments INT DEFAULT 0,
    num_likes INT DEFAULT 0,
    num_shared INT DEFAULT 0,
    ccreated_at TIMESTAMP NOT NULL DEFAULT(NOW()),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

DROP TABLE IF EXISTS publication_likes;
CREATE TABLE publication_likes(
	user_id INT NOT NULL,
    publication_id INT NOT NULL, -- ambos los ponemos como primary key porque no se pueden repetir (un usuario no le puede gustar una publicacion dos veces)
    PRIMARY KEY(user_id, publication_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (publication_id) REFERENCES publication (publication_id)
);

-- Creacion de usuario  ----------------------------------------
CREATE USER 'usuario'@'localhost' IDENTIFIED BY '123';
SELECT user, host FROM mysql.user;
	-- dar permisos
    GRANT ALL PRIVILEGES ON red_social.* TO 'usuario'@'localhost';
    -- ver los permisos que tiene un usuario
    SHOW GRANTS FOR 'usuario'@'localhost';
    FLUSH PRIVILEGES;

-- MODIFICAR RESTRICIONES EN LA TABLA ----------------------------------------
ALTER TABLE followers 
ADD CONSTRAINT check_follower_id
CHECK (follower_id <> following_id); -- Asegura que no coincida el id following y el follower

ALTER TABLE users
ADD column country VARCHAR(100);


-- INSERTAR DATOS EN LAS TABLAS ----------------------------------------
INSERT INTO users (user_name, first_name, surname, age, email, phone_number, follower_count, country) VALUES
('jgarcia', 'Juan', 'García', 18, 'jgarcia@example.com', '600123456', 3, 'Scotland'),
('mlopez', 'María', 'López', 22, 'mlopez@example.com', '600234567', 1, 'France'),
('fmartinez', 'Fernando', 'Martínez', 16, 'fmartinez@gmail.com', '600345678', 2, 'Spain'),
('jsanchez', 'Jose', 'García', 22, 'jsanchez@example.com', '600456789', 2, null),
('abeatriz', 'Ana', 'Beatriz', 31, 'abeatriz@example.com', '600567890', 1, 'England'),
('lramos', 'Luis', 'García', 23, 'lramos@example.com', '600678901', 2, 'Spain'),
('egarcia', 'Elena', 'García', 29, 'egarcia@gmail.com', '600789012', 2, 'England'),
('jhernandez', 'Javier', 'Hernández', 40, 'jhernandez@example.com', '600890123', 2, 'Spain'),
('amcruz', 'Ana Maria', 'Cruz', 36, 'amcruz@example.com', '600901234', 1, 'France'),
('lsuarez', 'Laura', 'Suárez', 33, 'lsuarez@gmail.com', '600012345', 2, null);


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

INSERT INTO followers(follower_id, following_id) VALUES
(1, 2), (2, 1), (4, 1), (5, 1), (6, 3), (7, 3), (8, 4), (9, 4), (10, 5),
(1, 6), (2, 7), (3, 8), (4, 9), (5, 10), (6, 8), (8, 10), (9, 6), (10, 7);



-- TRIGGERS ----------------------------------------
DROP TRIGGER IF EXISTS increase_follower_count;
-- Configuración del delimitador
DELIMITER //
-- Crear el trigger para aumentar el conteo de seguidores
CREATE TRIGGER increase_follower_count
AFTER INSERT ON followers
FOR EACH ROW
BEGIN
    UPDATE users
    SET follower_count = follower_count + 1
    WHERE user_id = NEW.following_id;
END//
-- Restaurar el delimitador
DELIMITER ;

DROP TRIGGER IF EXISTS decrease_follower_count;
-- Configuración del delimitador
DELIMITER //
-- Crear el trigger para disminuir el conteo de seguidores
CREATE TRIGGER decrease_follower_count
AFTER DELETE ON followers
FOR EACH ROW
BEGIN
    UPDATE users
    SET follower_count = follower_count - 1
    WHERE user_id = OLD.following_id; -- Cambiado de NEW a OLD
END//
-- Restaurar el delimitador
DELIMITER ;


-- TRANSACCION ----------------------------------------
-- 1. Anadir publicacion
-- Cambiar el delimitador temporalmente para definir el procedimiento
DELIMITER //

-- Crear el procedimiento almacenado para agregar una nueva publicación
CREATE PROCEDURE AddPublication(
    IN p_user_id INT,
    IN p_publication_text VARCHAR(200)
)
BEGIN
    DECLARE user_exists INT;

    -- Iniciar la transacción
    START TRANSACTION;

    -- Verificar si el usuario existe
    SELECT COUNT(*) INTO user_exists
    FROM users
    WHERE user_id = p_user_id;

    -- Si el usuario no existe, revertir la transacción
    IF user_exists = 0 THEN
        ROLLBACK;
        SELECT 'Error: El usuario no existe. Transacción revertida.' AS mensaje;
    ELSE
        -- Insertar la nueva publicación
        INSERT INTO publication (user_id, text)
        VALUES (p_user_id, p_publication_text);

        -- Confirmar la transacción si todo está bien
        COMMIT;
        SELECT 'Publicación insertada correctamente. Transacción confirmada.' AS mensaje;
    END IF;
END //

-- Restaurar el delimitador a la configuración por defecto
DELIMITER ;


-- Muestra informacion de todos los procedimientos de la base de datos 
SHOW PROCEDURE STATUS WHERE Db = 'red_social';

--  Llama al procedimiento almacenado para anadir una publicacion.
CALL AddPublication(1, 'Nueva publicación de prueba.');





