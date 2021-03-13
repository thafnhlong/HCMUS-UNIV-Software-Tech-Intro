-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: muzik
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Pop',0,'2021-03-13 12:19:40.536000','2021-03-13 12:19:40.536000','Pop is a genre of popular music'),(2,'Rock',0,'2021-03-13 12:23:48.928000','2021-03-13 12:23:48.928000','Rock music is originated as \"rock and roll\"'),(3,'Rap',0,'2021-03-13 12:24:57.007000','2021-03-13 12:50:05.049000','Rapping is a musical form of vocal delivery.'),(4,'R&B',0,'2021-03-13 12:28:16.112000','2021-03-13 12:50:16.839000','Rhythm and blues, often abbreviated as R&B.'),(5,'Ballad',0,'2021-03-13 12:30:35.983000','2021-03-13 12:50:36.691000','A ballad is a form of verse, often a narrative');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Singer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `composer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` int(10) NOT NULL,
  `views` int(10) DEFAULT NULL,
  `likes` int(10) DEFAULT NULL,
  `comments` int(11) NOT NULL DEFAULT 0,
  `category` int(10) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `createDate` datetime(6) DEFAULT NULL,
  `publishDate` datetime(6) DEFAULT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `author` (`author`),
  FULLTEXT KEY `Name` (`Name`,`Singer`,`composer`),
  CONSTRAINT `author` FOREIGN KEY (`author`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Better Now','Post Malone','Post Malone',1,2,1,1,1,1,'2021-03-13 12:21:42.899000','2021-03-13 12:21:53.351000',NULL),(2,'Without Me','Halsey','Halsey',1,0,0,0,1,1,'2021-03-13 12:33:14.510000','2021-03-13 12:33:20.820000',NULL),(3,'Bad At Love','Halsey','Whitney Jackson',1,4,0,0,1,1,'2021-03-13 12:36:41.635000','2021-03-13 12:36:46.414000',NULL),(4,'Sorry','Halsey','Smile Shine',1,0,0,0,1,1,'2021-03-13 12:41:29.170000','2021-03-13 13:05:23.542000',NULL),(5,'No Guidance','Drake, Chris Brown','Drake, Chris Brown',1,0,0,0,4,1,'2021-03-13 12:44:05.138000','2021-03-13 13:06:00.307000',NULL),(6,'In My Feelings','Drake','Drake',1,0,0,0,3,1,'2021-03-13 12:45:06.451000','2021-03-13 13:07:40.685000',NULL),(7,'Hotline Bling','Drake','Drake',1,0,0,0,4,1,'2021-03-13 13:05:52.242000','2021-03-13 13:05:58.539000',NULL),(8,'We will rock you','Queen','Queen',1,0,0,0,2,1,'2021-03-13 13:12:34.008000','2021-03-13 13:12:38.515000',NULL),(9,'Talk','Khalid','Khalid',1,0,0,0,1,1,'2021-03-13 13:15:50.772000','2021-03-13 13:22:09.937000',NULL),(10,'Rock star','Post Malone','Post Malone',1,0,0,0,1,1,'2021-03-13 13:16:57.993000','2021-03-13 13:22:11.883000',NULL),(11,'Congratulations','Post malone, Quavo','Post malone, Quavo',1,0,0,0,1,1,'2021-03-13 13:17:55.437000','2021-03-13 13:22:26.602000',NULL),(12,'Humble','Kendrick Lamar','Kendirck lamar',1,0,0,0,3,1,'2021-03-13 13:18:44.017000','2021-03-13 13:22:23.883000',NULL),(13,'Old Town Road','Lil Nasx','Lil Nasx',1,0,0,0,1,1,'2021-03-13 13:19:46.092000','2021-03-13 13:22:20.898000',NULL),(14,'See You Again','Charlie Puth, Wiz Khalifa','Charlie Puth, Wiz Khalifa',1,0,0,0,1,1,'2021-03-13 13:20:37.792000','2021-03-13 13:22:18.137000',NULL),(15,'I\'m The One','Justin Bieber, DJ Khaled, Lil Wayne ','Justin Bieber, DJ Khaled, Lil Wayne ',1,0,0,0,1,1,'2021-03-13 13:21:50.381000','2021-03-13 13:22:15.313000',NULL),(16,'Love Your Self','Justin Bieber','Justin Bieber',1,1,0,0,1,1,'2021-03-13 13:28:03.680000','2021-03-13 15:27:15.176000',NULL),(17,'Love The Way You Lie','Rihana, Eminem','Rihana, Eminem',1,0,0,0,1,1,'2021-03-13 13:30:58.896000','2021-03-13 15:27:12.750000',NULL),(18,'New Divide','Linkin Park','Linkin Park',1,0,0,0,2,1,'2021-03-13 13:40:19.274000','2021-03-13 15:27:07.945000',NULL),(19,'Thunder','Imagine Dragon','Imagine Dragon',1,0,0,0,2,1,'2021-03-13 13:42:08.514000','2021-03-13 15:27:02.983000',NULL),(20,'Demons','Imagine Dragon','Imgine Dragon',1,0,0,0,2,1,'2021-03-13 13:44:15.087000','2021-03-13 15:27:00.415000',NULL),(21,'My demon','Starset','Starset',1,0,0,0,2,1,'2021-03-13 13:45:06.406000','2021-03-13 15:26:57.670000',NULL),(22,'Centuries','Fall out boys','Fall out boys',1,0,0,0,2,1,'2021-03-13 13:45:42.000000','2021-03-13 15:26:55.084000',NULL),(23,'Radioactive','Imagine Dragon','Imagine Dragon',1,0,0,0,2,1,'2021-03-13 13:48:32.548000','2021-03-13 15:26:52.102000',NULL),(24,'Believer','Imagine Dragon','Imagine Dragon',1,0,0,0,2,1,'2021-03-13 13:52:20.753000','2021-03-13 15:26:49.133000',NULL),(25,'Immortals','Fall out boys','Fall out boys',1,0,0,0,2,1,'2021-03-13 14:28:18.621000','2021-03-13 15:26:46.285000',NULL),(26,'The phoenix','Fall out boys','Fall out boys',1,0,0,0,2,1,'2021-03-13 14:30:22.283000','2021-03-13 15:26:43.664000',NULL),(27,'Legend Never Die','Against The Current','Against The Current',1,0,0,0,2,1,'2021-03-13 14:32:29.892000','2021-03-13 15:26:40.960000',NULL),(28,'Bad liar','Imagine Dragon','Imagine Dragon',1,0,0,0,2,1,'2021-03-13 14:34:14.095000','2021-03-13 15:26:38.551000',NULL),(29,'Diamonds','Rihana','Rihana',1,0,0,0,5,1,'2021-03-13 14:36:30.031000','2021-03-13 15:26:36.365000',NULL),(30,'The monster','Rihnana, Eminem','Rihana, Eminem',1,0,0,0,4,1,'2021-03-13 14:38:03.433000','2021-03-13 15:26:33.768000',NULL),(31,'Not Afraid','Eminem','Eminem',1,0,0,0,3,1,'2021-03-13 14:38:46.714000','2021-03-13 15:26:07.422000',NULL),(32,'Lose Yourself','Eminem','Eminem',1,0,0,0,3,1,'2021-03-13 14:39:33.673000','2021-03-13 15:26:10.201000',NULL),(33,'I need a doctor','Eminem, Dr Dree','Dr Dree',1,0,0,0,3,1,'2021-03-13 14:41:08.282000','2021-03-13 15:26:14.542000',NULL),(34,'Venom','Eminem','Eminem',1,0,0,0,3,1,'2021-03-13 14:42:00.000000','2021-03-13 15:26:00.887000',NULL),(35,'Rap god','Eminem','Eminem',1,0,0,0,3,1,'2021-03-13 14:44:52.663000','2021-03-13 15:26:04.255000',NULL),(36,'7 Rings','Ariana Grande','Ariana Grande',1,0,0,0,4,1,'2021-03-13 14:45:54.600000','2021-03-13 15:26:20.384000',NULL),(37,'Blank space','Taylor swift','Taylor swift',1,0,0,0,4,1,'2021-03-13 14:47:25.823000','2021-03-13 15:26:24.006000',NULL),(38,'Wolves','Selena Gomez','Selena Gomez',1,0,0,0,4,1,'2021-03-13 14:48:14.881000','2021-03-13 15:26:26.329000',NULL),(39,'There for you','Troy Sivan','Martin Garix',1,0,0,0,4,1,'2021-03-13 14:49:10.294000','2021-03-13 15:26:28.822000',NULL),(40,'So far away ','Jamin Scott','Martin Garix',1,0,0,0,4,1,'2021-03-13 14:50:01.482000','2021-03-13 15:26:31.150000',NULL),(41,'This is what you came for','Rihana, Eminem','Rihana, Eminem',1,0,0,0,4,1,'2021-03-13 14:51:01.248000','2021-03-13 15:25:56.671000',NULL),(42,'How deep is your love','Calvin Harris, disciple','Calvin Harris',1,0,0,0,4,1,'2021-03-13 14:52:32.566000','2021-03-13 15:25:53.815000',NULL),(43,'Summer','Calvin harris','Calvin Harris',1,0,0,0,4,1,'2021-03-13 14:53:27.988000','2021-03-13 15:25:50.625000',NULL),(44,'Titanium','David Guetta, Sia','David Guetta',1,0,0,0,4,1,'2021-03-13 14:54:20.777000','2021-03-13 15:25:47.752000',NULL),(45,'Thunder Clouds','L.S.D','L.S.D',1,0,0,0,4,1,'2021-03-13 14:55:17.962000','2021-03-13 15:25:44.921000',NULL),(46,'Cheap Thrills','Sia','Sia',1,0,0,0,5,1,'2021-03-13 14:56:07.942000','2021-03-13 15:25:42.031000',NULL),(47,'Just give me a reason','Pink, Nate Ruess','Pink, Nate Ruess',1,0,0,0,5,1,'2021-03-13 14:57:19.120000','2021-03-13 15:25:39.358000',NULL),(48,'Bang Bang','Jessie J, Ariana Grande','Jessie J, Ariana Grande',1,0,0,0,5,1,'2021-03-13 14:58:03.890000','2021-03-13 15:25:35.663000',NULL),(49,'Wrecking ball','Miley Cyrus','Miley Cyrus',1,0,0,0,5,1,'2021-03-13 14:58:52.896000','2021-03-13 15:25:32.606000',NULL),(50,'Side to side','Ariana Grande','Ariana Grande',1,0,0,0,5,1,'2021-03-13 15:00:08.148000','2021-03-13 15:25:29.616000',NULL),(51,'Timber','Pitbull','Pitbull',1,0,0,0,3,1,'2021-03-13 15:00:42.198000','2021-03-13 15:25:06.249000',NULL),(52,'Lovely','Khalid, Billie Eilish','Khalid, Billie Eilish',1,0,0,0,5,0,'2021-03-13 15:04:08.885000',NULL,NULL),(53,'All of me','John legend','Johen legend',1,0,0,0,5,0,'2021-03-13 15:08:06.100000',NULL,NULL),(54,'Like I\'m gonna lose you','Johen legend, Meghan Tranor','Johen legend, Meghan Tranor',1,0,0,0,5,1,'2021-03-13 15:09:46.573000','2021-03-13 15:25:09.630000',NULL),(55,'Love me like you do','Ellie Goulding','Ellie Goulding',1,0,0,0,5,1,'2021-03-13 15:11:09.635000','2021-03-13 15:25:13.215000',NULL),(56,'Too good at good bye','Sam Smith','Sam Smith',1,0,0,0,5,1,'2021-03-13 15:12:57.770000','2021-03-13 15:25:16.167000',NULL),(57,'Let her go','Passenger','Passenger',1,0,0,0,5,1,'2021-03-13 15:14:08.236000','2021-03-13 15:25:18.736000',NULL),(58,'Taste ','Tyga, Offset','Tyga',1,0,0,0,3,1,'2021-03-13 15:15:58.908000','2021-03-13 15:25:21.574000',NULL),(59,'Let me love you','Lil wayne, Ariana Grande','Lil wayne, Ariana Grande',1,0,0,0,3,1,'2021-03-13 15:19:09.248000','2021-03-13 15:25:24.296000',NULL),(60,'Taki taki','Cardi B, Selena Gomez','Dj Snake',1,0,0,0,3,1,'2021-03-13 15:20:39.637000','2021-03-13 15:25:26.600000',NULL),(61,'Woman like me','Little Mix, Nicky Minaj','Little Mix, Nicky Minaj',1,0,0,0,3,1,'2021-03-13 15:24:34.911000','2021-03-13 15:25:00.826000',NULL);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender` tinyint(3) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permision` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `activeToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refreshToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hieuttm','$2b$08$T9Q664DzRpKOFv9Y1KkUv.tBcCenCfekCTDkFPvdZ2nXeKq3YC88q','ttmhieu08@gmail.com','2000-12-15',NULL,NULL,1,0,'2021-03-13 12:14:14.000000','2021-03-13 12:14:14.000000',1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_comments`
