drop database if exists empresa; -- si existe una base de datos que se llame empresa que se borre y cree esta
create database empresa;
use empresa;

drop table if exists empleados; -- si existe una tabla que se llame empleados que se borre
create table empleados(
	id int auto_increment primary key, 
    nombre varchar(50) not null,
    salario float
    );

-- crear un usuario
create user 'marta'@'localhost' identified by 'Med@c'; -- detras de la arroba se puede poner una ip, localhost....
select user, host from mysql.user;

-- dar permisos para el usuario
grant alter on empresa to 'marta'@'localhost'; -- alter solo tiene permisos para modificar para dar todos los permisos grant all privilegies on empresa to marta  y si queremos darle ese permiso a todos ponemos empresa.* 

-- añadir un nuevo atributo (desde consola con el usuario que tenemos permiso alter table empleados: > alter table empleados add column 'direccion' varchar(50) null after 'nombre';)
alter table empleados add column direccion varchar(50) null after nombre;

grant select on empresa.* to 'marta'@'localhost'; 

desc empleados;

-- como ver los permisos que tiene un usuario
show grants for 'marta'@'localhost';

alter table empleados change column nombre nombre varchar(20) not null; -- para cambiar el tamaño de dato de una columna

flush privileges; -- para que se apliquen los privilegios