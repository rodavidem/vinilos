USE vinilos;

CREATE USER
    'ddl_user'@'%' IDENTIFIED BY 'clave1234';
CREATE USER
    'consumer_user'@'%' IDENTIFIED BY 'clave1234';
CREATE USER
    'backup_user'@'%' IDENTIFIED BY 'clave1234';


GRANT SELECT, INSERT, UPDATE
    ON vinilos.* TO 'ddl_user'@'%' ;


SHOW GRANTS FOR
    'ddl_user'@'%' ;

GRANT SELECT
    ON vinilos.cantidad_discos_por_genero
    TO 'consumer_user'@'%' ;

GRANT SELECT
    ON vinilos.vista_inventario_proveedor
    TO 'consumer_user'@'%' ;

SHOW GRANTS FOR
    'consumer_user'@'%' ;

GRANT USAGE 
    ON vinilos.*
    TO 'backup_user'@'%';

GRANT PROCESS, RELOAD
    ON *.*
    TO 'backup_user'@'%';

GRANT SELECT, LOCK TABLES, SHOW VIEW, EVENT, TRIGGER
    ON vinilos.*
    TO 'backup_user'@'%';

SHOW GRANTS FOR
    'backup_user'@'%';