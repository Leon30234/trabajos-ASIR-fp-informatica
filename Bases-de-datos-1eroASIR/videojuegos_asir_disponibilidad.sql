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
-- Table structure for table `disponibilidad`
--

DROP TABLE IF EXISTS `disponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidad` (
  `id_tienda` int NOT NULL,
  `id_videojuego` int NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `stock` int DEFAULT NULL,
  `url_producto` varchar(250) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tienda`,`id_videojuego`),
  KEY `fk_disp_juego` (`id_videojuego`),
  CONSTRAINT `fk_disp_juego` FOREIGN KEY (`id_videojuego`) REFERENCES `videojuego` (`id_videojuego`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_disp_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidad`
--

LOCK TABLES `disponibilidad` WRITE;
/*!40000 ALTER TABLE `disponibilidad` DISABLE KEYS */;
INSERT INTO `disponibilidad` VALUES (1,1,22.00,9999,'https://store.steampowered.com','2023-08-03 09:00:00'),(1,2,59.99,9999,'https://store.steampowered.com','2022-02-25 09:00:00'),(1,3,59.99,9999,'https://store.steampowered.com','2020-12-10 09:00:00'),(1,4,24.99,9999,'https://store.steampowered.com','2020-09-17 09:00:00'),(1,5,26.95,9999,'https://store.steampowered.com','2011-11-18 09:00:00'),(2,3,59.99,NULL,'https://www.gog.com','2020-12-10 10:00:00'),(2,5,26.95,NULL,'https://www.gog.com','2011-11-18 10:00:00'),(3,1,22.00,NULL,'https://store.playstation.com','2023-09-06 10:00:00'),(3,2,59.99,NULL,'https://store.playstation.com','2022-02-25 10:00:00'),(3,3,59.99,NULL,'https://store.playstation.com','2020-12-10 10:00:00'),(4,4,24.99,NULL,'https://www.nintendo.com','2020-09-17 11:00:00'),(4,5,26.95,NULL,'https://www.nintendo.com','2017-05-12 11:00:00'),(4,8,59.99,NULL,'https://www.nintendo.com','2021-10-08 11:00:00'),(5,4,29.99,0,NULL,'2021-01-01 12:00:00'),(5,5,29.99,15,NULL,'2022-01-01 12:00:00'),(5,8,59.99,10,NULL,'2021-10-08 12:00:00');
/*!40000 ALTER TABLE `disponibilidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-09 13:21:16
