CREATE DATABASE  IF NOT EXISTS `proyeccionsocial_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `proyeccionsocial_db`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyeccionsocial_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo_admi_por_dep`
--

DROP TABLE IF EXISTS `cargo_admi_por_dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_admi_por_dep` (
  `cargo_admi_id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_departamento_id` int(3) NOT NULL,
  `cargo_administrativo_cargo_id` int(3) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `horario_habil` varchar(200) DEFAULT NULL COMMENT 'a que horas y dias se puede encontrar a ese personal ejemplo: \nDe lunes a viernes 9am-5pm\n',
  `fecha_de_creacion` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cargo_admi_id`),
  KEY `fk_cargo_admi_por_dep_departamento1_idx` (`departamento_departamento_id`),
  KEY `fk_cargo_admi_por_dep_cargo_admnistrativo1_idx` (`cargo_administrativo_cargo_id`),
  CONSTRAINT `fk_cargo_admi_por_dep_cargo_admnistrativo1` FOREIGN KEY (`cargo_administrativo_cargo_id`) REFERENCES `cargo_administrativo` (`cargo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cargo_admi_por_dep_departamento1` FOREIGN KEY (`departamento_departamento_id`) REFERENCES `departamento` (`departamento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_admi_por_dep`
--

LOCK TABLES `cargo_admi_por_dep` WRITE;
/*!40000 ALTER TABLE `cargo_admi_por_dep` DISABLE KEYS */;
INSERT INTO `cargo_admi_por_dep` VALUES (1,3,3,'Pepe','Lunes-Viernes por las manianas',NULL,NULL),(4,3,3,'Pepe','Lunes-Viernes por las manianas',NULL,NULL);
/*!40000 ALTER TABLE `cargo_admi_por_dep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo_administrativo`
--

DROP TABLE IF EXISTS `cargo_administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo_administrativo` (
  `cargo_id` int(3) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL COMMENT 'Jefe de Departamento\nCordinador ',
  PRIMARY KEY (`cargo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo_administrativo`
--

LOCK TABLES `cargo_administrativo` WRITE;
/*!40000 ALTER TABLE `cargo_administrativo` DISABLE KEYS */;
INSERT INTO `cargo_administrativo` VALUES (3,'Jefa de departamento'),(4,'Secretaria'),(5,'Coordinador de las horas sociales');
/*!40000 ALTER TABLE `cargo_administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `departamento_id` int(3) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Ingenieria'),(2,'Departamento de Economia'),(3,'Departamento de Matematicas'),(4,'Departamento de Idiomas'),(5,'Departamento de Leyes'),(6,'Departamento de Fisica'),(7,'Departamento de Arquitectura'),(9,'Jefe de Departamento'),(10,'Secretaria');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `documento_id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`documento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (1,'Ficha de Inscripcion'),(2,'Plan de ejeucion'),(3,'Memoria'),(4,'Carta de la empresa');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos_requeridos`
--

DROP TABLE IF EXISTS `documentos_requeridos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentos_requeridos` (
  `documentos_requeridos_id` int(11) NOT NULL AUTO_INCREMENT,
  `evento_evento_id` int(11) NOT NULL,
  `documento_documento_id` int(11) NOT NULL,
  `original` tinyint(1) DEFAULT NULL COMMENT 'Se requiere documento original\n',
  `cantidad_copias` int(3) DEFAULT NULL,
  PRIMARY KEY (`documentos_requeridos_id`),
  KEY `fk_documentos_requeridos_documento1_idx` (`documento_documento_id`),
  KEY `fk_documentos_requeridos_evento1` (`evento_evento_id`),
  CONSTRAINT `fk_documentos_requeridos_documento1` FOREIGN KEY (`documento_documento_id`) REFERENCES `documento` (`documento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_documentos_requeridos_evento1` FOREIGN KEY (`evento_evento_id`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos_requeridos`
--

LOCK TABLES `documentos_requeridos` WRITE;
/*!40000 ALTER TABLE `documentos_requeridos` DISABLE KEYS */;
INSERT INTO `documentos_requeridos` VALUES (1,1,1,1,0),(9,1,1,1,3);
/*!40000 ALTER TABLE `documentos_requeridos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_documento_por_estudiante`
--

DROP TABLE IF EXISTS `estado_documento_por_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_documento_por_estudiante` (
  `documentos_requeridos_documentos_requeridos_id` int(11) NOT NULL,
  `progreso_estudiante_carnet` varchar(10) NOT NULL,
  `entregado` tinyint(1) NOT NULL,
  `aprobado` tinyint(1) NOT NULL,
  `fecha_de_entrega` date DEFAULT NULL,
  `fecha_de_aprobacion` date DEFAULT NULL,
  PRIMARY KEY (`documentos_requeridos_documentos_requeridos_id`,`progreso_estudiante_carnet`),
  KEY `fk_estado_documento_por_estudiante_progreso_estudiante1_idx` (`progreso_estudiante_carnet`),
  CONSTRAINT `fk_estado_documento_por_estudiante_documentos_requeridos1` FOREIGN KEY (`documentos_requeridos_documentos_requeridos_id`) REFERENCES `documentos_requeridos` (`documentos_requeridos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_documento_por_estudiante_progreso_estudiante1` FOREIGN KEY (`progreso_estudiante_carnet`) REFERENCES `progreso_estudiante` (`carnet`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_documento_por_estudiante`
--

LOCK TABLES `estado_documento_por_estudiante` WRITE;
/*!40000 ALTER TABLE `estado_documento_por_estudiante` DISABLE KEYS */;
INSERT INTO `estado_documento_por_estudiante` VALUES (1,'IR13002',0,1,'2020-06-05','2020-06-05');
/*!40000 ALTER TABLE `estado_documento_por_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Entrega de ficha de inscripcion','2020-05-30',NULL),(2,'Entrega del Plan de Ejecucion','2020-06-15',NULL),(3,'Entrega de ficha de inscripcio','2020-05-30',NULL);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progreso_estudiante`
--

DROP TABLE IF EXISTS `progreso_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progreso_estudiante` (
  `carnet` varchar(10) NOT NULL,
  `progreso_horas_realizadas` int(3) NOT NULL COMMENT '150 horas realizadas',
  PRIMARY KEY (`carnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progreso_estudiante`
--

LOCK TABLES `progreso_estudiante` WRITE;
/*!40000 ALTER TABLE `progreso_estudiante` DISABLE KEYS */;
INSERT INTO `progreso_estudiante` VALUES ('IR13002',300),('IR13003',150);
/*!40000 ALTER TABLE `progreso_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_usuario`
--

DROP TABLE IF EXISTS `rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_usuario` (
  `rol_id` int(2) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL COMMENT 'Ayudante\nAdministrador',
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario`
--

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
INSERT INTO `rol_usuario` VALUES (1,'ADMINISTRADOR'),(2,'COLABORADOR');
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuario_id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `rol_usuario_rol_id` int(2) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `fk_usuario_rol_usuario_idx` (`rol_usuario_rol_id`),
  CONSTRAINT `FKipfy84q5f9hx9h6x5cq4llsxs` FOREIGN KEY (`rol_usuario_rol_id`) REFERENCES `rol_usuario` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'PEDRO','PEREZ','pedro.perez@gmail.com','$2a$10$Jl1nlImK9SuyXvpotApux.EO6ntlWxyerrvUjtdv/GZLoRAa.FpyS',1),(2,'LAURA','SAD','laura.sad@gmail.com','$2a$10$ezl84XEL.y/lIh6txwuhhudasZlVcedFCOkSaxE5xcQqLZBYUwfiq',2),(46,'pepe','perez','pepe.perez@gmail.com','$2a$10$H2kyhGSOsuE8Ks0cq.cX9uVSp0aZxGug84wLuVQTd7DaPU7Iq7bIy',1),(47,'pepe','perez','pepe.perez@gmail.com','$2a$10$VOFTs/CPsHTJKqPcyLakeeEJC42MLdTVYlmmZDA0TS4ajbFyjJUNC',1),(48,'pepe','perez','pepe.perez@gmail.com','$2a$10$c2Wz1agQ6bspH1Lm3mJEwOBoXbOUsW5IUGd35uMpA7HFRoEHBmRFC',1),(49,'pepe','perez','pepe.perez@gmail.com','$2a$10$yChyKoNL4I7xmOySVvThvOtXGpKAd7.H8AzvowdnVoxLyKqx.duw.',1),(50,'pepe','perez','pepe.perez@gmail.com','$2a$10$eJJiM8kgQksyjl6LY8VQEe81ygjvWvnNKvORrLlmcTQWjCj2ZhClW',1),(51,'PEPE','PEREZ','pepe.perez@gmail.com','$2a$10$eJJiM8kgQksyjl6LY8VQEe81ygjvWvnNKvORrLlmcTQWjCj2ZhClW',1),(52,'BRAYAN','CASILLAS','brayan.casillas1996@gmail.com','1234',1),(54,'IKER','CASILLAS','brayan.casillas1996@gmail.com','1234',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-15 15:34:00
