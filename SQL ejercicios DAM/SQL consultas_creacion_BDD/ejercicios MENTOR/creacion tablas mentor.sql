-- Ana Pastor Roncero
DROP DATABASE IF EXISTS mentor; 
CREATE DATABASE mentor; -- creamis la base de datos
USE mentor; -- uso la base de datos, si no no funciona
SHOW DATABASES; -- muestroala base de datos

CREATE TABLE administrador_aula(
	dni varchar(9) primary key not null, -- restringimos con not null para que el usuario no lo deje vacío
    nombre varchar(50) not null,
    email varchar(20) null
);

CREATE TABLE aula(
	cod_aula int auto_increment not null,
    nombre varchar(50) not null,
    direccion varchar(100) not null,
    primary key (cod_aula) 
);

-- crear la tabla administra y ponemos en este ejemplo la clave primaria abajo pero también podemos ponerla como el ejemplo anterior
CREATE TABLE administra(
	cod_aula int not null,
    dni_adm varchar(9) not null,
    primary key(cod_aula, dni_adm) 
);

-- como se hacen claves foráneas: hay que modificar 
-- la tabla constraint significa como que le voy a poner ese nombre a la clave foránea, 
-- references es para referenciar a la tabla aula
ALTER TABLE administra add constraint fk_cod_aula foreign key(cod_aula) references aula(cod_aula);
ALTER TABLE administra add constraint fk_dni_adm foreign key(dni_adm) references administrador_aula(dni);

CREATE TABLE alumnos(
	email varchar(20) primary key not null,
    dni varchar(9) not null,
    nombre varchar(50) not null, -- para que no se pueda añadir un campo vacío
    direccion varchar(100) not null,
    telefono varchar(18) null, -- que no de error si no lo pone puede haber alumnos con telefono o sin telefono, permite poner valores nulos
    espanol boolean not null,
    cod_aula int not null unique, -- debe existir ese, un alumno puede pertenecer unicamente a un aula lo metemos como una clave foránea por que es 1:N,
    constraint fk_alumno_cod_aula foreign key(cod_aula) references aula(cod_aula) -- con constraint se pone el nombre que nosotros queramos a la clave foránea
 );

CREATE TABLE curso (
	cod_curso  int auto_increment primary key not null,
	nombre varchar(50) not null,
    libro varchar(50) null, -- es null porque en el diagrama aparece la linea del atributo discontinua eso queria decir que era opcional entonces lo opcional es null
    url varchar(30) -- poner null es lo mismo que no poner nada
);

CREATE TABLE matricular( -- creamos una tabla por la relacion N:M del diagrama E/R y añadimos los atributos de la relacion tambien fecha inicio y fecha final
	email_alumno varchar(20) not null, 
    cod_curso int not null, -- aqui no se pone el increment porque ya lo coge de la tabla de arriba
    fech_ini date not null,
    fech_fin date null,
    primary key (email_alumno, cod_curso),
    foreign key (email_alumno) references alumnos(email),
    foreign key (cod_curso) references curso(cod_curso)
);

CREATE TABLE tutor(
	dni varchar(9) primary key not null,
    nombre varchar(50) not null,
    email varchar(50) not null
);

CREATE TABLE tutoriza( -- tabla creada por la relacion del diagrama er
	dni_tutor varchar(9),
    cod_curso int,
    primary key (dni_tutor, cod_curso), -- he puesto aqui las dos claves primarias porque no me deja poner dos primary key en dni_tutor y en cod curso
    foreign key (dni_tutor) references tutor(dni),
    foreign key (cod_curso) references curso(cod_curso)
);

CREATE TABLE coordina( -- al ser una relacion reflexiva de N:M se creaba una tabla y se le añadia a la relacion un atributo y se cogia tambien la primaria de la entidad
	dni_tutor varchar(9),
    dni_coordina varchar(9), -- esta es la que creamos de la relacion 
    primary key (dni_tutor, dni_coordina),
    foreign key (dni_tutor) references tutor(dni),
    foreign key (dni_coordina) references tutor(dni) -- se pone la misma tabla de referencia porque los dos referencia a la misma tabla
);

-- truncate es para borrar files (aún no lo hemos usado por ejemplo pongo truncate socio me borra toda la fila y si pongo drop socio me borra la tabla
    
    