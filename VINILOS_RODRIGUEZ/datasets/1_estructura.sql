DROP DATABASE IF EXISTS vinilos; 
CREATE DATABASE vinilos;
USE vinilos;

CREATE TABLE CLIENTE(
id_cliente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50),
apellido VARCHAR(50),
email VARCHAR(100),
telefono VARCHAR(20),
direccion VARCHAR(150),
PRIMARY KEY (id_cliente)
) COMMENT 'DATOS DEL CLIENTE';

CREATE TABLE DISCO(
id_disco INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(100),
interprete VARCHAR(100),
genero VARCHAR(50),
precio_compra DECIMAL(10, 2) DEFAULT 10,
precio_venta DECIMAL(10, 2) DEFAULT 10,
cantidad_disponible INT,
PRIMARY KEY (id_disco)
)COMMENT 'INFORMACION DEL DISCO';

CREATE TABLE PROVEEDOR(
id_proveedor INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(100),
contacto VARCHAR(100),
telefono VARCHAR(20),
email VARCHAR(100),
direccion VARCHAR(150),
PRIMARY KEY (id_proveedor)
)COMMENT 'DATOS DEL PROVEEDOR';

CREATE TABLE TRANSACCION(
id_transaccion INT NOT NULL AUTO_INCREMENT,
id_cliente INT,
id_disco INT,
tipo_transaccion VARCHAR(20),
fecha DATETIME DEFAULT (CURRENT_TIMESTAMP),
cantidad INT,
precio_total DECIMAL(10, 2) DEFAULT 10,
PRIMARY KEY (id_transaccion)
)COMMENT 'DATOS DE LA TRANSACCION';

CREATE TABLE INVENTARIO(
id_inventario INT NOT NULL AUTO_INCREMENT,
id_disco INT,
id_proveedor INT,
cantidad_entrada INT,
fecha_entrada DATETIME DEFAULT (CURRENT_TIMESTAMP),
PRIMARY KEY (id_inventario)
)COMMENT 'MOVIMIENTOS DE STOCK';

ALTER TABLE TRANSACCION
	ADD CONSTRAINT fk_trans_cliente
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente);

ALTER TABLE TRANSACCION
	ADD CONSTRAINT fk_trans_disco
    FOREIGN KEY (id_disco) REFERENCES DISCO(id_disco);
    
ALTER TABLE INVENTARIO
	ADD CONSTRAINT fk_inv_disco
    FOREIGN KEY (id_disco) REFERENCES DISCO(id_disco);
    
ALTER TABLE INVENTARIO
	ADD CONSTRAINT fk_inv_proveedor
    FOREIGN KEY (id_proveedor) REFERENCES PROVEEDOR(id_proveedor);
    
