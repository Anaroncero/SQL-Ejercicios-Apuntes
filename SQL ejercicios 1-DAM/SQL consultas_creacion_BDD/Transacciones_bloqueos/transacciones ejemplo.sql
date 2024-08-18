
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

drop database transacciones;
create database if not exists transacciones;
use transacciones;

create table empleados(
	id int auto_increment primary key,
    nombre varchar(20),
    departamento varchar(20),
    salario decimal (10,2) -- diez digitos y dos decimales
);

insert into empleados (nombre,departamento,salario) values
('Paco', 'IT', 3000),
('Claudia', 'RRHH', 15000),
('Lucas', 'RRHH', 3000),
('Jose', 'IT', 3000);

-- ------------------------------------------
start transaction;

update empleados set salario = salario*1.19 where departamento = 'RRHH';

select * from empleados;

savepoint antes_de_rrhh; 

update empleados set salario = salario*1.05 where departamento = 'IT';

rollback to antes_de_rrhh; -- queremos volver al punto de guardado (y que no se aplique la ultima actualización)

-- la transacción ahora mismo esta abierta. (commit)

-- ------------------ ver usuarios dar privilegios a usuario y ver permisos de los susuarios
select user, host from mysql.user;
grant all privileges on transacciones.* to 'Ana'@'%';

show grants for 'Ana'@'%';

select * from empleados;

select * from performance_schema.data_lock_waits;

-- ¿que es un bloqueo? , commit, rollback, savepoint etc

-- bloqueo manual
start transaction;
lock tables empleados write;
update empleados set aslario = salario * 1.10 where departamento = 'RRHH';
unlock tables;
