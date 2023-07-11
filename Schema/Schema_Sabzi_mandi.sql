CREATE DATABASE  IF NOT EXISTS `sabzi_mandi_management_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sabzi_mandi_management_system`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sabzi_mandi_management_system
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
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'BASIT IQBAL','1234'),(2,'Fatima Aftab','fati1321'),(3,'Rab Nawaz Jadoon','jadoon1');
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
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `admincontact_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admincontact`
--

LOCK TABLES `admincontact` WRITE;
/*!40000 ALTER TABLE `admincontact` DISABLE KEYS */;
INSERT INTO `admincontact` VALUES (1,'0345-9812889','basit@gmail.com'),(2,'0321-2211098','fati@gmail.com'),(3,'0331-9875431','jadoon1@gmail.com');
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
  `VlistID` int DEFAULT NULL,
  `flistID` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_vegetableViewedBy` (`VlistID`),
  KEY `fk_fruitViewedBy` (`flistID`),
  CONSTRAINT `fk_fruitViewedBy` FOREIGN KEY (`flistID`) REFERENCES `fruitlist` (`fID`),
  CONSTRAINT `fk_vegetableViewedBy` FOREIGN KEY (`VlistID`) REFERENCES `vegetablelist` (`vID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ahsan Iqbal','ahsan',1,1),(2,'Hasnain Iqbal','hasnain',2,2),(3,'Ali Ahemd','ali123',3,3),(4,'shafiq Iqbal','sh123',4,4),(5,'sana malik ','sanaMalik324',4,4),(6,'NOOR-ul-Ain','noor098',4,4);
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
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `customercontact_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customercontact`
--

