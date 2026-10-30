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
-- Table structure for table `videojuego`
--

DROP TABLE IF EXISTS `videojuego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videojuego` (
  `id_videojuego` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(160) NOT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  `pegi` tinyint DEFAULT NULL,
  `precio_base` decimal(8,2) DEFAULT NULL,
  `motor` varchar(80) DEFAULT NULL,
  `es_multijugador` tinyint(1) NOT NULL DEFAULT '0',
  `id_estudio` int DEFAULT NULL,
  `id_juego_padre` int DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_videojuego`),
  KEY `fk_juego_estudio` (`id_estudio`),
  KEY `fk_juego_padre` (`id_juego_padre`),
  CONSTRAINT `fk_juego_estudio` FOREIGN KEY (`id_estudio`) REFERENCES `estudio` (`id_estudio`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_juego_padre` FOREIGN KEY (`id_juego_padre`) REFERENCES `videojuego` (`id_videojuego`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videojuego`
--

LOCK TABLES `videojuego` WRITE;
/*!40000 ALTER TABLE `videojuego` DISABLE KEYS */;
INSERT INTO `videojuego` VALUES (1,'Baldur\'s Gate 3','2023-08-03',18,59.99,'Divinity Engine',1,1,NULL,'RPG basado en D&D.'),(2,'Elden Ring','2022-02-25',16,59.99,'FromEngine',1,2,NULL,'Acción RPG en mundo abierto.'),(3,'Cyberpunk 2077','2020-12-10',18,59.99,'REDengine 4',0,3,NULL,'RPG de ciencia ficción.'),(4,'Hades','2020-09-17',12,24.99,'Unreal Engine',0,4,NULL,'Roguelike de acción.'),(5,'Minecraft','2011-11-18',7,26.95,'Java',1,5,NULL,'Sandbox de construcción.'),(6,'Hades II',NULL,12,NULL,NULL,0,4,4,'Secuela (para self-join, sin fecha).'),(7,'Proyecto Misterioso',NULL,NULL,NULL,NULL,0,NULL,NULL,'Juego sin estudio ni fecha.'),(8,'Metroid Dread','2021-10-08',12,59.99,'Mercury Engine',0,6,NULL,'Aventura de acción con exploración y progresión.'),(10,'pruebaa','2026-05-01',NULL,NULL,NULL,0,1,NULL,NULL);
/*!40000 ALTER TABLE `videojuego` ENABLE KEYS */;
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
