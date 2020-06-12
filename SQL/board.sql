-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: corona
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `tbl_board`
--

DROP TABLE IF EXISTS `tbl_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `des` text NOT NULL,
  `writer` int(11) NOT NULL,
  `regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `viewcnt` int(11) DEFAULT '0',
  `replycnt` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `writer` (`writer`),
  CONSTRAINT `tbl_board_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `tbl_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (3,'스프링 스터디','스프링 스터디',2,'2020-05-28 01:38:23',7,1),(4,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-28 02:11:25',0,0),(11,'PHP 스터디','PHP 스터디',3,'2020-05-28 17:41:03',0,0),(12,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-28 17:47:26',0,0),(15,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 01:50:11',0,0),(16,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 02:04:09',0,0),(17,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:55:11',0,0),(18,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:55:11',0,0),(19,'Mysql 스터디','Mysql 스터디',3,'2020-05-29 18:55:11',0,0),(20,'스프링 스터디','스프링 스터디',2,'2020-05-29 18:56:09',0,0),(21,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-29 18:56:09',0,0),(22,'PHP 스터디','PHP 스터디',3,'2020-05-29 18:56:09',0,0),(23,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-29 18:56:09',0,0),(24,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 18:56:09',0,0),(25,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 18:56:09',0,0),(26,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:56:09',0,0),(27,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:56:09',0,0),(28,'Mysql 스터디','Mysql 스터디',3,'2020-05-29 18:56:09',0,0),(35,'스프링 스터디','스프링 스터디',2,'2020-05-29 18:56:16',0,0),(36,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-29 18:56:16',0,0),(37,'PHP 스터디','PHP 스터디',3,'2020-05-29 18:56:16',0,0),(38,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-29 18:56:16',0,0),(39,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 18:56:16',0,0),(40,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 18:56:16',0,0),(41,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:56:16',0,0),(42,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:56:16',0,0),(43,'Mysql 스터디','Mysql 스터디',3,'2020-05-29 18:56:16',0,0),(44,'스프링 스터디','스프링 스터디',2,'2020-05-29 18:56:16',0,0),(45,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-29 18:56:16',0,0),(46,'PHP 스터디','PHP 스터디',3,'2020-05-29 18:56:16',0,0),(47,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-29 18:56:16',0,0),(48,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 18:56:16',0,0),(49,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 18:56:16',0,0),(50,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:56:16',0,0),(51,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:56:16',0,0),(52,'Mysql 스터디','Mysql 스터디',3,'2020-05-29 18:56:16',0,0),(66,'스프링 스터디','스프링 스터디',2,'2020-05-29 18:56:17',0,0),(67,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-29 18:56:17',0,0),(68,'PHP 스터디','PHP 스터디',3,'2020-05-29 18:56:17',0,0),(69,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-29 18:56:17',0,0),(70,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 18:56:17',0,0),(71,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 18:56:17',0,0),(72,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:56:17',0,0),(73,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:56:17',0,0),(74,'Mysql 스터디','Mysql 스터디',3,'2020-05-29 18:56:17',0,0),(75,'스프링 스터디','스프링 스터디',2,'2020-05-29 18:56:17',0,0),(76,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-29 18:56:17',0,0),(77,'PHP 스터디','PHP 스터디',3,'2020-05-29 18:56:17',0,0),(78,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-29 18:56:17',0,0),(79,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 18:56:17',0,0),(80,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 18:56:17',0,0),(81,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:56:17',0,0),(82,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:56:17',0,0),(83,'Mysql 스터디','Mysql 스터디',3,'2020-05-29 18:56:17',0,0),(84,'스프링 스터디','스프링 스터디',2,'2020-05-29 18:56:17',0,0),(85,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-29 18:56:17',0,0),(86,'PHP 스터디','PHP 스터디',3,'2020-05-29 18:56:17',0,0),(87,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-29 18:56:17',0,0),(88,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 18:56:17',0,0),(89,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 18:56:17',0,0),(90,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:56:17',0,0),(91,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:56:17',0,0),(92,'Mysql 스터디','Mysql 스터디',3,'2020-05-29 18:56:17',0,0),(93,'스프링 스터디','스프링 스터디',2,'2020-05-29 18:56:17',0,0),(94,'안드로이드 스터디','안드로이드 스터디',1,'2020-05-29 18:56:17',0,0),(95,'PHP 스터디','PHP 스터디',3,'2020-05-29 18:56:17',0,0),(96,'알고리즘 스터디','알고리즘 스터디',3,'2020-05-29 18:56:17',0,0),(97,'Python 스터디Python 스터디','Python 스터디',3,'2020-05-29 18:56:17',0,0),(98,'JAVA 스터디','JAVA 스터디',3,'2020-05-29 18:56:17',0,0),(99,'코틀린 스터디','코틀린 스터디',2,'2020-05-29 18:56:17',0,0),(100,'IOS 스터디','IOS 스터디',1,'2020-05-29 18:56:17',0,1);
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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

--
-- Table structure for table `tbl_message`
--

DROP TABLE IF EXISTS `tbl_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_message` (
  `mno` int(11) NOT NULL AUTO_INCREMENT,
  `targetid` varchar(50) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `opendate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `senddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mno`),
  KEY `targetid` (`targetid`),
  KEY `sender` (`sender`),
  CONSTRAINT `tbl_message_ibfk_1` FOREIGN KEY (`targetid`) REFERENCES `tbl_user` (`uid`),
  CONSTRAINT `tbl_message_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `tbl_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_message`
--

LOCK TABLES `tbl_message` WRITE;
/*!40000 ALTER TABLE `tbl_message` DISABLE KEYS */;
INSERT INTO `tbl_message` VALUES (1,'user0','user1','awdwad','2020-06-11 16:54:47','2020-06-11 16:51:01'),(20,'user0','user1','i got it','2020-06-12 06:31:13','2020-06-12 06:31:13');
/*!40000 ALTER TABLE `tbl_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reply`
--

DROP TABLE IF EXISTS `tbl_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) NOT NULL,
  `replytext` varchar(1000) NOT NULL,
  `replyer` varchar(50) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tbl_reply_ibfk_1` (`bid`),
  CONSTRAINT `tbl_reply_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `tbl_board` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32824 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reply`
--

LOCK TABLES `tbl_reply` WRITE;
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
INSERT INTO `tbl_reply` VALUES (32821,3,'ㅁㄴㄻㄴㄹ','ㅁㅈㅇㅁㅈㅇ','2020-06-12 09:43:37','2020-06-12 09:43:37'),(32823,100,'awdawdwad','awdawd','2020-06-12 09:54:27','2020-06-12 09:54:27');
/*!40000 ALTER TABLE `tbl_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `uid` varchar(50) NOT NULL,
  `upw` varchar(50) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `upoint` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES ('user0','user0','a',0),('user1','user1','b',130),('user2','user2','c',0);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-12 20:03:27
