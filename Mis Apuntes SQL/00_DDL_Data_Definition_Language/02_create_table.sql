/* 
Al crear una tabla se tienen que definir los campos(columnas)
y de qué tipo son hay muchos tipos

Tipos:
INT (número entero), Varchar (alfanumérico), etc...
Con Varchar es necesario también indicar cuantos caracteres.

Estructura de una tabla:
CREATE TABLE nombre_tabla (
    columna1 tipo_de_dato [opciones],
    columna2 tipo_de_dato [opciones],
    ...
    [restricciones]
);

Estructura de un campo:
Nombre + tipo + restricciones

Restricciones:
-PRIMARY KEY: clave primaria, tiene que ser única.
-NOT NULL: Una columna no puede tener un valor nulo.
-UNIQUE: garantiza que todos los valores de una columna sean únicos (no se puedan repetir).
-AUTO_INCREMENT: se utiliza para generar automáticamente un valor numérico, para cada fila. Comienza desde el 1 y va aumentado.
-FOREIGN KEY: Para establecer relación entre dos tablas. El valor de este campo debe coincidir con el valor de otra columna de la tabla relacionada.
-DEFAULT: Especifica un valor determinado para un campo (se le asignará un valor cuando no se proporcione ninguno).
-CHECK: Especifica una condición que se debe cumplir.
-INDEX: crea un índice en una o más columnas de la tabla para acelerar las búsquedas.
-UNIQUE INDEX: Es un índice que también asegura que todos los valores sean únicos.
 */

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
