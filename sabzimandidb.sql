CREATE DATABASE  IF NOT EXISTS `sabzi_mandi_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sabzi_mandi_db`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sabzi_mandi_db
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Basit Iqbal','password123'),(2,'Fatima Aftab','password456'),(3,'Fatima Aftab','password456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admincontact`
--

DROP TABLE IF EXISTS `admincontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admincontact` (
  `AdminID` int NOT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  CONSTRAINT `admincontact_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admincontact`
--

LOCK TABLES `admincontact` WRITE;
/*!40000 ALTER TABLE `admincontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `admincontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Robert','password789'),(2,'Emily','passwordabc'),(3,'Michael','passworddef'),(4,'Sarah','passwordghi');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customercontact`
--

DROP TABLE IF EXISTS `customercontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customercontact` (
  `CustomerID` int NOT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `customercontact_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customercontact`
--

LOCK TABLES `customercontact` WRITE;
/*!40000 ALTER TABLE `customercontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `customercontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fid`
--

DROP TABLE IF EXISTS `fid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fid` (
  `fID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `approvedBy` int DEFAULT NULL,
  PRIMARY KEY (`fID`),
  KEY `approvedBy` (`approvedBy`),
  CONSTRAINT `fid_ibfk_1` FOREIGN KEY (`approvedBy`) REFERENCES `admin` (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fid`
--

LOCK TABLES `fid` WRITE;
/*!40000 ALTER TABLE `fid` DISABLE KEYS */;
INSERT INTO `fid` VALUES (21,'2023-07-01',1),(22,'2023-07-02',2),(23,'2023-07-03',1),(24,'2023-07-04',2),(25,'2023-07-05',2),(26,'2023-07-06',1),(27,'2023-07-07',1),(28,'2023-07-08',1),(29,'2023-07-09',2),(30,'2023-07-10',1);
/*!40000 ALTER TABLE `fid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Apple',1.99,'Fruit'),(2,'Banana',0.99,'Fruit'),(3,'Carrot',0.49,'Vegetable'),(4,'Orange',1.49,'Fruit'),(5,'Tomato',0.79,'Vegetable'),(6,'Grapes',2.99,'Fruit'),(7,'Broccoli',1.29,'Vegetable'),(8,'Strawberries',3.99,'Fruit'),(9,'Cucumber',0.89,'Vegetable'),(10,'Watermelon',4.99,'Fruit');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `VendorID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorcontact`
--

DROP TABLE IF EXISTS `vendorcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorcontact` (
  `VendorID` int NOT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`VendorID`),
  CONSTRAINT `vendorcontact_ibfk_1` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorcontact`
--

LOCK TABLES `vendorcontact` WRITE;
/*!40000 ALTER TABLE `vendorcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendorcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendoritem`
--

DROP TABLE IF EXISTS `vendoritem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendoritem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vID` int DEFAULT NULL,
  `itemID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vID` (`vID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `vendoritem_ibfk_1` FOREIGN KEY (`vID`) REFERENCES `vid` (`vID`),
  CONSTRAINT `vendoritem_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendoritem`
--

LOCK TABLES `vendoritem` WRITE;
/*!40000 ALTER TABLE `vendoritem` DISABLE KEYS */;
INSERT INTO `vendoritem` VALUES (5,11,1),(6,12,2),(7,13,3),(8,14,4);
/*!40000 ALTER TABLE `vendoritem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendoritem2`
--

DROP TABLE IF EXISTS `vendoritem2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendoritem2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fID` int DEFAULT NULL,
  `itemID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fID` (`fID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `vendoritem2_ibfk_1` FOREIGN KEY (`fID`) REFERENCES `fid` (`fID`),
  CONSTRAINT `vendoritem2_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendoritem2`
--

LOCK TABLES `vendoritem2` WRITE;
/*!40000 ALTER TABLE `vendoritem2` DISABLE KEYS */;
INSERT INTO `vendoritem2` VALUES (6,21,1),(7,22,2),(8,23,3),(9,24,4),(10,25,5);
/*!40000 ALTER TABLE `vendoritem2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vid`
--

DROP TABLE IF EXISTS `vid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vid` (
  `vID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `approvedBy` int DEFAULT NULL,
  PRIMARY KEY (`vID`),
  KEY `approvedBy` (`approvedBy`),
  CONSTRAINT `vid_ibfk_1` FOREIGN KEY (`approvedBy`) REFERENCES `admin` (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vid`
--

LOCK TABLES `vid` WRITE;
/*!40000 ALTER TABLE `vid` DISABLE KEYS */;
INSERT INTO `vid` VALUES (11,'2023-07-01',1),(12,'2023-07-02',2),(13,'2023-07-03',1),(14,'2023-07-04',2),(15,'2023-07-05',2),(16,'2023-07-06',1),(17,'2023-07-07',1),(18,'2023-07-08',1),(19,'2023-07-09',2),(20,'2023-07-10',1);
/*!40000 ALTER TABLE `vid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sabzi_mandi_db'
--

--
-- Dumping routines for database 'sabzi_mandi_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-06 11:53:41
