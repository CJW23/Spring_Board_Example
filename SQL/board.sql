-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: corona
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `tbl_board`
--

DROP TABLE IF EXISTS `tbl_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `des` text NOT NULL,
  `writer` int(11) NOT NULL,
  `regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `viewcnt` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `writer` (`writer`),
  CONSTRAINT `tbl_board_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (3,'aaaaa','wwwwwww',2,'2020-05-28 01:38:23',0),(4,'xxxxx','zzzzz',1,'2020-05-28 02:11:25',0),(10,'cvcvcvcvc','cvcvcvcvcv',3,'2020-05-28 17:40:12',0),(11,'cvcvcvcvc','cvcvcvcvcv',3,'2020-05-28 17:41:03',0),(12,'xxxxxx','xxxxxxx',3,'2020-05-28 17:47:26',0),(13,'asdfasdf','sdfsdf',3,'2020-05-28 18:59:09',0);
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) NOT NULL,
  `userpw` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES (1,'awd','awd','awd','awd','2020-05-27 17:51:46','2020-05-27 17:51:46'),(2,'ad','asd','awd',NULL,'2020-05-27 17:55:34','2020-05-27 17:55:34'),(3,'user1','123','user','zxc','2020-05-27 18:39:01','2020-05-27 18:39:01');
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-28 21:23:23
