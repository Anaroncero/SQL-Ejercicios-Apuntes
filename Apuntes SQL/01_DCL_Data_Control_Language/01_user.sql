-- Creacion de usuario  ----------------------------------------
CREATE USER 'usuario'@'localhost' IDENTIFIED BY '123';
SELECT user, host FROM mysql.user;
	-- dar permisos
    GRANT ALL PRIVILEGES ON red_social.* TO 'usuario'@'localhost';
    -- ver los permisos que tiene un usuario
    SHOW GRANTS FOR 'usuario'@'localhost';
    FLUSH PRIVILEGES;