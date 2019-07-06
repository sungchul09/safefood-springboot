-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: safe_food
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mallergies`
--

DROP TABLE IF EXISTS `mallergies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mallergies` (
  `email` varchar(45) NOT NULL,
  `argname` varchar(45) NOT NULL,
  PRIMARY KEY (`email`,`argname`),
  KEY `fk_Member_has_Allergies_Allergies1_idx` (`argname`),
  KEY `fk_Member_has_Allergies_Member_idx` (`email`),
  CONSTRAINT `fk_Member_has_Allergies_Allergies1` FOREIGN KEY (`argname`) REFERENCES `allergies` (`argname`),
  CONSTRAINT `fk_Member_has_Allergies_Member` FOREIGN KEY (`email`) REFERENCES `member` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mallergies`
--

LOCK TABLES `mallergies` WRITE;
/*!40000 ALTER TABLE `mallergies` DISABLE KEYS */;
INSERT INTO `mallergies` VALUES ('asdf@naver.com','게'),('asdf@naver.com','대두'),('root@root.com','대두'),('sungchul@naver.com','대두'),('asdf@naver.com','우유'),('root@root.com','우유'),('sungchul@naver.com','우유'),('test3@naver.com','우유'),('test4@naver.com','우유'),('test5@naver.com','우유');
/*!40000 ALTER TABLE `mallergies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-05 23:24:57
