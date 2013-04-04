-- MySQL dump 10.13  Distrib 5.1.68, for Win64 (unknown)
--
-- Host: localhost    Database: reckontor
-- ------------------------------------------------------
-- Server version	5.1.68-community

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
-- Table structure for table `core_settings`
--

DROP TABLE IF EXISTS `core_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_settings`
--

LOCK TABLES `core_settings` WRITE;
/*!40000 ALTER TABLE `core_settings` DISABLE KEYS */;
INSERT INTO `core_settings` VALUES ('date_format','g:ia -- m/d/y','g:ia -- m/d/y'),('lang_direction','ltr','ltr'),('status_message','This site has been disabled by a super-administrator.','This site has been disabled by a super-administrator.');
/*!40000 ALTER TABLE `core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sites`
--

DROP TABLE IF EXISTS `core_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sites`
--

LOCK TABLES `core_sites` WRITE;
/*!40000 ALTER TABLE `core_sites` DISABLE KEYS */;
INSERT INTO `core_sites` VALUES (1,'Default Site','default','localhost',1,1353209398,0);
/*!40000 ALTER TABLE `core_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_users`
--

LOCK TABLES `core_users` WRITE;
/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;
INSERT INTO `core_users` VALUES (1,'lehung@ymail.com','8921e95fb920aa0a971adc654fbcf6175f37abbe','1782e2',1,'',1,'',1353209396,1353209396,'administrator',NULL,NULL);
/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog`
--

DROP TABLE IF EXISTS `default_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `attachment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '1',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_blog`
--

LOCK TABLES `default_blog` WRITE;
/*!40000 ALTER TABLE `default_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog_categories`
--

DROP TABLE IF EXISTS `default_blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_blog_categories`
--

LOCK TABLES `default_blog_categories` WRITE;
/*!40000 ALTER TABLE `default_blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_ci_sessions`
--

DROP TABLE IF EXISTS `default_ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_ci_sessions`
--

LOCK TABLES `default_ci_sessions` WRITE;
/*!40000 ALTER TABLE `default_ci_sessions` DISABLE KEYS */;
INSERT INTO `default_ci_sessions` VALUES ('272360b4f98baaa62cbccb98c2eccb1c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31',1364945914,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:9:\"kevin.le1\";s:5:\"email\";s:18:\"kevin@ongoasia.com\";s:2:\"id\";s:1:\"7\";s:7:\"user_id\";s:1:\"7\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('0cf9b6473d6afa7104236ee734340ece','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31',1364948769,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:8:\"kevin.le\";s:5:\"email\";s:14:\"test@ymail.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('1dbe1d58070a8df2e2d8d8cd63a2ae8d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1363519241,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:8:\"kevin.le\";s:5:\"email\";s:14:\"test@ymail.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('1f3923ba5ca323293817bab96a308ea6','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1363647627,''),('24cf6a22b7741724f7be4f61abfc0edb','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361892008,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f697f6d30ff5e15893c30de21f1a7bb9','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1363558359,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:8:\"kevin.le\";s:5:\"email\";s:14:\"test@ymail.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('290eb012513b046f4a0bd4644205c5b6','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361865706,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3a2ca92b5d15cb5c501c442b5ac5363b','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356419323,'a:6:{s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3a8c8fbee32c79c046595a4de7201a78','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356772441,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3d13bd28f1f07ba8d5be6cc7e983fcb6','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1363788572,''),('45add0ed85ce9045b1397a63e913b314','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361800954,''),('472bf57f93ecb9975db947bf39960d74','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1364302173,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:11:\"admin.admin\";s:5:\"email\";s:18:\"admin@ongoasia.com\";s:2:\"id\";s:1:\"5\";s:7:\"user_id\";s:1:\"5\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('49de7c2323f9c65bed83b2eacb50378e','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1362065111,''),('4a9339cb62b9684cf48efe1f3595b230','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361779543,'a:2:{s:9:\"user_data\";s:0:\"\";s:11:\"redirect_to\";s:10:\"users/edit\";}'),('4ef02c24bde2f9c50484022486384cef','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356527663,''),('55936d67a2d317ffb3ad09fb52e27d9e','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361870239,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('683ee4d22439382f4da9b5c00102fb18','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1363213287,''),('6a387e94606689ecb4ea1fb9575eb0b6','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361869432,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('92d3248e168b87a2006deefd613ff70d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1364431883,''),('6c522301759be412b2d79a341c362cf1','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1363214547,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:8:\"kevin.le\";s:5:\"email\";s:14:\"test@ymail.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('6c7b08ba9d24d5c733f68e339c620ca4','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361800558,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6fad66b856d08ef7310ebc027f9fb5d2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1364141041,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:8:\"kevin.le\";s:5:\"email\";s:14:\"test@ymail.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('7f2c3bb1e58356dd1f56326182a316c2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.160 Safari/537.22',1363127298,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:8:\"kevin.le\";s:5:\"email\";s:14:\"test@ymail.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('810c111eaa474b1c08dcbd51da1f8330','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22',1361663449,''),('95de00415ce3fbf216d76c6f6776991c','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:16.0) Gecko/20100101 Firefox/16.0',1353274784,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9b7759bbb43c66377b5e758c33ae156a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1362703725,''),('9ed74db155bdb7b524ebde3b818512e1','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1363331730,'a:8:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:8:\"kevin.le\";s:5:\"email\";s:14:\"test@ymail.com\";s:2:\"id\";s:1:\"4\";s:7:\"user_id\";s:1:\"4\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";s:17:\"flash:old:success\";s:32:\"You have logged in successfully.\";}'),('a0ab7f98f00a64901aec0c251c3a157c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1364948754,'a:6:{s:8:\"username\";s:9:\"kevin.le1\";s:5:\"email\";s:18:\"kevin@ongoasia.com\";s:2:\"id\";s:1:\"7\";s:7:\"user_id\";s:1:\"7\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a1538b4d2c56cb607c7489abad4f6345','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1362034463,''),('b28189c0913c93ccc907c6d9df31745b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361883722,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('b81312fc19924943c757380620575235','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1363406246,''),('b9b78b93b922419b6546ea439bceecc5','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1363728336,''),('b9d864e8e5528c69760bbe10c31b1d50','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361978790,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('bc26353ae2cb2c01ea4ff80fc1c1159f','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361779973,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c7c1e354c0ece4e0d6b507605a76d8c2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1364133119,'a:1:{s:9:\"user_data\";s:0:\"\";}'),('d2c6c5a0725bee98d2a6154d9067ab15','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361802232,'a:6:{s:9:\"user_data\";s:0:\"\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('dd2dcd56900633dcc038c1ecea2afd96','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1361801121,''),('e3d9029235804b6afb2d565e3a18a8e8','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1362231312,''),('eca625c8e8797749d730610fda907ab0','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22',1363727568,''),('f0f4d09c2f949463a1cdd1a59deb3eba','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; rv:19.0) Gecko/20100101 Firefox/19.0',1362322812,''),('f6c0aeecdc10022d77990b74e8066f8e','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356579134,'a:2:{s:9:\"user_data\";s:0:\"\";s:16:\"flash:old:notice\";s:59:\"Your registration is awaiting approval by an administrator.\";}'),('cbd9d6c5d54c31cd58c45188acd594b7','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0',1364432120,''),('c1ea60a321f3d367ba1c36da560597b2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.43 Safari/537.31',1365027794,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:7:\"hung.le\";s:5:\"email\";s:17:\"hung@ongoasia.com\";s:2:\"id\";s:2:\"14\";s:7:\"user_id\";s:2:\"14\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}');
/*!40000 ALTER TABLE `default_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_comments`
--

DROP TABLE IF EXISTS `default_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `created_on` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_comments`
--

LOCK TABLES `default_comments` WRITE;
/*!40000 ALTER TABLE `default_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_contact_log`
--

DROP TABLE IF EXISTS `default_contact_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_contact_log`
--

LOCK TABLES `default_contact_log` WRITE;
/*!40000 ALTER TABLE `default_contact_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_contact_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_field_assignments`
--

DROP TABLE IF EXISTS `default_data_field_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_field_assignments`
--

LOCK TABLES `default_data_field_assignments` WRITE;
/*!40000 ALTER TABLE `default_data_field_assignments` DISABLE KEYS */;
INSERT INTO `default_data_field_assignments` VALUES (1,1,1,1,'yes','no',NULL,NULL),(2,2,1,2,'yes','no',NULL,NULL),(3,3,1,3,'no','no',NULL,NULL),(4,4,1,4,'no','no',NULL,NULL),(5,5,1,5,'no','no',NULL,NULL),(6,6,1,6,'no','no',NULL,NULL),(7,7,1,7,'no','no',NULL,NULL),(8,8,1,8,'no','no',NULL,NULL),(9,9,1,9,'no','no',NULL,NULL),(10,10,1,10,'no','no',NULL,NULL),(11,11,1,11,'no','no',NULL,NULL),(12,12,1,12,'no','no',NULL,NULL),(13,13,1,13,'no','no',NULL,NULL),(14,14,1,14,'no','no',NULL,NULL);
/*!40000 ALTER TABLE `default_data_field_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_fields`
--

DROP TABLE IF EXISTS `default_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_fields`
--

LOCK TABLES `default_data_fields` WRITE;
/*!40000 ALTER TABLE `default_data_fields` DISABLE KEYS */;
INSERT INTO `default_data_fields` VALUES (1,'lang:user_first_name','first_name','users','text','a:1:{s:10:\"max_length\";i:50;}',NULL,'no'),(2,'lang:user_last_name','last_name','users','text','a:1:{s:10:\"max_length\";i:50;}',NULL,'no'),(3,'lang:profile_company','company','users','text','a:1:{s:10:\"max_length\";i:100;}',NULL,'no'),(4,'lang:profile_bio','bio','users','textarea','a:0:{}',NULL,'no'),(5,'lang:user_lang','lang','users','pyro_lang','a:1:{s:12:\"filter_theme\";s:3:\"yes\";}',NULL,'no'),(6,'lang:profile_dob','dob','users','datetime','a:4:{s:8:\"use_time\";s:2:\"no\";s:10:\"start_date\";s:5:\"-100Y\";s:7:\"storage\";s:4:\"unix\";s:10:\"input_type\";s:8:\"dropdown\";}',NULL,'no'),(7,'lang:profile_gender','gender','users','choice','a:2:{s:11:\"choice_data\";s:34:\" : Not Telling\nm : Male\nf : Female\";s:11:\"choice_type\";s:8:\"dropdown\";}',NULL,'no'),(8,'lang:profile_phone','phone','users','text','a:1:{s:10:\"max_length\";i:20;}',NULL,'no'),(9,'lang:profile_mobile','mobile','users','text','a:1:{s:10:\"max_length\";i:20;}',NULL,'no'),(10,'lang:profile_address_line1','address_line1','users','text','a:0:{}',NULL,'no'),(11,'lang:profile_address_line2','address_line2','users','text','a:0:{}',NULL,'no'),(12,'lang:profile_address_line3','address_line3','users','text','a:0:{}',NULL,'no'),(13,'lang:profile_address_postcode','postcode','users','text','a:1:{s:10:\"max_length\";i:20;}',NULL,'no'),(14,'lang:profile_website','website','users','url',NULL,NULL,'no');
/*!40000 ALTER TABLE `default_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_streams`
--

DROP TABLE IF EXISTS `default_data_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_streams` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_streams`
--

LOCK TABLES `default_data_streams` WRITE;
/*!40000 ALTER TABLE `default_data_streams` DISABLE KEYS */;
INSERT INTO `default_data_streams` VALUES (1,'lang:user_profile_fields_label','profiles','users',NULL,'Profiles for users module','a:1:{i:0;s:12:\"display_name\";}','display_name','title');
/*!40000 ALTER TABLE `default_data_streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_email_templates`
--

DROP TABLE IF EXISTS `default_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_email_templates`
--

LOCK TABLES `default_email_templates` WRITE;
/*!40000 ALTER TABLE `default_email_templates` DISABLE KEYS */;
INSERT INTO `default_email_templates` VALUES (1,'comments','Comment Notification','Email that is sent to admin when someone creates a comment','You have just received a comment from {{ name }}','<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>','en',1,'comments'),(2,'contact','Contact Notification','Template for the contact form','{{ settings:site_name }} :: {{ subject }}','This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n\n				{{ email }}','en',1,'pages'),(3,'registered','New User Registered','Email sent to the site contact e-mail when a new user registers','{{ settings:site_name }} :: You have just received a registration from {{ name }}','<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>','en',1,'users'),(4,'activation','Activation Email','The email which contains the activation code that is sent to a new user','{{ settings:site_name }} - Account Activation','<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>','en',1,'users'),(5,'forgotten_password','Forgotten Password Email','The email that is sent containing a password reset code','{{ settings:site_name }} - Forgotten Password','<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>','en',1,'users'),(6,'new_password','New Password Email','After a password is reset this email is sent containing the new password','{{ settings:site_name }} - New Password','<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>','en',1,'users');
/*!40000 ALTER TABLE `default_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_file_folders`
--

DROP TABLE IF EXISTS `default_file_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_file_folders`
--

LOCK TABLES `default_file_folders` WRITE;
/*!40000 ALTER TABLE `default_file_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_file_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_files`
--

DROP TABLE IF EXISTS `default_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_files`
--

LOCK TABLES `default_files` WRITE;
/*!40000 ALTER TABLE `default_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_groups`
--

DROP TABLE IF EXISTS `default_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_groups`
--

LOCK TABLES `default_groups` WRITE;
/*!40000 ALTER TABLE `default_groups` DISABLE KEYS */;
INSERT INTO `default_groups` VALUES (1,'admin','Administrator'),(2,'user','User');
/*!40000 ALTER TABLE `default_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords`
--

DROP TABLE IF EXISTS `default_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_keywords`
--

LOCK TABLES `default_keywords` WRITE;
/*!40000 ALTER TABLE `default_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords_applied`
--

DROP TABLE IF EXISTS `default_keywords_applied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_keywords_applied`
--

LOCK TABLES `default_keywords_applied` WRITE;
/*!40000 ALTER TABLE `default_keywords_applied` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords_applied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_migrations`
--

DROP TABLE IF EXISTS `default_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_migrations`
--

LOCK TABLES `default_migrations` WRITE;
/*!40000 ALTER TABLE `default_migrations` DISABLE KEYS */;
INSERT INTO `default_migrations` VALUES (96);
/*!40000 ALTER TABLE `default_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_modules`
--

DROP TABLE IF EXISTS `default_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_modules`
--

LOCK TABLES `default_modules` WRITE;
/*!40000 ALTER TABLE `default_modules` DISABLE KEYS */;
INSERT INTO `default_modules` VALUES (1,'a:15:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"zh\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}','blog','2.0',NULL,'a:23:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fr\";s:46:\"Envoyez de nouveaux posts et messages de blog.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"zh\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}',1,1,1,'content',1,1,1,1361807567),(2,'a:23:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"zh\";s:6:\"回應\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}','comments','1.0',NULL,'a:23:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"zh\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}',0,0,1,'content',1,1,1,1361807567),(3,'a:23:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"zh\";s:12:\"聯絡我們\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}','contact','0.9',NULL,'a:23:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"zh\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}',0,0,0,'0',1,1,1,1361807567),(4,'a:22:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"zh\";s:6:\"檔案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}','files','2.0',NULL,'a:22:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"zh\";s:33:\"管理網站中的檔案與目錄\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}',0,0,1,'content',1,1,1,1361807567),(5,'a:22:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"zh\";s:6:\"群組\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}','groups','1.0',NULL,'a:22:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"zh\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}',0,0,1,'users',1,1,1,1361807567),(6,'a:15:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"zh\";s:6:\"鍵詞\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}','keywords','1.0',NULL,'a:15:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"zh\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}',0,0,1,'content',1,1,1,1361807567),(7,'a:12:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"zh\";s:6:\"維護\";}','maintenance','1.0',NULL,'a:12:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"zh\";s:45:\"經由管理介面手動刪除暫存資料。\";}',0,0,1,'utilities',1,1,1,1361807567),(8,'a:23:{s:2:\"en\";s:7:\"Modules\";s:2:\"ar\";s:14:\"الوحدات\";s:2:\"br\";s:8:\"Módulos\";s:2:\"pt\";s:8:\"Módulos\";s:2:\"cs\";s:6:\"Moduly\";s:2:\"da\";s:7:\"Moduler\";s:2:\"de\";s:6:\"Module\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:8:\"Módulos\";s:2:\"fi\";s:8:\"Moduulit\";s:2:\"fr\";s:7:\"Modules\";s:2:\"he\";s:14:\"מודולים\";s:2:\"id\";s:5:\"Modul\";s:2:\"it\";s:6:\"Moduli\";s:2:\"lt\";s:8:\"Moduliai\";s:2:\"nl\";s:7:\"Modules\";s:2:\"pl\";s:7:\"Moduły\";s:2:\"ru\";s:12:\"Модули\";s:2:\"sl\";s:6:\"Moduli\";s:2:\"zh\";s:6:\"模組\";s:2:\"hu\";s:7:\"Modulok\";s:2:\"th\";s:15:\"โมดูล\";s:2:\"se\";s:7:\"Moduler\";}','modules','1.0',NULL,'a:23:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"zh\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}',0,0,1,'0',1,1,1,1361807567),(9,'a:23:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"zh\";s:12:\"導航選單\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}','navigation','1.1',NULL,'a:23:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"zh\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";}',0,0,1,'design',1,1,1,1361807567),(10,'a:23:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"zh\";s:6:\"頁面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}','pages','2.2.0',NULL,'a:23:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"zh\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}',1,1,1,'content',1,1,1,1361807567),(11,'a:23:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"zh\";s:6:\"權限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}','permissions','0.6',NULL,'a:23:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"zh\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}',0,0,1,'users',1,1,1,1361807567),(12,'a:21:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"zh\";s:6:\"轉址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}','redirects','1.0',NULL,'a:21:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"zh\";s:33:\"將網址轉址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}',0,0,1,'utilities',1,1,1,1361807567),(13,'a:23:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"zh\";s:12:\"網站設定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}','settings','1.0',NULL,'a:23:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:105:\"Permet aux admistrateurs et au personnel de modifier les paramètres du site : nom du site et description\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"zh\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}',1,0,1,'0',1,1,1,1361807567),(14,'a:18:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"zh\";s:12:\"網站地圖\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}','sitemap','1.2',NULL,'a:19:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"zh\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}',0,1,0,'content',1,1,1,1361807567),(15,'a:5:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";}','streams_core','1.0.0',NULL,'a:5:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";}',1,0,0,'0',1,1,1,1361807567),(16,'a:19:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"zh\";s:12:\"郵件範本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}','templates','1.1.0',NULL,'a:19:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"zh\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}',1,0,1,'design',1,1,1,1361807567),(17,'a:23:{s:2:\"en\";s:6:\"Themes\";s:2:\"ar\";s:14:\"السّمات\";s:2:\"br\";s:5:\"Temas\";s:2:\"pt\";s:5:\"Temas\";s:2:\"cs\";s:14:\"Motivy vzhledu\";s:2:\"da\";s:6:\"Temaer\";s:2:\"de\";s:6:\"Themen\";s:2:\"el\";s:31:\"Θέματα Εμφάνισης\";s:2:\"es\";s:5:\"Temas\";s:2:\"fi\";s:6:\"Teemat\";s:2:\"fr\";s:7:\"Thèmes\";s:2:\"he\";s:23:\"ערכות נושאים\";s:2:\"id\";s:4:\"Tema\";s:2:\"it\";s:4:\"Temi\";s:2:\"lt\";s:5:\"Temos\";s:2:\"nl\";s:7:\"Thema\'s\";s:2:\"pl\";s:6:\"Motywy\";s:2:\"ru\";s:8:\"Темы\";s:2:\"sl\";s:8:\"Predloge\";s:2:\"zh\";s:12:\"佈景主題\";s:2:\"hu\";s:8:\"Sablonok\";s:2:\"th\";s:9:\"ธีม\";s:2:\"se\";s:5:\"Teman\";}','themes','1.0',NULL,'a:23:{s:2:\"en\";s:86:\"Allows admins and staff to switch themes, upload new themes, and manage theme options.\";s:2:\"ar\";s:170:\"تمكّن الإدارة وأعضاء الموقع تغيير سِمة الموقع، وتحميل سمات جديدة وإدارتها بطريقة مرئية سلسة.\";s:2:\"br\";s:125:\"Permite aos administradores e membros da equipe fazer upload de novos temas e gerenciá-los através de uma interface visual.\";s:2:\"pt\";s:100:\"Permite aos administradores fazer upload de novos temas e geri-los através de uma interface visual.\";s:2:\"cs\";s:106:\"Umožňuje administrátorům a dalším osobám měnit vzhled webu, nahrávat nové motivy a spravovat je.\";s:2:\"da\";s:108:\"Lader administratore ændre websidens tema, uploade nye temaer og håndtére dem med en mere visual tilgang.\";s:2:\"de\";s:121:\"Ermöglicht es dem Administrator das Seiten Thema auszuwählen, neue Themen hochzulanden oder diese visuell zu verwalten.\";s:2:\"el\";s:222:\"Επιτρέπει στους διαχειριστές να αλλάξουν το θέμα προβολής του ιστοτόπου να ανεβάσουν νέα θέματα και να τα διαχειριστούν.\";s:2:\"es\";s:132:\"Permite a los administradores y miembros del personal cambiar el tema del sitio web, subir nuevos temas y manejar los ya existentes.\";s:2:\"fi\";s:129:\"Mahdollistaa sivuston teeman vaihtamisen, uusien teemojen lataamisen ja niiden hallinnoinnin visuaalisella käyttöliittymällä.\";s:2:\"fr\";s:144:\"Permet aux administrateurs et au personnel de modifier le thème du site, de charger de nouveaux thèmes et de le gérer de façon plus visuelle\";s:2:\"he\";s:63:\"ניהול של ערכות נושאים שונות - עיצוב\";s:2:\"id\";s:104:\"Memungkinkan admin dan staff untuk mengubah tema tampilan, mengupload tema baru, dan mengatur opsi tema.\";s:2:\"it\";s:120:\"Permette ad amministratori e staff di cambiare il tema del sito, carica nuovi temi e gestiscili in um modo più visuale.\";s:2:\"lt\";s:105:\"Leidžiama administratoriams ir personalui keisti puslapio temą, įkraunant naują temą ir valdyti ją.\";s:2:\"nl\";s:153:\"Maakt het voor administratoren en medewerkers mogelijk om het thema van de website te wijzigen, nieuwe thema&apos;s te uploaden en ze visueel te beheren.\";s:2:\"pl\";s:100:\"Umożliwia administratorowi zmianę motywu strony, wgrywanie nowych motywów oraz zarządzanie nimi.\";s:2:\"ru\";s:102:\"Управление темами оформления сайта, загрузка новых тем.\";s:2:\"sl\";s:133:\"Dovoljuje adminom in osebju spremembo izgleda spletne strani, namestitev novega izgleda in urejanja le tega v bolj vizualnem pristopu\";s:2:\"zh\";s:108:\"讓管理者可以更改網站顯示風貌，以視覺化的操作上傳並管理這些網站佈景主題。\";s:2:\"th\";s:219:\"ช่วยให้ผู้ดูแลระบบสามารถอัปโหลดรูปแบบใหม่และการจัดการตัวเลือกชุดรูปแบบได้\";s:2:\"hu\";s:107:\"Az adminok megváltoztathatják az oldal kinézetét, feltölthetnek új kinézeteket és kezelhetik őket.\";s:2:\"se\";s:94:\"Hantera webbplatsens utseende genom teman, ladda upp nya teman och hantera temainställningar.\";}',0,0,1,'design',1,1,1,1361807567),(18,'a:23:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"zh\";s:6:\"用戶\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}','users','0.9',NULL,'a:23:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"zh\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}',0,0,1,'0',1,1,1,1361807567),(19,'a:23:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"zh\";s:12:\"系統變數\";s:2:\"hu\";s:10:\"Változók\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";}','variables','0.4',NULL,'a:23:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"zh\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}',0,0,1,'content',1,1,1,1361807567),(20,'a:20:{s:2:\"en\";s:7:\"Widgets\";s:2:\"ar\";s:12:\"الودجت\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fi\";s:8:\"Widgetit\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"zh\";s:9:\"小組件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";}','widgets','1.1',NULL,'a:21:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:138:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"وِدْجِتْ\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fi\";s:83:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Widgettejä\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"zh\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}',1,0,1,'content',1,1,1,1361807567),(21,'a:3:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";}','wysiwyg','1.0',NULL,'a:4:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";}',0,0,0,'0',1,1,1,1361807567),(22,'a:1:{s:2:\"en\";s:18:\"Contractors System\";}','contractors','1.0',NULL,'a:1:{s:2:\"en\";s:136:\"This system allows GPSI Contractors to estimate their next payment, as well as to provide a back-end to add and modify contractors info.\";}',0,1,1,'content',0,0,0,1361803967),(23,'a:1:{s:2:\"en\";s:11:\"Tour System\";}','tour','1.0',NULL,'a:1:{s:2:\"en\";s:11:\"Tour System\";}',0,1,1,'content',1,1,0,1361808127);
/*!40000 ALTER TABLE `default_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_groups`
--

DROP TABLE IF EXISTS `default_navigation_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_navigation_groups`
--

LOCK TABLES `default_navigation_groups` WRITE;
/*!40000 ALTER TABLE `default_navigation_groups` DISABLE KEYS */;
INSERT INTO `default_navigation_groups` VALUES (1,'Header','header'),(2,'Sidebar','sidebar'),(3,'Footer','footer');
/*!40000 ALTER TABLE `default_navigation_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_links`
--

DROP TABLE IF EXISTS `default_navigation_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_navigation_links`
--

LOCK TABLES `default_navigation_links` WRITE;
/*!40000 ALTER TABLE `default_navigation_links` DISABLE KEYS */;
INSERT INTO `default_navigation_links` VALUES (1,'Home',NULL,'page',1,'','','',1,1,NULL,NULL,''),(2,'Blog',NULL,'module',NULL,'blog','','',1,2,NULL,NULL,''),(3,'Contact',NULL,'page',3,'','','',1,3,NULL,NULL,'');
/*!40000 ALTER TABLE `default_navigation_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_page_chunks`
--

DROP TABLE IF EXISTS `default_page_chunks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_page_chunks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci,
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_page_chunks`
--

LOCK TABLES `default_page_chunks` WRITE;
/*!40000 ALTER TABLE `default_page_chunks` DISABLE KEYS */;
INSERT INTO `default_page_chunks` VALUES (1,'default','',1,'<p>Welcome to our homepage. We have not quite finished setting up our website yet, but please add us to your bookmarks and come back soon.</p>','','wysiwyg-advanced',1),(2,'default','',2,'<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>','','html',1),(3,'default','',3,'<p>To contact us please fill out the form below.</p>\n					{{ contact:form name=\"text|required\" email=\"text|required|valid_email\" subject=\"dropdown|Support|Sales|Feedback|Other\" message=\"textarea\" attachment=\"file|zip\" }}\n						<div><label for=\"name\">Name:</label>{{ name }}</div>\n						<div><label for=\"email\">Email:</label>{{ email }}</div>\n						<div><label for=\"subject\">Subject:</label>{{ subject }}</div>\n						<div><label for=\"message\">Message:</label>{{ message }}</div>\n						<div><label for=\"attachment\">Attach  a zip file:</label>{{ attachment }}</div>\n					{{ /contact:form }}','','html',1);
/*!40000 ALTER TABLE `default_page_chunks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_page_layouts`
--

DROP TABLE IF EXISTS `default_page_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_page_layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_page_layouts`
--

LOCK TABLES `default_page_layouts` WRITE;
/*!40000 ALTER TABLE `default_page_layouts` DISABLE KEYS */;
INSERT INTO `default_page_layouts` VALUES (1,'Default','<h2>{{ page:title }}</h2>\r\n{{ page:body }}','','','default',1353209404);
/*!40000 ALTER TABLE `default_page_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pages`
--

DROP TABLE IF EXISTS `default_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `revision_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `layout_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pages`
--

LOCK TABLES `default_pages` WRITE;
/*!40000 ALTER TABLE `default_pages` DISABLE KEYS */;
INSERT INTO `default_pages` VALUES (1,'home','','Home','home',0,'1','1',NULL,NULL,NULL,NULL,NULL,0,0,'live',1353209404,0,'',1,1,1353209404),(2,'404','','Page missing','404',0,'1','1',NULL,NULL,NULL,NULL,NULL,0,0,'live',1353209404,0,'',0,1,1353209404),(3,'contact','','Contact','contact',0,'1','1',NULL,NULL,NULL,NULL,NULL,0,0,'live',1353209404,0,'',0,1,1353209404);
/*!40000 ALTER TABLE `default_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_permissions`
--

DROP TABLE IF EXISTS `default_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_permissions`
--

LOCK TABLES `default_permissions` WRITE;
/*!40000 ALTER TABLE `default_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_profiles`
--

DROP TABLE IF EXISTS `default_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_profiles`
--

LOCK TABLES `default_profiles` WRITE;
/*!40000 ALTER TABLE `default_profiles` DISABLE KEYS */;
INSERT INTO `default_profiles` VALUES (1,NULL,NULL,NULL,NULL,1,'Le Hung','Le','Hung',NULL,'en','&lt;html&gt;&lt;/html>',0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1356769936),(2,'2012-12-27 03:32:33',NULL,NULL,1,2,'asdfff.sdff','asdfff','sdff',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'2013-02-25 04:37:43',NULL,NULL,2,3,'nga.ngo','Nga','Ngo',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'2013-03-12 22:10:18',NULL,NULL,3,4,'kevin.le','kevin','le',NULL,'en',NULL,0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1363646930),(5,'2013-03-24 02:18:09',NULL,NULL,4,5,'admin.admin','admin','admin',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'2013-03-24 02:39:28',NULL,NULL,5,6,'passsword.password','passsword','password',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'2013-04-02 23:08:00',NULL,NULL,6,7,'kevin.le1','Kevin','Le',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'2013-04-03 21:15:50',NULL,NULL,7,8,'kevin.le2','kevin','le',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'2013-04-03 21:38:51',NULL,NULL,8,9,'admin.user','admin','user',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'2013-04-03 21:43:18',NULL,NULL,9,10,'kevin.le','Kevin','Le',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'2013-04-03 21:53:38',NULL,NULL,10,11,'fani.nini','Fani','Nini',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'2013-04-03 21:57:05',NULL,NULL,11,12,'fani.nini','Fani','Nini',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'2013-04-03 22:03:27',NULL,NULL,12,13,'raymond.futuray','Raymond','Futuray',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2013-04-03 22:05:20',NULL,NULL,13,14,'hung.le','Hung','Le',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `default_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_redirects`
--

DROP TABLE IF EXISTS `default_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_redirects`
--

LOCK TABLES `default_redirects` WRITE;
/*!40000 ALTER TABLE `default_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_settings`
--

DROP TABLE IF EXISTS `default_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_settings`
--

LOCK TABLES `default_settings` WRITE;
/*!40000 ALTER TABLE `default_settings` DISABLE KEYS */;
INSERT INTO `default_settings` VALUES ('activation_email','Activation Email','Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.','radio','1','0','1=Enabled|0=Disabled',0,1,'users',961),('addons_upload','Addons Upload Permissions','Keeps mere admins from uploading addons by default','text','0','1','',1,0,'',0),('admin_force_https','Force HTTPS for Control Panel?','Allow only the HTTPS protocol when using the Control Panel?','radio','0','','1=Yes|0=No',1,1,'',0),('admin_theme','Control Panel Theme','Select the theme for the control panel.','','','pyrocms','func:get_themes',1,0,'',0),('akismet_api_key','Akismet API Key','Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.','text','','','',0,1,'integration',981),('api_enabled','API Enabled','Allow API access to all modules which have an API controller.','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('api_user_keys','API User Keys','Allow users to sign up for API keys (if the API is Enabled).','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('auto_username','Auto Username','Create the username automatically, meaning users can skip making one on registration.','radio','1','','1=Enabled|0=Disabled',0,1,'users',964),('cdn_domain','CDN Domain','CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.','text','','','',0,1,'integration',1000),('ckeditor_config','CKEditor Config','You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>','textarea','','{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(\'textarea.blog.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'pyroimages\'],\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	extraPlugins: \'pyroimages\',\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(\'textarea.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(\'textarea.wysiwyg-advanced\').ckeditor({\r\n	toolbar: [\r\n		[\'Maximize\'],\r\n		[\'pyroimages\', \'pyrofiles\'],\r\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\r\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\r\n		[\'Link\',\'Unlink\'],\r\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\r\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\r\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\r\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	],\r\n	extraPlugins: \'pyroimages,pyrofiles\',\r\n	width: \'99%\',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	removePlugins: \'elementspath\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});','',1,1,'wysiwyg',993),('comment_markdown','Allow Markdown','Do you want to allow visitors to post comments using Markdown?','select','0','0','0=Text Only|1=Allow Markdown',1,1,'comments',965),('comment_order','Comment Order','Sort order in which to display comments.','select','ASC','ASC','ASC=Oldest First|DESC=Newest First',1,1,'comments',966),('contact_email','Contact E-mail','All e-mails from users, guests and the site will go to this e-mail address.','text','lehung@ymail.com','','',1,1,'email',979),('currency','Currency','The currency symbol for use on products, services, etc.','text','&pound;','','',1,1,'',994),('dashboard_rss','Dashboard RSS Feed','Link to an RSS feed that will be displayed on the dashboard.','text','https://www.pyrocms.com/blog/rss/all.rss','','',0,1,'',990),('dashboard_rss_count','Dashboard RSS Items','How many RSS items would you like to display on the dashboard?','text','5','5','',1,1,'',989),('date_format','Date Format','How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.','text','Y-m-d','','',1,1,'',995),('default_theme','Default Theme','Select the theme you want users to see by default.','','default','reckontor','func:get_themes',1,0,'',0),('enable_comments','Enable Comments','Enable comments.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',968),('enable_profiles','Enable profiles','Allow users to add and edit profiles.','radio','1','','1=Enabled|0=Disabled',1,1,'users',963),('enable_registration','Enable user registration','Allow users to register in your site.','radio','1','','1=Enabled|0=Disabled',0,1,'users',961),('files_cache','Files Cache','When outputting an image via site.com/files what shall we set the cache expiration for?','select','480','480','0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days',1,1,'files',986),('files_cf_api_key','Rackspace Cloud Files API Key','You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.','text','','','',0,1,'files',989),('files_cf_username','Rackspace Cloud Files Username','To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>','text','','','',0,1,'files',990),('files_enabled_providers','Enabled File Storage Providers','Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below','checkbox','0','0','amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files',0,1,'files',994),('files_s3_access_key','Amazon S3 Access Key','To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>','text','','','',0,1,'files',993),('files_s3_geographic_location','Amazon S3 Geographic Location','Either US or EU. If you change this you must also change the S3 URL.','radio','US','US','US=United States|EU=Europe',1,1,'files',991),('files_s3_secret_key','Amazon S3 Secret Key','You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.','text','','','',0,1,'files',992),('files_s3_url','Amazon S3 URL','Change this if using one of Amazon\'s EU locations or a custom domain.','text','http://{{ bucket }}.s3.amazonaws.com/','http://{{ bucket }}.s3.amazonaws.com/','',0,1,'files',991),('files_upload_limit','Filesize Limit','Maximum filesize to allow when uploading. Specify the size in MB. Example: 5','text','5','5','',1,1,'files',987),('frontend_enabled','Site Status','Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.','radio','1','','1=Open|0=Closed',1,1,'',988),('ga_email','Google Analytic E-mail','E-mail address used for Google Analytics, we need this to show the graph on the dashboard.','text','','','',0,1,'integration',983),('ga_password','Google Analytic Password','This is also needed this to show the graph on the dashboard.','password','','','',0,1,'integration',982),('ga_profile','Google Analytic Profile ID','Profile ID for this website in Google Analytics','text','','','',0,1,'integration',984),('ga_tracking','Google Tracking Code','Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6','text','','','',0,1,'integration',985),('mail_protocol','Mail Protocol','Select desired email protocol.','select','mail','smtp','mail=Mail|sendmail=Sendmail|smtp=SMTP',1,1,'email',977),('mail_sendmail_path','Sendmail Path','Path to server sendmail binary.','text','','','',0,1,'email',972),('mail_smtp_host','SMTP Host Name','The host name of your smtp server.','text','','smtp.gmail.com','',0,1,'email',976),('mail_smtp_pass','SMTP password','SMTP password.','password','','mailchothao','',0,1,'email',975),('mail_smtp_port','SMTP Port','SMTP port number.','text','','465','',0,1,'email',974),('mail_smtp_user','SMTP User Name','SMTP user name.','text','','hunglevn@gmail.com','',0,1,'email',973),('meta_topic','Meta Topic','Two or three words describing this type of company/website.','text','Content Management','Add your slogan here','',0,1,'',998),('moderate_comments','Moderate Comments','Force comments to be approved before they appear on the site.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',967),('records_per_page','Records Per Page','How many records should we show per page in the admin section?','select','25','','10=10|25=25|50=50|100=100',1,1,'',992),('registered_email','User Registered Email','Send a notification email to the contact e-mail when someone registers.','radio','1','0','1=Enabled|0=Disabled',0,1,'users',962),('require_lastname','Require last names?','For some situations, a last name may not be required. Do you want to force users to enter one or not?','radio','1','','1=Required|0=Optional',1,1,'users',962),('rss_feed_items','Feed item count','How many items should we show in RSS/blog feeds?','select','25','','10=10|25=25|50=50|100=100',1,1,'',991),('server_email','Server E-mail','All e-mails to users will come from this e-mail address.','text','admin@localhost','','',1,1,'email',978),('site_lang','Site Language','The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.','select','en','en','func:get_supported_lang',1,1,'',997),('site_name','Site Name','The name of the website for page titles and for use around the site.','text','Un-named Website','','',1,1,'',1000),('site_public_lang','Public Languages','Which are the languages really supported and offered on the front-end of your website?','checkbox','en','en','func:get_supported_lang',1,1,'',996),('site_slogan','Site Slogan','The slogan of the website for page titles and for use around the site','text','','Add your slogan here','',0,1,'',999),('twitter_cache','Cache time','How many minutes should your Tweets be stored?','text','300','','',0,1,'twitter',969),('twitter_feed_count','Feed Count','How many tweets should be returned to the Twitter feed block?','text','5','','',0,1,'twitter',970),('twitter_username','Username','Twitter username.','text','','','',0,1,'twitter',971),('unavailable_message','Unavailable Message','When the site is turned off or there is a major problem, this message will show to users.','textarea','Sorry, this website is currently unavailable.','','',0,1,'',987);
/*!40000 ALTER TABLE `default_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_theme_options`
--

DROP TABLE IF EXISTS `default_theme_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_theme_options`
--

LOCK TABLES `default_theme_options` WRITE;
/*!40000 ALTER TABLE `default_theme_options` DISABLE KEYS */;
INSERT INTO `default_theme_options` VALUES (1,'pyrocms_recent_comments','Recent Comments','Would you like to display recent comments on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(2,'pyrocms_news_feed','News Feed','Would you like to display the news feed on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(3,'pyrocms_quick_links','Quick Links','Would you like to display quick links on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(4,'pyrocms_analytics_graph','Analytics Graph','Would you like to display the graph on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(5,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'default'),(6,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'default'),(7,'cufon_enabled','Use Cufon','Would you like to use Cufon for titles?','radio','yes','yes','yes=Yes|no=No',1,'default'),(8,'background','Background','Choose the default background for the theme.','select','fabric','fabric','black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture',1,'base'),(9,'slider','Slider','Would you like to display the slider on the homepage?','radio','yes','yes','yes=Yes|no=No',1,'base'),(10,'color','Default Theme Color','This changes things like background color, link colors etc…','select','pink','pink','red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink',1,'base'),(11,'show_breadcrumbs','Do you want to show breadcrumbs?','If selected it shows a string of breadcrumbs at the top of the page.','radio','yes','yes','yes=Yes|no=No',1,'base');
/*!40000 ALTER TABLE `default_theme_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_users`
--

DROP TABLE IF EXISTS `default_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_users`
--

LOCK TABLES `default_users` WRITE;
/*!40000 ALTER TABLE `default_users` DISABLE KEYS */;
INSERT INTO `default_users` VALUES (9,'admin@ongoasia.com','e26262cb46e116db9b18d8c53a6f94f39a2f4858','925ad3',1,'127.0.0.1',1,'',1365025131,1365026402,'admin.user',NULL,NULL),(10,'kevinle@ongoasia.com','120111324ec0551c3cd0399137d18e62ff7f3782','af5edb',2,'127.0.0.1',1,'8c315d3f527d8092cd326f376f1346d3fdaee669',1365025398,1365025398,'kevin.le',NULL,NULL),(12,'fani@ongoasia.com','bc25b3b1502635b5479b464136d52f279fdbaac5','ee8604',2,'127.0.0.1',1,'',1365026225,1365026225,'fani.nini',NULL,NULL),(13,'raymond@ongoasia.com','68fda1a1c315c869ed59cf3d6fc73103936dabd3','b76ba0',2,'127.0.0.1',1,NULL,1365026607,1365026607,'raymond.futuray',NULL,NULL),(14,'hung@ongoasia.com','016ae6c008765c9d21df11d9a0be032e5a69e609','202348',2,'127.0.0.1',1,NULL,1365026720,1365027981,'hung.le',NULL,NULL);
/*!40000 ALTER TABLE `default_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_variables`
--

DROP TABLE IF EXISTS `default_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_variables`
--

LOCK TABLES `default_variables` WRITE;
/*!40000 ALTER TABLE `default_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_areas`
--

DROP TABLE IF EXISTS `default_widget_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widget_areas`
--

LOCK TABLES `default_widget_areas` WRITE;
/*!40000 ALTER TABLE `default_widget_areas` DISABLE KEYS */;
INSERT INTO `default_widget_areas` VALUES (1,'sidebar','Sidebar');
/*!40000 ALTER TABLE `default_widget_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_instances`
--

DROP TABLE IF EXISTS `default_widget_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widget_instances`
--

LOCK TABLES `default_widget_instances` WRITE;
/*!40000 ALTER TABLE `default_widget_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_widget_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widgets`
--

DROP TABLE IF EXISTS `default_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widgets`
--

LOCK TABLES `default_widgets` WRITE;
/*!40000 ALTER TABLE `default_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_attraction`
--

DROP TABLE IF EXISTS `r_attraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_attraction` (
  `attraction_id` int(11) NOT NULL AUTO_INCREMENT,
  `attraction_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `attraction_desc` varchar(2000) DEFAULT NULL,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`attraction_id`),
  KEY `FK_r_attraction_city` (`city_id`),
  CONSTRAINT `FK_r_attraction_city` FOREIGN KEY (`city_id`) REFERENCES `r_city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_attraction`
--

LOCK TABLES `r_attraction` WRITE;
/*!40000 ALTER TABLE `r_attraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_attraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_booking`
--

DROP TABLE IF EXISTS `r_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_status` enum('PENDING','PAID') NOT NULL,
  `phone_area_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(512) NOT NULL,
  `book_by_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FK_r_booking_user` (`book_by_id`),
  CONSTRAINT `FK_r_booking_user` FOREIGN KEY (`book_by_id`) REFERENCES `default_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_booking`
--

LOCK TABLES `r_booking` WRITE;
/*!40000 ALTER TABLE `r_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_booking_tour`
--

DROP TABLE IF EXISTS `r_booking_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_booking_tour` (
  `booking_tour_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `travel_date` datetime NOT NULL,
  PRIMARY KEY (`booking_tour_id`),
  KEY `FK_r_booking_tour_tour` (`tour_id`),
  KEY `FK_r_booking_tour_booking` (`booking_id`),
  CONSTRAINT `FK_r_booking_tour_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `r_booking` (`booking_id`),
  CONSTRAINT `FK_r_booking_tour_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_booking_tour`
--

LOCK TABLES `r_booking_tour` WRITE;
/*!40000 ALTER TABLE `r_booking_tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_booking_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_card_type`
--

DROP TABLE IF EXISTS `r_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_card_type` (
  `card_type_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `card_type_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`card_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_card_type`
--

LOCK TABLES `r_card_type` WRITE;
/*!40000 ALTER TABLE `r_card_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_card_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_city`
--

DROP TABLE IF EXISTS `r_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_city` (
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_city` tinyint(4) NOT NULL DEFAULT '1',
  `highlight_level` enum('HOT CITY','RECOMEND CITY') DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `FK_r_city_country` (`country_id`),
  CONSTRAINT `FK_r_city_country` FOREIGN KEY (`country_id`) REFERENCES `r_country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_city`
--

LOCK TABLES `r_city` WRITE;
/*!40000 ALTER TABLE `r_city` DISABLE KEYS */;
INSERT INTO `r_city` VALUES ('1','Buenos Aires','2',1,''),('10','Brisbane','4',1,''),('100','London','28',1,''),('101','Manchester','28',1,''),('102','Lake District ','28',0,''),('103','The North of England ','28',0,''),('104','Tallinn','29',1,''),('105','Helsinki','31',1,''),('106','Avignon','32',1,''),('107','Bayeux','32',1,''),('108','Bordeaux','32',1,''),('109','Cannes','32',1,''),('11','Broome','4',1,''),('110','Lille','32',1,''),('111','Lyon','32',1,''),('112','Marseille','32',1,''),('113','Nice','32',1,''),('114','Paris','32',1,''),('115','Versailles','32',1,''),('116','Aquitaine ','32',0,''),('117','Burgundy & Dijon ','32',0,''),('118','Champagne ','32',0,''),('119','French Riviera ','32',0,''),('12','Cairns & the Tropical North','4',1,''),('120','Normandy ','32',0,''),('121','Provence ','32',0,''),('122','Berlin','33',1,''),('123','Cologne','33',1,''),('124','Frankfurt','33',1,''),('125','Hamburg','33',1,''),('126','Munich','33',1,''),('127','Rhine River ','33',0,''),('128','Athens','34',1,''),('129','Mykonos','34',1,''),('13','Canberra','4',1,''),('130','Santorini','34',1,''),('131','Cyclades Islands ','34',0,''),('132','Antigua','36',1,''),('133','Guatemala City','36',1,''),('134','Budapest','38',1,''),('135','Reykjavik','39',1,''),('136','Chennai','40',1,''),('137','Goa','40',1,''),('138','Jaipur','40',1,''),('139','Kochi','40',1,''),('14','Darwin','4',1,''),('140','Kolkata','40',1,''),('141','Mumbai','40',1,''),('142','New Delhi','40',1,''),('143','Udaipur','40',1,''),('144','Kerala ','40',0,''),('145','Rajasthan ','40',0,''),('146','Tamil Nadu ','40',0,''),('147','West Bengal ','40',0,''),('148','Bali ','41',0,''),('149','Belfast','42',1,''),('15','Gold Coast','4',1,''),('150','Dublin','42',1,''),('151','Galway','42',1,''),('152','Killarney','42',1,''),('153','Jerusalem','43',1,''),('154','Tel Aviv','43',1,''),('155','Bologna','44',1,''),('156','Florence','44',1,''),('157','Milan','44',1,''),('158','Naples','44',1,''),('159','Pisa','44',1,''),('16','Hobart','4',1,''),('160','Rome','44',1,''),('161','Siena','44',1,''),('162','Sorrento','44',1,''),('163','Turin','44',1,''),('164','Venice','44',1,''),('165','Verona','44',1,''),('166','Amalfi Coast ','44',0,''),('167','Piedmont & Liguria ','44',0,''),('168','Sicily ','44',0,''),('169','Tuscany ','44',0,''),('17','Launceston','4',1,''),('170','Montego Bay','45',1,''),('171','Negril','45',1,''),('172','Ocho Rios','45',1,''),('173','Kyoto','46',1,''),('174','Osaka','46',1,''),('175','Tokyo','46',1,''),('176','Amman ','47',1,''),('177','Beirut','48',1,''),('178','Kota Kinabalu','50',1,''),('179','Kuala Lumpur','50',1,''),('18','Melbourne','4',1,''),('180','Kuching','50',1,''),('181','Langkawi','50',1,''),('182','Penang','50',1,''),('183','Sabah ','50',0,''),('184','Sarawak ','50',0,''),('185','Acapulco','51',1,''),('186','Cancun','51',1,''),('187','Cozumel','51',1,''),('188','Los Cabos','51',1,''),('189','Mexico City','51',1,''),('19','Noosa & Sunshine Coast','4',1,''),('190','Puerto Vallarta','51',1,''),('191','Baja California Peninsula ','51',0,''),('192','Central Pacific Coast ','51',0,''),('193','Riviera Maya & the Yucatan ','51',0,''),('194','Monaco','52',1,''),('195','Marrakech ','53',0,''),('196','Kathmandu','54',1,''),('197','Amsterdam','55',1,''),('198','Auckland','56',1,''),('199','Bay of Islands','56',1,''),('2','El Calafate','2',1,''),('20','Palm Cove','4',1,''),('200','Christchurch','56',1,''),('201','Dunedin & The Otago Peninsula','56',1,''),('202','Fiordland & Milford Sound','56',1,''),('203','Franz Josef & Fox Glacier','56',1,''),('204','Mount Cook','56',1,''),('205','Picton','56',1,''),('206','Queenstown','56',1,''),('207','Rotorua','56',1,''),('208','Wellington','56',1,''),('209','North Island ','56',0,''),('21','Perth','4',1,''),('210','South Island ','56',0,''),('211','Managua','57',1,''),('212','Oslo','58',1,''),('213','Panama City','60',1,''),('214','Arequipa','61',1,''),('215','Cusco','61',1,''),('216','Iquitos','61',1,''),('217','Lima','61',1,''),('218','Puno','61',1,''),('219','Cebu','62',1,''),('22','Port Douglas','4',1,''),('220','Manila','62',1,''),('221','Visayas ','62',0,''),('222','Krakow','63',1,''),('223','Warsaw','63',1,''),('224','Lisbon','64',1,''),('225','Islands of Portugal ','64',0,''),('226','Porto & Northern Portugal ','64',0,''),('227','The Algarve ','64',0,''),('228','San Juan ','65',0,''),('229','Moscow','66',1,''),('23','Sydney','4',1,''),('230','St Petersburg','66',1,''),('231','Edinburgh','67',1,''),('232','Glasgow','67',1,''),('233','Inverness','67',1,''),('234','The Scottish Highlands ','67',1,''),('235','Cape Town','70',1,''),('236','Durban','70',1,''),('237','Johannesburg','70',1,''),('238','Seoul','71',1,''),('239','Barcelona','72',1,''),('24','The Whitsundays & Hamilton Island','4',1,''),('240','Costa del Sol','72',1,''),('241','Granada','72',1,''),('242','Gran Canaria','72',1,''),('243','Ibiza','72',1,''),('244','Madrid','72',1,''),('245','Malaga ','72',1,''),('246','Mallorca','72',1,''),('247','Santiago de Compostela','72',1,''),('248','Seville','72',1,''),('249','Valencia','72',1,''),('25','New South Wales ','4',0,''),('250','Andalucia & Costa del Sol ','72',0,''),('251','Balearic Islands ','72',0,''),('252','Basque Country ','72',0,''),('253','Canary Islands ','72',0,''),('254','Costa Brava ','72',0,''),('255','St Kitts ','73',0,''),('256','Stockholm','76',1,''),('257','Geneva','77',1,''),('258','Lucerne','77',1,''),('259','Zurich','77',1,''),('26','Northern Territory ','4',0,''),('260','Bangkok','80',1,''),('261','Chiang Mai & Chiang Rai','80',1,''),('262','Koh Samui','80',1,''),('263','Krabi','80',1,''),('264','Pattaya','80',1,''),('265','Phuket','80',1,''),('266','Ankara','82',1,''),('267','Antalya','82',1,''),('268','Cappadocia','82',1,''),('269','Istanbul','82',1,''),('27','Queensland ','4',0,''),('270','Izmir','82',1,''),('271','Kusadasi','82',1,''),('272','Dubai','83',1,''),('273','Montevideo','84',1,''),('274','Punta del Este','84',1,''),('275','Anaheim & Buena Park','85',1,''),('276','Anchorage','85',1,''),('277','Atlanta','85',1,''),('278','Austin','85',1,''),('279','Big Island of Hawaii','85',1,''),('28','South Australia ','4',0,''),('280','Boston','85',1,''),('281','Charleston','85',1,''),('282','Chicago','85',1,''),('283','Dallas','85',1,''),('284','Denver','85',1,''),('285','Fort Lauderdale','85',1,''),('286','Grand Canyon National Park','85',1,''),('287','Juneau','85',1,''),('288','Kauai','85',1,''),('289','Ketchikan','85',1,''),('29','Tasmania ','4',0,''),('290','Key West','85',1,''),('291','Lake Tahoe','85',1,''),('292','Las Vegas','85',1,''),('293','Los Angeles','85',1,''),('294','Maui','85',1,''),('295','Memphis','85',1,''),('296','Miami','85',1,''),('297','Napa & Sonoma','85',1,''),('298','Nashville','85',1,''),('299','New Orleans','85',1,''),('3','Mendoza','2',1,''),('30','Victoria ','4',0,''),('300','New York City','85',1,''),('301','Oahu','85',1,''),('302','Orlando','85',1,''),('303','Palm Springs','85',1,''),('304','Philadelphia','85',1,''),('305','Phoenix','85',1,''),('306','Portland','85',1,''),('307','San Antonio','85',1,''),('308','San Diego','85',1,''),('309','San Francisco','85',1,''),('31','Western Australia ','4',0,''),('310','Seattle','85',1,''),('311','Sedona & Flagstaff','85',1,''),('312','Sitka','85',1,''),('313','Skagway','85',1,''),('314','St Augustine','85',1,''),('315','Tampa','85',1,''),('316','Washington DC','85',1,''),('317','Alaska ','85',0,''),('318','Arizona ','85',0,''),('319','California ','85',0,''),('32','Salzburg','5',1,''),('320','Colorado ','85',0,''),('321','Florida ','85',0,''),('322','Georgia ','85',0,''),('323','Hawaii ','85',0,''),('324','Maryland ','85',0,''),('325','Oregon ','85',0,''),('326','Pennsylvania ','85',0,''),('327','South Carolina ','85',0,''),('328','Tennessee ','85',0,''),('329','Texas ','85',0,''),('33','Vienna','5',1,''),('330','Washington ','85',0,''),('331','St Thomas ','86',0,''),('332','Hanoi','87',1,''),('333','Ho Chi Minh City','87',1,''),('34','Freeport','6',1,''),('35','Nassau','6',1,''),('36','Bruges','8',1,''),('37','Brussels','8',1,''),('38','Ambergris Caye','9',1,''),('39','Belize City','9',1,''),('4','Puerto Iguazu','2',1,''),('40','The Cayes ','9',0,''),('41','Fortaleza','11',1,''),('42','Foz do Iguacu','11',1,''),('43','Manaus','11',1,''),('44','Natal','11',1,''),('45','Rio de Janeiro','11',1,''),('46','Salvador da Bahia','11',1,''),('47','Angkor Wat','13',1,''),('48','Banff','14',1,''),('49','Calgary','14',1,''),('5','Ushuaia','2',1,''),('50','Montreal','14',1,''),('51','Niagara Falls & Around','14',1,''),('52','Ottawa','14',1,''),('53','Quebec City','14',1,''),('54','Toronto','14',1,''),('55','Vancouver','14',1,''),('56','Victoria','14',1,''),('57','Whistler','14',1,''),('58','Alberta ','14',0,''),('59','British Columbia ','14',0,''),('6','Patagonia','2',0,''),('60','Ontario ','14',0,''),('61','Quebec ','14',0,''),('62','Santiago','16',1,''),('63','North Chile ','16',0,''),('64','Patagonia ','16',0,''),('65','Beijing','17',1,''),('66','Chengdu','17',1,''),('67','Guilin','17',1,''),('68','Hangzhou','17',1,''),('69','Macau','17',1,''),('7','Adelaide','4',1,''),('70','Shanghai','17',1,''),('71','Xian','17',1,''),('72','Yangshuo','17',1,''),('73','Eastern China ','17',0,''),('74','Northern China ','17',0,''),('75','Northwest China ','17',0,''),('76','Southern China ','17',0,''),('77','Southwest China ','17',0,''),('78','Yangtze River ','17',0,''),('79','Bogotá','18',1,''),('8','Alice Springs','4',1,''),('80','Cartagena','18',1,''),('81','Medellín','18',1,''),('82','Arenal Volcano National Park','19',1,''),('83','Jaco','19',1,''),('84','San Jose','19',1,''),('85','Guanacaste and Northwest ','19',0,''),('86','Pacific Coast ','19',0,''),('87','Dubrovnik','20',1,''),('88','Prague','22',1,''),('89','Copenhagen','23',1,''),('9','Ayers Rock','4',1,''),('90','Puerto Plata','25',1,''),('91','Punta Cana','25',1,''),('92','Quito','26',1,''),('93','Galapagos Islands ','26',0,''),('94','Aswan','27',1,''),('95','Cairo','27',1,''),('96','Hurghada','27',1,''),('97','Luxor','27',1,''),('98','Sharm el Sheikh','27',1,''),('99','Liverpool','28',1,'');
/*!40000 ALTER TABLE `r_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_country`
--

DROP TABLE IF EXISTS `r_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_country` (
  `country_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `photo_path` varchar(1024) DEFAULT '1',
  PRIMARY KEY (`country_id`),
  KEY `FK_r_country_photo` (`photo_path`(767))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_country`
--

LOCK TABLES `r_country` WRITE;
/*!40000 ALTER TABLE `r_country` DISABLE KEYS */;
INSERT INTO `r_country` VALUES ('1','Antigua and Barbuda',0,'1'),('10','Bermuda',0,'1'),('11','Brazil',0,'1'),('12','British Virgin Islands',0,'1'),('13','Cambodia',0,'1'),('14','Canada',0,'1'),('15','Cayman Islands',0,'1'),('16','Chile',0,'1'),('17','China',0,'1'),('18','Colombia',0,'1'),('19','Costa Rica',0,'1'),('2','Argentina',0,'1'),('20','Croatia',0,'1'),('21','Curacao',0,'1'),('22','Czech Republic',0,'1'),('23','Denmark',0,'1'),('24','Dominica',0,'1'),('25','Dominican Republic',0,'1'),('26','Ecuador',0,'1'),('27','Egypt',0,'1'),('28','England',3,'1'),('29','Estonia',0,'1'),('3','Aruba',0,'1'),('30','Fiji',0,'1'),('31','Finland',0,'1'),('32','France',6,'1'),('33','Germany',0,'1'),('34','Greece',0,'1'),('35','Grenada',0,'1'),('36','Guatemala',0,'1'),('37','Hong Kong',0,'1'),('38','Hungary',0,'1'),('39','Iceland',0,'1'),('4','Australia',8,'1'),('40','India',0,'1'),('41','Indonesia',0,'1'),('42','Ireland',0,'1'),('43','Israel',0,'1'),('44','Italy',5,'1'),('45','Jamaica',0,'1'),('46','Japan',0,'1'),('47','Jordan',0,'1'),('48','Lebanon',0,'1'),('49','Lithuania',0,'1'),('5','Austria',0,'1'),('50','Malaysia',0,'1'),('51','Mexico',0,'1'),('52','Monaco',0,'1'),('53','Morocco',0,'1'),('54','Nepal',0,'1'),('55','Netherlands',2,'1'),('56','New Zealand',7,'1'),('57','Nicaragua',0,'1'),('58','Norway',0,'1'),('59','Oman',0,'1'),('6','Bahamas',0,'1'),('60','Panama',0,'1'),('61','Peru',0,'1'),('62','Philippines',0,'1'),('63','Poland',0,'1'),('64','Portugal',0,'1'),('65','Puerto Rico',0,'1'),('66','Russia',0,'1'),('67','Scotland',0,'1'),('68','Singapore',0,'1'),('69','Slovenia',0,'1'),('7','Barbados',0,'1'),('70','South Africa',0,'1'),('71','South Korea',0,'1'),('72','Spain',4,'1'),('73','St Kitts and Nevis',0,'1'),('74','St Lucia',0,'1'),('75','St Maarten',0,'1'),('76','Sweden',0,'1'),('77','Switzerland',0,'1'),('78','Tahiti',0,'1'),('79','Taiwan',0,'1'),('8','Belgium',0,'1'),('80','Thailand',0,'1'),('81','Trinidad and Tobago',0,'1'),('82','Turkey',0,'1'),('83','United Arab Emirates',0,'1'),('84','Uruguay',0,'1'),('85','USA',9,'1'),('86','US Virgin Islands',0,'1'),('87','Vietnam',0,'1'),('9','Belize',0,'1');
/*!40000 ALTER TABLE `r_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_payment`
--

DROP TABLE IF EXISTS `r_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `payment_status_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FK_r_payment_booking` (`booking_id`),
  KEY `FK_r_payment_payment_status` (`payment_status_id`),
  CONSTRAINT `FK_r_payment_booking` FOREIGN KEY (`booking_id`) REFERENCES `r_booking` (`booking_id`),
  CONSTRAINT `FK_r_payment_payment_status` FOREIGN KEY (`payment_status_id`) REFERENCES `r_payment_status` (`payment_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_payment`
--

LOCK TABLES `r_payment` WRITE;
/*!40000 ALTER TABLE `r_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_payment_detail`
--

DROP TABLE IF EXISTS `r_payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_payment_detail` (
  `payment_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) NOT NULL,
  `total_cost` float NOT NULL,
  `card_type_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address` varchar(2056) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `security_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry_month` int(11) DEFAULT NULL,
  `expiry_year` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_detail_id`),
  KEY `FK_r_payment_detail_payment` (`payment_id`),
  KEY `FK_r_payment_detail_city` (`city_id`),
  KEY `FK_r_payment_detail_country` (`country_id`),
  KEY `FK_r_payment_detail_card_type` (`card_type_id`),
  KEY `FK_r_payment_detail_state` (`state_id`),
  CONSTRAINT `FK_r_payment_detail_card_type` FOREIGN KEY (`card_type_id`) REFERENCES `r_card_type` (`card_type_id`),
  CONSTRAINT `FK_r_payment_detail_city` FOREIGN KEY (`city_id`) REFERENCES `r_city` (`city_id`),
  CONSTRAINT `FK_r_payment_detail_country` FOREIGN KEY (`country_id`) REFERENCES `r_country` (`country_id`),
  CONSTRAINT `FK_r_payment_detail_payment` FOREIGN KEY (`payment_id`) REFERENCES `r_payment` (`payment_id`),
  CONSTRAINT `FK_r_payment_detail_state` FOREIGN KEY (`state_id`) REFERENCES `r_state` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_payment_detail`
--

LOCK TABLES `r_payment_detail` WRITE;
/*!40000 ALTER TABLE `r_payment_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_payment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_payment_status`
--

DROP TABLE IF EXISTS `r_payment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_payment_status` (
  `payment_status_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_payment_status`
--

LOCK TABLES `r_payment_status` WRITE;
/*!40000 ALTER TABLE `r_payment_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_payment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_state`
--

DROP TABLE IF EXISTS `r_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_state` (
  `state_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `FK_r_state` (`country_id`),
  CONSTRAINT `FK_r_state` FOREIGN KEY (`country_id`) REFERENCES `r_country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_state`
--

LOCK TABLES `r_state` WRITE;
/*!40000 ALTER TABLE `r_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour`
--

DROP TABLE IF EXISTS `r_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour` (
  `tour_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tour_status_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `common_adult_price` float NOT NULL,
  `common_child_price` float NOT NULL,
  `available_from_date` datetime NOT NULL,
  `available_to_date` datetime NOT NULL,
  `duration_hours` int(11) NOT NULL,
  PRIMARY KEY (`tour_id`),
  KEY `FK_r_tour_city` (`city_id`),
  KEY `FK_r_tour` (`tour_status_id`),
  CONSTRAINT `FK_r_tour` FOREIGN KEY (`tour_status_id`) REFERENCES `r_tour_status` (`tour_status_id`),
  CONSTRAINT `FK_r_tour_city` FOREIGN KEY (`city_id`) REFERENCES `r_city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour`
--

LOCK TABLES `r_tour` WRITE;
/*!40000 ALTER TABLE `r_tour` DISABLE KEYS */;
INSERT INTO `r_tour` VALUES (1,'260','A',100,50,'2013-05-02 00:00:00','2013-05-05 00:00:00',3),(2,'260','A',299.99,20,'2013-03-20 03:24:36','2013-06-21 03:24:40',8),(3,'260','A',199.99,30,'2013-03-22 03:30:36','2013-05-18 03:31:38',6),(4,'260','A',190,10,'2013-02-09 03:30:36','2013-07-13 03:24:40',4),(5,'264','A',90,50,'2013-02-12 03:30:36','2013-04-30 03:30:54',4),(6,'264','A',45,10,'2013-03-22 03:30:36','2013-04-30 03:30:54',4),(7,'265','A',39,3,'2013-03-29 03:31:33','2013-04-18 03:31:38',6),(8,'179','A',100,50,'2013-04-02 00:00:00','2013-06-06 00:00:00',4),(9,'179','A',299.99,20,'2013-03-20 03:24:36','2013-06-03 03:24:40',8),(10,'181','A',199.99,30,'2013-04-20 03:30:36','2013-07-03 03:24:40',6),(11,'181','A',190,10,'2013-02-12 03:30:36','2013-06-09 03:24:40',4),(12,'182','A',90,50,'2013-02-09 03:30:36','2013-05-13 03:24:40',8),(13,'182','A',45,10,'2013-03-07 03:30:36','2013-04-30 03:30:54',12),(14,'182','A',39,3,'2013-01-09 03:31:33','2013-04-18 03:31:38',24);
/*!40000 ALTER TABLE `r_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour_available_date`
--

DROP TABLE IF EXISTS `r_tour_available_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_available_date` (
  `tour_available_date_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `code` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `available_from_date` datetime NOT NULL,
  `available_to_date` datetime NOT NULL,
  `adult_price` float NOT NULL,
  `child_price` float NOT NULL,
  PRIMARY KEY (`tour_available_date_id`),
  KEY `FK_r_tour_price_tour` (`tour_id`),
  CONSTRAINT `FK_r_tour_price_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_available_date`
--

LOCK TABLES `r_tour_available_date` WRITE;
/*!40000 ALTER TABLE `r_tour_available_date` DISABLE KEYS */;
INSERT INTO `r_tour_available_date` VALUES (1,1,'1','2013-03-24 09:28:40','2013-03-30 09:28:51',10,3),(2,1,'2','2013-04-05 09:29:14','2013-04-23 09:29:27',9,2),(3,2,'3','2013-03-26 09:30:15','2013-03-30 09:30:19',8,2),(4,2,'4','2013-04-03 09:30:37','2013-04-24 09:30:56',20,4),(5,3,'5','2013-05-02 09:31:28','2013-05-24 09:31:36',60,10),(6,4,'6','2013-03-24 09:32:07','2013-03-31 09:32:13',30,5),(7,4,'7','2013-04-02 09:32:28','2013-04-05 09:32:38',20,4),(8,4,'8','2013-04-08 09:32:57','2013-04-12 09:33:08',25,6),(9,5,'1','2013-03-24 09:28:40','2013-03-30 09:28:51',10,3),(10,6,'2','2013-04-05 09:29:14','2013-04-23 09:29:27',9,2),(11,7,'3','2013-03-26 09:30:15','2013-03-30 09:30:19',8,2),(12,7,'4','2013-04-03 09:30:37','2013-04-24 09:30:56',20,4),(13,8,'5','2013-05-02 09:31:28','2013-05-24 09:31:36',60,10),(14,9,'6','2013-03-24 09:32:07','2013-03-31 09:32:13',30,5),(15,9,'7','2013-04-02 09:32:28','2013-04-05 09:32:38',20,4),(16,10,'8','2013-04-08 09:32:57','2013-04-12 09:33:08',25,6),(17,11,'1','2013-03-24 09:28:40','2013-03-30 09:28:51',10,3),(18,11,'2','2013-04-05 09:29:14','2013-04-23 09:29:27',9,2),(19,12,'3','2013-03-26 09:30:15','2013-03-30 09:30:19',8,2),(20,13,'4','2013-04-03 09:30:37','2013-04-24 09:30:56',20,4),(21,13,'5','2013-05-02 09:31:28','2013-05-24 09:31:36',60,10),(22,14,'6','2013-03-24 09:32:07','2013-03-31 09:32:13',30,5),(23,9,'7','2013-04-02 09:32:28','2013-04-05 09:32:38',20,4),(24,10,'8','2013-04-08 09:32:57','2013-04-12 09:33:08',25,6),(25,1,'2','2013-06-01 22:52:11','2013-06-03 22:52:18',100,5),(26,1,'10','2013-06-10 10:09:26','2013-06-20 10:09:40',30,5);
/*!40000 ALTER TABLE `r_tour_available_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour_detail`
--

DROP TABLE IF EXISTS `r_tour_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_detail` (
  `tour_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `title` varchar(2056) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `introduction` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `highlight` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `scheduler` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `additional_info` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`tour_detail_id`),
  KEY `FK_r_tour_detail_tour` (`tour_id`),
  CONSTRAINT `FK_r_tour_detail_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_detail`
--

LOCK TABLES `r_tour_detail` WRITE;
/*!40000 ALTER TABLE `r_tour_detail` DISABLE KEYS */;
INSERT INTO `r_tour_detail` VALUES (1,1,'1DENALI','Grand Canyon All American Helicopter Tour','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>\r\n\r\n','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(2,2,'2DENALI','90-Minute Fjords National Monument Seaplane Tour','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','\r\n\r\n    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>\r\n\r\n','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(3,3,'3DENALI','Ketchikan Shore Excursion: 90-Minute Fjords National Monument Seaplane Tour','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','\r\n\r\n    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>\r\n\r\n','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(4,4,'4DENALI','Ketchikan Shore Excursion: Off-Road Jeep and Canoe Safari','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','\r\n\r\n    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>\r\n\r\n','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(5,5,'5DENALI','Ketchikan Shore Excursion: 30 Minute Seaplane Spectacular Tour','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>\r\n\r\n','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(6,6,'6DENALI','Ketchikan Shore Excursion: Lighthouses, Totems and Eagles Cruise','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(7,7,'7DENALI','Ketchikan Shore Excursion: Eagle Island Sea Kayaking','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(8,8,'8DENALI','Ketchikan Shore Excursion: Rainforest Canopy Ropes and Zipline Park','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(9,9,'9DENALI','30-Minute Seaplane Spectacular Tour','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(10,10,'10DENALI','Ketchikan Shore Excursion: Zodiac Boat Wilderness Adventure ','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(11,11,'11DENALI','Small-Group Zodiac Wilderness Adventure from Ketchikan ','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(12,12,'12DENALI','Ketchikan Rainforest Canoe and Nature Walk','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(13,13,'13DENALI','Ketchikan Super Saver: Off-Road Jeep and Canoe Safari Combo','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n'),(14,14,'14DENALI','Ketchikan Shore Excursion: Rainforest Canoe and Nature Walk in Tongass National Forest','Take off from Las Vegas Airport on an exhilarating helicopter flight to the Grand Canyon. You\'ll enjoy a 45-minute helicopter flight each way, land deep in the canyon for a champagne picnic, and fly low over the famous Las Vegas neon Strip on your return. The Grand Canyon All American Helicopter Tour is a half-day tour, leaving you with time in the day free to explore Las Vegas and Nevada at your leisure.','    <li>Grand Canyon All American helicopter tour</li>\r\n    <li>Scenic helicopter flight to the Grand Canyon West Rim from Las Vegas</li>\r\n    <li>Grand Canyon All American Helicopter Tour departs from McCarran Airport - not Boulder City!</li>\r\n    <li>Grand Canyon helicopter tours fly over Lake Mead, Hoover Dam, the Grand Canyon and Las Vegas</li>\r\n    <li>45-minute flight each way in a state-of-the-art six-passenger jet helicopter</li>\r\n    <li>30-minute champagne picnic below the rim</li>\r\n    <li>Choice of morning or afternoon flights</li>\r\n    <li>Recorded commentary by audio headphones on board</li>','This tour is likely to Sell-out! The Grand Canyon All American Helicopter Tour regularly sells out weeks in advance, so book ahead to avoid disappointment!\r\n\r\nYou\'ll discover the natural beauty of the Grand Canyon as your air-conditioned helicopter flies to the West Rim, passing over Lake Las Vegas, Lake Mead and the Hoover Dam en route. Hoover Dam is a spectacular sight from the air, curved between the rock canyon walls. During the flight, you can listen to a recorded commentary about the Grand Canyon and its surrounds via audio headphones.\r\n\r\nYou\'ll land for an unforgettable champagne picnic, 3,200 feet (960 meters) below the rim. While you share a bottle of champagne under an authentic Native American Ramada shelter, your pilot/guide will be happy to answer any questions you may have about the canyon or your helicopter flight.\r\n\r\nYour Grand Canyon helicopter scenic flight ends with a low-level pass over the west side of the famous Las Vegas Strip. On landing, your limousine is waiting to whisk you back to your hotel.\r\n\r\nThere is a maximum capacity of 6 people per helicopter plus your pilot.\r\n\r\nPlease note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in','    Early morning: 7:00am - 8:00am\r\n    Late morning: 9:45am - 10:45am\r\n    Early afternoon: 12:30pm - 1:30pm\r\n    Late afternoon: 3:15pm - 4:15pm (April to approximately August only)','\r\nInclusions\r\n\r\n    45-minute (approx.) flight each way in a state-of-the-art helicopter\r\n    Hotel pickup and drop off by limousine\r\n    Lunch\r\n    Glass of Champagne\r\n\r\nExclusions\r\n\r\n    Gratuities (optional)\r\n    Please note: the listed price does not include a US $45 per person processing fee, payable at the time of tour check-in\r\n\r\nAdditional info\r\n\r\n    Confirmation will be received at time of booking, unless booked within 30 days of travel. In this case confirmation will be received within 48 hours, subject to availability\r\n    Individual passenger weights, including infants, MUST be advised at time of booking\r\n    Collapsible wheelchairs with removable wheels may be accommodated provided the passenger is accompanied by someone who can assist them with boarding and disembarking the aircraft\r\n    Due to comfort and weight / balance of the aircraft, passengers weighing over 275lbs. will be required to purchase an additional seat. This is payable directly to the tour operator on the day of the tour.\r\n    Infant children are considered a lap child if they are under the age of two and have proof of age, such as a passport or a copy of their birth certificate\r\n    Veggie (no additional charge) and kosher lunch (additional $8 payable directly to the tour operator on the day of the tour) are available. Please note this request in the special requirement field at check out.\r\n    Please note: Seats are determined by passengers weights and front seats cannot be guaranteed at any time.\r\n\r\nVoucher info\r\nYou can present either a paper or an electronic voucher for this activity. What\'s this?\r\nLocal operator information\r\nComplete Operator information, including local telephone numbers at your destination, are included on your Confirmation Voucher. Our Product Managers select only the most experienced and reliable operators in each destination, removing the guesswork for you, and ensuring your peace of mind.\r\n');
/*!40000 ALTER TABLE `r_tour_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour_photo`
--

DROP TABLE IF EXISTS `r_tour_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_photo` (
  `tour_photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `photo_path` varchar(1024) DEFAULT NULL,
  `photo_comment` tinytext,
  `posted_by_id` int(11) DEFAULT NULL,
  `is_main` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tour_photo_id`),
  KEY `FK_r_tour_photo_tour` (`tour_id`),
  KEY `FK_r_tour_photo_photo` (`photo_path`(767)),
  CONSTRAINT `FK_r_tour_photo_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_photo`
--

LOCK TABLES `r_tour_photo` WRITE;
/*!40000 ALTER TABLE `r_tour_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_tour_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour_rating`
--

DROP TABLE IF EXISTS `r_tour_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_rating` (
  `tour_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `feedback` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `by_user_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`tour_rating_id`),
  KEY `FK_r_tour_rating_tour` (`tour_id`),
  KEY `FK_r_tour_rating_user` (`by_user_id`),
  CONSTRAINT `FK_r_tour_rating_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`),
  CONSTRAINT `FK_r_tour_rating_user` FOREIGN KEY (`by_user_id`) REFERENCES `default_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_rating`
--

LOCK TABLES `r_tour_rating` WRITE;
/*!40000 ALTER TABLE `r_tour_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_tour_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour_review`
--

DROP TABLE IF EXISTS `r_tour_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_review` (
  `tour_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) DEFAULT NULL,
  `review` varchar(2056) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `review_by_id` smallint(6) NOT NULL,
  PRIMARY KEY (`tour_review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_review`
--

LOCK TABLES `r_tour_review` WRITE;
/*!40000 ALTER TABLE `r_tour_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_tour_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour_status`
--

DROP TABLE IF EXISTS `r_tour_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_status` (
  `tour_status_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tour_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_status`
--

LOCK TABLES `r_tour_status` WRITE;
/*!40000 ALTER TABLE `r_tour_status` DISABLE KEYS */;
INSERT INTO `r_tour_status` VALUES ('A','Available','Tour is available for booking'),('C','Close','Tour is closed'),('S','Sold Out','Tour is sold out');
/*!40000 ALTER TABLE `r_tour_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_tour_video`
--

DROP TABLE IF EXISTS `r_tour_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_video` (
  `tour_video_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`tour_video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_video`
--

LOCK TABLES `r_tour_video` WRITE;
/*!40000 ALTER TABLE `r_tour_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_tour_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_traveler`
--

DROP TABLE IF EXISTS `r_traveler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_traveler` (
  `traveler_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_tour_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_children` int(11) DEFAULT '0',
  `is_leader` int(11) NOT NULL,
  PRIMARY KEY (`traveler_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_traveler`
--

LOCK TABLES `r_traveler` WRITE;
/*!40000 ALTER TABLE `r_traveler` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_traveler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_video`
--

DROP TABLE IF EXISTS `r_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `embed_code` varchar(2056) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_video`
--

LOCK TABLES `r_video` WRITE;
/*!40000 ALTER TABLE `r_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_wishlist`
--

DROP TABLE IF EXISTS `r_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  PRIMARY KEY (`wishlist_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_wishlist`
--

LOCK TABLES `r_wishlist` WRITE;
/*!40000 ALTER TABLE `r_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-05  4:36:58
