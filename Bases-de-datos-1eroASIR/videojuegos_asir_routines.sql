-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: videojuegos_asir
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Temporary view structure for view `vw_videojuegos_estudio`
--

DROP TABLE IF EXISTS `vw_videojuegos_estudio`;
/*!50001 DROP VIEW IF EXISTS `vw_videojuegos_estudio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_videojuegos_estudio` AS SELECT 
 1 AS `id_videojuego`,
 1 AS `titulo`,
 1 AS `fecha_lanzamiento`,
 1 AS `pegi`,
 1 AS `precio_base`,
 1 AS `motor`,
 1 AS `es_multijugador`,
 1 AS `estudio`,
 1 AS `pais_estudio`,
 1 AS `total_dlc`,
 1 AS `precio_medio`,
 1 AS `precio_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_videojuegos_estudio`
--

/*!50001 DROP VIEW IF EXISTS `vw_videojuegos_estudio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_videojuegos_estudio` AS select `v`.`id_videojuego` AS `id_videojuego`,`v`.`titulo` AS `titulo`,`v`.`fecha_lanzamiento` AS `fecha_lanzamiento`,`v`.`pegi` AS `pegi`,`v`.`precio_base` AS `precio_base`,`v`.`motor` AS `motor`,`v`.`es_multijugador` AS `es_multijugador`,`e`.`nombre` AS `estudio`,`e`.`pais` AS `pais_estudio`,(select count(0) from `dlc` `d` where (`d`.`id_videojuego` = `v`.`id_videojuego`)) AS `total_dlc`,(select round(avg(`dis`.`precio`),2) from `disponibilidad` `dis` where (`dis`.`id_videojuego` = `v`.`id_videojuego`)) AS `precio_medio`,(select min(`dis`.`precio`) from `disponibilidad` `dis` where (`dis`.`id_videojuego` = `v`.`id_videojuego`)) AS `precio_min` from (`videojuego` `v` left join `estudio` `e` on((`e`.`id_estudio` = `v`.`id_estudio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'videojuegos_asir'
--

--
-- Dumping routines for database 'videojuegos_asir'
--
/*!50003 DROP FUNCTION IF EXISTS `precio_con_descuento_pegi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `precio_con_descuento_pegi`(p_id_videojuego INT) RETURNS decimal(5,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
  DECLARE v_existe INT DEFAULT 0;

  -- TODO:
  -- Declara las variables necesarias para:
  -- - precio_base
  -- - pegi
  -- - descuento
  DECLARE p_base DECIMAL(5,2);
  DECLARE v_pegi INT;
  DECLARE descuento INT;

  -- Comprobar si existe el videojuego
  SELECT COUNT(*)
  INTO v_existe
  FROM videojuego
  WHERE id_videojuego = p_id_videojuego;

  -- TODO:
  -- Si el videojuego no existe,
  -- la función debe devolver NULL.
	IF v_existe = 0 THEN
		RETURN NULL;
	END IF;


  -- TODO:
  -- Obten precio_base y pegi del videojuego
  SELECT precio_base
  INTO p_base
  FROM videojuego
  WHERE id_videojuego = p_id_videojuego;
  SELECT pegi
  INTO v_pegi
  FROM videojuego
  WHERE id_videojuego = p_id_videojuego;

  -- TODO:
  -- Calcula el descuento según el valor de pegi:
  --
  -- NULL → 0%
  -- <= 7 → 20%
  -- <= 12 → 15%
  -- <= 16 → 10%
  -- > 16 → 5%
  IF v_pegi IS NULL THEN
    set descuento = 0;
  ELSEIF v_pegi <= 7 THEN
    set descuento = 20;
  ELSEIF v_pegi <= 12 THEN
    set descuento = 15;
  ELSEIF v_pegi <= 16 THEN
    set descuento = 10;
  ELSE
    set descuento = 5;

  END IF;


  RETURN p_base * (1 - descuento / 100);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_precio_descuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_precio_descuento`(

  -- TODO:
  -- Declara los parámetros
  -- El procedimiento debe recibir:
  -- 1) Un número máximo de id_videojuego a recorrer.
  -- 2) Una variable de salida que indique cuántos videojuegos se han actualizado.
  IN p_max_id_videojuego INT,
  OUT num_actualizados INT
)
BEGIN
  DECLARE i INT DEFAULT 1;
  DECLARE v_existe INT;
  DECLARE v_nuevo_precio DECIMAL(8,2);

  -- TODO:
  -- Inicializa el contador de videojuegos actualizados.
 SET  num_actualizados = 0;

  -- TODO:
  -- Declara un bucle que recorra todos los videojuegos desde 1 hasta p_max_id.
  WHILE i <= p_max_id_videojuego DO
      SELECT COUNT(*)
      INTO v_existe
      FROM videojuego
      WHERE id_videojuego = i;


      -- TODO:
      -- Comprueba si el videojuego existe
	  IF v_existe = 1 THEN
          -- TODO:
          -- Llama a la función precio_con_descuento_pegi
          -- y guardar el resultado en v_nuevo_precio.
		  SET v_nuevo_precio = precio_con_descuento_pegi(i);
          
          UPDATE videojuego
          SET precio_base = v_nuevo_precio
          WHERE id_videojuego = i;


          -- TODO:
          -- Incrementa el contador de actualizados.
		  SET num_actualizados = num_actualizados + 1;

      -- TODO:
      -- Cierra el if
      -- Incrementa el contador del bucle
      -- Cierra el bucle
	  END IF;
      SET i = i + 1;
  END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-09 13:21:16
