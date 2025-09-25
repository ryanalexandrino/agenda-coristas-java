-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: coro
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `cadastro_corista`
--

DROP TABLE IF EXISTS `cadastro_corista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro_corista` (
  `id_corista` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `rg` char(14) DEFAULT NULL,
  `id_voz` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_corista`),
  KEY `id_voz` (`id_voz`),
  CONSTRAINT `cadastro_corista_ibfk_1` FOREIGN KEY (`id_voz`) REFERENCES `vozes` (`id_voz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_corista`
--

LOCK TABLES `cadastro_corista` WRITE;
/*!40000 ALTER TABLE `cadastro_corista` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastro_corista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cadastro_musicos`
--

DROP TABLE IF EXISTS `cadastro_musicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro_musicos` (
  `id_musico` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `rg` char(14) DEFAULT NULL,
  `id_instrumento` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_musico`),
  KEY `id_instrumento` (`id_instrumento`),
  CONSTRAINT `cadastro_musicos_ibfk_1` FOREIGN KEY (`id_instrumento`) REFERENCES `instrumentos` (`id_instrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastro_musicos`
--

LOCK TABLES `cadastro_musicos` WRITE;
/*!40000 ALTER TABLE `cadastro_musicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastro_musicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` tinyint(4) NOT NULL AUTO_INCREMENT,
  `data_evento` date NOT NULL,
  `dia_semana` enum('Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo') DEFAULT NULL,
  `tipo` enum('Ensaio','Apresentacão') DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrumentos`
--

DROP TABLE IF EXISTS `instrumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrumentos` (
  `id_instrumento` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nome_instrumento` varchar(20) NOT NULL,
  PRIMARY KEY (`id_instrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrumentos`
--

LOCK TABLES `instrumentos` WRITE;
/*!40000 ALTER TABLE `instrumentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presenca_corista`
--

DROP TABLE IF EXISTS `presenca_corista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presenca_corista` (
  `id_evento` tinyint(4) NOT NULL,
  `id_corista` tinyint(4) NOT NULL,
  `presente` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_evento`,`id_corista`),
  KEY `id_corista` (`id_corista`),
  CONSTRAINT `presenca_corista_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`),
  CONSTRAINT `presenca_corista_ibfk_2` FOREIGN KEY (`id_corista`) REFERENCES `cadastro_corista` (`id_corista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presenca_corista`
--

LOCK TABLES `presenca_corista` WRITE;
/*!40000 ALTER TABLE `presenca_corista` DISABLE KEYS */;
/*!40000 ALTER TABLE `presenca_corista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presenca_musico`
--

DROP TABLE IF EXISTS `presenca_musico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presenca_musico` (
  `id_evento` tinyint(4) NOT NULL,
  `id_musico` tinyint(4) NOT NULL,
  `presente` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_evento`,`id_musico`),
  KEY `id_musico` (`id_musico`),
  CONSTRAINT `presenca_musico_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`),
  CONSTRAINT `presenca_musico_ibfk_2` FOREIGN KEY (`id_musico`) REFERENCES `cadastro_musicos` (`id_musico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presenca_musico`
--

LOCK TABLES `presenca_musico` WRITE;
/*!40000 ALTER TABLE `presenca_musico` DISABLE KEYS */;
/*!40000 ALTER TABLE `presenca_musico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vozes`
--

DROP TABLE IF EXISTS `vozes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vozes` (
  `id_voz` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo_voz` varchar(20) NOT NULL,
  PRIMARY KEY (`id_voz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vozes`
--

LOCK TABLES `vozes` WRITE;
/*!40000 ALTER TABLE `vozes` DISABLE KEYS */;
/*!40000 ALTER TABLE `vozes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24 21:51:48
