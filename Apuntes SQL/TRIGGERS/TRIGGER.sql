/* 
Con TRIGGER o disparadores son herramientas para automatizar y controlar la base de datos
cuando ocurren eventos se puede:
insertar datos automaticamente, actualizar datos relacionados, eliminar datos relacionados, 
validar datos, evitar datos duplicados registrar cambios, aplicar reglas de negocio, generar mensajes de error,
optimizar consultas.

*/
-- TRIGGERS ----------------------------------------

-- 1. Incrementar numero seguidores
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


-- 1. Decrementar numero seguidores
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
