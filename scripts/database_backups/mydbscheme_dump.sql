-- MySQL dump 10.13  Distrib 5.7.10, for osx10.11 (x86_64)
--
-- Host: localhost    Database: doc_genius_starter
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `acad_entity_scores`
--

DROP TABLE IF EXISTS `acad_entity_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acad_entity_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `average_value` decimal(10,0) DEFAULT NULL,
  `max_value` decimal(10,0) DEFAULT NULL,
  `last_value` decimal(10,0) DEFAULT NULL,
  `time_spent` decimal(10,0) DEFAULT NULL,
  `passed_count` int(11) DEFAULT NULL,
  `failed_count` int(11) DEFAULT NULL,
  `seen_count` int(11) DEFAULT NULL,
  `percentile` decimal(10,0) DEFAULT NULL,
  `acad_entity_type` varchar(255) DEFAULT NULL,
  `acad_entity_id` int(11) DEFAULT NULL,
  `attempt_score_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_acad_entity_scores_on_acad_entity_type_and_acad_entity_id` (`acad_entity_type`,`acad_entity_id`),
  KEY `index_acad_entity_scores_on_attempt_score_id` (`attempt_score_id`),
  CONSTRAINT `fk_rails_71a4d711dd` FOREIGN KEY (`attempt_score_id`) REFERENCES `attempt_scores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acad_entity_scores`
--

LOCK TABLES `acad_entity_scores` WRITE;
/*!40000 ALTER TABLE `acad_entity_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `acad_entity_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_options`
--

DROP TABLE IF EXISTS `answer_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `correct` tinyint(1) DEFAULT NULL,
  `word_question_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_answer_options_on_word_question_id` (`word_question_id`),
  CONSTRAINT `fk_rails_d903929a88` FOREIGN KEY (`word_question_id`) REFERENCES `word_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_options`
--

LOCK TABLES `answer_options` WRITE;
/*!40000 ALTER TABLE `answer_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-07-04 15:26:18','2017-07-04 15:26:18');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attempt_scores`
--

DROP TABLE IF EXISTS `attempt_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attempt_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(10,0) DEFAULT NULL,
  `time_taken` decimal(10,0) DEFAULT NULL,
  `correct_count` int(11) DEFAULT NULL,
  `incorrect_count` int(11) DEFAULT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  `failed` tinyint(1) DEFAULT NULL,
  `game_attempt_id` int(11) DEFAULT NULL,
  `game_holder_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attempt_scores_on_game_attempt_id` (`game_attempt_id`),
  KEY `index_attempt_scores_on_game_holder_id` (`game_holder_id`),
  CONSTRAINT `fk_rails_0d1769df43` FOREIGN KEY (`game_attempt_id`) REFERENCES `game_attempts` (`id`),
  CONSTRAINT `fk_rails_4e31874eb9` FOREIGN KEY (`game_holder_id`) REFERENCES `game_holders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attempt_scores`
--

LOCK TABLES `attempt_scores` WRITE;
/*!40000 ALTER TABLE `attempt_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `attempt_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_tokens_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_0d66c22f4c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_questions`
--

DROP TABLE IF EXISTS `auto_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_tag` varchar(255) DEFAULT NULL,
  `answer_tag` varchar(255) DEFAULT NULL,
  `question_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auto_questions_on_question_type_id` (`question_type_id`),
  CONSTRAINT `fk_rails_5cbf8d14f6` FOREIGN KEY (`question_type_id`) REFERENCES `question_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_questions`
--