LOCK TABLES `customercontact` WRITE;
/*!40000 ALTER TABLE `customercontact` DISABLE KEYS */;
INSERT INTO `customercontact` VALUES (1,'0345-987688','ashu@gmail.com'),(2,'0321-6754768','hasnain@gmail.com'),(3,'0332-2334589','ali@gmail.com'),(4,'0321-3454343','shafiq@gmail.com'),(5,'0342-9877868','sanaMalik@gmail.com'),(6,'0322-3232323','noor@gmail.com');
/*!40000 ALTER TABLE `customercontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fruitlist`
--

DROP TABLE IF EXISTS `fruitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fruitlist` (
  `fID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `approvedBy` int DEFAULT NULL,
  PRIMARY KEY (`fID`),
  UNIQUE KEY `unique_date_approvedBy` (`date`,`approvedBy`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fruitlist`
--

LOCK TABLES `fruitlist` WRITE;
/*!40000 ALTER TABLE `fruitlist` DISABLE KEYS */;
INSERT INTO `fruitlist` VALUES (6,'2021-02-11',3),(7,'2021-06-22',3),(5,'2022-01-17',3),(4,'2023-01-01',2),(3,'2023-01-11',1),(1,'2023-07-10',1),(8,'2023-07-22',3),(2,'2023-08-01',1);
/*!40000 ALTER TABLE `fruitlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fruitlist_item`
--

DROP TABLE IF EXISTS `fruitlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fruitlist_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fID` int DEFAULT NULL,
  `itemid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fID` (`fID`),
  KEY `itemid` (`itemid`),
  CONSTRAINT `fruitlist_item_ibfk_1` FOREIGN KEY (`fID`) REFERENCES `fruitlist` (`fID`),
  CONSTRAINT `fruitlist_item_ibfk_2` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fruitlist_item`
--

LOCK TABLES `fruitlist_item` WRITE;
/*!40000 ALTER TABLE `fruitlist_item` DISABLE KEYS */;
INSERT INTO `fruitlist_item` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,2,1),(12,2,2),(13,2,3),(14,2,4),(15,2,5),(16,2,6),(17,2,7),(18,3,1),(19,3,2),(20,3,3),(21,3,4),(22,3,5),(23,3,6),(24,3,7),(25,3,8),(26,4,1),(27,4,2),(28,4,3),(29,4,4),(30,4,5),(31,4,6),(32,4,7),(33,5,1),(34,5,2),(35,5,3),(36,5,4),(37,5,5),(38,5,6),(39,5,7),(40,5,8),(41,5,9),(42,5,10),(43,6,1),(44,6,2),(45,6,3),(46,6,4),(47,6,5),(48,6,6),(49,6,7),(50,6,8),(51,6,9),(52,6,10),(53,7,1),(54,7,2),(55,7,3),(56,7,4),(57,7,5),(58,7,6),(59,7,7),(60,7,8),(61,7,9),(62,7,10),(63,8,1),(64,8,2),(65,8,3),(66,8,4),(67,8,5),(68,8,6),(69,8,7),(70,8,8),(71,8,9),(72,8,10);
/*!40000 ALTER TABLE `fruitlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Pineapple',150,'Fruit'),(2,'Tomato',90,'Vegetable'),(3,'Watermelon',100,'Fruit'),(4,'Cauliflower',60,'Vegetable'),(5,'Broccoli',70,'Vegetable'),(6,'Spinach',50,'Vegetable'),(7,'Strawberry',180,'Fruit'),(8,'Orange',80,'Fruit'),(9,'Banana',120,'Fruit'),(10,'Mango',200,'Fruit');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vegetablelist`
--

DROP TABLE IF EXISTS `vegetablelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vegetablelist` (
  `vID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `approvedBy` int DEFAULT NULL,
  PRIMARY KEY (`vID`),
  UNIQUE KEY `unique_date_approvedBy` (`date`,`approvedBy`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vegetablelist`
--

LOCK TABLES `vegetablelist` WRITE;
/*!40000 ALTER TABLE `vegetablelist` DISABLE KEYS */;
INSERT INTO `vegetablelist` VALUES (3,'2021-02-11',3),(2,'2021-06-22',3),(8,'2022-01-17',3),(7,'2023-01-01',2),(6,'2023-01-11',1),(4,'2023-07-10',1),(1,'2023-07-22',3),(5,'2023-08-01',1);
/*!40000 ALTER TABLE `vegetablelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veglist_item`
--

DROP TABLE IF EXISTS `veglist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veglist_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vID` int DEFAULT NULL,
  `itemid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vID` (`vID`),
  KEY `itemid` (`itemid`),
  CONSTRAINT `veglist_item_ibfk_1` FOREIGN KEY (`vID`) REFERENCES `vegetablelist` (`vID`),
  CONSTRAINT `veglist_item_ibfk_2` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veglist_item`
--

LOCK TABLES `veglist_item` WRITE;
/*!40000 ALTER TABLE `veglist_item` DISABLE KEYS */;
INSERT INTO `veglist_item` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,2,1),(12,2,2),(13,2,3),(14,2,4),(15,2,5),(16,2,6),(17,2,7),(18,3,1),(19,3,2),(20,3,3),(21,3,4),(22,3,5),(23,3,6),(24,3,7),(25,3,8),(26,4,1),(27,4,2),(28,4,3),(29,4,4),(30,4,5),(31,4,6),(32,4,7),(33,5,1),(34,5,2),(35,5,3),(36,5,4),(37,5,5),(38,5,6),(39,5,7),(40,5,8),(41,5,9),(42,5,10),(43,6,1),(44,6,2),(45,6,3),(46,6,4),(47,6,5),(48,6,6),(49,6,7),(50,6,8),(51,6,9),(52,6,10),(53,7,1),(54,7,2),(55,7,3),(56,7,4),(57,7,5),(58,7,6),(59,7,7),(60,7,8),(61,7,9),(62,7,10),(63,8,1),(64,8,2),(65,8,3),(66,8,4),(67,8,5),(68,8,6),(69,8,7),(70,8,8),(71,8,9),(72,8,10);
/*!40000 ALTER TABLE `veglist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `VlistID` int DEFAULT NULL,
  `flistID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `VlistID` (`VlistID`),
  KEY `flistID` (`flistID`),
  CONSTRAINT `vendor_ibfk_1` FOREIGN KEY (`VlistID`) REFERENCES `vegetablelist` (`vID`),
  CONSTRAINT `vendor_ibfk_2` FOREIGN KEY (`flistID`) REFERENCES `fruitlist` (`fID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'aftab','af77tab',1,1),(2,'Muhammad Iqbal','iqbal123',2,2),(3,'Sania Ahemd','sania098',3,3),(4,'haris khan','haris987',4,4),(5,'asad yousaf ','asad876',4,4);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendorcontact`
--

DROP TABLE IF EXISTS `vendorcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendorcontact` (
  `vendorID` int NOT NULL,
  `phoneNo` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`vendorID`),
  CONSTRAINT `vendorcontact_ibfk_1` FOREIGN KEY (`vendorID`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendorcontact`
--

LOCK TABLES `vendorcontact` WRITE;
/*!40000 ALTER TABLE `vendorcontact` DISABLE KEYS */;
INSERT INTO `vendorcontact` VALUES (1,'0345-9854388','abse@gmail.com'),(2,'0321-6754768','ha12ga@gmail.com'),(3,'0332-2334589','ali123@gmail.com'),(4,'0321-3454343','shgai@gmail.com'),(5,'0342-9877868','asad@gmail.com');
/*!40000 ALTER TABLE `vendorcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sabzi_mandi_management_system'
--

--
-- Dumping routines for database 'sabzi_mandi_management_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-11  6:34:41
