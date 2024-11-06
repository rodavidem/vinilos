## DOCUMENTACION DE STORED PROCEDURES

**Nombre del Procedimiento:** `agregar_transaccion_con_rollback`

**Descripción:** Este procedimiento agrega una transacción de compra o venta de un disco. Si es una venta, disminuye el inventario del disco; si es una compra, lo incrementa. En caso de que la cantidad solicitada para venta sea mayor que el inventario disponible, realiza un rollback de toda la transacción para evitar inconsistencias.

**Objetivo:** Registrar de manera precisa una transacción de compra o venta de vinilos en el sistema, asegurando la actualización correcta del inventario y manteniendo la integridad de los datos.

**Parámetros de Entrada:**

- `p_id_cliente` (INT): ID del cliente que realiza la transacción.
- `p_id_disco` (INT): ID del disco en cuestión.
- `p_tipo_transaccion` (VARCHAR(20)): Tipo de transacción ("Compra" o "Venta").
- `p_cantidad` (INT): Cantidad de discos a comprar o vender.
- `p_precio_total` (DECIMAL(10,2)): Precio total de la transacción.

**Mensajes de Error:**

- "Inventario insuficiente" en caso de que no haya suficiente cantidad de discos para completar una venta.

**Rollback:**

- Se ejecuta un ROLLBACK si la cantidad de discos disponibles es menor que la solicitada para la venta.

**Comportamiento:**

1. Inserta un registro en la tabla TRANSACCION.
2. Si la transacción es una venta, disminuye el inventario y verifica que no haya valores negativos.
3. Si la transacción es una compra, incrementa el inventario.
4. Realiza un COMMIT si todo es exitoso; en caso de error, ejecuta un ROLLBACK.

**CASOS DE PRUEBA**

```sql
CALL agregar_transaccion_con_rollback(1, 1, 'Venta', 2, 20.00); -- Prueba de Venta Exitoso

CALL agregar_transaccion_con_rollback(1, 1, 'Venta', 100, 1000.00); -- Prueba de Venta con Rollback

CALL agregar_transaccion_con_rollback(1, 1, 'Compra', 5, 50.00); -- Prueba de Compra Exitoso
```
**CASO DE USO: Registrar Transacción de Vinilos**

**Objetivo**: Registrar una compra o venta, actualizando el inventario de manera segura.

- Empleado ingresa datos de transacción.
- El sistema verifica el tipo de transacción:
  - **Venta**: Reduce inventario; si es insuficiente, hace rollback.
  - **Compra**: Aumenta inventario.
- **Resultado**: Transacción confirmada o revertida si hay error.

---

**CASO DE ERROR: Inventario Insuficiente**

**Objetivo**: Manejar error al intentar vender más unidades de las disponibles.

- Empleado intenta registrar venta con cantidad mayor a la disponible.
- Sistema detecta inventario insuficiente y ejecuta rollback.
- **Resultado**: No se realizan cambios; muestra mensaje **"Inventario insuficiente"**.
