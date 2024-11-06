
USE vinilos;

-- funciones
	-- fn_total_transacciones -- Esta función devuelve el número de transacciones asociadas a un cliente específico en la tabla TRANSACCION.
    
DELIMITER //

CREATE FUNCTION fn_total_transacciones(id_cliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM vinilos.TRANSACCION
    WHERE id_cliente = id_cliente;
    
    RETURN total;
END //

DELIMITER ;

SELECT fn_total_transacciones(2) AS TOTAL_TRANSACCIONES;

    
	-- cantidad_discos_de_genero -- Esta función devuelve un resultado específico basado en un género dado.
DELIMITER //

CREATE FUNCTION cantidad_discos_de_genero(genero_input VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad 
    FROM DISCO 
    WHERE genero = genero_input;
    RETURN cantidad;
END //

DELIMITER ;

SELECT cantidad_discos_de_genero('Rock');