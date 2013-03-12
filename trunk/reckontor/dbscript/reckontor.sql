-- MySQL dump 10.13  Distrib 5.1.53, for Win64 (unknown)
--
-- Host: localhost    Database: reckontor
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
INSERT INTO `core_users` VALUES (1,'lehung@ymail.com','08a90ba49607708532b8b7498265814a8a658321','bdb3a',1,'',1,'',1353209396,1353209396,'administrator',NULL,NULL);
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
INSERT INTO `default_ci_sessions` VALUES ('95de00415ce3fbf216d76c6f6776991c','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:16.0) Gecko/20100101 Firefox/16.0',1353274784,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3a2ca92b5d15cb5c501c442b5ac5363b','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356419323,'a:6:{s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('4ef02c24bde2f9c50484022486384cef','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356527663,''),('f6c0aeecdc10022d77990b74e8066f8e','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356579134,'a:2:{s:9:\"user_data\";s:0:\"\";s:16:\"flash:old:notice\";s:59:\"Your registration is awaiting approval by an administrator.\";}'),('3a8c8fbee32c79c046595a4de7201a78','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0',1356772441,'a:7:{s:9:\"user_data\";s:0:\"\";s:8:\"username\";s:13:\"administrator\";s:5:\"email\";s:16:\"lehung@ymail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('810c111eaa474b1c08dcbd51da1f8330','0.0.0.0','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.97 Safari/537.22',1361663449,'');
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_modules`
--

LOCK TABLES `default_modules` WRITE;
/*!40000 ALTER TABLE `default_modules` DISABLE KEYS */;
INSERT INTO `default_modules` VALUES (1,'a:15:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"Ø§Ù„Ù…Ø¯ÙˆÙ‘Ù†Ø©\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Î™ÏƒÏ„Î¿Î»ÏŒÎ³Î¹Î¿\";s:2:\"he\";s:8:\"×‘×œ×•×’\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Ð‘Ð»Ð¾Ð³\";s:2:\"zh\";s:6:\"æ–‡ç« \";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"à¸šà¸¥à¹‡à¸­à¸�\";s:2:\"se\";s:5:\"Blogg\";}','blog','2.0',NULL,'a:23:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"Ø£Ù†Ø´Ø± Ø§Ù„Ù…Ù‚Ø§Ù„Ø§Øª Ø¹Ù„Ù‰ Ù…Ø¯ÙˆÙ‘Ù†ØªÙƒ.\";s:2:\"br\";s:30:\"Escrever publicaÃ§Ãµes de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicaÃ§Ãµes no blog\";s:2:\"cs\";s:49:\"Publikujte novÃ© Ä�lÃ¡nky a pÅ™Ã­spÄ›vky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlÃ¦g\";s:2:\"de\";s:47:\"VerÃ¶ffentliche neue Artikel und Blog-EintrÃ¤ge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Î”Î·Î¼Î¹Î¿Ï…Ï�Î³Î®ÏƒÏ„Îµ Î¬Ï�Î¸Ï�Î± ÎºÎ±Î¹ ÎµÎ³Î³Ï�Î±Ï†Î­Ï‚ ÏƒÏ„Î¿ Î¹ÏƒÏ„Î¿Î»ÏŒÎ³Î¹Î¿ ÏƒÎ±Ï‚.\";s:2:\"es\";s:54:\"Escribe entradas para los artÃ­culos y blog (web log).\";s:2:\"fr\";s:46:\"Envoyez de nouveaux posts et messages de blog.\";s:2:\"he\";s:19:\"× ×™×”×•×œ ×‘×œ×•×’\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"RaÅ¡ykite naujienas bei blog\'o Ä¯raÅ¡us.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð·Ð°Ð¿Ð¸Ñ�Ñ�Ð¼Ð¸ Ð±Ð»Ð¾Ð³Ð°.\";s:2:\"zh\";s:42:\"ç™¼è¡¨æ–°è�žè¨Šæ�¯ã€�éƒ¨è�½æ ¼ç­‰æ–‡ç« ã€‚\";s:2:\"th\";s:48:\"à¹‚à¸žà¸ªà¸•à¹Œà¸£à¸²à¸¢à¸�à¸²à¸£à¸šà¸¥à¹‡à¸­à¸�\";s:2:\"hu\";s:32:\"Blog bejegyzÃ©sek lÃ©trehozÃ¡sa.\";s:2:\"se\";s:18:\"InlÃ¤gg i bloggen.\";}',1,1,1,'content',1,1,1,1353274673),(2,'a:23:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"Ø§Ù„ØªØ¹Ù„ÙŠÙ‚Ø§Øª\";s:2:\"br\";s:12:\"ComentÃ¡rios\";s:2:\"pt\";s:12:\"ComentÃ¡rios\";s:2:\"cs\";s:11:\"KomentÃ¡Å™e\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Î£Ï‡ÏŒÎ»Î¹Î±\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"he\";s:12:\"×ª×’×•×‘×•×ª\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"ÐšÐ¾Ð¼Ð¼ÐµÐ½Ñ‚Ð°Ñ€Ð¸Ð¸\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"zh\";s:6:\"å›žæ‡‰\";s:2:\"hu\";s:16:\"HozzÃ¡szÃ³lÃ¡sok\";s:2:\"th\";s:33:\"à¸„à¸§à¸²à¸¡à¸„à¸´à¸”à¹€à¸«à¹‡à¸™\";s:2:\"se\";s:11:\"Kommentarer\";}','comments','1.0',NULL,'a:23:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"ÙŠØ³ØªØ·ÙŠØ¹ Ø§Ù„Ø£Ø¹Ø¶Ø§Ø¡ ÙˆØ§Ù„Ø²ÙˆÙ‘Ø§Ø± ÙƒØªØ§Ø¨Ø© Ø§Ù„ØªØ¹Ù„ÙŠÙ‚Ø§Øª Ø¹Ù„Ù‰ Ø§Ù„Ù…Ù�Ø­ØªÙˆÙ‰ ÙƒØ§Ù„Ø£Ø®Ø¨Ø§Ø±ØŒ ÙˆØ§Ù„ØµÙ�Ø­Ø§Øª ÙˆØ§Ù„ØµÙ‘ÙˆÙŽØ±.\";s:2:\"br\";s:97:\"UsuÃ¡rios e convidados podem escrever comentÃ¡rios para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentÃ¡rios para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"UÅ¾ivatelÃ© a hostÃ© mohou psÃ¡t komentÃ¡Å™e k obsahu, napÅ™. neovinkÃ¡m, strÃ¡nkÃ¡m a fotografiÃ­m.\";s:2:\"da\";s:83:\"Brugere og besÃ¸gende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und GÃ¤ste kÃ¶nnen fÃ¼r fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"ÎŸÎ¹ Ï‡Ï�Î®ÏƒÏ„ÎµÏ‚ ÎºÎ±Î¹ Î¿Î¹ ÎµÏ€Î¹ÏƒÎºÎ­Ï€Ï„ÎµÏ‚ Î¼Ï€Î¿Ï�Î¿Ï�Î½ Î½Î± Î±Ï†Î®Î½Î¿Ï…Î½ ÏƒÏ‡ÏŒÎ»Î¹Î± Î³Î¹Î± Ï€ÎµÏ�Î¹ÎµÏ‡ÏŒÎ¼ÎµÎ½Î¿ ÏŒÏ€Ï‰Ï‚ Ï„Î¿ Î¹ÏƒÏ„Î¿Î»ÏŒÎ³Î¹Î¿, Ï„Î¹Ï‚ ÏƒÎµÎ»Î¯Î´ÎµÏ‚ ÎºÎ±Î¹ Ï„Î¹Ï‚ Ï†Ï‰Ï„Î¿Î³Ï�Î±Ï†Î¯ÎµÏ‚.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluÃ­do.\";s:2:\"fi\";s:107:\"KÃ¤yttÃ¤jÃ¤t ja vieraat voivat kirjoittaa kommentteja eri sisÃ¤ltÃ¶ihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invitÃ©s peuvent Ã©crire des commentaires pour quasiment tout grÃ¢ce au gÃ©nÃ©rateur de captcha intÃ©grÃ©.\";s:2:\"he\";s:94:\"×ž×©×ª×ž×©×™ ×”×�×ª×¨ ×™×›×•×œ×™×� ×œ×¨×©×•×� ×ª×’×•×‘×•×ª ×œ×ž×�×ž×¨×™×�, ×ª×ž×•× ×•×ª ×•×›×•\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir sveÄ�iai gali komentuoti jÅ«sÅ³ naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"UÅ¼ytkownicy i goÅ›cie mogÄ… dodawaÄ‡ komentarze z wbudowanym systemem zabezpieczeÅ„ captcha.\";s:2:\"ru\";s:187:\"ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ð¸ Ð¸ Ð³Ð¾Ñ�Ñ‚Ð¸ Ð¼Ð¾Ð³ÑƒÑ‚ Ð´Ð¾Ð±Ð°Ð²Ð»Ñ�Ñ‚ÑŒ ÐºÐ¾Ð¼Ð¼ÐµÐ½Ñ‚Ð°Ñ€Ð¸Ð¸ Ðº Ð½Ð¾Ð²Ð¾Ñ�Ñ‚Ñ�Ð¼, Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¾Ð½Ð½Ñ‹Ð¼ Ñ�Ñ‚Ñ€Ð°Ð½Ð¸Ñ†Ð°Ð¼ Ð¸ Ñ„Ð¾Ñ‚Ð¾Ð³Ñ€Ð°Ñ„Ð¸Ñ�Ð¼.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"zh\";s:75:\"ç”¨æˆ¶å’Œè¨ªå®¢å�¯ä»¥é‡�å°�æ–°è�žã€�é �é�¢èˆ‡ç…§ç‰‡ç­‰å…§å®¹ç™¼è¡¨å›žæ‡‰ã€‚\";s:2:\"hu\";s:117:\"A felhasznÃ¡lÃ³k Ã©s a vendÃ©gek hozzÃ¡szÃ³lÃ¡sokat Ã­rhatnak a tartalomhoz (bejegyzÃ©sekhez, oldalakhoz, fotÃ³khoz).\";s:2:\"th\";s:240:\"à¸œà¸¹à¹‰à¹ƒà¸Šà¹‰à¸‡à¸²à¸™à¹�à¸¥à¸°à¸œà¸¹à¹‰à¹€à¸¢à¸µà¹ˆà¸¢à¸¡à¸Šà¸¡à¸ªà¸²à¸¡à¸²à¸£à¸–à¹€à¸‚à¸µà¸¢à¸™à¸„à¸§à¸²à¸¡à¸„à¸´à¸”à¹€à¸«à¹‡à¸™à¹ƒà¸™à¹€à¸™à¸·à¹‰à¸­à¸«à¸²à¸‚à¸­à¸‡à¸«à¸™à¹‰à¸²à¹€à¸§à¹‡à¸šà¸šà¸¥à¹‡à¸­à¸�à¹�à¸¥à¸°à¸ à¸²à¸žà¸–à¹ˆà¸²à¸¢\";s:2:\"se\";s:98:\"AnvÃ¤ndare och besÃ¶kare kan skriva kommentarer till innehÃ¥ll som blogginlÃ¤gg, sidor och bilder.\";}',0,0,1,'content',1,1,1,1353274673),(3,'a:23:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"Ø§Ù„Ø¥ØªØµØ§Ù„\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Î•Ï€Î¹ÎºÎ¿Î¹Î½Ï‰Î½Î¯Î±\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fi\";s:13:\"Ota yhteyttÃ¤\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"×™×¦×™×¨×ª ×§×©×¨\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"KontaktinÄ— formÄ…\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"ÐžÐ±Ñ€Ð°Ñ‚Ð½Ð°Ñ� Ñ�Ð²Ñ�Ð·ÑŒ\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"zh\";s:12:\"è�¯çµ¡æˆ‘å€‘\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"à¸•à¸´à¸”à¸•à¹ˆà¸­\";s:2:\"se\";s:7:\"Kontakt\";}','contact','0.9',NULL,'a:23:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"Ø¥Ø¶Ø§Ù�Ø© Ø§Ø³ØªÙ…Ø§Ø±Ø© Ø¥Ù„Ù‰ Ù…ÙˆÙ‚Ø¹Ùƒ ØªÙ�Ù…ÙƒÙ‘Ù† Ø§Ù„Ø²ÙˆÙ‘Ø§Ø± Ù…Ù† Ù…Ø±Ø§Ø³Ù„ØªÙƒ Ø¯ÙˆÙ† Ø¹Ù„Ù…Ù‡Ù… Ø¨Ø¹Ù†ÙˆØ§Ù† Ø§Ù„Ø¨Ø±ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠ.\";s:2:\"br\";s:139:\"Adiciona um formulÃ¡rio para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereÃ§o de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulÃ¡rio ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereÃ§o de e-mail.\";s:2:\"cs\";s:149:\"PÅ™idÃ¡ na web kontaktnÃ­ formulÃ¡Å™ pro nÃ¡vÅ¡tÄ›vnÃ­ky a uÅ¾ivatele, dÃ­ky kterÃ©mu vÃ¡s mohou kontaktovat i bez znalosti vaÅ¡Ã­ e-mailovÃ© adresy.\";s:2:\"da\";s:123:\"TilfÃ¸jer en formular pÃ¥ din side som tillader besÃ¸gende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"FÃ¼gt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Î Ï�Î¿ÏƒÎ¸Î­Ï„ÎµÎ¹ Î¼Î¹Î± Ï†ÏŒÏ�Î¼Î± ÏƒÏ„Î¿Î½ Î¹ÏƒÏ„ÏŒÏ„Î¿Ï€ÏŒ ÏƒÎ±Ï‚ Ï€Î¿Ï… ÎµÏ€Î¹Ï„Ï�Î­Ï€ÎµÎ¹ ÏƒÎµ ÎµÏ€Î¹ÏƒÎºÎ­Ï€Ï„ÎµÏ‚ Î½Î± ÏƒÎ±Ï‚ ÏƒÏ„Î­Î»Î½Î¿Ï…Î½ Î¼Î·Î½Ï�Î¼Î± Î¼Î­ÏƒÏ‰ email Ï‡Ï‰Ï�Î¯Ï‚ Î½Î± Ï„Î¿Ï…Ï‚ Î±Ï€Î¿ÎºÎ±Î»Ï�Ï€Ï„ÎµÏ„Î±Î¹ Î· Î´Î¹ÎµÏ�Î¸Ï…Î½ÏƒÎ· Ï„Î¿Ï… email ÏƒÎ±Ï‚.\";s:2:\"es\";s:156:\"AÃ±ade un formulario a tu sitio que permitirÃ¡ a los visitantes enviarte correos electrÃ³nicos a ti sin darles tu direcciÃ³n de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kÃ¤vijÃ¤t voivat lÃ¤hettÃ¤Ã¤ sÃ¤hkÃ¶postia tietÃ¤mÃ¤ttÃ¤ vastaanottajan sÃ¤hkÃ¶postiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire Ã  votre site qui permet aux visiteurs de vous envoyer un e-mail sans rÃ©vÃ©ler votre adresse e-mail.\";s:2:\"he\";s:155:\"×ž×•×¡×™×£ ×ª×•×¤×¡ ×™×¦×™×¨×ª ×§×©×¨ ×œ×�×ª×¨ ×¢×œ ×ž× ×ª ×œ×� ×œ×—×¡×•×£ ×›×ª×•×‘×ª ×“×•×�×¨ ×”×�×œ×§×˜×¨×•× ×™ ×©×œ ×”×�×ª×¨ ×œ×ž× ×•×¢×™ ×¤×¨×¡×•×ž×•×ª\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jÅ«sÅ³ puslapyje formÄ… leidÅ¾ianti lankytojams siÅ«sti jums el. laiÅ¡kus neatskleidÅ¾iant jÅ«sÅ³ el. paÅ¡to adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, ktÃ³ry pozwala uÅ¼ytkownikom wysÅ‚anie maila za pomocÄ… formularza kontaktowego.\";s:2:\"ru\";s:234:\"Ð”Ð¾Ð±Ð°Ð²Ð»Ñ�ÐµÑ‚ Ñ„Ð¾Ñ€Ð¼Ñƒ Ð¾Ð±Ñ€Ð°Ñ‚Ð½Ð¾Ð¹ Ñ�Ð²Ñ�Ð·Ð¸ Ð½Ð° Ñ�Ð°Ð¹Ñ‚, Ñ‡ÐµÑ€ÐµÐ· ÐºÐ¾Ñ‚Ð¾Ñ€ÑƒÑŽ Ð¿Ð¾Ñ�ÐµÑ‚Ð¸Ñ‚ÐµÐ»Ð¸ Ð¼Ð¾Ð³ÑƒÑ‚ Ð¾Ñ‚Ð¿Ñ€Ð°Ð²Ð»Ñ�Ñ‚ÑŒ Ð²Ð°Ð¼ Ð¿Ð¸Ñ�ÑŒÐ¼Ð°, Ð¿Ñ€Ð¸ Ñ�Ñ‚Ð¾Ð¼ Ð°Ð´Ñ€ÐµÑ� Email Ð¾Ñ�Ñ‚Ð°Ñ‘Ñ‚Ñ�Ñ� Ñ�ÐºÑ€Ñ‹Ñ‚.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci poÅ¡ljejo sporoÄ�ilo brez da bi jim razkrili vaÅ¡ email naslov.\";s:2:\"zh\";s:147:\"ç‚ºæ‚¨çš„ç¶²ç«™æ–°å¢žã€Œè�¯çµ¡æˆ‘å€‘ã€�çš„åŠŸèƒ½ï¼Œå°�è¨ªå®¢æ˜¯è¼ƒç‚ºæ¸…æ¥šä¾¿æ�·çš„è�¯çµ¡æ–¹å¼�ï¼Œä¹Ÿç„¡é ˆæ‚¨å°‡é›»å­�éƒµä»¶å…¬é–‹åœ¨ç¶²ç«™ä¸Šã€‚\";s:2:\"th\";s:316:\"à¹€à¸žà¸´à¹ˆà¸¡à¹�à¸šà¸šà¸Ÿà¸­à¸£à¹Œà¸¡à¹ƒà¸™à¹€à¸§à¹‡à¸šà¹„à¸‹à¸•à¹Œà¸‚à¸­à¸‡à¸„à¸¸à¸“ à¸Šà¹ˆà¸§à¸¢à¹ƒà¸«à¹‰à¸œà¸¹à¹‰à¹€à¸¢à¸µà¹ˆà¸¢à¸¡à¸Šà¸¡à¸ªà¸²à¸¡à¸²à¸£à¸–à¸ªà¹ˆà¸‡à¸­à¸µà¹€à¸¡à¸¥à¸–à¸¶à¸‡à¸„à¸¸à¸“à¹‚à¸”à¸¢à¹„à¸¡à¹ˆà¸•à¹‰à¸­à¸‡à¹€à¸›à¸´à¸”à¹€à¸œà¸¢à¸—à¸µà¹ˆà¸­à¸¢à¸¹à¹ˆà¸­à¸µà¹€à¸¡à¸¥à¸‚à¸­à¸‡à¸žà¸§à¸�à¹€à¸‚à¸²\";s:2:\"hu\";s:156:\"LÃ©trehozhatÃ³ vele olyan Å±rlap, amely lehetÅ‘vÃ© teszi a lÃ¡togatÃ³k szÃ¡mÃ¡ra, hogy e-mailt kÃ¼ldjenek neked Ãºgy, hogy nem feded fel az e-mail cÃ­medet.\";s:2:\"se\";s:53:\"LÃ¤gger till ett kontaktformulÃ¤r till din webbplats.\";}',0,0,0,'0',1,1,1,1353274673),(4,'a:22:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"Ø§Ù„Ù…Ù„Ù�Ù‘Ø§Øª\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Î‘Ï�Ï‡ÎµÎ¯Î±\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"×§×‘×¦×™×�\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Ð¤Ð°Ð¹Ð»Ñ‹\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"zh\";s:6:\"æª”æ¡ˆ\";s:2:\"hu\";s:7:\"FÃ¡jlok\";s:2:\"th\";s:12:\"à¹„à¸Ÿà¸¥à¹Œ\";s:2:\"se\";s:5:\"Filer\";}','files','2.0',NULL,'a:22:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"Ø¥Ø¯Ø§Ø±Ø© Ù…Ù„Ù�Ø§Øª ÙˆÙ…Ø¬Ù„Ù‘Ø¯Ø§Øª Ù…ÙˆÙ‚Ø¹Ùƒ.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a sloÅ¾ky na vaÅ¡em webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Î”Î¹Î±Ï‡ÎµÎ¹Ï�Î¯Î¶ÎµÏ„Î±Î¹ Î±Ï�Ï‡ÎµÎ¯Î± ÎºÎ±Î¹ Ï†Î±ÎºÎ­Î»Î¿Ï…Ï‚ Î³Î¹Î± Ï„Î¿ Î¹ÏƒÏ„ÏŒÏ„Î¿Ï€ÏŒ ÏƒÎ±Ï‚.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"GÃ©rer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"× ×™×”×•×œ ×ª×™×§×™×•×ª ×•×§×‘×¦×™×� ×©×‘×�×ª×¨\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"KatalogÅ³ ir bylÅ³ valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ñ„Ð°Ð¹Ð»Ð°Ð¼Ð¸ Ð¸ Ð¿Ð°Ð¿ÐºÐ°Ð¼Ð¸ Ð²Ð°ÑˆÐµÐ³Ð¾ Ñ�Ð°Ð¹Ñ‚Ð°.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaÅ¡i strani\";s:2:\"zh\";s:33:\"ç®¡ç�†ç¶²ç«™ä¸­çš„æª”æ¡ˆèˆ‡ç›®éŒ„\";s:2:\"hu\";s:41:\"FÃ¡jlok Ã©s mappÃ¡k kezelÃ©se az oldalon.\";s:2:\"th\";s:141:\"à¸šà¸£à¸´à¸«à¸²à¸£à¸ˆà¸±à¸”à¸�à¸²à¸£à¹„à¸Ÿà¸¥à¹Œà¹�à¸¥à¸°à¹‚à¸Ÿà¸¥à¹€à¸”à¸­à¸£à¹Œà¸ªà¸³à¸«à¸£à¸±à¸šà¹€à¸§à¹‡à¸šà¹„à¸‹à¸•à¹Œà¸‚à¸­à¸‡à¸„à¸¸à¸“\";s:2:\"se\";s:45:\"Hanterar filer och mappar fÃ¶r din webbplats.\";}',0,0,1,'content',1,1,1,1353274673),(5,'a:22:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"Ø§Ù„Ù…Ø¬Ù…ÙˆØ¹Ø§Øª\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"ÎŸÎ¼Î¬Î´ÎµÏ‚\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fi\";s:7:\"RyhmÃ¤t\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"×§×‘×•×¦×•×ª\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"GrupÄ—s\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Ð“Ñ€ÑƒÐ¿Ð¿Ñ‹\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"zh\";s:6:\"ç¾¤çµ„\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"à¸�à¸¥à¸¸à¹ˆà¸¡\";s:2:\"se\";s:7:\"Grupper\";}','groups','1.0',NULL,'a:22:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"ÙŠÙ…ÙƒÙ† ÙˆØ¶Ø¹ Ø§Ù„Ù…Ø³ØªØ®Ø¯Ù…ÙŠÙ† Ù�ÙŠ Ù…Ø¬Ù…ÙˆØ¹Ø§Øª Ù„ØªØ³Ù‡ÙŠÙ„ Ø¥Ø¯Ø§Ø±Ø© ØµÙ„Ø§Ø­ÙŠØ§ØªÙ‡Ù….\";s:2:\"br\";s:72:\"UsuÃ¡rios podem ser inseridos em grupos para gerenciar suas permissÃµes.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissÃµes.\";s:2:\"cs\";s:77:\"UÅ¾ivatelÃ© mohou bÃ½t rozÅ™azeni do skupin pro lepÅ¡Ã­ sprÃ¡vu oprÃ¡vnÄ›nÃ­.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer kÃ¶nnen zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"ÎŸÎ¹ Ï‡Ï�Î®ÏƒÏ„ÎµÏ‚ Î¼Ï€Î¿Ï�Î¿Ï�Î½ Î½Î± Ï„Î¿Ï€Î¿Î¸ÎµÏ„Î·Î¸Î¿Ï�Î½ ÏƒÎµ Î¿Î¼Î¬Î´ÎµÏ‚ ÎºÎ±Î¹ Î­Ï„ÏƒÎ¹ Î½Î± Î´Î¹Î±Ï‡ÎµÎ¹Ï�Î¹ÏƒÏ„ÎµÎ¯Ï„Îµ Ï„Î± Î´Î¹ÎºÎ±Î¹ÏŽÎ¼Î±Ï„Î¬ Ï„Î¿Ï…Ï‚.\";s:2:\"es\";s:75:\"Los usuarios podrÃ¡n ser colocados en grupos para administrar sus permisos.\";s:2:\"fi\";s:84:\"KÃ¤yttÃ¤jÃ¤t voidaan liittÃ¤Ã¤ ryhmiin, jotta kÃ¤yttÃ¶oikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir Ã  des groupes afin de gÃ©rer les permissions.\";s:2:\"he\";s:62:\"× ×•×ª×Ÿ ×�×¤×©×¨×•×ª ×œ×�×¡×•×£ ×ž×©×ª×ž×©×™×� ×œ×§×‘×•×¦×•×ª\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali bÅ«ti priskirti grupei tam, kad valdyti jÅ³ teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹ Ð¼Ð¾Ð¶Ð½Ð¾ Ð¾Ð±ÑŠÐµÐ´Ð¸Ð½Ñ�Ñ‚ÑŒ Ð² Ð³Ñ€ÑƒÐ¿Ð¿Ñ‹, Ð´Ð»Ñ� ÑƒÐ¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ñ� Ð¿Ñ€Ð°Ð²Ð°Ð¼Ð¸ Ð´Ð¾Ñ�Ñ‚ÑƒÐ¿Ð°.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrÅ¡Ä�eni v skupine za urejanje dovoljenj\";s:2:\"zh\";s:45:\"ç”¨æˆ¶å�¯ä»¥ä¾�ç¾¤çµ„åˆ†é¡žä¸¦ç®¡ç�†å…¶æ¬Šé™�\";s:2:\"hu\";s:73:\"A felhasznÃ¡lÃ³k csoportokba rendezhetÅ‘ek a jogosultsÃ¡gok kezelÃ©sÃ©re.\";s:2:\"th\";s:84:\"à¸ªà¸²à¸¡à¸²à¸£à¸–à¸§à¸²à¸‡à¸œà¸¹à¹‰à¹ƒà¸Šà¹‰à¸¥à¸‡à¹ƒà¸™à¸�à¸¥à¸¸à¹ˆà¸¡à¹€à¸žà¸·à¹ˆ\";s:2:\"se\";s:76:\"AnvÃ¤ndare kan delas in i grupper fÃ¶r att hantera roller och behÃ¶righeter.\";}',0,0,1,'users',1,1,1,1353274673),(6,'a:15:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"ÙƒÙ„Ù…Ø§Øª Ø§Ù„Ø¨Ø­Ø«\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"NÃ¸gleord\";s:2:\"el\";s:27:\"Î›Î­Î¾ÎµÎ¹Ï‚ ÎšÎ»ÎµÎ¹Î´Î¹Î¬\";s:2:\"fr\";s:10:\"Mots-ClÃ©s\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"zh\";s:6:\"é�µè©ž\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"KljuÄ�ne besede\";s:2:\"th\";s:15:\"à¸„à¸³à¸„à¹‰à¸™\";s:2:\"se\";s:9:\"Nyckelord\";}','keywords','1.0',NULL,'a:15:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"Ø£Ù†Ø´Ø¦ Ù…Ø¬Ù…ÙˆØ¹Ø© Ù…Ù† ÙƒÙ„Ù…Ø§Øª Ø§Ù„Ø¨Ø­Ø« Ø§Ù„ØªÙŠ ØªØ³ØªØ·ÙŠØ¹ Ù…Ù† Ø®Ù„Ø§Ù„Ù‡Ø§ ÙˆØ³Ù… ÙˆØªÙ†Ø¸ÙŠÙ… Ø§Ù„Ù…Ø­ØªÙˆÙ‰.\";s:2:\"br\";s:85:\"MantÃ©m uma lista central de palavras-chave para rotular e organizar o seu conteÃºdo.\";s:2:\"pt\";s:85:\"MantÃ©m uma lista central de palavras-chave para rotular e organizar o seu conteÃºdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nÃ¸gleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Î£Ï…Î½Ï„Î·Ï�ÎµÎ¯ Î¼Î¹Î± ÎºÎµÎ½Ï„Ï�Î¹ÎºÎ® Î»Î¯ÏƒÏ„Î± Î±Ï€ÏŒ Î»Î­Î¾ÎµÎ¹Ï‚ ÎºÎ»ÎµÎ¹Î´Î¹Î¬ Î³Î¹Î± Î½Î± Î¿Ï�Î³Î±Î½ÏŽÎ½ÎµÏ„Îµ Î¼Î­ÏƒÏ‰ ÎµÏ„Î¹ÎºÎµÏ„ÏŽÎ½ Ï„Î¿ Ï€ÎµÏ�Î¹ÎµÏ‡ÏŒÎ¼ÎµÎ½ÏŒ ÏƒÎ±Ï‚.\";s:2:\"fr\";s:87:\"Maintenir une liste centralisÃ©e de Mots-ClÃ©s pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"zh\";s:64:\"é›†ä¸­ç®¡ç�†å�¯ç”¨æ–¼æ¨™é¡Œèˆ‡å…§å®¹çš„é�µè©ž(keywords)åˆ—è¡¨ã€‚\";s:2:\"hu\";s:65:\"Ez egy kÃ¶zponti kulcsszÃ³ lista a cimkÃ©khez Ã©s a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyÃ¤ listaa avainsanoista merkitÃ¤ksesi ja jÃ¤rjestellÃ¤ksesi sisÃ¤ltÃ¶Ã¤.\";s:2:\"sl\";s:82:\"VzdrÅ¾uj centralni seznam kljuÄ�nih besed za oznaÄ�evanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"à¸¨à¸¹à¸™à¸¢à¹Œà¸�à¸¥à¸²à¸‡à¸�à¸²à¸£à¸›à¸£à¸±à¸šà¸›à¸£à¸¸à¸‡à¸„à¸³à¸„à¹‰à¸™à¹ƒà¸™à¸�à¸²à¸£à¸•à¸´à¸”à¸‰à¸¥à¸²à¸�à¹�à¸¥à¸°à¸ˆà¸±à¸”à¸£à¸°à¹€à¸šà¸µà¸¢à¸šà¹€à¸™à¸·à¹‰à¸­à¸«à¸²à¸‚à¸­à¸‡à¸„à¸¸à¸“\";s:2:\"se\";s:61:\"Hantera nyckelord fÃ¶r att organisera webbplatsens innehÃ¥ll.\";}',0,0,1,'content',1,1,1,1353274673),(7,'a:12:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"ManutenÃ§Ã£o\";s:2:\"ar\";s:14:\"Ø§Ù„ØµÙŠØ§Ù†Ø©\";s:2:\"el\";s:18:\"Î£Ï…Î½Ï„Î®Ï�Î·ÏƒÎ·\";s:2:\"hu\";s:13:\"KarbantartÃ¡s\";s:2:\"fi\";s:9:\"YllÃ¤pito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"se\";s:10:\"UnderhÃ¥ll\";s:2:\"sl\";s:12:\"VzdrÅ¾evanje\";s:2:\"th\";s:39:\"à¸�à¸²à¸£à¸šà¸³à¸£à¸¸à¸‡à¸£à¸±à¸�à¸©à¸²\";s:2:\"zh\";s:6:\"ç¶­è­·\";}','maintenance','1.0',NULL,'a:12:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informaÃ§Ãµes da base de dados.\";s:2:\"ar\";s:81:\"Ø­Ø°Ù� Ø¹Ù†Ø§ØµØ± Ø§Ù„Ø°Ø§ÙƒØ±Ø© Ø§Ù„Ù…Ø®Ø¨Ø£Ø© Ø¹Ø¨Ø± ÙˆØ§Ø¬Ù‡Ø© Ø§Ù„Ø¥Ø¯Ø§Ø±Ø©.\";s:2:\"el\";s:142:\"Î”Î¹Î±Î³Ï�Î±Ï†Î® Î±Î½Ï„Î¹ÎºÎµÎ¹Î¼Î­Î½Ï‰Î½ Ï€Ï�Î¿ÏƒÏ‰Ï�Î¹Î½Î®Ï‚ Î±Ï€Î¿Î¸Î®ÎºÎµÏ…ÏƒÎ·Ï‚ Î¼Î­ÏƒÏ‰ Ï„Î·Ï‚ Ï€ÎµÏ�Î¹Î¿Ï‡Î®Ï‚ Î´Î¹Î±Ï‡ÎµÎ¯Ï�Î¹ÏƒÎ·Ï‚.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"fr\";s:71:\"GÃ©rer le cache du site et exporter les contenus de la base de donnÃ©es\";s:2:\"fi\";s:59:\"Hallinoi sivuston vÃ¤limuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsÃ­tÃ³tÃ¡r kezelÃ©se Ã©s az adatbÃ¡zis exportÃ¡lÃ¡sa.\";s:2:\"se\";s:76:\"UnderhÃ¥ll webbplatsens cache och exportera data frÃ¥n webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"à¸�à¸²à¸£à¸ˆà¸±à¸”à¸�à¸²à¸£à¹�à¸„à¸Šà¹€à¸§à¹‡à¸šà¹„à¸‹à¸•à¹Œà¹�à¸¥à¸°à¸‚à¹‰à¸­à¸¡à¸¹à¸¥à¸�à¸²à¸£à¸ªà¹ˆà¸‡à¸­à¸­à¸�à¸ˆà¸²à¸�à¸�à¸²à¸™à¸‚à¹‰à¸­à¸¡à¸¹à¸¥\";s:2:\"zh\";s:45:\"ç¶“ç”±ç®¡ç�†ä»‹é�¢æ‰‹å‹•åˆªé™¤æš«å­˜è³‡æ–™ã€‚\";}',0,0,1,'utilities',1,1,1,1353274673),(8,'a:23:{s:2:\"en\";s:7:\"Modules\";s:2:\"ar\";s:14:\"Ø§Ù„ÙˆØ­Ø¯Ø§Øª\";s:2:\"br\";s:8:\"MÃ³dulos\";s:2:\"pt\";s:8:\"MÃ³dulos\";s:2:\"cs\";s:6:\"Moduly\";s:2:\"da\";s:7:\"Moduler\";s:2:\"de\";s:6:\"Module\";s:2:\"el\";s:16:\"Î Ï�ÏŒÏƒÎ¸ÎµÏ„Î±\";s:2:\"es\";s:8:\"MÃ³dulos\";s:2:\"fi\";s:8:\"Moduulit\";s:2:\"fr\";s:7:\"Modules\";s:2:\"he\";s:14:\"×ž×•×“×•×œ×™×�\";s:2:\"id\";s:5:\"Modul\";s:2:\"it\";s:6:\"Moduli\";s:2:\"lt\";s:8:\"Moduliai\";s:2:\"nl\";s:7:\"Modules\";s:2:\"pl\";s:7:\"ModuÅ‚y\";s:2:\"ru\";s:12:\"ÐœÐ¾Ð´ÑƒÐ»Ð¸\";s:2:\"sl\";s:6:\"Moduli\";s:2:\"zh\";s:6:\"æ¨¡çµ„\";s:2:\"hu\";s:7:\"Modulok\";s:2:\"th\";s:15:\"à¹‚à¸¡à¸”à¸¹à¸¥\";s:2:\"se\";s:7:\"Moduler\";}','modules','1.0',NULL,'a:23:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"ØªÙ�Ù…ÙƒÙ‘Ù† Ø§Ù„Ù…Ù�Ø¯Ø±Ø§Ø¡ Ù…Ù† Ù…Ø¹Ø§ÙŠÙ†Ø© Ø¬Ù…ÙŠØ¹ Ø§Ù„ÙˆØ­Ø¯Ø§Øª Ø§Ù„Ù…Ù�Ø«Ø¨Ù‘ØªØ©.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos mÃ³dulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos mÃ³dulos instalados atualmente.\";s:2:\"cs\";s:68:\"UmoÅ¾Åˆuje administrÃ¡torÅ¯m vidÄ›t seznam nainstalovanÃ½ch modulÅ¯.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Î•Ï€Î¹Ï„Ï�Î­Ï€ÎµÎ¹ ÏƒÏ„Î¿Ï…Ï‚ Î´Î¹Î±Ï‡ÎµÎ¹Ï�Î¹ÏƒÏ„Î­Ï‚ Î½Î± Ï€Ï�Î¿Î²Î¬Î»Î¿Ï…Î½ Î¼Î¹Î± Î»Î¯ÏƒÏ„Î± Ï„Ï‰Î½ ÎµÎ³ÎºÎ±Ï„ÎµÏƒÏ„Î·Î¼Î­Î½Ï‰Î½ Ï€Ï�ÏŒÏƒÎ¸ÎµÏ„Ï‰Î½.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los mÃ³dulos instalados.\";s:2:\"fi\";s:60:\"Listaa jÃ¤rjestelmÃ¤nvalvojalle kÃ¤ytÃ¶ssÃ¤ olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installÃ©s\";s:2:\"he\";s:160:\"× ×•×ª×Ÿ ×�×•×¤×¦×™×” ×œ×ž× ×”×œ ×œ×¨×�×•×ª ×¨×©×™×ž×” ×©×œ ×”×ž×•×“×•×œ×™×� ×�×©×¨ ×ž×•×ª×§× ×™×� ×›×¢×ª ×‘×�×ª×¨ ×�×• ×œ×”×ª×§×™×Ÿ ×ž×•×“×•×œ×™×� × ×•×¡×¤×™×�\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir sveÄ�iai gali komentuoti jÅ«sÅ³ naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"UmoÅ¼liwiajÄ… administratorowi wglÄ…d do listy obecnie zainstalowanych moduÅ‚Ã³w.\";s:2:\"ru\";s:83:\"Ð¡Ð¿Ð¸Ñ�Ð¾Ðº Ð¼Ð¾Ð´ÑƒÐ»ÐµÐ¹, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ðµ ÑƒÑ�Ñ‚Ð°Ð½Ð¾Ð²Ð»ÐµÐ½Ñ‹ Ð½Ð° Ñ�Ð°Ð¹Ñ‚Ðµ.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameÅ¡Ä�enih modulov.\";s:2:\"zh\";s:54:\"ç®¡ç�†å“¡å�¯ä»¥æª¢è¦–ç›®å‰�å·²ç¶“å®‰è£�æ¨¡çµ„çš„åˆ—è¡¨\";s:2:\"hu\";s:79:\"LehetÅ‘vÃ© teszi az adminoknak, hogy lÃ¡ssÃ¡k a telepÃ­tett modulok listÃ¡jÃ¡t.\";s:2:\"th\";s:162:\"à¸Šà¹ˆà¸§à¸¢à¹ƒà¸«à¹‰à¸œà¸¹à¹‰à¸”à¸¹à¹�à¸¥à¸£à¸°à¸šà¸šà¸”à¸¹à¸£à¸²à¸¢à¸�à¸²à¸£à¸‚à¸­à¸‡à¹‚à¸¡à¸”à¸¹à¸¥à¸—à¸µà¹ˆà¸•à¸´à¸”à¸•à¸±à¹‰à¸‡à¹ƒà¸™à¸›à¸±à¸ˆà¸ˆà¸¸à¸šà¸±à¸™\";s:2:\"se\";s:67:\"GÃ¶r det mÃ¶jligt fÃ¶r administratÃ¶ren att se installerade mouler.\";}',0,0,1,'0',1,1,1,1353274673),(9,'a:23:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"Ø§Ù„Ø±ÙˆØ§Ø¨Ø·\";s:2:\"br\";s:11:\"NavegaÃ§Ã£o\";s:2:\"pt\";s:11:\"NavegaÃ§Ã£o\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Î Î»Î¿Î®Î³Î·ÏƒÎ·\";s:2:\"es\";s:11:\"NavegaciÃ³n\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"× ×™×•×•×˜\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Ð�Ð°Ð²Ð¸Ð³Ð°Ñ†Ð¸Ñ�\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"zh\";s:12:\"å°Žèˆªé�¸å–®\";s:2:\"th\";s:36:\"à¸•à¸±à¸§à¸Šà¹ˆà¸§à¸¢à¸™à¸³à¸—à¸²à¸‡\";s:2:\"hu\";s:11:\"NavigÃ¡ciÃ³\";s:2:\"se\";s:10:\"Navigation\";}','navigation','1.1',NULL,'a:23:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"Ø¥Ø¯Ø§Ø±Ø© Ø±ÙˆØ§Ø¨Ø· ÙˆÙ‚ÙˆØ§Ø¦Ù… ÙˆÙ…Ø¬Ù…ÙˆØ¹Ø§Øª Ø§Ù„Ø±ÙˆØ§Ø¨Ø· Ù�ÙŠ Ø§Ù„Ù…ÙˆÙ‚Ø¹.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegaÃ§Ã£o e todos os grupos de navegaÃ§Ã£o pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegaÃ§Ã£o e os links de navegaÃ§Ã£o pertencentes a eles.\";s:2:\"cs\";s:73:\"SprÃ¡va odkazÅ¯ v navigaci a vÅ¡ech souvisejÃ­cÃ­ch navigaÄ�nÃ­ch skupin.\";s:2:\"da\";s:82:\"HÃ¥ndtÃ©r links pÃ¥ navigationsmenuerne og alle navigationsgrupperne de tilhÃ¸rer.\";s:2:\"de\";s:76:\"Verwalte Links in NavigationsmenÃ¼s und alle zugehÃ¶rigen Navigationsgruppen\";s:2:\"el\";s:207:\"Î”Î¹Î±Ï‡ÎµÎ¹Ï�Î¹ÏƒÏ„ÎµÎ¯Ï„Îµ Ï„Î¿Ï…Ï‚ ÏƒÏ…Î½Î´Î­ÏƒÎ¼Î¿Ï…Ï‚ ÏƒÏ„Î± Î¼ÎµÎ½Î¿Ï� Ï€Î»Î¿Î®Î³Î·ÏƒÎ·Ï‚ ÎºÎ±Î¹ ÏŒÎ»ÎµÏ‚ Ï„Î¹Ï‚ Î¿Î¼Î¬Î´ÎµÏ‚ ÏƒÏ…Î½Î´Î­ÏƒÎ¼Ï‰Î½ Ï€Î»Î¿Î®Î³Î·ÏƒÎ·Ï‚ ÏƒÏ„Î¹Ï‚ Î¿Ï€Î¿Î¯ÎµÏ‚ Î±Î½Î®ÎºÎ¿Ï…Î½.\";s:2:\"es\";s:102:\"Administra links en los menÃºs de navegaciÃ³n y en todos los grupos de navegaciÃ³n al cual pertenecen.\";s:2:\"fi\";s:91:\"Hallitse linkkejÃ¤ navigointi valikoissa ja kaikkia navigointi ryhmiÃ¤, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"GÃ©rer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"× ×™×”×•×œ ×©×œ×•×—×•×ª ×ª×¤×¨×™×˜×™ × ×™×•×•×˜ ×•×§×‘×•×¦×•×ª × ×™×•×•×˜\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijÅ³ meniÅ³ ir visas navigacijÅ³ grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"ZarzÄ…dzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do ktÃ³rych one naleÅ¼Ä….\";s:2:\"ru\";s:136:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ñ�Ñ�Ñ‹Ð»ÐºÐ°Ð¼Ð¸ Ð² Ð¼ÐµÐ½ÑŽ Ð½Ð°Ð²Ð¸Ð³Ð°Ñ†Ð¸Ð¸ Ð¸ Ð³Ñ€ÑƒÐ¿Ð¿Ð°Ñ…, Ðº ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ð¼ Ð¾Ð½Ð¸ Ð¿Ñ€Ð¸Ð½Ð°Ð´Ð»ÐµÐ¶Ð°Ñ‚.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"zh\";s:72:\"ç®¡ç�†å°Žèˆªé�¸å–®ä¸­çš„é€£çµ�ï¼Œä»¥å�Šå®ƒå€‘æ‰€éš¸å±¬çš„å°Žèˆªç¾¤çµ„ã€‚\";s:2:\"th\";s:108:\"à¸ˆà¸±à¸”à¸�à¸²à¸£à¸�à¸²à¸£à¹€à¸Šà¸·à¹ˆà¸­à¸¡à¹‚à¸¢à¸‡à¸™à¸³à¸—à¸²à¸‡à¹�à¸¥à¸°à¸�à¸¥à¸¸à¹ˆà¸¡à¸™à¸³à¸—à¸²à¸‡\";s:2:\"hu\";s:100:\"Linkek kezelÃ©se a navigÃ¡ciÃ³s menÃ¼kben Ã©s a navigÃ¡ciÃ³s csoportok kezelÃ©se, amikhez tartoznak.\";s:2:\"se\";s:33:\"Hantera lÃ¤nkar och lÃ¤nkgrupper.\";}',0,0,1,'design',1,1,1,1353274673),(10,'a:23:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"Ø§Ù„ØµÙ�Ø­Ø§Øª\";s:2:\"br\";s:8:\"PÃ¡ginas\";s:2:\"pt\";s:8:\"PÃ¡ginas\";s:2:\"cs\";s:8:\"StrÃ¡nky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Î£ÎµÎ»Î¯Î´ÎµÏ‚\";s:2:\"es\";s:8:\"PÃ¡ginas\";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"×“×¤×™×�\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Ð¡Ñ‚Ñ€Ð°Ð½Ð¸Ñ†Ñ‹\";s:2:\"sl\";s:6:\"Strani\";s:2:\"zh\";s:6:\"é �é�¢\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"à¸«à¸™à¹‰à¸²à¹€à¸žà¸ˆ\";s:2:\"se\";s:5:\"Sidor\";}','pages','2.2.0',NULL,'a:23:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"Ø¥Ø¶Ø§Ù�Ø© ØµÙ�Ø­Ø§Øª Ù…Ù�Ø®ØµÙ‘ØµØ© Ø¥Ù„Ù‰ Ø§Ù„Ù…ÙˆÙ‚Ø¹ ØªØ­ØªÙˆÙŠ Ø£ÙŠØ© Ù…Ù�Ø­ØªÙˆÙ‰ ØªØ±ÙŠØ¯Ù‡.\";s:2:\"br\";s:82:\"Adicionar pÃ¡ginas personalizadas ao site com qualquer conteÃºdo que vocÃª queira.\";s:2:\"pt\";s:86:\"Adicionar pÃ¡ginas personalizadas ao seu site com qualquer conteÃºdo que vocÃª queira.\";s:2:\"cs\";s:74:\"PÅ™idÃ¡vejte vlastnÃ­ strÃ¡nky na web s jakÃ½mkoliv obsahem budete chtÃ­t.\";s:2:\"da\";s:71:\"TilfÃ¸j brugerdefinerede sider til dit site med det indhold du Ã¸nsker.\";s:2:\"de\";s:49:\"FÃ¼ge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Î Ï�Î¿ÏƒÎ¸Î­ÏƒÏ„Îµ ÎºÎ±Î¹ ÎµÏ€ÎµÎ¾ÎµÏ�Î³Î±ÏƒÏ„ÎµÎ¯Ï„Îµ ÏƒÎµÎ»Î¯Î´ÎµÏ‚ ÏƒÏ„Î¿Î½ Î¹ÏƒÏ„ÏŒÏ„Î¿Ï€ÏŒ ÏƒÎ±Ï‚ Î¼Îµ ÏŒ,Ï„Î¹ Ï€ÎµÏ�Î¹ÎµÏ‡ÏŒÎ¼ÎµÎ½Î¿ Î¸Î­Î»ÎµÏ„Îµ.\";s:2:\"es\";s:77:\"Agrega pÃ¡ginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fi\";s:47:\"LisÃ¤Ã¤ mitÃ¤ tahansa sisÃ¤ltÃ¶Ã¤ sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisÃ©es avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"× ×™×”×•×œ ×“×¤×™ ×ª×•×›×Ÿ ×”×�×ª×¨\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"PridÄ—kite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj wÅ‚asne strony z dowolnÄ… treÅ›ciÄ… do witryny.\";s:2:\"ru\";s:134:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¾Ð½Ð½Ñ‹Ð¼Ð¸ Ñ�Ñ‚Ñ€Ð°Ð½Ð¸Ñ†Ð°Ð¼Ð¸ Ñ�Ð°Ð¹Ñ‚Ð°, Ñ� Ð¿Ñ€Ð¾Ð¸Ð·Ð²Ð¾Ð»ÑŒÐ½Ñ‹Ð¼ Ñ�Ð¾Ð´ÐµÑ€Ð¶Ð¸Ð¼Ñ‹Ð¼.\";s:2:\"sl\";s:44:\"Dodaj stran s kakrÅ¡no koli vsebino Å¾elite.\";s:2:\"zh\";s:39:\"ç‚ºæ‚¨çš„ç¶²ç«™æ–°å¢žè‡ªå®šçš„é �é�¢ã€‚\";s:2:\"th\";s:168:\"à¹€à¸žà¸´à¹ˆà¸¡à¸«à¸™à¹‰à¸²à¹€à¸§à¹‡à¸šà¸—à¸µà¹ˆà¸�à¸³à¸«à¸™à¸”à¹€à¸­à¸‡à¹„à¸›à¸¢à¸±à¸‡à¹€à¸§à¹‡à¸šà¹„à¸‹à¸•à¹Œà¸‚à¸­à¸‡à¸„à¸¸à¸“à¸•à¸²à¸¡à¸—à¸µà¹ˆà¸•à¹‰à¸­à¸‡à¸�à¸²à¸£\";s:2:\"hu\";s:67:\"SajÃ¡t oldalak hozzÃ¡adÃ¡sa a weboldalhoz, akÃ¡rmilyen tartalommal.\";s:2:\"se\";s:39:\"LÃ¤gg till egna sidor till webbplatsen.\";}',1,1,1,'content',1,1,1,1353274673),(11,'a:23:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"Ø§Ù„ØµÙ„Ø§Ø­ÙŠØ§Øª\";s:2:\"br\";s:11:\"PermissÃµes\";s:2:\"pt\";s:11:\"PermissÃµes\";s:2:\"cs\";s:12:\"OprÃ¡vnÄ›nÃ­\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Î”Î¹ÎºÎ±Î¹ÏŽÎ¼Î±Ï„Î±\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fi\";s:16:\"KÃ¤yttÃ¶oikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"×”×¨×©×�×•×ª\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"TeisÄ—s\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"ÐŸÑ€Ð°Ð²Ð° Ð´Ð¾Ñ�Ñ‚ÑƒÐ¿Ð°\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"zh\";s:6:\"æ¬Šé™�\";s:2:\"hu\";s:14:\"JogosultsÃ¡gok\";s:2:\"th\";s:18:\"à¸ªà¸´à¸—à¸˜à¸´à¹Œ\";s:2:\"se\";s:13:\"BehÃ¶righeter\";}','permissions','0.6',NULL,'a:23:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"Ø§Ù„ØªØ­ÙƒÙ… Ø¨Ø¥Ø¹Ø·Ø§Ø¡ Ø§Ù„ØµÙ„Ø§Ø­ÙŠØ§Øª Ù„Ù„Ù…Ø³ØªØ®Ø¯Ù…ÙŠÙ† Ù„Ù„ÙˆØµÙˆÙ„ Ø¥Ù„Ù‰ Ø£Ù‚Ø³Ø§Ù… Ø§Ù„Ù…ÙˆÙ‚Ø¹ Ø§Ù„Ù…Ø®ØªÙ„Ù�Ø©.\";s:2:\"br\";s:68:\"Controle quais tipos de usuÃ¡rios podem ver certas seÃ§Ãµes no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secÃ§Ãµes no site.\";s:2:\"cs\";s:93:\"Spravujte oprÃ¡vnÄ›nÃ­ pro jednotlivÃ© typy uÅ¾ivatelÅ¯ a ke kterÃ½m sekcÃ­m majÃ­ pÅ™Ã­stup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner pÃ¥ sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Î•Î»Î­Î³Î¾Ï„Îµ Ï„Î± Î´Î¹ÎºÎ±Î¹ÏŽÎ¼Î±Ï„Î± Ï‡Ï�Î·ÏƒÏ„ÏŽÎ½ ÎºÎ±Î¹ Î¿Î¼Î¬Î´Ï‰Î½ Ï‡Ï�Î·ÏƒÏ„ÏŽÎ½ ÏŒÏƒÎ¿ Î±Ï†Î¿Ï�Î¬ ÏƒÎµ Î´Î¹Î¬Ï†Î¿Ï�ÎµÏ‚ Î»ÎµÎ¹Ï„Î¿Ï…Ï�Î³Î¯ÎµÏ‚ Ï„Î¿Ï… Î¹ÏƒÏ„Î¿Ï„ÏŒÏ€Î¿Ï….\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones especÃ­ficas dentro del sitio.\";s:2:\"fi\";s:72:\"Hallitse minkÃ¤ tyyppisiin osioihin kÃ¤yttÃ¤jÃ¤t pÃ¤Ã¤sevÃ¤t sivustolla.\";s:2:\"fr\";s:104:\"Permet de dÃ©finir les autorisations des groupes d\'utilisateurs pour afficher les diffÃ©rentes sections.\";s:2:\"he\";s:75:\"× ×™×”×•×œ ×”×¨×©×�×•×ª ×›× ×™×¡×” ×œ×�×™×–×•×¨×™×� ×ž×¡×•×™×ž×™×� ×‘×�×ª×¨\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokiÄ… dalÄ¯ puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, ktÃ³rzy uÅ¼ytkownicy mogÄ… mieÄ‡ dostÄ™p do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð¿Ñ€Ð°Ð²Ð°Ð¼Ð¸ Ð´Ð¾Ñ�Ñ‚ÑƒÐ¿Ð°, Ð¾Ð³Ñ€Ð°Ð½Ð¸Ñ‡ÐµÐ½Ð¸Ðµ Ð´Ð¾Ñ�Ñ‚ÑƒÐ¿Ð° Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ñ‘Ð½Ð½Ñ‹Ñ… Ð³Ñ€ÑƒÐ¿Ð¿ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹ Ðº Ð¿Ñ€Ð¾Ð¸Ð·Ð²Ð¾Ð»ÑŒÐ½Ñ‹Ð¼ Ñ€Ð°Ð·Ð´ÐµÐ»Ð°Ð¼ Ñ�Ð°Ð¹Ñ‚Ð°.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi doloÄ�ena podroÄ�ja vaÅ¡e strani.\";s:2:\"zh\";s:81:\"ç”¨ä¾†æŽ§åˆ¶ä¸�å�Œé¡žåˆ¥çš„ç”¨æˆ¶ï¼Œè¨­å®šå…¶ç€�è¦½ç‰¹å®šç¶²ç«™å…§å®¹çš„æ¬Šé™�ã€‚\";s:2:\"hu\";s:129:\"A felhasznÃ¡lÃ³k felÃ¼gyelet alatt tartÃ¡sÃ¡ra, hogy milyen tÃ­pusÃº felhasznÃ¡lÃ³k, mit lÃ¡thatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"à¸„à¸§à¸šà¸„à¸¸à¸¡à¸§à¹ˆà¸²à¸œà¸¹à¹‰à¹ƒà¸Šà¹‰à¸‡à¸²à¸™à¸ˆà¸°à¹€à¸«à¹‡à¸™à¸«à¸¡à¸§à¸”à¸«à¸¡à¸¹à¹ˆà¹„à¸«à¸™à¸šà¹‰à¸²à¸‡\";s:2:\"se\";s:27:\"Hantera gruppbehÃ¶righeter.\";}',0,0,1,'users',1,1,1,1353274673),(12,'a:21:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"Ø§Ù„ØªÙˆØ¬ÙŠÙ‡Ø§Øª\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"PÅ™esmÄ›rovÃ¡nÃ­\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Î‘Î½Î±ÎºÎ±Ï„ÎµÏ…Î¸Ï�Î½ÏƒÎµÎ¹Ï‚\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"×”×¤× ×™×•×ª\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"ÐŸÐµÑ€ÐµÐ½Ð°Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ñ�\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"zh\";s:6:\"è½‰å�€\";s:2:\"hu\";s:17:\"Ã�tirÃ¡nyÃ­tÃ¡sok\";s:2:\"th\";s:42:\"à¹€à¸›à¸¥à¸µà¹ˆà¸¢à¸™à¹€à¸ªà¹‰à¸™à¸—à¸²à¸‡\";s:2:\"se\";s:14:\"Omdirigeringar\";}','redirects','1.0',NULL,'a:21:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"Ø§Ù„ØªÙˆØ¬ÙŠÙ‡ Ù…Ù† Ø±Ø§Ø¨Ø· URL Ø¥Ù„Ù‰ Ø¢Ø®Ø±.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"PÅ™esmÄ›rujte z jednÃ© adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Î‘Î½Î±ÎºÎ±Ï„ÎµÏ…Î¸ÎµÎ¯Î½ÎµÏ„Îµ Î¼Î¹Î± Î´Î¹ÎµÏ�Î¸Ï…Î½ÏƒÎ· URL ÏƒÎµ Î¼Î¹Î± Î¬Î»Î»Î·\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fi\";s:45:\"Uudelleenohjaa kÃ¤yttÃ¤jÃ¤n paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL Ã  un autre.\";s:2:\"he\";s:43:\"×”×¤× ×™×•×ª ×ž×›×ª×•×‘×ª ×�×—×ª ×œ×�×—×¨×ª\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapÄ¯ iÅ¡ vieno adreso (URL) Ä¯ kitÄ….\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"ÐŸÐµÑ€ÐµÐ½Ð°Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ñ� Ñ� Ð¾Ð´Ð½Ð¾Ð³Ð¾ Ð°Ð´Ñ€ÐµÑ�Ð° Ð½Ð° Ð´Ñ€ÑƒÐ³Ð¾Ð¹.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"zh\";s:33:\"å°‡ç¶²å�€è½‰å�€ã€�é‡�æ–°å®šå�‘ã€‚\";s:2:\"hu\";s:38:\"Egy URL Ã¡tirÃ¡nyÃ­tÃ¡sa egy mÃ¡sikra.\";s:2:\"th\";s:123:\"à¹€à¸›à¸¥à¸µà¹ˆà¸¢à¸™à¹€à¸ªà¹‰à¸™à¸—à¸²à¸‡à¸ˆà¸²à¸�à¸—à¸µà¹ˆà¸«à¸™à¸¶à¹ˆà¸‡à¹„à¸›à¸¢à¸±à¸‡à¸­à¸µà¸�à¸—à¸µà¹ˆà¸«à¸™à¸¶à¹ˆà¸‡\";s:2:\"se\";s:38:\"Omdirigera frÃ¥n en URL till en annan.\";}',0,0,1,'utilities',1,1,1,1353274673),(13,'a:23:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"Ø§Ù„Ø¥Ø¹Ø¯Ø§Ø¯Ø§Øª\";s:2:\"br\";s:15:\"ConfiguraÃ§Ãµes\";s:2:\"pt\";s:15:\"ConfiguraÃ§Ãµes\";s:2:\"cs\";s:10:\"NastavenÃ­\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Î¡Ï…Î¸Î¼Î¯ÏƒÎµÎ¹Ï‚\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"ParamÃ¨tres\";s:2:\"he\";s:12:\"×”×’×“×¨×•×ª\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Ð�Ð°Ñ�Ñ‚Ñ€Ð¾Ð¹ÐºÐ¸\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"zh\";s:12:\"ç¶²ç«™è¨­å®š\";s:2:\"hu\";s:14:\"BeÃ¡llÃ­tÃ¡sok\";s:2:\"th\";s:21:\"à¸•à¸±à¹‰à¸‡à¸„à¹ˆà¸²\";s:2:\"se\";s:14:\"InstÃ¤llningar\";}','settings','1.0',NULL,'a:23:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"ØªÙ…ÙƒÙ† Ø§Ù„Ù…Ø¯Ø±Ø§Ø¡ Ù…Ù† ØªØ­Ø¯ÙŠØ« Ø§Ù„Ø¥Ø¹Ø¯Ø§Ø¯Ø§Øª ÙƒØ¥Ø³Ù… Ø§Ù„Ù…ÙˆÙ‚Ø¹ØŒ ÙˆØ§Ù„Ø±Ø³Ø§Ø¦Ù„ ÙˆØ¹Ù†Ø§ÙˆÙŠÙ† Ø§Ù„Ø¨Ø±ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠØŒ .. Ø¥Ù„Ø®.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configuraÃ§Ãµes do website incluindo o nome e descriÃ§Ã£o.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configuraÃ§Ãµes do website incluindo o nome e descriÃ§Ã£o.\";s:2:\"cs\";s:102:\"UmoÅ¾Åˆuje administrÃ¡torÅ¯m mÄ›nit nastavenÃ­ webu jako jeho jmÃ©no, zprÃ¡vy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu Ã¤ndern.\";s:2:\"el\";s:230:\"Î•Ï€Î¹Ï„Ï�Î­Ï€ÎµÎ¹ ÏƒÏ„Î¿Ï…Ï‚ Î´Î¹Î±Ï‡ÎµÎ¹Ï�Î¹ÏƒÏ„Î­Ï‚ Î½Î± Ï„Ï�Î¿Ï€Î¿Ï€Î¿Î¹Î®ÏƒÎ¿Ï…Î½ Ï�Ï…Î¸Î¼Î¯ÏƒÎµÎ¹Ï‚ ÏŒÏ€Ï‰Ï‚ Ï„Î¿ ÎŒÎ½Î¿Î¼Î± Ï„Î¿Ï… Î™ÏƒÏ„Î¿Ï„ÏŒÏ€Î¿Ï…, Ï„Î± Î¼Î·Î½Ï�Î¼Î±Ï„Î± ÎºÎ±Î¹ Ï„Î¹Ï‚ Î´Î¹ÎµÏ…Î¸Ï�Î½ÏƒÎµÎ¹Ï‚ email, Îº.Î±.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripciÃ³n del mismo.\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sÃ¤hkÃ¶postiosoitteet yms.\";s:2:\"fr\";s:105:\"Permet aux admistrateurs et au personnel de modifier les paramÃ¨tres du site : nom du site et description\";s:2:\"he\";s:116:\"× ×™×”×•×œ ×”×’×“×¨×•×ª ×©×•× ×•×ª ×©×œ ×”×�×ª×¨ ×›×’×•×Ÿ: ×©×� ×”×�×ª×¨, ×”×•×“×¢×•×ª, ×›×ª×•×‘×•×ª ×“×•×�×¨ ×•×›×•\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"LeidÅ¾ia administratoriams keisti puslapio vavadinimÄ…, Å¾inutes, administratoriaus el. paÅ¡ta ir kitÄ….\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"UmoÅ¼liwia administratorom zmianÄ™ ustawieÅ„ strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð½Ð°Ñ�Ñ‚Ñ€Ð¾Ð¹ÐºÐ°Ð¼Ð¸ Ñ�Ð°Ð¹Ñ‚Ð° - Ð˜Ð¼Ñ� Ñ�Ð°Ð¹Ñ‚Ð°, Ñ�Ð¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ñ�, Ð¿Ð¾Ñ‡Ñ‚Ð¾Ð²Ñ‹Ðµ Ð°Ð´Ñ€ÐµÑ�Ð° Ð¸ Ñ‚.Ð¿.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporoÄ�il, email naslova itd.\";s:2:\"zh\";s:99:\"ç¶²ç«™ç®¡ç�†è€…å�¯æ›´æ–°çš„é‡�è¦�ç¶²ç«™è¨­å®šã€‚ä¾‹å¦‚ï¼šç¶²ç«™å��ç¨±ã€�è¨Šæ�¯ã€�é›»å­�éƒµä»¶ç­‰ã€‚\";s:2:\"hu\";s:125:\"LehetÅ‘vÃ© teszi az adminok szÃ¡mÃ¡ra a beÃ¡llÃ­tÃ¡sok frissÃ­tÃ©sÃ©t, mint a weboldal neve, Ã¼zenetek, e-mail cÃ­mek, stb...\";s:2:\"th\";s:232:\"à¹ƒà¸«à¹‰à¸œà¸¹à¹‰à¸”à¸¹à¹�à¸¥à¸£à¸°à¸šà¸šà¸ªà¸²à¸¡à¸²à¸£à¸–à¸›à¸£à¸±à¸šà¸›à¸£à¸¸à¸‡à¸�à¸²à¸£à¸•à¸±à¹‰à¸‡à¸„à¹ˆà¸²à¹€à¸Šà¹ˆà¸™à¸Šà¸·à¹ˆà¸­à¹€à¸§à¹‡à¸šà¹„à¸‹à¸•à¹Œ à¸‚à¹‰à¸­à¸„à¸§à¸²à¸¡à¹�à¸¥à¸°à¸­à¸µà¹€à¸¡à¸¥à¹Œà¹€à¸›à¹‡à¸™à¸•à¹‰à¸™\";s:2:\"se\";s:84:\"AdministratÃ¶ren kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}',1,0,1,'0',1,1,1,1353274673),(14,'a:18:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"Ø®Ø±ÙŠØ·Ø© Ø§Ù„Ù…ÙˆÙ‚Ø¹\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Î§Î¬Ï�Ï„Î·Ï‚ Î™ÏƒÏ„ÏŒÏ„Î¿Ï€Î¿Ï…\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"SvetainÄ—s medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"ÐšÐ°Ñ€Ñ‚Ð° Ñ�Ð°Ð¹Ñ‚Ð°\";s:2:\"zh\";s:12:\"ç¶²ç«™åœ°åœ–\";s:2:\"th\";s:21:\"à¹„à¸‹à¸•à¹Œà¹�à¸¡à¸ž\";s:2:\"hu\";s:13:\"OldaltÃ©rkÃ©p\";s:2:\"se\";s:9:\"Sajtkarta\";}','sitemap','1.2',NULL,'a:19:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"ÙˆØ­Ø¯Ø© Ø®Ø±ÙŠØ·Ø© Ø§Ù„Ù…ÙˆÙ‚Ø¹ ØªÙ†Ø´Ø¦ Ù�Ù‡Ø±Ø³Ø§Ù‹ Ù„Ø¬Ù…ÙŠØ¹ Ø§Ù„ØµÙ�Ø­Ø§Øª ÙˆÙ…Ù„Ù� XML Ù„Ù…Ø­Ø±ÙƒØ§Øª Ø§Ù„Ø¨Ø­Ø«.\";s:2:\"br\";s:102:\"O mÃ³dulo de mapa do site cria um Ã­ndice de todas as pÃ¡ginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O mÃ³dulo do mapa do site cria um Ã­ndice de todas as pÃ¡ginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til sÃ¸gemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap fÃ¼r Suchmaschinen.\";s:2:\"el\";s:190:\"Î”Î·Î¼Î¹Î¿Ï…Ï�Î³ÎµÎ¯ Î­Î½Î±Î½ ÎºÎ±Ï„Î¬Î»Î¿Î³Î¿ ÏŒÎ»Ï‰Î½ Ï„Ï‰Î½ ÏƒÎµÎ»Î¯Î´Ï‰Î½ ÎºÎ±Î¹ Î­Î½Î±Î½ Ï‡Î¬Ï�Ï„Î· ÏƒÎµÎ»Î¯Î´Ï‰Î½ ÏƒÎµ Î¼Î¿Ï�Ï†Î® XML Î³Î¹Î± Ï„Î¹Ï‚ Î¼Î·Ï‡Î±Î½Î­Ï‚ Î±Î½Î±Î¶Î®Ï„Î·ÏƒÎ·Ï‚.\";s:2:\"es\";s:111:\"El mÃ³dulo de mapa crea un Ã­ndice de todas las pÃ¡ginas y un mapa del sitio XML para los motores de bÃºsqueda.\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crÃ©e un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktÅ«ra modulis sukuria visÅ³ puslapiÅ³ ir XML Sitemap paieÅ¡kos sistemÅ³ indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"ÐšÐ°Ñ€Ñ‚Ð° Ð¼Ð¾Ð´ÑƒÐ»ÑŒ Ñ�Ð¾Ð·Ð´Ð°ÐµÑ‚ Ð¸Ð½Ð´ÐµÐºÑ� Ð²Ñ�ÐµÑ… Ñ�Ñ‚Ñ€Ð°Ð½Ð¸Ñ† Ð¸ ÐºÐ°Ñ€Ñ‚Ð° Ñ�Ð°Ð¹Ñ‚Ð° XML Ð´Ð»Ñ� Ð¿Ð¾Ð¸Ñ�ÐºÐ¾Ð²Ñ‹Ñ… Ñ�Ð¸Ñ�Ñ‚ÐµÐ¼.\";s:2:\"zh\";s:84:\"ç«™é»žåœ°åœ–æ¨¡å¡Šå‰µå»ºä¸€å€‹ç´¢å¼•çš„æ‰€æœ‰ç¶²é �å’ŒXMLç¶²ç«™åœ°åœ–æ�œç´¢å¼•æ“Žã€‚\";s:2:\"th\";s:202:\"à¹‚à¸¡à¸”à¸¹à¸¥à¹„à¸‹à¸•à¹Œà¹�à¸¡à¸žà¸ªà¸²à¸¡à¸²à¸£à¸–à¸ªà¸£à¹‰à¸²à¸‡à¸”à¸±à¸Šà¸™à¸µà¸‚à¸­à¸‡à¸«à¸™à¹‰à¸²à¹€à¸§à¹‡à¸šà¸—à¸±à¹‰à¸‡à¸«à¸¡à¸”à¸ªà¸³à¸«à¸£à¸±à¸šà¹€à¸„à¸£à¸·à¹ˆà¸­à¸‡à¸¡à¸·à¸­à¸„à¹‰à¸™à¸«à¸².\";s:2:\"hu\";s:94:\"Ez a modul indexeli az Ã¶sszes oldalt Ã©s egy XML oldaltÃ©kÃ©pet generÃ¡l a keresÅ‘motoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap fÃ¶r sÃ¶kmotorer.\";}',0,1,0,'content',1,1,1,1353274673),(15,'a:5:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"NÃºcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Î Ï…Ï�Î®Î½Î±Ï‚ Î¡Î¿ÏŽÎ½\";s:2:\"se\";s:18:\"Streams grundmodul\";}','streams_core','1.0.0',NULL,'a:5:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"MÃ³dulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de donnÃ©es pour les Flux.\";s:2:\"el\";s:113:\"Î Ï�Î¿Î³Ï�Î±Î¼Î¼Î±Ï„Î¹ÏƒÏ„Î¹ÎºÏŒÏ‚ Ï€Ï…Ï�Î®Î½Î±Ï‚ Î³Î¹Î± Ï„Î·Î½ Î»ÎµÎ¹Ï„Î¿Ï…Ï�Î³Î¯Î± Ï�Î¿ÏŽÎ½ Î´ÎµÎ´Î¿Î¼Î­Î½Ï‰Î½.\";s:2:\"se\";s:50:\"Streams grundmodul fÃ¶r enklare hantering av data.\";}',1,0,0,'0',1,1,1,1353274673),(16,'a:19:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"Ù‚ÙˆØ§Ù„Ø¨ Ø§Ù„Ø±Ø³Ø§Ø¦Ù„ Ø§Ù„Ø¥Ù„ÙƒØªØ±ÙˆÙ†ÙŠØ©\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Î”Ï…Î½Î±Î¼Î¹ÎºÎ¬ email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fr\";s:17:\"ModÃ¨les d\'emails\";s:2:\"he\";s:12:\"×ª×‘× ×™×•×ª\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiÅ¡kÅ³ Å¡ablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Ð¨Ð°Ð±Ð»Ð¾Ð½Ñ‹ Ð¿Ð¾Ñ‡Ñ‚Ñ‹\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"zh\";s:12:\"éƒµä»¶ç¯„æœ¬\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"SÃ¤hkÃ¶posti viestipohjat\";s:2:\"th\";s:33:\"à¹�à¸¡à¹ˆà¹�à¸šà¸šà¸­à¸µà¹€à¸¡à¸¥\";s:2:\"se\";s:12:\"E-postmallar\";}','templates','1.1.0',NULL,'a:19:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"Ø£Ù†Ø´Ø¦ØŒ Ø¹Ø¯Ù‘Ù„ ÙˆØ§Ø­Ù�Ø¸ Ù‚ÙˆØ§Ù„Ø¨ Ø§Ù„Ø¨Ø±ÙŠØ¯ Ø§Ù„Ø¥Ù„ÙƒØªØ±Ù†ÙŠ Ø§Ù„Ø¯ÙŠÙ†Ø§Ù…ÙŠÙƒÙŠØ©.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinÃ¢micos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinÃ¢micos\";s:2:\"da\";s:49:\"Opret, redigÃ©r og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Î”Î·Î¼Î¹Î¿Ï…Ï�Î³Î®ÏƒÏ„Îµ, ÎµÏ€ÎµÎ¾ÎµÏ�Î³Î±ÏƒÏ„ÎµÎ¯Ï„Îµ ÎºÎ±Î¹ Î±Ï€Î¿Î¸Î·ÎºÎµÏ�ÏƒÏ„Îµ Î´Ï…Î½Î±Î¼Î¹ÎºÎ¬ email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinÃ¡micas\";s:2:\"fr\";s:61:\"CrÃ©er, Ã©diter et sauver dynamiquement des modÃ¨les d\'emails\";s:2:\"he\";s:54:\"× ×™×”×•×œ ×©×œ ×ª×‘× ×™×•×ª ×“×•×�×¨ ×�×œ×§×˜×¨×•× ×™\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiÅ¡kÅ³ Å¡ablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Ð¡Ð¾Ð·Ð´Ð°Ð²Ð°Ð¹Ñ‚Ðµ, Ñ€ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€ÑƒÐ¹Ñ‚Ðµ Ð¸ Ñ�Ð¾Ñ…Ñ€Ð°Ð½Ñ�Ð¹Ñ‚Ðµ Ð´Ð¸Ð½Ð°Ð¼Ð¸Ñ‡ÐµÑ�ÐºÐ¸Ðµ Ð¿Ð¾Ñ‡Ñ‚Ð¾Ð²Ñ‹Ðµ ÑˆÐ°Ð±Ð»Ð¾Ð½Ñ‹\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"zh\";s:61:\"æ–°å¢žã€�ç·¨è¼¯èˆ‡å„²å­˜å�¯é¡¯ç¤ºå‹•æ…‹è³‡æ–™çš„ email ç¯„æœ¬\";s:2:\"hu\";s:63:\"CsinÃ¡ld, szerkeszd Ã©s mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"LisÃ¤Ã¤, muokkaa ja tallenna dynaamisia sÃ¤hkÃ¶posti viestipohjia.\";s:2:\"th\";s:129:\"à¸�à¸²à¸£à¸ªà¸£à¹‰à¸²à¸‡à¹�à¸�à¹‰à¹„à¸‚à¹�à¸¥à¸°à¸šà¸±à¸™à¸—à¸¶à¸�à¹�à¸¡à¹ˆà¹�à¸šà¸šà¸­à¸µà¹€à¸¡à¸¥à¹�à¸šà¸šà¹„à¸”à¸™à¸²à¸¡à¸´à¸�\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}',1,0,1,'design',1,1,1,1353274673),(17,'a:23:{s:2:\"en\";s:6:\"Themes\";s:2:\"ar\";s:14:\"Ø§Ù„Ø³Ù‘Ù…Ø§Øª\";s:2:\"br\";s:5:\"Temas\";s:2:\"pt\";s:5:\"Temas\";s:2:\"cs\";s:14:\"Motivy vzhledu\";s:2:\"da\";s:6:\"Temaer\";s:2:\"de\";s:6:\"Themen\";s:2:\"el\";s:31:\"Î˜Î­Î¼Î±Ï„Î± Î•Î¼Ï†Î¬Î½Î¹ÏƒÎ·Ï‚\";s:2:\"es\";s:5:\"Temas\";s:2:\"fi\";s:6:\"Teemat\";s:2:\"fr\";s:7:\"ThÃ¨mes\";s:2:\"he\";s:23:\"×¢×¨×›×•×ª × ×•×©×�×™×�\";s:2:\"id\";s:4:\"Tema\";s:2:\"it\";s:4:\"Temi\";s:2:\"lt\";s:5:\"Temos\";s:2:\"nl\";s:7:\"Thema\'s\";s:2:\"pl\";s:6:\"Motywy\";s:2:\"ru\";s:8:\"Ð¢ÐµÐ¼Ñ‹\";s:2:\"sl\";s:8:\"Predloge\";s:2:\"zh\";s:12:\"ä½ˆæ™¯ä¸»é¡Œ\";s:2:\"hu\";s:8:\"Sablonok\";s:2:\"th\";s:9:\"à¸˜à¸µà¸¡\";s:2:\"se\";s:5:\"Teman\";}','themes','1.0',NULL,'a:23:{s:2:\"en\";s:86:\"Allows admins and staff to switch themes, upload new themes, and manage theme options.\";s:2:\"ar\";s:170:\"ØªÙ…ÙƒÙ‘Ù† Ø§Ù„Ø¥Ø¯Ø§Ø±Ø© ÙˆØ£Ø¹Ø¶Ø§Ø¡ Ø§Ù„Ù…ÙˆÙ‚Ø¹ ØªØºÙŠÙŠØ± Ø³Ù�Ù…Ø© Ø§Ù„Ù…ÙˆÙ‚Ø¹ØŒ ÙˆØªØ­Ù…ÙŠÙ„ Ø³Ù…Ø§Øª Ø¬Ø¯ÙŠØ¯Ø© ÙˆØ¥Ø¯Ø§Ø±ØªÙ‡Ø§ Ø¨Ø·Ø±ÙŠÙ‚Ø© Ù…Ø±Ø¦ÙŠØ© Ø³Ù„Ø³Ø©.\";s:2:\"br\";s:125:\"Permite aos administradores e membros da equipe fazer upload de novos temas e gerenciÃ¡-los atravÃ©s de uma interface visual.\";s:2:\"pt\";s:100:\"Permite aos administradores fazer upload de novos temas e geri-los atravÃ©s de uma interface visual.\";s:2:\"cs\";s:106:\"UmoÅ¾Åˆuje administrÃ¡torÅ¯m a dalÅ¡Ã­m osobÃ¡m mÄ›nit vzhled webu, nahrÃ¡vat novÃ© motivy a spravovat je.\";s:2:\"da\";s:108:\"Lader administratore Ã¦ndre websidens tema, uploade nye temaer og hÃ¥ndtÃ©re dem med en mere visual tilgang.\";s:2:\"de\";s:121:\"ErmÃ¶glicht es dem Administrator das Seiten Thema auszuwÃ¤hlen, neue Themen hochzulanden oder diese visuell zu verwalten.\";s:2:\"el\";s:222:\"Î•Ï€Î¹Ï„Ï�Î­Ï€ÎµÎ¹ ÏƒÏ„Î¿Ï…Ï‚ Î´Î¹Î±Ï‡ÎµÎ¹Ï�Î¹ÏƒÏ„Î­Ï‚ Î½Î± Î±Î»Î»Î¬Î¾Î¿Ï…Î½ Ï„Î¿ Î¸Î­Î¼Î± Ï€Ï�Î¿Î²Î¿Î»Î®Ï‚ Ï„Î¿Ï… Î¹ÏƒÏ„Î¿Ï„ÏŒÏ€Î¿Ï… Î½Î± Î±Î½ÎµÎ²Î¬ÏƒÎ¿Ï…Î½ Î½Î­Î± Î¸Î­Î¼Î±Ï„Î± ÎºÎ±Î¹ Î½Î± Ï„Î± Î´Î¹Î±Ï‡ÎµÎ¹Ï�Î¹ÏƒÏ„Î¿Ï�Î½.\";s:2:\"es\";s:132:\"Permite a los administradores y miembros del personal cambiar el tema del sitio web, subir nuevos temas y manejar los ya existentes.\";s:2:\"fi\";s:129:\"Mahdollistaa sivuston teeman vaihtamisen, uusien teemojen lataamisen ja niiden hallinnoinnin visuaalisella kÃ¤yttÃ¶liittymÃ¤llÃ¤.\";s:2:\"fr\";s:144:\"Permet aux administrateurs et au personnel de modifier le thÃ¨me du site, de charger de nouveaux thÃ¨mes et de le gÃ©rer de faÃ§on plus visuelle\";s:2:\"he\";s:63:\"× ×™×”×•×œ ×©×œ ×¢×¨×›×•×ª × ×•×©×�×™×� ×©×•× ×•×ª - ×¢×™×¦×•×‘\";s:2:\"id\";s:104:\"Memungkinkan admin dan staff untuk mengubah tema tampilan, mengupload tema baru, dan mengatur opsi tema.\";s:2:\"it\";s:120:\"Permette ad amministratori e staff di cambiare il tema del sito, carica nuovi temi e gestiscili in um modo piÃ¹ visuale.\";s:2:\"lt\";s:105:\"LeidÅ¾iama administratoriams ir personalui keisti puslapio temÄ…, Ä¯kraunant naujÄ… temÄ… ir valdyti jÄ….\";s:2:\"nl\";s:153:\"Maakt het voor administratoren en medewerkers mogelijk om het thema van de website te wijzigen, nieuwe thema&apos;s te uploaden en ze visueel te beheren.\";s:2:\"pl\";s:100:\"UmoÅ¼liwia administratorowi zmianÄ™ motywu strony, wgrywanie nowych motywÃ³w oraz zarzÄ…dzanie nimi.\";s:2:\"ru\";s:102:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ñ‚ÐµÐ¼Ð°Ð¼Ð¸ Ð¾Ñ„Ð¾Ñ€Ð¼Ð»ÐµÐ½Ð¸Ñ� Ñ�Ð°Ð¹Ñ‚Ð°, Ð·Ð°Ð³Ñ€ÑƒÐ·ÐºÐ° Ð½Ð¾Ð²Ñ‹Ñ… Ñ‚ÐµÐ¼.\";s:2:\"sl\";s:133:\"Dovoljuje adminom in osebju spremembo izgleda spletne strani, namestitev novega izgleda in urejanja le tega v bolj vizualnem pristopu\";s:2:\"zh\";s:108:\"è®“ç®¡ç�†è€…å�¯ä»¥æ›´æ”¹ç¶²ç«™é¡¯ç¤ºé¢¨è²Œï¼Œä»¥è¦–è¦ºåŒ–çš„æ“�ä½œä¸Šå‚³ä¸¦ç®¡ç�†é€™äº›ç¶²ç«™ä½ˆæ™¯ä¸»é¡Œã€‚\";s:2:\"th\";s:219:\"à¸Šà¹ˆà¸§à¸¢à¹ƒà¸«à¹‰à¸œà¸¹à¹‰à¸”à¸¹à¹�à¸¥à¸£à¸°à¸šà¸šà¸ªà¸²à¸¡à¸²à¸£à¸–à¸­à¸±à¸›à¹‚à¸«à¸¥à¸”à¸£à¸¹à¸›à¹�à¸šà¸šà¹ƒà¸«à¸¡à¹ˆà¹�à¸¥à¸°à¸�à¸²à¸£à¸ˆà¸±à¸”à¸�à¸²à¸£à¸•à¸±à¸§à¹€à¸¥à¸·à¸­à¸�à¸Šà¸¸à¸”à¸£à¸¹à¸›à¹�à¸šà¸šà¹„à¸”à¹‰\";s:2:\"hu\";s:107:\"Az adminok megvÃ¡ltoztathatjÃ¡k az oldal kinÃ©zetÃ©t, feltÃ¶lthetnek Ãºj kinÃ©zeteket Ã©s kezelhetik Å‘ket.\";s:2:\"se\";s:94:\"Hantera webbplatsens utseende genom teman, ladda upp nya teman och hantera temainstÃ¤llningar.\";}',0,0,1,'design',1,1,1,1353274673),(18,'a:23:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"Ø§Ù„Ù…Ø³ØªØ®Ø¯Ù…ÙˆÙ†\";s:2:\"br\";s:9:\"UsuÃ¡rios\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"UÅ¾ivatelÃ©\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Î§Ï�Î®ÏƒÏ„ÎµÏ‚\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fi\";s:12:\"KÃ¤yttÃ¤jÃ¤t\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"×ž×©×ª×ž×©×™×�\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"UÅ¼ytkownicy\";s:2:\"ru\";s:24:\"ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ð¸\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"zh\";s:6:\"ç”¨æˆ¶\";s:2:\"hu\";s:14:\"FelhasznÃ¡lÃ³k\";s:2:\"th\";s:27:\"à¸œà¸¹à¹‰à¹ƒà¸Šà¹‰à¸‡à¸²à¸™\";s:2:\"se\";s:10:\"AnvÃ¤ndare\";}','users','0.9',NULL,'a:23:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"ØªÙ…ÙƒÙŠÙ† Ø§Ù„Ù…Ø³ØªØ®Ø¯Ù…ÙŠÙ† Ù…Ù† Ø§Ù„ØªØ³Ø¬ÙŠÙ„ ÙˆØ§Ù„Ø¯Ø®ÙˆÙ„ Ø¥Ù„Ù‰ Ø§Ù„Ù…ÙˆÙ‚Ø¹ØŒ ÙˆØ¥Ø¯Ø§Ø±ØªÙ‡Ù… Ù…Ù† Ù„ÙˆØ­Ø© Ø§Ù„ØªØ­ÙƒÙ….\";s:2:\"br\";s:125:\"Permite com que usuÃ¡rios se registrem e entrem no site e tambÃ©m que eles sejam gerenciÃ¡veis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e tambÃ©m que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"UmoÅ¾Åˆuje uÅ¾ivatelÅ¯m se registrovat a pÅ™ihlaÅ¡ovat a zÃ¡roveÅˆ jejich sprÃ¡vu v KontrolnÃ­m panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind pÃ¥ sitet, og hÃ¥ndtÃ©r dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie Ã¼ber die Admin-OberflÃ¤che.\";s:2:\"el\";s:208:\"Î Î±Ï�Î­Ï‡ÎµÎ¹ Î»ÎµÎ¹Ï„Î¿Ï…Ï�Î³Î¯ÎµÏ‚ ÎµÎ³Î³Ï�Î±Ï†Î®Ï‚ ÎºÎ±Î¹ ÏƒÏ�Î½Î´ÎµÏƒÎ·Ï‚ ÏƒÏ„Î¿Ï…Ï‚ ÎµÏ€Î¹ÏƒÎºÎ­Ï€Ï„ÎµÏ‚. Î•Ï€Î¯ÏƒÎ·Ï‚ Î±Ï€ÏŒ ÎµÎ´ÏŽ Î³Î¯Î½ÎµÏ„Î±Î¹ Î· Î´Î¹Î±Ï‡ÎµÎ¯Ï�Î¹ÏƒÎ· Ï„Ï‰Î½ Î»Î¿Î³Î±Ï�Î¹Î±ÏƒÎ¼ÏŽÎ½.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrÃ¡n loguearse en el sitio. Estos podrÃ¡n controlarse desde el panel de administraciÃ³n.\";s:2:\"fi\";s:126:\"Antaa kÃ¤yttÃ¤jien rekisterÃ¶ityÃ¤ ja kirjautua sisÃ¤Ã¤n sivustolle sekÃ¤ mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gÃ©rer via le panneau de contrÃ´le\";s:2:\"he\";s:62:\"× ×™×”×•×œ ×ž×©×ª×ž×©×™×�: ×¨×™×©×•×�, ×”×¤×¢×œ×” ×•×ž×—×™×§×”\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"LeidÅ¾ia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"PozwÃ³l uÅ¼ytkownikom na logowanie siÄ™ na stronie i zarzÄ…dzaj nimi za pomocÄ… panelu.\";s:2:\"ru\";s:155:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð·Ð°Ñ€ÐµÐ³Ð¸Ñ�Ñ‚Ñ€Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ñ‹Ð¼Ð¸ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ñ�Ð¼Ð¸, Ð°ÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ð½Ð¾Ð²Ñ‹Ñ… Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne ploÅ¡Ä�e\";s:2:\"zh\";s:87:\"è®“ç”¨æˆ¶å�¯ä»¥è¨»å†Šä¸¦ç™»å…¥ç¶²ç«™ï¼Œä¸¦ä¸”ç®¡ç�†è€…å�¯åœ¨æŽ§åˆ¶å�°å…§é€²è¡Œç®¡ç�†ã€‚\";s:2:\"th\";s:210:\"à¹ƒà¸«à¹‰à¸œà¸¹à¹‰à¹ƒà¸Šà¹‰à¸¥à¸‡à¸—à¸°à¹€à¸šà¸µà¸¢à¸™à¹�à¸¥à¸°à¹€à¸‚à¹‰à¸²à¸ªà¸¹à¹ˆà¹€à¸§à¹‡à¸šà¹„à¸‹à¸•à¹Œà¹�à¸¥à¸°à¸ˆà¸±à¸”à¸�à¸²à¸£à¸�à¸±à¸šà¸žà¸§à¸�à¹€à¸‚à¸²à¸œà¹ˆà¸²à¸™à¸—à¸²à¸‡à¹�à¸œà¸‡à¸„à¸§à¸šà¸„à¸¸à¸¡\";s:2:\"hu\";s:120:\"Hogy a felhasznÃ¡lÃ³k tudjanak az oldalra regisztrÃ¡lni Ã©s belÃ©pni, valamint lehessen Å‘ket kezelni a vezÃ©rlÅ‘pulton.\";s:2:\"se\";s:111:\"LÃ¥t dina besÃ¶kare registrera sig och logga in pÃ¥ webbplatsen. Hantera sedan anvÃ¤ndarna via kontrollpanelen.\";}',0,0,1,'0',1,1,1,1353274673),(19,'a:23:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"Ø§Ù„Ù…ØªØºÙŠÙ‘Ø±Ø§Øª\";s:2:\"br\";s:10:\"VariÃ¡veis\";s:2:\"pt\";s:10:\"VariÃ¡veis\";s:2:\"cs\";s:10:\"PromÄ›nnÃ©\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"ÎœÎµÏ„Î±Î²Î»Î·Ï„Î­Ï‚\";s:2:\"es\";s:9:\"Variables\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"×ž×©×ª× ×™×�\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"ÐŸÐµÑ€ÐµÐ¼ÐµÐ½Ð½Ñ‹Ðµ\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"zh\";s:12:\"ç³»çµ±è®Šæ•¸\";s:2:\"hu\";s:10:\"VÃ¡ltozÃ³k\";s:2:\"th\";s:18:\"à¸•à¸±à¸§à¹�à¸›à¸£\";s:2:\"se\";s:9:\"Variabler\";}','variables','0.4',NULL,'a:23:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù…Ù�ØªØºÙŠÙ‘Ø±Ø§Øª Ø§Ù„Ø¹Ø§Ù…Ø© Ù„Ø§Ø³ØªØ®Ø¯Ø§Ù…Ù‡Ø§ Ù�ÙŠ Ø£Ø±Ø¬Ø§Ø¡ Ø§Ù„Ù…ÙˆÙ‚Ø¹.\";s:2:\"br\";s:61:\"Gerencia as variÃ¡veis globais acessÃ­veis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variÃ¡veis globais acessÃ­veis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globÃ¡lnÃ­ promÄ›nnÃ© pÅ™Ã­stupnÃ© odkudkoliv.\";s:2:\"da\";s:51:\"HÃ¥ndtÃ©r globale variable som kan tilgÃ¥s overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von Ã¼berall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Î”Î¹Î±Ï‡ÎµÎ¯Ï�Î¹ÏƒÎ· Î¼ÎµÏ„Î±Î²Î»Î·Ï„ÏŽÎ½ Ï€Î¿Ï… ÎµÎ¯Î½Î±Î¹ Ï€Ï�Î¿ÏƒÎ²Î¬ÏƒÎ¹Î¼ÎµÏ‚ Î±Ï€ÏŒ Ï€Î±Î½Ï„Î¿Ï� ÏƒÏ„Î¿Î½ Î¹ÏƒÏ„ÏŒÏ„Î¿Ï€Î¿.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pÃ¤Ã¤see kÃ¤siksi mistÃ¤ vain.\";s:2:\"fr\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"he\";s:96:\"× ×™×”×•×œ ×ž×©×ª× ×™×� ×’×œ×•×‘×œ×™×™×� ×�×©×¨ × ×™×ª× ×™×� ×œ×”×ž×¨×” ×‘×›×œ ×—×œ×§×™ ×”×�×ª×¨\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"GlobaliÅ³ kintamujÅ³ tvarkymas kurie yra pasiekiami iÅ¡ bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"ZarzÄ…dzaj globalnymi zmiennymi do ktÃ³rych masz dostÄ™p z kaÅ¼dego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð³Ð»Ð¾Ð±Ð°Ð»ÑŒÐ½Ñ‹Ð¼Ð¸ Ð¿ÐµÑ€ÐµÐ¼ÐµÐ½Ð½Ñ‹Ð¼Ð¸, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ðµ Ð´Ð¾Ñ�Ñ‚ÑƒÐ¿Ð½Ñ‹ Ð² Ð»ÑŽÐ±Ð¾Ð¼ Ð¼ÐµÑ�Ñ‚Ðµ Ñ�Ð°Ð¹Ñ‚Ð°.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"à¸ˆà¸±à¸”à¸�à¸²à¸£à¸•à¸±à¸§à¹�à¸›à¸£à¸—à¸±à¹ˆà¸§à¹„à¸›à¹‚à¸”à¸¢à¸—à¸µà¹ˆà¸ªà¸²à¸¡à¸²à¸£à¸–à¹€à¸‚à¹‰à¸²à¸–à¸¶à¸‡à¹„à¸”à¹‰à¸ˆà¸²à¸�à¸—à¸¸à¸�à¸—à¸µà¹ˆ.\";s:2:\"zh\";s:45:\"ç®¡ç�†æ­¤ç¶²ç«™å…§å�¯å­˜å�–çš„å…¨å±€è®Šæ•¸ã€‚\";s:2:\"hu\";s:62:\"GlobÃ¡lis vÃ¡ltozÃ³k kezelÃ©se a hozzÃ¡fÃ©rÃ©shez, bÃ¡rhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avÃ¤ndas Ã¶ver hela webbplatsen.\";}',0,0,1,'content',1,1,1,1353274673),(20,'a:20:{s:2:\"en\";s:7:\"Widgets\";s:2:\"ar\";s:12:\"Ø§Ù„ÙˆØ¯Ø¬Øª\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fi\";s:8:\"Widgetit\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Ð’Ð¸Ð´Ð¶ÐµÑ‚Ñ‹\";s:2:\"sl\";s:9:\"VtiÄ�niki\";s:2:\"zh\";s:9:\"å°�çµ„ä»¶\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"à¸§à¸´à¸”à¹€à¸ˆà¹‡à¸•\";s:2:\"se\";s:8:\"Widgetar\";}','widgets','1.1',NULL,'a:21:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:138:\"Ø¥Ø¯Ø§Ø±Ø© Ø£Ù‚Ø³Ø§Ù… ØµØºÙŠØ±Ø© Ù…Ù† Ø§Ù„Ø¨Ø±Ù…Ø¬ÙŠØ§Øª Ù�ÙŠ Ù…Ø³Ø§Ø­Ø§Øª Ø§Ù„Ù…ÙˆÙ‚Ø¹ Ø£Ùˆ Ù…Ø§ ÙŠÙ�Ø³Ù…Ù‘Ù‰ Ø¨Ø§Ù„Ù€\"ÙˆÙ�Ø¯Ù’Ø¬Ù�ØªÙ’\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seÃ§Ãµes de conteÃºdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secÃ§Ãµes de conteÃºdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malÃ© funkÄ�nÃ­ Ä�Ã¡sti webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"HÃ¥ndter smÃ¥ sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentstÃ¤ndige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Î”Î¹Î±Ï‡ÎµÎ¯Ï�Î¹ÏƒÎ· Î¼Î¹ÎºÏ�ÏŽÎ½ Ï„Î¼Î·Î¼Î¬Ï„Ï‰Î½ Î±Ï…Ï„ÏŒÎ½Î¿Î¼Î·Ï‚ Ï€Ï�Î¿Î³Ï�Î±Î¼Î¼Î±Ï„Î¹ÏƒÏ„Î¹ÎºÎ®Ï‚ Î»Î¿Î³Î¹ÎºÎ®Ï‚ ÏƒÎµ Ï€ÎµÎ´Î¯Î± Î® \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeÃ±as secciones de lÃ³gica autocontenida en bloques o \"Widgets\"\";s:2:\"fi\";s:83:\"Hallitse pieniÃ¤ osioita, jotka sisÃ¤ltÃ¤vÃ¤t erillisiÃ¤ lohkoja tai \"WidgettejÃ¤\".\";s:2:\"fr\";s:41:\"GÃ©rer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"NedideliÅ³, savarankiÅ¡kÅ³ blokÅ³ valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð½ÐµÐ±Ð¾Ð»ÑŒÑˆÐ¸Ð¼Ð¸, Ñ�Ð°Ð¼Ð¾Ñ�Ñ‚Ð¾Ñ�Ñ‚ÐµÐ»ÑŒÐ½Ñ‹Ð¼Ð¸ Ð±Ð»Ð¾ÐºÐ°Ð¼Ð¸.\";s:2:\"sl\";s:61:\"Urejanje manjÅ¡ih delov blokov strani ti. VtiÄ�niki (Widgets)\";s:2:\"zh\";s:103:\"å�¯å°‡å°�æ®µçš„ç¨‹å¼�ç¢¼é€�é�Žå°�çµ„ä»¶ä¾†ç®¡ç�†ã€‚å�³æ‰€è¬‚ \"Widgets\"ï¼Œæˆ–ç¨±ç‚ºå°�å·¥å…·ã€�éƒ¨ä»¶ã€‚\";s:2:\"hu\";s:56:\"Ã–nÃ¡llÃ³ kis logikai tÃ¶mbÃ¶k vagy widget-ek kezelÃ©se.\";s:2:\"th\";s:152:\"à¸ˆà¸±à¸”à¸�à¸²à¸£à¸ªà¹ˆà¸§à¸™à¹€à¸¥à¹‡à¸� à¹† à¹ƒà¸™à¸£à¸¹à¸›à¹�à¸šà¸šà¸‚à¸­à¸‡à¸•à¸±à¸§à¹€à¸­à¸‡à¹ƒà¸™à¸šà¸¥à¹‡à¸­à¸�à¸«à¸£à¸·à¸­à¸§à¸´à¸”à¹€à¸ˆà¹‡à¸•\";s:2:\"se\";s:83:\"Hantera smÃ¥ sektioner med egen logik och innehÃ¥ll pÃ¥ olika delar av webbplatsen.\";}',1,0,1,'content',1,1,1,1353274673),(21,'a:3:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";}','wysiwyg','1.0',NULL,'a:4:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Î Î±Ï�Î­Ï‡ÎµÎ¹ Ï„Î¿Î½ ÎµÏ€ÎµÎ¾ÎµÏ�Î³Î±ÏƒÏ„Î® WYSIWYG Î³Î¹Î± Ï„Î¿ PyroCMS, Ï‡Ï�Î·ÏƒÎ¹Î¼Î¿Ï€Î¿Î¹ÎµÎ¯ Ï„Î¿ CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul fÃ¶r HTML, CKEditor.\";}',0,0,0,'0',1,1,1,1353274673);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_profiles`
--

LOCK TABLES `default_profiles` WRITE;
/*!40000 ALTER TABLE `default_profiles` DISABLE KEYS */;
INSERT INTO `default_profiles` VALUES (1,NULL,NULL,NULL,NULL,1,'Le Hung','Le','Hung',NULL,'en','&lt;html&gt;&lt;/html>',0,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1356769936),(2,'2012-12-27 03:32:33',NULL,NULL,1,2,'asdfff.sdff','asdfff','sdff',NULL,'en',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `default_settings` VALUES ('activation_email','Activation Email','Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.','radio','1','0','1=Enabled|0=Disabled',0,1,'users',961),('addons_upload','Addons Upload Permissions','Keeps mere admins from uploading addons by default','text','0','1','',1,0,'',0),('admin_force_https','Force HTTPS for Control Panel?','Allow only the HTTPS protocol when using the Control Panel?','radio','0','','1=Yes|0=No',1,1,'',0),('admin_theme','Control Panel Theme','Select the theme for the control panel.','','','pyrocms','func:get_themes',1,0,'',0),('akismet_api_key','Akismet API Key','Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.','text','','','',0,1,'integration',981),('api_enabled','API Enabled','Allow API access to all modules which have an API controller.','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('api_user_keys','API User Keys','Allow users to sign up for API keys (if the API is Enabled).','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('auto_username','Auto Username','Create the username automatically, meaning users can skip making one on registration.','radio','1','','1=Enabled|0=Disabled',0,1,'users',964),('cdn_domain','CDN Domain','CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.','text','','','',0,1,'integration',1000),('ckeditor_config','CKEditor Config','You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>','textarea','','{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(\'textarea.blog.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'pyroimages\'],\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	extraPlugins: \'pyroimages\',\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(\'textarea.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\']\r\n	  ],\r\n	width: \'99%\',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(\'textarea.wysiwyg-advanced\').ckeditor({\r\n	toolbar: [\r\n		[\'Maximize\'],\r\n		[\'pyroimages\', \'pyrofiles\'],\r\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\r\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\r\n		[\'Link\',\'Unlink\'],\r\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\r\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\r\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\r\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	],\r\n	extraPlugins: \'pyroimages,pyrofiles\',\r\n	width: \'99%\',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	removePlugins: \'elementspath\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});','',1,1,'wysiwyg',993),('comment_markdown','Allow Markdown','Do you want to allow visitors to post comments using Markdown?','select','0','0','0=Text Only|1=Allow Markdown',1,1,'comments',965),('comment_order','Comment Order','Sort order in which to display comments.','select','ASC','ASC','ASC=Oldest First|DESC=Newest First',1,1,'comments',966),('contact_email','Contact E-mail','All e-mails from users, guests and the site will go to this e-mail address.','text','lehung@ymail.com','','',1,1,'email',979),('currency','Currency','The currency symbol for use on products, services, etc.','text','&pound;','','',1,1,'',994),('dashboard_rss','Dashboard RSS Feed','Link to an RSS feed that will be displayed on the dashboard.','text','https://www.pyrocms.com/blog/rss/all.rss','','',0,1,'',990),('dashboard_rss_count','Dashboard RSS Items','How many RSS items would you like to display on the dashboard?','text','5','5','',1,1,'',989),('date_format','Date Format','How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.','text','Y-m-d','','',1,1,'',995),('default_theme','Default Theme','Select the theme you want users to see by default.','','default','default','func:get_themes',1,0,'',0),('enable_comments','Enable Comments','Enable comments.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',968),('enable_profiles','Enable profiles','Allow users to add and edit profiles.','radio','1','','1=Enabled|0=Disabled',1,1,'users',963),('enable_registration','Enable user registration','Allow users to register in your site.','radio','1','','1=Enabled|0=Disabled',0,1,'users',961),('files_cache','Files Cache','When outputting an image via site.com/files what shall we set the cache expiration for?','select','480','480','0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days',1,1,'files',986),('files_cf_api_key','Rackspace Cloud Files API Key','You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.','text','','','',0,1,'files',989),('files_cf_username','Rackspace Cloud Files Username','To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>','text','','','',0,1,'files',990),('files_enabled_providers','Enabled File Storage Providers','Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below','checkbox','0','0','amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files',0,1,'files',994),('files_s3_access_key','Amazon S3 Access Key','To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>','text','','','',0,1,'files',993),('files_s3_geographic_location','Amazon S3 Geographic Location','Either US or EU. If you change this you must also change the S3 URL.','radio','US','US','US=United States|EU=Europe',1,1,'files',991),('files_s3_secret_key','Amazon S3 Secret Key','You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.','text','','','',0,1,'files',992),('files_s3_url','Amazon S3 URL','Change this if using one of Amazon\'s EU locations or a custom domain.','text','http://{{ bucket }}.s3.amazonaws.com/','http://{{ bucket }}.s3.amazonaws.com/','',0,1,'files',991),('files_upload_limit','Filesize Limit','Maximum filesize to allow when uploading. Specify the size in MB. Example: 5','text','5','5','',1,1,'files',987),('frontend_enabled','Site Status','Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.','radio','1','','1=Open|0=Closed',1,1,'',988),('ga_email','Google Analytic E-mail','E-mail address used for Google Analytics, we need this to show the graph on the dashboard.','text','','','',0,1,'integration',983),('ga_password','Google Analytic Password','This is also needed this to show the graph on the dashboard.','password','','','',0,1,'integration',982),('ga_profile','Google Analytic Profile ID','Profile ID for this website in Google Analytics','text','','','',0,1,'integration',984),('ga_tracking','Google Tracking Code','Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6','text','','','',0,1,'integration',985),('mail_protocol','Mail Protocol','Select desired email protocol.','select','mail','mail','mail=Mail|sendmail=Sendmail|smtp=SMTP',1,1,'email',977),('mail_sendmail_path','Sendmail Path','Path to server sendmail binary.','text','','','',0,1,'email',972),('mail_smtp_host','SMTP Host Name','The host name of your smtp server.','text','','','',0,1,'email',976),('mail_smtp_pass','SMTP password','SMTP password.','password','','','',0,1,'email',975),('mail_smtp_port','SMTP Port','SMTP port number.','text','','','',0,1,'email',974),('mail_smtp_user','SMTP User Name','SMTP user name.','text','','','',0,1,'email',973),('meta_topic','Meta Topic','Two or three words describing this type of company/website.','text','Content Management','Add your slogan here','',0,1,'',998),('moderate_comments','Moderate Comments','Force comments to be approved before they appear on the site.','radio','1','1','1=Enabled|0=Disabled',1,1,'comments',967),('records_per_page','Records Per Page','How many records should we show per page in the admin section?','select','25','','10=10|25=25|50=50|100=100',1,1,'',992),('registered_email','User Registered Email','Send a notification email to the contact e-mail when someone registers.','radio','1','','1=Enabled|0=Disabled',0,1,'users',962),('require_lastname','Require last names?','For some situations, a last name may not be required. Do you want to force users to enter one or not?','radio','1','','1=Required|0=Optional',1,1,'users',962),('rss_feed_items','Feed item count','How many items should we show in RSS/blog feeds?','select','25','','10=10|25=25|50=50|100=100',1,1,'',991),('server_email','Server E-mail','All e-mails to users will come from this e-mail address.','text','admin@localhost','','',1,1,'email',978),('site_lang','Site Language','The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.','select','en','en','func:get_supported_lang',1,1,'',997),('site_name','Site Name','The name of the website for page titles and for use around the site.','text','Un-named Website','','',1,1,'',1000),('site_public_lang','Public Languages','Which are the languages really supported and offered on the front-end of your website?','checkbox','en','en','func:get_supported_lang',1,1,'',996),('site_slogan','Site Slogan','The slogan of the website for page titles and for use around the site','text','','Add your slogan here','',0,1,'',999),('twitter_cache','Cache time','How many minutes should your Tweets be stored?','text','300','','',0,1,'twitter',969),('twitter_feed_count','Feed Count','How many tweets should be returned to the Twitter feed block?','text','5','','',0,1,'twitter',970),('twitter_username','Username','Twitter username.','text','','','',0,1,'twitter',971),('unavailable_message','Unavailable Message','When the site is turned off or there is a major problem, this message will show to users.','textarea','Sorry, this website is currently unavailable.','','',0,1,'',987);
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
INSERT INTO `default_theme_options` VALUES (1,'pyrocms_recent_comments','Recent Comments','Would you like to display recent comments on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(2,'pyrocms_news_feed','News Feed','Would you like to display the news feed on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(3,'pyrocms_quick_links','Quick Links','Would you like to display quick links on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(4,'pyrocms_analytics_graph','Analytics Graph','Would you like to display the graph on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(5,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'default'),(6,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'default'),(7,'cufon_enabled','Use Cufon','Would you like to use Cufon for titles?','radio','yes','yes','yes=Yes|no=No',1,'default'),(8,'background','Background','Choose the default background for the theme.','select','fabric','fabric','black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture',1,'base'),(9,'slider','Slider','Would you like to display the slider on the homepage?','radio','yes','yes','yes=Yes|no=No',1,'base'),(10,'color','Default Theme Color','This changes things like background color, link colors etcâ€¦','select','pink','pink','red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink',1,'base'),(11,'show_breadcrumbs','Do you want to show breadcrumbs?','If selected it shows a string of breadcrumbs at the top of the page.','radio','yes','yes','yes=Yes|no=No',1,'base');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_users`
--

LOCK TABLES `default_users` WRITE;
/*!40000 ALTER TABLE `default_users` DISABLE KEYS */;
INSERT INTO `default_users` VALUES (1,'lehung@ymail.com','08a90ba49607708532b8b7498265814a8a658321','bdb3a',1,'',1,'',1353209396,1356768380,'administrator',NULL,'f77cdb88c91dc6fbe492d3a29ad24985225534f2'),(2,'abc@aaa.com','74ac4f01dffdaf163ecf93566811ffe564a5941c','f6f788',2,'0.0.0.0',0,'26b9a354f59b99e3e4ab63a34c851a819e89b6f1',1356579152,1356579152,'asdfff.sdff',NULL,NULL);
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
-- Table structure for table `r_booking`
--

DROP TABLE IF EXISTS `r_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `booking_status_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `travel_date` datetime NOT NULL,
  `phone_area_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `book_by_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `FK_r_booking_tour` (`tour_id`),
  KEY `FK_r_booking_booking_status` (`booking_status_id`),
  KEY `FK_r_booking_user` (`book_by_id`),
  CONSTRAINT `FK_r_booking_booking_status` FOREIGN KEY (`booking_status_id`) REFERENCES `r_booking_status` (`booking_status_id`),
  CONSTRAINT `FK_r_booking_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`),
  CONSTRAINT `FK_r_booking_user` FOREIGN KEY (`book_by_id`) REFERENCES `default_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_booking`
--

LOCK TABLES `r_booking` WRITE;
/*!40000 ALTER TABLE `r_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_booking_status`
--

DROP TABLE IF EXISTS `r_booking_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_booking_status` (
  `booking_status_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`booking_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_booking_status`
--

LOCK TABLES `r_booking_status` WRITE;
/*!40000 ALTER TABLE `r_booking_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_booking_status` ENABLE KEYS */;
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
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_country`
--

LOCK TABLES `r_country` WRITE;
/*!40000 ALTER TABLE `r_country` DISABLE KEYS */;
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
-- Table structure for table `r_photo`
--

DROP TABLE IF EXISTS `r_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `posted_by_id` smallint(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `FK_r_photo` (`posted_by_id`),
  CONSTRAINT `FK_r_photo` FOREIGN KEY (`posted_by_id`) REFERENCES `default_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_photo`
--

LOCK TABLES `r_photo` WRITE;
/*!40000 ALTER TABLE `r_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_photo` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour`
--

LOCK TABLES `r_tour` WRITE;
/*!40000 ALTER TABLE `r_tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_tour` ENABLE KEYS */;
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
  `title` varchar(2056) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `introduction` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `highlight` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `scheduler` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `additional_info` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`tour_detail_id`),
  KEY `FK_r_tour_detail_tour` (`tour_id`),
  CONSTRAINT `FK_r_tour_detail_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_detail`
--

LOCK TABLES `r_tour_detail` WRITE;
/*!40000 ALTER TABLE `r_tour_detail` DISABLE KEYS */;
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
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`tour_photo_id`),
  KEY `FK_r_tour_photo_tour` (`tour_id`),
  KEY `FK_r_tour_photo_photo` (`photo_id`),
  CONSTRAINT `FK_r_tour_photo_photo` FOREIGN KEY (`photo_id`) REFERENCES `r_photo` (`photo_id`),
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
-- Table structure for table `r_tour_price`
--

DROP TABLE IF EXISTS `r_tour_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_tour_price` (
  `tour_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apply_from_date` datetime NOT NULL,
  `apply_to_date` datetime NOT NULL,
  `adult_price` float NOT NULL,
  `child_price` float NOT NULL,
  PRIMARY KEY (`tour_price_id`),
  KEY `FK_r_tour_price_tour` (`tour_id`),
  CONSTRAINT `FK_r_tour_price_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_tour_price`
--

LOCK TABLES `r_tour_price` WRITE;
/*!40000 ALTER TABLE `r_tour_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_tour_price` ENABLE KEYS */;
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
  `booking_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `first_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-24  7:20:21