LOCK TABLES `auto_questions` WRITE;
/*!40000 ALTER TABLE `auto_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benifits`
--

DROP TABLE IF EXISTS `benifits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benifits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `explainer` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benifits`
--

LOCK TABLES `benifits` WRITE;
/*!40000 ALTER TABLE `benifits` DISABLE KEYS */;
/*!40000 ALTER TABLE `benifits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chapters`
--

DROP TABLE IF EXISTS `chapters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `seq_stream` int(11) DEFAULT NULL,
  `seq_standard` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `stream_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_chapters_on_subject_id` (`subject_id`),
  KEY `index_chapters_on_stream_id` (`stream_id`),
  CONSTRAINT `fk_rails_66036dbccd` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `fk_rails_995da6577f` FOREIGN KEY (`stream_id`) REFERENCES `streams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapters`
--

LOCK TABLES `chapters` WRITE;
/*!40000 ALTER TABLE `chapters` DISABLE KEYS */;
/*!40000 ALTER TABLE `chapters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulty_levels`
--

DROP TABLE IF EXISTS `difficulty_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difficulty_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty_levels`
--

LOCK TABLES `difficulty_levels` WRITE;
/*!40000 ALTER TABLE `difficulty_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `difficulty_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_attempts`
--

DROP TABLE IF EXISTS `game_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_type` varchar(255) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `game_session_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_game_attempts_on_game_type_and_game_id` (`game_type`,`game_id`),
  KEY `index_game_attempts_on_game_session_id` (`game_session_id`),
  KEY `index_game_attempts_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_6c4e947c9e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_ecbde8009c` FOREIGN KEY (`game_session_id`) REFERENCES `game_sessions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_attempts`
--

LOCK TABLES `game_attempts` WRITE;
/*!40000 ALTER TABLE `game_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_holders`
--

DROP TABLE IF EXISTS `game_holders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_holders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `game_type` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `latest_sequence` int(11) DEFAULT NULL,
  `game_count` int(11) DEFAULT NULL,
  `question_type_id` int(11) DEFAULT NULL,
  `rank_name_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_game_holders_on_question_type_id` (`question_type_id`),
  KEY `index_game_holders_on_rank_name_id` (`rank_name_id`),
  CONSTRAINT `fk_rails_808f944d47` FOREIGN KEY (`question_type_id`) REFERENCES `question_types` (`id`),
  CONSTRAINT `fk_rails_ca7f0fc0c4` FOREIGN KEY (`rank_name_id`) REFERENCES `rank_names` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_holders`
--

LOCK TABLES `game_holders` WRITE;
/*!40000 ALTER TABLE `game_holders` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_holders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_sessions`
--

DROP TABLE IF EXISTS `game_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attempt_date` date DEFAULT NULL,
  `game_holder_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_game_sessions_on_game_holder_id` (`game_holder_id`),
  CONSTRAINT `fk_rails_5a28550512` FOREIGN KEY (`game_holder_id`) REFERENCES `game_holders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_sessions`
--

LOCK TABLES `game_sessions` WRITE;
/*!40000 ALTER TABLE `game_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_questions`
--

DROP TABLE IF EXISTS `practice_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `question_text` varchar(255) DEFAULT NULL,
  `option_text` varchar(255) DEFAULT NULL,
  `game_holder_id` int(11) DEFAULT NULL,
  `auto_question_id` int(11) DEFAULT NULL,
  `difficulty_level_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_practice_questions_on_game_holder_id` (`game_holder_id`),
  KEY `index_practice_questions_on_auto_question_id` (`auto_question_id`),
  KEY `index_practice_questions_on_difficulty_level_id` (`difficulty_level_id`),
  CONSTRAINT `fk_rails_12e3b0e021` FOREIGN KEY (`auto_question_id`) REFERENCES `auto_questions` (`id`),
  CONSTRAINT `fk_rails_358d598236` FOREIGN KEY (`game_holder_id`) REFERENCES `game_holders` (`id`),
  CONSTRAINT `fk_rails_8aad8fdb97` FOREIGN KEY (`difficulty_level_id`) REFERENCES `difficulty_levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_questions`
--

LOCK TABLES `practice_questions` WRITE;
/*!40000 ALTER TABLE `practice_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_types`
--

DROP TABLE IF EXISTS `question_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `sub_topic_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_question_types_on_sub_topic_id` (`sub_topic_id`),
  CONSTRAINT `fk_rails_82ddea1d8b` FOREIGN KEY (`sub_topic_id`) REFERENCES `sub_topics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_types`
--

LOCK TABLES `question_types` WRITE;
/*!40000 ALTER TABLE `question_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank_names`
--

DROP TABLE IF EXISTS `rank_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `display_text` varchar(255) DEFAULT NULL,
  `explainer` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank_names`
--

LOCK TABLES `rank_names` WRITE;
/*!40000 ALTER TABLE `rank_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `rank_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_percentile_scores`
--

DROP TABLE IF EXISTS `region_percentile_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_percentile_scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `percentile_count` int(11) DEFAULT NULL,
  `score` decimal(10,0) DEFAULT NULL,
  `acad_entity_type` varchar(255) DEFAULT NULL,
  `acad_entity_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_region_percentile_scores_on_acad_entity` (`acad_entity_type`,`acad_entity_id`),
  KEY `index_region_percentile_scores_on_region_id` (`region_id`),
  CONSTRAINT `fk_rails_22795fd4b7` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_percentile_scores`
--

LOCK TABLES `region_percentile_scores` WRITE;
/*!40000 ALTER TABLE `region_percentile_scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `region_percentile_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `display_text` varchar(255) DEFAULT NULL,
  `region_type` varchar(255) DEFAULT NULL,
  `parent_region_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_regions_on_parent_region_id` (`parent_region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20170704153005'),('20170704153115'),('20170704153128'),('20170704153138'),('20170704153147'),('20170704153156'),('20170704153206'),('20170704153215'),('20170704153226'),('20170704153238'),('20170704153247'),('20170704153257'),('20170704153306'),('20170704153318'),('20170704153726'),('20170704153802'),('20170704153823'),('20170704154743'),('20170704154802'),('20170704154812'),('20170704154822'),('20170704154832'),('20170704154845'),('20170704154859'),('20170704154913'),('20170704155242'),('20170704155256');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standards`
--

DROP TABLE IF EXISTS `standards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standards`
--

LOCK TABLES `standards` WRITE;
/*!40000 ALTER TABLE `standards` DISABLE KEYS */;
/*!40000 ALTER TABLE `standards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streams`
--

DROP TABLE IF EXISTS `streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_streams_on_subject_id` (`subject_id`),
  CONSTRAINT `fk_rails_b7f44ead64` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streams`
--

LOCK TABLES `streams` WRITE;
/*!40000 ALTER TABLE `streams` DISABLE KEYS */;
/*!40000 ALTER TABLE `streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_topics`
--

DROP TABLE IF EXISTS `sub_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sub_topics_on_topic_id` (`topic_id`),
  CONSTRAINT `fk_rails_f63a589081` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_topics`
--

LOCK TABLES `sub_topics` WRITE;
/*!40000 ALTER TABLE `sub_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `sub_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_topics_on_chapter_id` (`chapter_id`),
  CONSTRAINT `fk_rails_1356a848f9` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_acad_profiles`
--

DROP TABLE IF EXISTS `user_acad_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_acad_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acad_entity_type` varchar(255) DEFAULT NULL,
  `acad_entity_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_acad_profiles_on_acad_entity_type_and_acad_entity_id` (`acad_entity_type`,`acad_entity_id`),
  KEY `index_user_acad_profiles_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_234d386d4e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_acad_profiles`
--

LOCK TABLES `user_acad_profiles` WRITE;
/*!40000 ALTER TABLE `user_acad_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_acad_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_phone_numbers`
--

DROP TABLE IF EXISTS `user_phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_phone_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_phone_numbers_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_51f5e5a641` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_phone_numbers`
--

LOCK TABLES `user_phone_numbers` WRITE;
/*!40000 ALTER TABLE `user_phone_numbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_regions`
--

DROP TABLE IF EXISTS `user_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registration_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_regions_on_user_id` (`user_id`),
  KEY `index_user_regions_on_region_id` (`region_id`),
  CONSTRAINT `fk_rails_a6d21f3917` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_fc68fbc512` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_regions`
--

LOCK TABLES `user_regions` WRITE;
/*!40000 ALTER TABLE `user_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` date DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT NULL,
  `current_sign_in_at` date DEFAULT NULL,
  `last_sign_in_at` date DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `remember_created_at` date DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` date DEFAULT NULL,
  `confirmation_sent_at` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `word_questions`
--

DROP TABLE IF EXISTS `word_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `word_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `explaination` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `correct_count` int(11) DEFAULT NULL,
  `game_holder_id` int(11) DEFAULT NULL,
  `difficulty_level_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_word_questions_on_game_holder_id` (`game_holder_id`),
  KEY `index_word_questions_on_difficulty_level_id` (`difficulty_level_id`),
  CONSTRAINT `fk_rails_40ea748f2f` FOREIGN KEY (`game_holder_id`) REFERENCES `game_holders` (`id`),
  CONSTRAINT `fk_rails_4c7418e278` FOREIGN KEY (`difficulty_level_id`) REFERENCES `difficulty_levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `word_questions`
--

LOCK TABLES `word_questions` WRITE;
/*!40000 ALTER TABLE `word_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `word_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_rules`
--

DROP TABLE IF EXISTS `working_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `working_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `question_text` varchar(255) DEFAULT NULL,
  `game_holder_id` int(11) DEFAULT NULL,
  `difficulty_level_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_working_rules_on_game_holder_id` (`game_holder_id`),
  KEY `index_working_rules_on_difficulty_level_id` (`difficulty_level_id`),
  CONSTRAINT `fk_rails_1cbc9bc0cc` FOREIGN KEY (`difficulty_level_id`) REFERENCES `difficulty_levels` (`id`),
  CONSTRAINT `fk_rails_fc18aeb0c5` FOREIGN KEY (`game_holder_id`) REFERENCES `game_holders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_rules`
--

LOCK TABLES `working_rules` WRITE;
/*!40000 ALTER TABLE `working_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `working_rules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-05  7:59:44
