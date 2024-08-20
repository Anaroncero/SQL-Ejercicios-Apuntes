/* 
GRANT se usa para:
Otorgar permisos a los usuarios o roles.

Tipos de privilegios:
SELECT, INSERT, UPDATE, DELETE, ALL PRIVILEGIES

Objeto: Base de datos o una tabla


Estructura:
    GRANT tipos_privilegios ON objecto TO 'user'@'host';

Despues de usar GRANT se tiene que aplicar cambios con:
    FLUSH PRIVILEGES;

Ver los permisos que tiene un usuario:
    SHOW GRANTS FOR 'usuario'@'localhost';

*/

