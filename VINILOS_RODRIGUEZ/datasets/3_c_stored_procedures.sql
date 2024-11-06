
USE vinilos;

-- procedimientos
	-- agregar_transaccion -- Este procedimiento permite agregar una nueva transacción a la tabla TRANSACCION.
    
DELIMITER //

CREATE PROCEDURE agregar_transaccion(
    IN p_id_cliente INT, 
    IN p_id_disco INT, 
    IN p_tipo_transaccion VARCHAR(20), 
    IN p_cantidad INT, 
    IN p_precio_total DECIMAL(10, 2)
)
BEGIN
    INSERT INTO TRANSACCION (id_cliente, id_disco, tipo_transaccion, cantidad, precio_total)
    VALUES (p_id_cliente, p_id_disco, p_tipo_transaccion, p_cantidad, p_precio_total);
END //

DELIMITER ;

-- Llamar al Procedimiento
CALL agregar_transaccion(1, 2, 'venta', 3, 90.00);
-- verificar la transacción
SELECT * FROM vinilos.TRANSACCION WHERE id_cliente = 1 AND id_disco = 2;


    -- actualizar_inventario -- Este procedimiento actualiza el inventario de un disco específico después de una transacción.
    
DELIMITER //

CREATE PROCEDURE actualizar_inventario(
    IN p_id_disco INT, 
    IN p_cantidad INT
)
BEGIN
    UPDATE DISCO
    SET cantidad_disponible = cantidad_disponible - p_cantidad
    WHERE id_disco = p_id_disco;
END //

DELIMITER ;

-- Llamar al Procedimiento
CALL actualizar_inventario(2, 3);
-- verificar la transacción
SELECT * FROM vinilos.DISCO WHERE id_disco = 2;


    -- verificar_cliente_transacciones -- Este procedimiento verifica si un cliente existe en la tabla CLIENTE, y si existe, devuelve la cantidad de transacciones asociadas a ese cliente.

DELIMITER //

CREATE PROCEDURE verificar_cliente_transacciones(IN cliente INT, OUT valor_retorno INT)
BEGIN
    DECLARE existe BOOLEAN;

    -- Verifica si el cliente existe en la tabla CLIENTE
    SET existe = (
        SELECT IF(COUNT(id_cliente) = 0, FALSE, TRUE)
        FROM vinilos.CLIENTE
        WHERE id_cliente = cliente
    );

    IF existe THEN
        -- Si el cliente existe, cuenta las transacciones asociadas
        SELECT COUNT(id_transaccion) INTO valor_retorno
        FROM vinilos.TRANSACCION
        WHERE id_cliente = cliente
        GROUP BY id_cliente;

        -- No es necesario RETURN; el resultado se pasa a través de valor_retorno

    ELSE
        -- Si el cliente no existe, genera un error
        SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'NO EXISTE EL CLIENTE', MYSQL_ERRNO = 1000;
    END IF;
END //

DELIMITER ;

-- Llamar al Procedimiento
CALL verificar_cliente_transacciones(2, @total_transacciones);
-- verificar la transacción
SELECT @total_transacciones;

-- TCL

USE vinilos;

DROP PROCEDURE IF EXISTS agregar_transaccion_con_rollback;

DELIMITER //

CREATE PROCEDURE agregar_transaccion_con_rollback(
    IN p_id_cliente INT,
    IN p_id_disco INT,
    IN p_tipo_transaccion VARCHAR(20),
    IN p_cantidad INT,
    IN p_precio_total DECIMAL(10, 2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Si ocurre un error, hacemos rollback
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción. Se realizó rollback.';
    END;

    -- Iniciamos la transacción
    START TRANSACTION;

    -- Insertamos la transacción en la tabla TRANSACCION
    INSERT INTO TRANSACCION (ID_Cliente, ID_Disco, Tipo_Transaccion, Fecha_y_hora, Cantidad, Precio_Total)
    VALUES (p_id_cliente, p_id_disco, p_tipo_transaccion, NOW(), p_cantidad, p_precio_total);

    -- Si es una venta, actualiza el inventario
    IF p_tipo_transaccion = 'Venta' THEN
        UPDATE DISCO
        SET Cantidad_Disponible = Cantidad_Disponible - p_cantidad
        WHERE ID_Disco = p_id_disco;

        -- Verificar si hay suficiente stock después de la venta
        IF (SELECT Cantidad_Disponible FROM DISCO WHERE ID_Disco = p_id_disco) < 0 THEN
            -- Si no hay suficiente stock, lanzamos un error para hacer rollback
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Inventario insuficiente';
        END IF;
    END IF;

    -- Si es una compra, aumentamos el inventario
    IF p_tipo_transaccion = 'Compra' THEN
        UPDATE DISCO
        SET Cantidad_Disponible = Cantidad_Disponible + p_cantidad
        WHERE ID_Disco = p_id_disco;
    END IF;

    -- Si todo fue bien, confirmamos la transacción
    COMMIT;
END //

DELIMITER ;
