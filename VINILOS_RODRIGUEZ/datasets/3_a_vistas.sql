
USE vinilos;

-- vistas
	-- cantidad_discos_por_genero -- Esta vista cuenta la cantidad de discos disponibles agrupados por cada género musical.

CREATE VIEW cantidad_discos_por_genero AS
SELECT genero, COUNT(*) AS cantidad
FROM DISCO
GROUP BY genero;

SELECT * FROM cantidad_discos_por_genero;


    -- vista_inventario_proveedor -- Muestra el inventario actual de discos, incluyendo el título del disco y el nombre del proveedor.

CREATE VIEW vista_inventario_proveedor AS
SELECT i.id_inventario, d.titulo, d.interprete, i.cantidad_entrada, p.nombre AS proveedor, i.fecha_entrada
FROM INVENTARIO i
JOIN DISCO d ON i.id_disco = d.id_disco
JOIN PROVEEDOR p ON i.id_proveedor = p.id_proveedor;

SELECT * FROM vista_inventario_proveedor;