--

DROP TABLE IF EXISTS `users_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_comments` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `User` int(10) NOT NULL,
  `Song` int(10) NOT NULL,
  `delete` tinyint(3) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `modifileDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKUsers_Comm215024` (`User`),
  KEY `FKUsers_Comm193966` (`Song`),
  CONSTRAINT `FKUsers_Comm193966` FOREIGN KEY (`Song`) REFERENCES `songs` (`ID`),
  CONSTRAINT `FKUsers_Comm215024` FOREIGN KEY (`User`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_comments`
--

LOCK TABLES `users_comments` WRITE;
/*!40000 ALTER TABLE `users_comments` DISABLE KEYS */;
INSERT INTO `users_comments` VALUES (1,'I love this song',1,1,0,'2021-03-13 12:38:27.221000','2021-03-13 12:38:27.221000');
/*!40000 ALTER TABLE `users_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_favorite_songs`
--

DROP TABLE IF EXISTS `users_favorite_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_favorite_songs` (
  `User` int(10) NOT NULL,
  `Song` int(10) NOT NULL,
  PRIMARY KEY (`User`,`Song`),
  KEY `FKUsers_Favo456767` (`User`),
  KEY `FKUsers_Favo477825` (`Song`),
  CONSTRAINT `FKUsers_Favo456767` FOREIGN KEY (`User`) REFERENCES `users` (`ID`),
  CONSTRAINT `FKUsers_Favo477825` FOREIGN KEY (`Song`) REFERENCES `songs` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_favorite_songs`
--

LOCK TABLES `users_favorite_songs` WRITE;
/*!40000 ALTER TABLE `users_favorite_songs` DISABLE KEYS */;
INSERT INTO `users_favorite_songs` VALUES (1,3);
/*!40000 ALTER TABLE `users_favorite_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_like_songs`
--

DROP TABLE IF EXISTS `users_like_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_like_songs` (
  `User` int(10) NOT NULL,
  `Song` int(10) NOT NULL,
  PRIMARY KEY (`User`,`Song`),
  KEY `FKUsers_like408315` (`User`),
  KEY `FKUsers_like387257` (`Song`),
  CONSTRAINT `FKUsers_like387257` FOREIGN KEY (`Song`) REFERENCES `songs` (`ID`),
  CONSTRAINT `FKUsers_like408315` FOREIGN KEY (`User`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_like_songs`
--

LOCK TABLES `users_like_songs` WRITE;
/*!40000 ALTER TABLE `users_like_songs` DISABLE KEYS */;
INSERT INTO `users_like_songs` VALUES (1,1);
/*!40000 ALTER TABLE `users_like_songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-13 15:59:36
