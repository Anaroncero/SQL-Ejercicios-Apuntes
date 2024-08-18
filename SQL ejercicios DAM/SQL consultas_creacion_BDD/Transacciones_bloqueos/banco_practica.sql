drop database if exists banco_practica; 
create database banco_practica;
use banco_practica;

/* 

.-========================-.
|==========================|
|                          |
|        SQL Gestión       |
|      de transacciones    |
|        y Bloqueos        |
|                          |
'--------------------------'

*/


-- -----------------------------------
-- Parte 1: Preparación del Entorno  -
-- -----------------------------------
    
-- Tablas 
create table cuentas(
	id int auto_increment primary key,
    dni_titular varchar(10) not null,
    saldo double not null
);

-- Insertar registros en la tabla cuentas 
INSERT INTO  cuentas(dni_titular, saldo) VALUES ('918362657X','1000.00');
INSERT INTO cuentas(dni_titular, saldo) VALUES ('154789651S','100.00');
INSERT INTO cuentas(dni_titular, saldo) VALUES ('784575986O','12000.55');
INSERT INTO cuentas(dni_titular, saldo) VALUES('42157986P','4000.00');
INSERT INTO cuentas(dni_titular, saldo) VALUES('42157986P','2800.45');

-- -------------------------------------------
-- Parte 2: Implementación de Transacciones  -
-- -------------------------------------------

-- Crear usuario 
drop user 'alumno16'@'localhost';
CREATE USER 'alumno16'@'localhost' IDENTIFIED BY 'Med@c';
-- otorgar privilegio al usuario en la base de datos
GRANT ALL PRIVILEGES ON * . * TO 'alumno16'@'localhost';
-- aplicar los privilegios
FLUSH PRIVILEGES;

-- Realizar transferencia 
-- Mostrar la tabla antes de las actualizaciones
select * from cuentas;

-- Iniciar transacción
START TRANSACTION;
-- Decrementar saldo de cuenta emisor
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1 AND saldo >= 100;

-- SAVEPOINT antes de la segunda actualización
SAVEPOINT antes_aumento_saldo;
select * from cuentas;

-- Aumentar saldo de cuenta receptor
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;

-- Realizar la transferencia incorrecta
UPDATE cuentas SET saldo = saldo + 5000 WHERE id = 1;
SELECT * FROM cuentas;

SELECT 'Realizando rollback, no se puede hacer transaccion no hay dinero...' AS Mensaje;
rollback to antes_aumento_saldo;
select * from cuentas;

-- ------------------------------
-- Parte 3: Bloqueos de Tablas  -
-- ------------------------------

-- 1.bloqueo de tabla manual
LOCK TABLES cuentas WRITE;


-- desbloqueo las tablas 
UNLOCK TABLES;

-- 2.Verificación de Bloqueos Automáticos














