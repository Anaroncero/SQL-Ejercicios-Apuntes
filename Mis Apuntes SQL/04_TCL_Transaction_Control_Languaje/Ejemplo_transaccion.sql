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
