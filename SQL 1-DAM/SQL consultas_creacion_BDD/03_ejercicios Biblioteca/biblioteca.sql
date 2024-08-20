
-- -------------------------------------------
-- Creacion BBDD BIBLIOTECA
-- -------------------------------------------

drop database if exists biblioteca;
create database biblioteca;

use biblioteca;

drop table if exists libro;
create table libro(
	ISBN varchar(10) primary key,
    titulo varchar(100) not null,
    anio date not null,
    autor int(5) auto_increment
);

drop table if exists socio;
create table socio(
	cod_socio int(5) primary key,
    nombre varchar(15),
    apellidos varchar(20),
    telefono int(9)
);

drop table if exists prestamo;
create table prestamo(
	codigo int(7) auto_increment primary key,
    fecha_prestamo date not null,
    fecha_devolucion date,
    libro int(5)
);

drop table if exists autor;
create table autor(
	cod_autor int(5) primary key,
    nombre varchar(50) not null
);

ALTER TABLE libro add foreign key(autor) references autor(cod_autor);
ALTER TABLE prestamo add foreign key(libro) references libro(ISBN);

-- truncate para borrar la fila de la tabla y drop la tabla o la base de datos

-- Ejercicio 3
-- a) 
alter table socio add column direccion varchar(50); -- añadir una columna que se llama direccion
-- b) 
alter table libro add titulo varchar(150); -- modifica el tipo de dato de la columna titulo
-- c)
alter table socios add telefono varchar(9) not null;
-- d)
alter table prestamo add column socio int(5)
-- e)
alter table autor change column f_nac f_nac date;