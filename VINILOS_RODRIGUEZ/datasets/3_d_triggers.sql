
USE vinilos;

-- triggers
	-- after_venta_update_inventory -- Este trigger se ejecuta después de insertar una nueva transacción de venta en la tabla TRANSACCION. Su función es actualizar el inventario, restando la cantidad vendida del stock disponible en la tabla DISCO.
    
DELIMITER //

CREATE TRIGGER after_venta_update_inventory
AFTER INSERT ON TRANSACCION
FOR EACH ROW
BEGIN
    IF NEW.tipo_transaccion = 'venta' THEN
        CALL actualizar_inventario(NEW.id_disco, NEW.cantidad);
    END IF;
END //

DELIMITER ;

    -- after_insert_inventario -- Este trigger se ejecuta después de insertar un nuevo registro en la tabla INVENTARIO. Su función es actualizar la cantidad disponible de un disco en la tabla DISCO, sumando la cantidad nueva ingresada al inventario.

DELIMITER //

CREATE TRIGGER after_insert_inventario
AFTER INSERT ON INVENTARIO
FOR EACH ROW
BEGIN
    UPDATE DISCO
    SET cantidad_disponible = cantidad_disponible + NEW.cantidad_entrada
    WHERE id_disco = NEW.id_disco;
END //

DELIMITER ;