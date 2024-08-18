drop database if exists biblioteca;
create database biblioteca;

use biblioteca;

create table libro(
	isbn varchar(10) primary key,
    titulo varchar(100) not null,
    anio date not null,
    autor int(5), -- Cambio de tipo de dato directamente también se puede cambiar al final con alter, debe ser del mismo tipo de la clave foranea de la tabla autor
    constraint fk_libro_autor foreign key (autor) references autor(cod_autor) -- si referenciamos al rpincipio y la tabla que queremos referenciar no esta delante de donde la referenciamos y es como que no existe o movemos la tabla o hacemos las claves foráneas al final
);

create table socio(
	cod_socio int(5) primary key,
    nombre varchar(15) not null,
    apellidos varchar(20) not null,
    telefono int(9)
);

create table prestamo(
	codigo int(7) auto_increment primary key,
    fecha_prestamo date,
    fecha_devolucion date,
    libro int(5)
);

create table autor(
	cod_autor int(5) primary key,  
    nombre varchar(50) not null
);

alter table prestamo modify column libro varchar(10); -- para que coincida con el isbn tenemos que cambiar y que tenga el tamño de 10 para luego poder hacer la clave foranea tiene que ser del mismo tamaño y del mismo tipo
alter table prestamo add constraint fk_prestamo_libro foreign key (libro) references libro(isbn);

-- ejercio 3: 

-- a 
alter table socio add direccion varchar(50);
desc socio; -- muestra
-- b
alter table libro modify titulo varchar(150);
-- c
alter table socio change column telefono telefono varchar(9) not null;
-- d
alter table prestamo add socio int(5);
alter table prestamo add constraint fk_prestamo_socio foreign key (socio) references socio(cod_socio) on update cascade; -- ELIMINAR EN CASCADA: Cuando creamos una clave foránea utilizando esta opción, elimina las filas de referencia en la tabla secundaria cuando la fila referenciada se elimina en la tabla primaria que tiene una clave primaria. ACTUALIZAR CASCADA: cuando creamos una clave externa utilizando ACTUALIZAR CASCADA, las filas de referencia se van a actualizar en la tabla secundaria cuando la fila referenciada se actualiza en la tabla principal que tiene una clave primaria.
-- e
alter table autor add f_nac date;










