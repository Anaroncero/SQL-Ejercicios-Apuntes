-- Ana Pastor Roncero
DROP DATABASE IF EXISTS cine; 
create database cine;
use cine;

drop table if exists genero; -- si existe una tabla que se llame empleados que se borre
create table genero(
	idGenero int(5) auto_increment primary key,
    nombre varchar(20) not null,
    drama varchar(20),
    accion varchar(20)
    );

create table director(
	codDirector int(5) auto_increment,
	nombre varchar(50) not null,
    fNacimiento date not null,
    nacionalidad varchar(50) not null,
    fFallecimiento date,
    primary key (codDirector)
);

create table pelicula(
	codPelicula int(5) auto_increment primary key,
    titulo varchar(20) not null,
    anio int(4) not null,
    duracion double,
    genero varchar(20),
    foreign key (codPelicula) references director(codDirector) on update cascade
); 

alter table pelicula change column titulo titulo varchar(50) not null; -- para cambiar el tamaño de dato de una columna
ALTER TABLE pelicula add foreign key(codPelicula) references genero(idGenero);

-- crear un usuario
create user 'alumno1'@'localhost' identified by 'Med@c'; -- detras de la arroba se puede poner una ip, localhost....
select user, host from mysql.user;

-- dar permisos para el usuario
grant alter on director to 'alumno1'@'localhost'; -- alter solo tiene permisos para modificar para dar todos los permisos grant all privilegies on empresa to marta  y si queremos darle ese permiso a todos ponemos empresa.* 
alter table director add fFallecimiento date; -- en clase poner
flush privileges; -- para que se apliquen los privilegios

revoke alter on cine.* from 'alumno1'@'localhost' -- quitar los permisos de toda la base de datos 






