/* 
Al crear una tabla se tienen que definir los campos(columnas)
y de qué tipo son hay muchos tipos

Tipos:
INT (número entero), Varchar (alfanumérico), etc...
Con Varchar es necesario también indicar cuantos caracteres.

Estructura de un campo:
Nombre + tipo + restricciones

Restricciones:
-PRIMARY KEY: clave primaria, cada tabla solo puede tener una; tiene que ser única.
-NOT NULL: Una columna no puede tener un valor nulo.
-UNIQUE: garantiza que todos los valores de una columna sean únicos (no se puedan repetir).
-AUTO_INCREMENT: se utiliza para generar automáticamente un valor numérico, para cada fila. Comienza desde el 1 y va aumentado.
-FOREIGN KEY: Para establecer relación entre dos tablas. El valor de este campo debe coincidir con el valor de otra columna de la tabla relacionada.
-DEFAULT: Especifica un valor determinado para un campo (se le asignará un valor cuando no se proporcione ninguno).
-CHECK: Especifica una condición que se debe cumplir.
-INDEX: crea un índice en una o más columnas de la tabla para acelerar las búsquedas.
-UNIQUE INDEX: Es un índice que también asegura que todos los valores sean únicos.
 */

-- CREAR TABLA ----------------------------------------
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	user_id INT AUTO_INCREMENT PRIMARY KEY, 
    user_name VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    age INT(2) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number CHAR(10) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT(NOW())
);