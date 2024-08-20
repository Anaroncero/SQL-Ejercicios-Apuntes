/* 
REVOKE se usa para:
retirar los permisos concedidos a un usuario o rol.

Tipos de privilegios:
SELECT, INSERT, UPDATE, DELETE, ALL PRIVILEGIES

Objeto: Base de datos o una tabla


Estructura:
    REVOKE tipos_privilegios ON objecto TO 'user'@'host';

Despues de usar REVOKE se tiene que aplicar cambios con:
    FLUSH PRIVILEGES;
*/
