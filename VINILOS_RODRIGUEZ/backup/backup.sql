CREATE DATABASE  IF NOT EXISTS `vinilos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vinilos`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: vinilos
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `cantidad_discos_por_genero`
--

DROP TABLE IF EXISTS `cantidad_discos_por_genero`;
/*!50001 DROP VIEW IF EXISTS `cantidad_discos_por_genero`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cantidad_discos_por_genero` AS SELECT 
 1 AS `genero`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='DATOS DEL CLIENTE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Pérez','juan.perez@example.com','1234567890','Calle Falsa 123, Ciudad A'),(2,'María','González','maria.gonzalez@example.com','0987654321','Avenida Siempre Viva 742, Ciudad B'),(3,'Pedro','Ramírez','pedro.ramirez@example.com','1122334455','Boulevard Los Olivos 55, Ciudad C'),(4,'Ana','López','ana.lopez@example.com','2233445566','Calle de la Rosa 77, Ciudad D'),(5,'Lucía','Martínez','lucia.martinez@example.com','3344556677','Avenida del Sol 88, Ciudad E'),(6,'Carlos','Gómez','carlos.gomez@example.com','4455667788','Calle Luna 99, Ciudad F'),(7,'Sofía','Fernández','sofia.fernandez@example.com','5566778899','Avenida Estrella 101, Ciudad G'),(8,'Miguel','Torres','miguel.torres@example.com','6677889900','Calle Mar 202, Ciudad H'),(9,'Laura','Ruiz','laura.ruiz@example.com','7788990011','Boulevard del Mar 303, Ciudad I'),(10,'Diego','Mendoza','diego.mendoza@example.com','8899001122','Calle Flor 404, Ciudad J');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disco`
--

DROP TABLE IF EXISTS `disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco` (
  `id_disco` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `interprete` varchar(100) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `precio_compra` decimal(10,2) DEFAULT '10.00',
  `precio_venta` decimal(10,2) DEFAULT '10.00',
  `cantidad_disponible` int DEFAULT NULL,
  PRIMARY KEY (`id_disco`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='INFORMACION DEL DISCO';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disco`
--

LOCK TABLES `disco` WRITE;
/*!40000 ALTER TABLE `disco` DISABLE KEYS */;
INSERT INTO `disco` VALUES (1,'Dark Side of the Moon','Pink Floyd','Rock',20.00,30.00,50),(2,'Thriller','Michael Jackson','Pop',25.00,40.00,37),(3,'Back in Black','AC/DC','Rock',22.00,35.00,60),(4,'Rumours','Fleetwood Mac','Rock',18.00,28.00,45),(5,'Hotel California','Eagles','Rock',20.00,32.00,55),(6,'Abbey Road','The Beatles','Rock',23.00,37.00,50),(7,'1989','Taylor Swift','Pop',20.00,30.00,70),(8,'The Wall','Pink Floyd','Rock',25.00,38.00,40),(9,'Sgt. Pepper’s Lonely Hearts Club Band','The Beatles','Rock',21.00,34.00,65),(10,'Born to Run','Bruce Springsteen','Rock',19.00,29.00,50);
/*!40000 ALTER TABLE `disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_disco` int DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  `cantidad_entrada` int DEFAULT NULL,
  `fecha_entrada` datetime DEFAULT (now()),
  PRIMARY KEY (`id_inventario`),
  KEY `fk_inv_disco` (`id_disco`),
  KEY `fk_inv_proveedor` (`id_proveedor`),
  CONSTRAINT `fk_inv_disco` FOREIGN KEY (`id_disco`) REFERENCES `disco` (`id_disco`),
  CONSTRAINT `fk_inv_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MOVIMIENTOS DE STOCK';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,1,100,'2024-11-06 19:42:28'),(2,2,2,80,'2024-11-06 19:42:28'),(3,3,3,150,'2024-11-06 19:42:28'),(4,4,4,90,'2024-11-06 19:42:28'),(5,5,5,110,'2024-11-06 19:42:28'),(6,6,6,130,'2024-11-06 19:42:28'),(7,7,7,120,'2024-11-06 19:42:28'),(8,8,8,100,'2024-11-06 19:42:28'),(9,9,9,140,'2024-11-06 19:42:28'),(10,10,10,130,'2024-11-06 19:42:28');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_inventario` AFTER INSERT ON `inventario` FOR EACH ROW BEGIN
    UPDATE DISCO
    SET cantidad_disponible = cantidad_disponible + NEW.cantidad_entrada
    WHERE id_disco = NEW.id_disco;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='DATOS DEL PROVEEDOR';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'VinylWorld','John Doe','5551234567','john.doe@vinylworld.com','Calle Musica 123, Ciudad A'),(2,'MusicWarehouse','Jane Smith','5557654321','jane.smith@musicwarehouse.com','Avenida Melodía 456, Ciudad B'),(3,'RecordMasters','Mike Johnson','5551112222','mike.johnson@recordmasters.com','Boulevard Riff 789, Ciudad C'),(4,'DiscoHub','Alice Davis','5553334444','alice.davis@discohub.com','Calle Armonía 101, Ciudad D'),(5,'VinylCity','Bob Brown','5555556666','bob.brown@vinylcity.com','Avenida Rock 202, Ciudad E'),(6,'MelodyWorks','Clara Wilson','5557778888','clara.wilson@melodyworks.com','Calle Jazz 303, Ciudad F'),(7,'BeatStore','Dave Taylor','5559990000','dave.taylor@beatstore.com','Boulevard Soul 404, Ciudad G'),(8,'SoundFactory','Eve Miller','5551122334','eve.miller@soundfactory.com','Calle Blues 505, Ciudad H'),(9,'RhythmCorner','Frank Harris','5555566777','frank.harris@rhythmcorner.com','Avenida Funk 606, Ciudad I'),(10,'GrooveDepot','Grace Lee','5557788990','grace.lee@groovedepot.com','Calle HipHop 707, Ciudad J');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id_transaccion` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_disco` int DEFAULT NULL,
  `tipo_transaccion` varchar(20) DEFAULT NULL,
  `fecha` datetime DEFAULT (now()),
  `cantidad` int DEFAULT NULL,
  `precio_total` decimal(10,2) DEFAULT '10.00',
  PRIMARY KEY (`id_transaccion`),
  KEY `fk_trans_cliente` (`id_cliente`),
  KEY `fk_trans_disco` (`id_disco`),
  CONSTRAINT `fk_trans_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_trans_disco` FOREIGN KEY (`id_disco`) REFERENCES `disco` (`id_disco`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='DATOS DE LA TRANSACCION';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,1,1,'venta','2024-11-06 19:42:28',2,60.00),(2,2,2,'venta','2024-11-06 19:42:28',1,40.00),(3,3,3,'venta','2024-11-06 19:42:28',3,105.00),(4,4,4,'venta','2024-11-06 19:42:28',1,28.00),(5,5,5,'venta','2024-11-06 19:42:28',2,64.00),(6,6,6,'venta','2024-11-06 19:42:28',4,148.00),(7,7,7,'venta','2024-11-06 19:42:28',2,60.00),(8,8,8,'venta','2024-11-06 19:42:28',1,38.00),(9,9,9,'venta','2024-11-06 19:42:28',3,102.00),(10,10,10,'venta','2024-11-06 19:42:28',2,58.00),(11,1,2,'venta','2024-11-06 19:42:28',3,90.00);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_venta_update_inventory` AFTER INSERT ON `transaccion` FOR EACH ROW BEGIN
    IF NEW.tipo_transaccion = 'venta' THEN
        CALL actualizar_inventario(NEW.id_disco, NEW.cantidad);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_inventario_proveedor`
--

DROP TABLE IF EXISTS `vista_inventario_proveedor`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario_proveedor` AS SELECT 
 1 AS `id_inventario`,
 1 AS `titulo`,
 1 AS `interprete`,
 1 AS `cantidad_entrada`,
 1 AS `proveedor`,
 1 AS `fecha_entrada`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'vinilos'
--

--
-- Dumping routines for database 'vinilos'
--
/*!50003 DROP FUNCTION IF EXISTS `cantidad_discos_de_genero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_discos_de_genero`(genero_input VARCHAR(50)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad 
    FROM DISCO 
    WHERE genero = genero_input;
    RETURN cantidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_transacciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_transacciones`(id_cliente INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM vinilos.TRANSACCION
    WHERE id_cliente = id_cliente;
    
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_inventario`(
    IN p_id_disco INT, 
    IN p_cantidad INT
)
BEGIN
    UPDATE DISCO
    SET cantidad_disponible = cantidad_disponible - p_cantidad
    WHERE id_disco = p_id_disco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_transaccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_transaccion`(
    IN p_id_cliente INT, 
    IN p_id_disco INT, 
    IN p_tipo_transaccion VARCHAR(20), 
    IN p_cantidad INT, 
    IN p_precio_total DECIMAL(10, 2)
)
BEGIN
    INSERT INTO TRANSACCION (id_cliente, id_disco, tipo_transaccion, cantidad, precio_total)
    VALUES (p_id_cliente, p_id_disco, p_tipo_transaccion, p_cantidad, p_precio_total);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_transaccion_con_rollback` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_transaccion_con_rollback`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verificar_cliente_transacciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificar_cliente_transacciones`(IN cliente INT, OUT valor_retorno INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cantidad_discos_por_genero`
--

/*!50001 DROP VIEW IF EXISTS `cantidad_discos_por_genero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cantidad_discos_por_genero` AS select `disco`.`genero` AS `genero`,count(0) AS `cantidad` from `disco` group by `disco`.`genero` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_inventario_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inventario_proveedor` AS select `i`.`id_inventario` AS `id_inventario`,`d`.`titulo` AS `titulo`,`d`.`interprete` AS `interprete`,`i`.`cantidad_entrada` AS `cantidad_entrada`,`p`.`nombre` AS `proveedor`,`i`.`fecha_entrada` AS `fecha_entrada` from ((`inventario` `i` join `disco` `d` on((`i`.`id_disco` = `d`.`id_disco`))) join `proveedor` `p` on((`i`.`id_proveedor` = `p`.`id_proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-06 20:02:09
