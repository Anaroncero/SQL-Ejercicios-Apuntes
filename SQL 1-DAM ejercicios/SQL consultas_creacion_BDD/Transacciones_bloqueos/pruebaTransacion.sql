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

drop database if exists pruebaT;
create database pruebaT;
use pruebaT;

-- empezar una transacción
START transaction;

CREATE TABLE prueba(
	dato1 int,
    dato2 int
); 

INSERT into prueba values (5,10); 
select * from prueba;

-- yo quiero que todo lo anterior (los datos se almacenen) finalizo con un commit
commit;
-- esta transaccion esta terminada si yo quiero introducir más datos en esta transaccion tendria que hacer otra transaccion que estaria a partir del commit

-- puntos de salvado---------------------------
start transaction;
INSERT INTO prueba values (10,20);
UPDATE prueba set dato1=0 where dato2=10;

select* from prueba;

savepoint puntoSalvado1;

INSERT INTO prueba values (30,40);
update prueba set dato1=0 where dato2=20;

select * from prueba;
savepoint puntoSalvado2;

-- rollback si queremos volver al punto de salvado 1 
rollback to savepoint puntoSalvado1;
select * from prueba;
commit;
