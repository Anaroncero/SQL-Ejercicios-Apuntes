-- TRIGGERS ----------------------------------------
DROP TRIGGER IF EXISTS increase_follower_count;
-- Configuración del delimitador
DELIMITER //
-- Crear el trigger
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
DELIMITER //
CREATE TRIGGER decrease_follower_count
AFTER DELETE ON followers
FOR EACH ROW
BEGIN
    UPDATE users
    SET follower_count = follower_count - 1
    WHERE user_id = NEW.following_id;
END//
DELIMITER ;
