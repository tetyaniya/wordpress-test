/*M!999999\- enable the sandbox mode */ 

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
DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) NOT NULL,
  `status` varchar(20) NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT 10,
  `args` varchar(191) DEFAULT NULL,
  `schedule` longtext DEFAULT NULL,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook_status_scheduled_date_gmt` (`hook`(163),`status`,`scheduled_date_gmt`),
  KEY `status_scheduled_date_gmt` (`status`,`scheduled_date_gmt`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id_status_priority_scheduled_date_gmt` (`claim_id`,`status`,`priority`,`scheduled_date_gmt`),
  KEY `status_last_attempt_gmt` (`status`,`last_attempt_gmt`),
  KEY `status_claim_id` (`status`,`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_actionscheduler_actions` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_actions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_actionscheduler_claims` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_claims` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_actionscheduler_groups` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_groups` DISABLE KEYS */;
INSERT INTO `wp_actionscheduler_groups` VALUES
(1,'ActionScheduler'),
(2,'aioseo'),
(3,'action-scheduler-migration'),
(4,'action-scheduler-migration');
/*!40000 ALTER TABLE `wp_actionscheduler_groups` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text NOT NULL,
  `log_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_actionscheduler_logs` WRITE;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_actionscheduler_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_ai_insights_keyword_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_ai_insights_keyword_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `brands` longtext DEFAULT NULL,
  `brands_mentioned` int(11) DEFAULT 0,
  `results` longtext DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_aioseo_ai_insights_keyword_reports_uuid` (`uuid`),
  KEY `ndx_aioseo_ai_insights_keyword_reports_keyword` (`keyword`),
  KEY `ndx_aioseo_ai_insights_keyword_reports_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_ai_insights_keyword_reports` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_ai_insights_keyword_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_aioseo_ai_insights_keyword_reports` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_cache` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `value` longtext NOT NULL,
  `is_object` tinyint(1) DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_cache_name` (`name`),
  KEY `ndx_aioseo_cache_expiration` (`expiration`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_cache` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_aioseo_cache` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_crawl_cleanup_blocked_args`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_crawl_cleanup_blocked_args` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `param` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `param_value_hash` varchar(40) DEFAULT NULL,
  `regex` varchar(150) DEFAULT NULL,
  `hits` int(20) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_crawl_cleanup_blocked_args_param_value_hash` (`param_value_hash`),
  UNIQUE KEY `ndx_aioseo_crawl_cleanup_blocked_args_regex` (`regex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_crawl_cleanup_blocked_args` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_crawl_cleanup_blocked_args` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_aioseo_crawl_cleanup_blocked_args` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_crawl_cleanup_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_crawl_cleanup_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` text NOT NULL,
  `param` text NOT NULL,
  `value` text DEFAULT NULL,
  `hash` varchar(40) NOT NULL,
  `hits` int(20) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_crawl_cleanup_logs_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_crawl_cleanup_logs` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_crawl_cleanup_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_aioseo_crawl_cleanup_logs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(13) NOT NULL,
  `addon` varchar(64) DEFAULT NULL,
  `title` text NOT NULL,
  `content` longtext NOT NULL,
  `type` varchar(64) NOT NULL,
  `level` text NOT NULL,
  `notification_id` bigint(20) unsigned DEFAULT NULL,
  `notification_name` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `button1_label` varchar(255) DEFAULT NULL,
  `button1_action` varchar(255) DEFAULT NULL,
  `button2_label` varchar(255) DEFAULT NULL,
  `button2_action` varchar(255) DEFAULT NULL,
  `dismissed` tinyint(1) NOT NULL DEFAULT 0,
  `new` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_notifications_slug` (`slug`),
  KEY `ndx_aioseo_notifications_dates` (`start`,`end`),
  KEY `ndx_aioseo_notifications_type` (`type`),
  KEY `ndx_aioseo_notifications_dismissed` (`dismissed`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_notifications` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_notifications` DISABLE KEYS */;
INSERT INTO `wp_aioseo_notifications` VALUES
(1,'6ae6637d5b478',NULL,'Have you connected your site to Google Search Console?','AIOSEO can now verify whether your site is correctly verified with Google Search Console and that your sitemaps have been submitted correctly. Connect with Google Search Console now to ensure your content is being added to Google as soon as possible for increased rankings.','warning','[\"all\"]',NULL,'search-console-site-not-connected','2026-10-31 21:54:05',NULL,'Connect to Google Search Console','https://route#aioseo-settings&aioseo-scroll=google-search-console-settings&aioseo-highlight=google-search-console-settings:webmaster-tools?activetool=googleSearchConsole',NULL,NULL,0,0,'2026-10-31 21:54:05','2026-10-31 21:54:05');
/*!40000 ALTER TABLE `wp_aioseo_notifications` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` mediumtext DEFAULT NULL,
  `keyphrases` longtext DEFAULT NULL,
  `focus_keyword` varchar(255) DEFAULT NULL,
  `truseo` longtext DEFAULT NULL,
  `additional_keywords` text DEFAULT NULL,
  `truseo_locale` varchar(20) DEFAULT NULL,
  `page_analysis` longtext DEFAULT NULL,
  `primary_term` longtext DEFAULT NULL,
  `canonical_url` text DEFAULT NULL,
  `og_title` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `og_object_type` varchar(64) DEFAULT 'default',
  `og_image_type` varchar(64) DEFAULT 'default',
  `og_image_custom_url` text DEFAULT NULL,
  `og_image_custom_fields` text DEFAULT NULL,
  `og_image_url` text DEFAULT NULL,
  `og_image_width` int(11) DEFAULT NULL,
  `og_image_height` int(11) DEFAULT NULL,
  `og_video` varchar(255) DEFAULT NULL,
  `og_custom_url` text DEFAULT NULL,
  `og_article_section` text DEFAULT NULL,
  `og_article_tags` text DEFAULT NULL,
  `twitter_use_og` tinyint(1) DEFAULT 0,
  `twitter_card` varchar(64) DEFAULT 'default',
  `twitter_image_type` varchar(64) DEFAULT 'default',
  `twitter_image_custom_url` text DEFAULT NULL,
  `twitter_image_custom_fields` text DEFAULT NULL,
  `twitter_image_url` text DEFAULT NULL,
  `twitter_title` text DEFAULT NULL,
  `twitter_description` text DEFAULT NULL,
  `seo_score` int(11) NOT NULL DEFAULT 0,
  `schema_type` varchar(20) DEFAULT 'default',
  `schema_type_options` longtext DEFAULT NULL,
  `schema` longtext DEFAULT NULL,
  `pillar_content` tinyint(1) DEFAULT NULL,
  `robots_default` tinyint(1) NOT NULL DEFAULT 1,
  `robots_noindex` tinyint(1) NOT NULL DEFAULT 0,
  `robots_noarchive` tinyint(1) NOT NULL DEFAULT 0,
  `robots_nosnippet` tinyint(1) NOT NULL DEFAULT 0,
  `robots_nofollow` tinyint(1) NOT NULL DEFAULT 0,
  `robots_noimageindex` tinyint(1) NOT NULL DEFAULT 0,
  `robots_noodp` tinyint(1) NOT NULL DEFAULT 0,
  `robots_notranslate` tinyint(1) NOT NULL DEFAULT 0,
  `robots_max_snippet` int(11) DEFAULT NULL,
  `robots_max_videopreview` int(11) DEFAULT NULL,
  `robots_max_imagepreview` varchar(20) DEFAULT 'large',
  `images` longtext DEFAULT NULL,
  `image_scan_date` datetime DEFAULT NULL,
  `priority` float DEFAULT NULL,
  `frequency` tinytext DEFAULT NULL,
  `videos` longtext DEFAULT NULL,
  `video_thumbnail` text DEFAULT NULL,
  `video_scan_date` datetime DEFAULT NULL,
  `local_seo` longtext DEFAULT NULL,
  `limit_modified_date` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext DEFAULT NULL,
  `ai` longtext DEFAULT NULL,
  `breadcrumb_settings` longtext DEFAULT NULL,
  `seo_analyzer_scan_date` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_aioseo_posts_post_id` (`post_id`),
  KEY `ndx_aioseo_posts_pillar_content` (`pillar_content`),
  KEY `ndx_aioseo_posts_focus_keyword` (`focus_keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_posts` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_posts` DISABLE KEYS */;
INSERT INTO `wp_aioseo_posts` VALUES
(1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/custom-theme-logo-for-light-background.png\"}]','2026-10-31 21:55:43',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-10-31 21:55:43'),
(2,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/favicon-3.png\"}]','2026-10-31 21:55:43',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-10-31 21:55:43'),
(3,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/cropped-favicon-3.png\"}]','2026-10-31 21:55:43',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-10-31 21:55:43'),
(4,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/Observatory.jpg\"}]','2026-10-31 21:55:43',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-10-31 21:55:43'),
(5,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/heic1509a.jpg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-11-02 06:16:47'),
(6,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/gP2SlH.jpeg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-11-02 06:16:47'),
(7,44,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-damir-28893489-scaled.jpg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-11-02 06:16:47'),
(8,45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-annija-u-492300719-16047151-scaled.jpg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-11-02 06:16:47'),
(9,46,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-damir-18894621-scaled.jpg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-11-02 06:16:47'),
(10,47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-morlaiim-285925855-34485377-scaled.jpg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 21:55:43','2026-11-02 06:16:47'),
(11,48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-kenzhar-sharap-125323072-18227137-scaled.jpg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-11-02 06:16:47'),
(12,49,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-oksana-bulgaru-176523174-20680807-scaled.jpg\"}]','2026-11-02 06:16:47',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-11-02 06:16:47'),
(13,69,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/facebook.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(14,70,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/linkedin.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(15,74,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/instagram.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(16,76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/inst.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(17,77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/fb.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(18,78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/in.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(19,79,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/facebook-1.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(20,80,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/instagram-1.svg\"}]','2026-10-31 22:59:51',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-10-31 22:59:51','2026-10-31 22:59:51'),
(21,81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/linkedin-1.svg\"}]','2026-11-01 20:24:15',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-11-01 20:24:15','2026-11-01 20:24:15'),
(22,83,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/fb-2.svg\"}]','2026-11-01 20:24:15',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-11-01 20:24:15','2026-11-01 20:24:15'),
(23,84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/in-2.svg\"}]','2026-11-01 20:24:15',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-11-01 20:24:15','2026-11-01 20:24:15'),
(24,85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/inst-2.svg\"}]','2026-11-01 20:24:15',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-11-01 20:24:15','2026-11-01 20:24:15'),
(25,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large',NULL,'2026-11-01 20:24:15',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-11-01 20:24:15','2026-11-01 20:24:15'),
(26,6,'Space Laboratory | Exploring the Universe','We explore distant galaxies, observe celestial bodies, and occasionally peek through people\'s windows from outer space. Strictly for scientific purposes!',NULL,'{\"focus\":{\"keyphrase\":\"\",\"score\":0,\"analysis\":{\"keyphraseInTitle\":{\"score\":0,\"maxScore\":9,\"error\":1}}},\"additional\":[]}',NULL,'{\"focus_keyword\":{\"score\":28,\"items\":{\"introductionKeyword\":{\"score\":3},\"keyphraseLength\":{\"score\":0},\"keyphraseDensity\":{\"score\":0},\"keyphraseDistribution\":{\"score\":1},\"metaDescriptionKeyword\":{\"score\":3},\"subheadingsKeyword\":{\"score\":1},\"textCompetingLinks\":{\"score\":9},\"imageKeyphrase\":{\"score\":3},\"keyphraseInSEOTitle\":{\"score\":2},\"slugKeyword\":{\"score\":3}}},\"general\":{\"introductionKeyword\":{\"score\":3},\"keyphraseLength\":{\"score\":0},\"keyphraseDensity\":{\"score\":0},\"metaDescriptionKeyword\":{\"score\":3},\"metaDescriptionLength\":{\"score\":9},\"subheadingsKeyword\":{\"score\":1},\"textCompetingLinks\":{\"score\":9},\"imageKeyphrase\":{\"score\":3},\"images\":{\"score\":3},\"textLength\":{\"score\":0},\"externalLinks\":{\"score\":3},\"keyphraseInSEOTitle\":{\"score\":2},\"internalLinks\":{\"score\":3},\"titleWidth\":{\"score\":6},\"slugKeyword\":{\"score\":3},\"singleH1\":{\"score\":9},\"keyphraseDistribution\":{\"score\":1},\"subheadingsTooLong\":{\"score\":9},\"textParagraphTooLong\":{\"score\":9},\"textSentenceLength\":{\"score\":9},\"textTransitionWords\":{\"score\":9},\"passiveVoice\":{\"score\":3},\"textPresence\":{\"score\":9},\"sentenceBeginnings\":{\"score\":9},\"wordComplexity\":{\"score\":9},\"spellingChecker\":{\"score\":3}}}',NULL,NULL,'{\"analysis\":{\"basic\":{\"lengthContent\":{\"error\":1,\"maxScore\":9,\"score\":6}},\"title\":{\"titleLength\":{\"error\":1,\"maxScore\":9,\"score\":1}},\"readability\":{\"contentHasAssets\":{\"error\":1,\"maxScore\":5,\"score\":0}}}}',NULL,NULL,NULL,NULL,'website','default',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,49,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"WebPage\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,-1,-1,'large','[{\"image:loc\":\"/wp-content/uploads/2026/10/Observatory.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/heic1509a.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/gP2SlH.jpeg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-damir-28893489.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-annija-u-492300719-16047151.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-damir-18894621.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-morlaiim-285925855-34485377.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-kenzhar-sharap-125323072-18227137.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/pexels-oksana-bulgaru-176523174-20680807.jpg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/fb-2.svg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/in-2.svg\"},{\"image:loc\":\"/wp-content/uploads/2026/10/inst-2.svg\"}]','2026-11-01 21:26:36',NULL,'default',NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":false}}','{\"faqs\":[],\"keyPoints\":[],\"schemas\":[],\"titles\":[],\"descriptions\":[],\"socialPosts\":{\"email\":{\"subject\":\"\",\"preview\":\"\",\"content\":\"\"},\"linkedin\":[],\"twitter\":[],\"facebook\":[],\"instagram\":[]}}',NULL,NULL,'2026-11-01 20:24:15','2026-11-01 21:26:36'),
(27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'default','default',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default','default',NULL,NULL,NULL,NULL,NULL,0,'default',NULL,'{\"blockGraphs\":[],\"customGraphs\":[],\"default\":{\"data\":{\"Article\":[],\"Course\":[],\"Dataset\":[],\"FAQPage\":[],\"Movie\":[],\"Person\":[],\"Product\":[],\"ProductReview\":[],\"Car\":[],\"Recipe\":[],\"Service\":[],\"SoftwareApplication\":[],\"WebPage\":[]},\"graphName\":\"\",\"isEnabled\":true},\"graphs\":[]}',0,1,0,0,0,0,0,0,0,NULL,NULL,'large',NULL,'2026-11-01 20:24:15',NULL,NULL,NULL,NULL,NULL,NULL,0,'{\"linkFormat\":{\"internalLinkCount\":0,\"linkAssistantDismissed\":false},\"primaryTerm\":{\"productEducationDismissed\":false},\"truSeo\":{\"highlightingEnabled\":null}}',NULL,NULL,NULL,'2026-11-01 20:24:15','2026-11-01 20:24:15');
/*!40000 ALTER TABLE `wp_aioseo_posts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_seo_analyzer_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_seo_analyzer_results` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data` text NOT NULL,
  `score` varchar(255) DEFAULT NULL,
  `competitor_url` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_aioseo_seo_analyzer_results_competitor_url` (`competitor_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_seo_analyzer_results` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_seo_analyzer_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_aioseo_seo_analyzer_results` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_writing_assistant_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_writing_assistant_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(40) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `country` varchar(10) NOT NULL DEFAULT 'us',
  `language` varchar(10) NOT NULL DEFAULT 'en',
  `progress` tinyint(3) DEFAULT 0,
  `keywords` mediumtext DEFAULT NULL,
  `competitors` mediumtext DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_writing_assistant_keywords_uuid` (`uuid`),
  KEY `ndx_aioseo_writing_assistant_keywords_keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_writing_assistant_keywords` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_writing_assistant_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_aioseo_writing_assistant_keywords` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_aioseo_writing_assistant_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_aioseo_writing_assistant_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `keyword_id` bigint(20) unsigned DEFAULT NULL,
  `content_analysis_hash` varchar(40) DEFAULT NULL,
  `content_analysis` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndx_aioseo_writing_assistant_posts_post_id` (`post_id`),
  KEY `ndx_aioseo_writing_assistant_posts_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_aioseo_writing_assistant_posts` WRITE;
/*!40000 ALTER TABLE `wp_aioseo_writing_assistant_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_aioseo_writing_assistant_posts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES
(1,1,'A WordPress Commenter','wapuu@wordpress.example','https://wordpress.org/','','2026-10-29 19:34:03','2026-10-29 19:34:03','Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.',0,'1','','comment',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'cron','a:15:{i:1793600524;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1793601243;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1793602519;a:1:{s:24:\"flamingo_hourly_cron_job\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1793604854;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1793608443;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1793610243;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1793612043;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1793643922;a:1:{s:21:\"ai1wm_storage_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1793648043;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:41:\"wp_privacy_personal_data_cleanup_requests\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1793648054;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1793648056;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1793652322;a:1:{s:22:\"llar_mfa_daily_cleanup\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1793910115;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1793993643;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on'),
(2,'siteurl','https://wordpress-test.ddev.site','on'),
(3,'home','https://wordpress-test.ddev.site','on'),
(4,'blogname','Space Laboratory','on'),
(5,'blogdescription','Made on Earth. Inspired by the Universe.','on'),
(6,'users_can_register','0','on'),
(7,'admin_email','reviewer@example.test','on'),
(8,'start_of_week','1','on'),
(9,'use_balanceTags','0','on'),
(10,'use_smilies','1','on'),
(11,'require_name_email','1','on'),
(12,'comments_notify','1','on'),
(13,'posts_per_rss','10','on'),
(14,'rss_use_excerpt','0','on'),
(15,'mailserver_url','','on'),
(16,'mailserver_login','','on'),
(17,'mailserver_pass','','on'),
(18,'mailserver_port','110','on'),
(19,'default_category','1','on'),
(20,'default_comment_status','open','on'),
(21,'default_ping_status','open','on'),
(22,'default_pingback_flag','1','on'),
(23,'posts_per_page','10','on'),
(24,'date_format','F j, Y','on'),
(25,'time_format','g:i a','on'),
(26,'links_updated_date_format','F j, Y g:i a','on'),
(27,'comment_moderation','0','on'),
(28,'moderation_notify','1','on'),
(29,'permalink_structure','/%postname%/','on'),
(30,'rewrite_rules','a:90:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:23:\"index.php?sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=6&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','on'),
(31,'hack_file','0','on'),
(32,'blog_charset','UTF-8','on'),
(33,'moderation_keys','','off'),
(34,'active_plugins','a:6:{i:0;s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";i:1;s:51:\"all-in-one-wp-migration/all-in-one-wp-migration.php\";i:2;s:36:\"contact-form-7/wp-contact-form-7.php\";i:3;s:21:\"flamingo/flamingo.php\";i:4;s:63:\"limit-login-attempts-reloaded/limit-login-attempts-reloaded.php\";i:5;s:33:\"wps-hide-login/wps-hide-login.php\";}','on'),
(35,'category_base','','on'),
(36,'ping_sites','https://rpc.pingomatic.com/','on'),
(37,'comment_max_links','2','on'),
(38,'gmt_offset','0','on'),
(39,'default_email_category','1','on'),
(40,'recently_edited','','off'),
(41,'template','custom-theme','on'),
(42,'stylesheet','custom-theme','on'),
(43,'comment_registration','0','on'),
(44,'html_type','text/html','on'),
(45,'use_trackback','0','on'),
(46,'default_role','subscriber','on'),
(47,'db_version','61833','on'),
(48,'uploads_use_yearmonth_folders','1','on'),
(49,'upload_path','','on'),
(50,'blog_public','1','on'),
(51,'default_link_category','2','on'),
(52,'show_on_front','page','on'),
(53,'tag_base','','on'),
(54,'show_avatars','1','on'),
(55,'avatar_rating','G','on'),
(56,'upload_url_path','','on'),
(57,'thumbnail_size_w','150','on'),
(58,'thumbnail_size_h','150','on'),
(59,'thumbnail_crop','1','on'),
(60,'medium_size_w','300','on'),
(61,'medium_size_h','300','on'),
(62,'avatar_default','mystery','on'),
(63,'large_size_w','1024','on'),
(64,'large_size_h','1024','on'),
(65,'image_default_link_type','none','on'),
(66,'image_default_size','','on'),
(67,'image_default_align','','on'),
(68,'close_comments_for_old_posts','0','on'),
(69,'close_comments_days_old','14','on'),
(70,'thread_comments','1','on'),
(71,'thread_comments_depth','5','on'),
(72,'page_comments','0','on'),
(73,'comments_per_page','50','on'),
(74,'default_comments_page','newest','on'),
(75,'comment_order','asc','on'),
(76,'sticky_posts','a:0:{}','on'),
(77,'widget_categories','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','auto'),
(78,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','auto'),
(79,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','auto'),
(80,'uninstall_plugins','a:0:{}','off'),
(81,'timezone_string','','on'),
(82,'page_for_posts','0','on'),
(83,'page_on_front','6','on'),
(84,'default_post_format','0','on'),
(85,'link_manager_enabled','0','on'),
(86,'finished_splitting_shared_terms','1','on'),
(87,'site_icon','14','on'),
(88,'medium_large_size_w','768','on'),
(89,'medium_large_size_h','0','on'),
(90,'wp_page_for_privacy_policy','3','on'),
(91,'show_comments_cookies_opt_in','1','on'),
(92,'admin_email_lifespan','1808854443','on'),
(93,'disallowed_keys','','off'),
(94,'comment_previously_approved','1','on'),
(95,'auto_plugin_theme_update_emails','a:0:{}','off'),
(96,'auto_update_core_dev','enabled','on'),
(97,'auto_update_core_minor','enabled','on'),
(98,'auto_update_core_major','enabled','on'),
(99,'wp_force_deactivated_plugins','a:0:{}','on'),
(100,'wp_attachment_pages_enabled','0','on'),
(101,'wp_notes_notify','1','on'),
(102,'initial_db_version','61833','on'),
(103,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:70:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:10:\"llar_admin\";b:1;s:17:\"aioseo_manage_seo\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:31:\"aioseo_page_ai_content_settings\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;s:38:\"aioseo_page_writing_assistant_settings\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:41:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:31:\"aioseo_page_ai_content_settings\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;s:38:\"aioseo_page_writing_assistant_settings\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:17:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:31:\"aioseo_page_ai_content_settings\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;s:38:\"aioseo_page_writing_assistant_settings\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:12:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:29:\"aioseo_page_advanced_settings\";b:1;s:31:\"aioseo_page_ai_content_settings\";b:1;s:20:\"aioseo_page_analysis\";b:1;s:28:\"aioseo_page_general_settings\";b:1;s:27:\"aioseo_page_schema_settings\";b:1;s:27:\"aioseo_page_social_settings\";b:1;s:38:\"aioseo_page_writing_assistant_settings\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','on'),
(104,'fresh_site','0','off'),
(105,'user_count','1','off'),
(106,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto'),
(107,'sidebars_widgets','a:2:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:13:\"array_version\";i:3;}','auto'),
(108,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(109,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(110,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(111,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(112,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(113,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(114,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(115,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(116,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(117,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(118,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(119,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(120,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(121,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(125,'theme_mods_twentytwentyfive','a:4:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1793472386;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}}','off'),
(139,'can_compress_scripts','0','on'),
(152,'current_theme','Custom Theme','auto'),
(153,'theme_mods_custom-theme','a:9:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:3;s:6:\"footer\";i:6;}s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:10;s:8:\"ct_phone\";s:13:\"+380000000000\";s:15:\"ct_social_links\";a:3:{i:0;a:3:{s:5:\"title\";s:8:\"Facebook\";s:3:\"url\";s:25:\"https://www.facebook.com/\";s:4:\"icon\";i:83;}i:1;a:3:{s:5:\"title\";s:8:\"Linkedin\";s:3:\"url\";s:25:\"https://www.linkedin.com/\";s:4:\"icon\";i:84;}i:2;a:3:{s:5:\"title\";s:9:\"Instagram\";s:3:\"url\";s:26:\"https://www.instagram.com/\";s:4:\"icon\";i:85;}}s:8:\"ct_email\";s:21:\"reviewer@example.test\";s:10:\"ct_address\";s:37:\"Київ, вул. Хрещатик, 1\";s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1793472380;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}','on'),
(154,'theme_switched','','auto'),
(159,'finished_updating_comment_type','1','auto'),
(173,'wpcf7','a:2:{s:7:\"version\";s:7:\"6.2.4.1\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1793305318;s:7:\"version\";s:7:\"6.2.4.1\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}','auto'),
(183,'site_logo','10','auto'),
(190,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','off'),
(236,'ai1wm_updater','a:0:{}','auto'),
(246,'wp_calendar_block_has_published_posts','1','auto'),
(310,'recently_activated','a:0:{}','off'),
(320,'flamingo_inbound_channel_children','a:1:{i:4;a:1:{i:0;i:5;}}','auto'),
(393,'limit_login_plugin_version','3.3.10','on'),
(394,'limit_login_digest_daily','1','on'),
(395,'limit_login_digest_weekly','1','on'),
(396,'limit_login_digest_monthly','1','on'),
(399,'limit_login_activation_timestamp','1793479522','on'),
(400,'limit_login_notice_enable_notify_timestamp','1790714722','on'),
(410,'WPLANG','','auto'),
(412,'whl_page','nebula-access','auto'),
(413,'whl_redirect_admin','404','auto'),
(431,'limit_login_admin_notify_email','reviewer@example.test','on'),
(432,'limit_login_lockout_notify','email','on'),
(435,'limit_login_active_app','local','on'),
(436,'limit_login_onboarding_popup_shown','1','on'),
(437,'limit_login_block_by_country','false','on'),
(438,'limit_login_gdpr','0','on'),
(439,'limit_login_show_top_level_menu_item','1','on'),
(440,'limit_login_show_top_bar_menu_item','1','on'),
(441,'limit_login_hide_dashboard_widget','0','on'),
(442,'limit_login_show_warning_badge','1','on'),
(443,'limit_login_allowed_retries','4','on'),
(444,'limit_login_lockout_duration','1200','on'),
(445,'limit_login_valid_duration','86400','on'),
(446,'limit_login_allowed_lockouts','4','on'),
(447,'limit_login_long_duration','86400','on'),
(448,'limit_login_notify_email_after','3','on'),
(449,'limit_login_gdpr_message','By proceeding you understand and give your consent that your IP address and browser information might be processed by the security plugins installed on this site.','on'),
(450,'limit_login_custom_error_message','','on'),
(451,'limit_login_trusted_ip_origins','a:1:{i:0;s:11:\"REMOTE_ADDR\";}','on'),
(454,'action_scheduler_hybrid_store_demarkation','89','auto'),
(455,'schema-ActionScheduler_StoreSchema','8.0.1793483644','auto'),
(456,'schema-ActionScheduler_LoggerSchema','3.0.1793483644','auto'),
(457,'aioseo_migrations_log','{\"drop_legacy_cache_indexes\":{\"version\":\"4.9.7.2\",\"ran_at\":\"2026-10-31 21:54:04\",\"status\":1,\"attempts\":1,\"last_error\":null},\"unschedule_ai_credit_fetch\":{\"version\":\"5.0.1\",\"ran_at\":\"2026-10-31 21:54:04\",\"status\":1,\"attempts\":1,\"last_error\":null},\"drop_legacy_og_image_dimension_columns\":{\"version\":\"5.0.4\",\"ran_at\":\"2026-10-31 21:54:04\",\"status\":1,\"attempts\":1,\"last_error\":null}}','off'),
(459,'action_scheduler_lock_async-request-runner','6ae82bfe627044.97648359|1793600570','no'),
(464,'aioseo_dynamic_settings_backup','[]','off'),
(475,'aioseo_options_internal','{\"internal\":{\"lastActiveVersion\":\"5.0.4\",\"lastSchemaVersion\":\"5.0.4\",\"migratedVersion\":null,\"headlineAnalysis\":{\"headlines\":[]},\"wizard\":null,\"category\":null,\"categoryOther\":null,\"deprecatedOptions\":[],\"searchStatistics\":{\"profile\":{\"siteurl\":\"\",\"authedsite\":\"\"},\"rolling\":\"last28Days\",\"site\":{\"verified\":false,\"lastFetch\":0},\"sitemap\":{\"list\":[],\"ignored\":[],\"lastFetch\":0}},\"ai\":{\"isTrialAccessToken\":false,\"isManuallyConnected\":false,\"credits\":{\"total\":100,\"remaining\":100,\"orders\":[],\"license\":{\"total\":0,\"remaining\":0,\"expires\":0}},\"costPerFeature\":{\"aiAssistant\":\"50\",\"imageGenerator\":{\"low\":\"250\",\"medium\":\"1000\",\"high\":\"5000\",\"gpt-image-1\":{\"low\":\"250\",\"medium\":\"1000\",\"high\":\"5000\"},\"gpt-image-2\":{\"low\":\"250\",\"medium\":\"1000\"},\"gemini-3.1-flash-image\":\"1000\"},\"faqs\":\"10\",\"keyPoints\":\"10\",\"socialPosts\":\"10\",\"titles\":\"10\",\"descriptions\":\"10\",\"imageAltText\":\"10\",\"rephrase\":\"5\",\"schemas\":\"25\",\"truseoSuggest\":\"5\",\"truseoSpelling\":\"5\",\"truseoOptimizePost\":\"25\"}},\"seoChecklist\":{\"completed\":[\"enableIndexing\",\"setSiteTitleAndTagline\"]}},\"integrations\":{\"semrush\":{\"tokenType\":null,\"expires\":null}}}','auto'),
(476,'aioseo_options_internal_lite','{\"internal\":{\"activated\":0,\"firstActivated\":1793483749,\"installed\":0,\"connect\":{\"time\":0,\"network\":false}}}','auto'),
(477,'aioseo_options','{\"internal\":[],\"webmasterTools\":{\"google\":null,\"bing\":null,\"yandex\":null,\"baidu\":null,\"pinterest\":null,\"microsoftClarityProjectId\":null,\"norton\":null,\"miscellaneousVerification\":null},\"aiContent\":{\"country\":\"us\",\"language\":\"en\",\"tone\":\"formal\",\"audience\":\"general\",\"imageQuality\":\"medium\",\"imageStyle\":\"auto\",\"imageAspectRatio\":\"landscape\",\"imageModel\":\"gemini-3.1-flash-image\"},\"breadcrumbs\":{\"separator\":\"»\",\"homepageLink\":true,\"homepageLabel\":\"Home\",\"breadcrumbPrefix\":\"\",\"archiveFormat\":\"Archives for #breadcrumb_archive_post_type_name\",\"searchResultFormat\":\"Search Results for \'#breadcrumb_search_string\'\",\"errorFormat404\":\"404 - Page Not Found\",\"showCurrentItem\":true,\"linkCurrentItem\":false,\"categoryFullHierarchy\":false,\"showBlogHome\":false},\"rssContent\":{\"before\":null,\"after\":\"&lt;p&gt;The post #post_link first appeared on #site_link.&lt;/p&gt;\"},\"advanced\":{\"truSeo\":true,\"truSeoObjects\":{\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]},\"taxonomies\":{\"all\":false,\"included\":[\"product_cat\"]}},\"headlineAnalyzer\":true,\"seoAnalysis\":true,\"spellChecker\":true,\"highlighter\":true,\"highlighterStyle\":\"underline\",\"dashboardWidgets\":[\"seoSetup\",\"seoChecklist\",\"seoOverview\",\"seoNews\"],\"announcements\":true,\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]},\"taxonomies\":{\"all\":true,\"included\":[\"category\",\"post_tag\",\"product_cat\",\"product_tag\"]},\"uninstall\":false,\"emailSummary\":{\"enable\":false,\"recipients\":[{\"email\":\"reviewer@example.test\",\"frequency\":\"monthly\"}]}},\"sitemap\":{\"general\":{\"enable\":true,\"filename\":\"sitemap\",\"indexes\":true,\"linksPerIndex\":1000,\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"attachment\",\"product\"]},\"taxonomies\":{\"all\":true,\"included\":[\"category\",\"post_tag\",\"product_cat\",\"product_tag\"]},\"author\":false,\"date\":false,\"additionalPages\":{\"enable\":false,\"pages\":[]},\"advancedSettings\":{\"enable\":false,\"excludeImages\":false,\"excludePosts\":[],\"excludeTerms\":[],\"priority\":{\"homePage\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"postTypes\":{\"grouped\":true,\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"taxonomies\":{\"grouped\":true,\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"archive\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"author\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"}}}},\"rss\":{\"enable\":true,\"linksPerIndex\":50,\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]}},\"html\":{\"enable\":true,\"pageUrl\":\"\",\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]},\"taxonomies\":{\"all\":true,\"included\":[\"category\",\"post_tag\",\"product_cat\",\"product_tag\"]},\"sortOrder\":\"publish_date\",\"sortDirection\":\"asc\",\"publicationDate\":true,\"compactArchives\":false,\"advancedSettings\":{\"enable\":false,\"nofollowLinks\":false,\"excludePosts\":[],\"excludeTerms\":[]}},\"llms\":{\"enable\":false,\"convertToMd\":false,\"advancedSettings\":{\"title\":\"#site_title\",\"description\":\"#tagline\",\"linksPerPostTax\":1000,\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\",\"product\"]},\"taxonomies\":{\"all\":true,\"included\":[]},\"excludePosts\":[],\"excludeTerms\":[]}}},\"social\":{\"profiles\":{\"sameUsername\":{\"enable\":false,\"username\":null,\"included\":[\"facebookPageUrl\",\"twitterUrl\",\"tiktokUrl\",\"pinterestUrl\",\"instagramUrl\",\"youtubeUrl\",\"linkedinUrl\"]},\"urls\":{\"facebookPageUrl\":null,\"twitterUrl\":null,\"instagramUrl\":null,\"tiktokUrl\":null,\"pinterestUrl\":null,\"youtubeUrl\":null,\"linkedinUrl\":null,\"tumblrUrl\":null,\"yelpPageUrl\":null,\"soundCloudUrl\":null,\"wikipediaUrl\":null,\"myspaceUrl\":null,\"googlePlacesUrl\":null,\"wordPressUrl\":null,\"blueskyUrl\":null,\"threadsUrl\":null},\"additionalUrls\":null},\"facebook\":{\"general\":{\"enable\":true,\"defaultImageSourcePosts\":\"default\",\"customFieldImagePosts\":null,\"defaultImagePosts\":\"https://wordpress-test.ddev.site/wp-content/uploads/2026/10/custom-theme-logo-for-light-background.png\",\"defaultImagePostsWidth\":\"\",\"defaultImagePostsHeight\":\"\",\"showAuthor\":true,\"siteName\":\"#site_title #separator_sa #tagline\"},\"homePage\":{\"image\":\"\",\"title\":\"\",\"description\":\"\",\"imageWidth\":\"\",\"imageHeight\":\"\",\"objectType\":\"website\"},\"advanced\":{\"enable\":false,\"adminId\":\"\",\"appId\":\"\",\"authorUrl\":\"\",\"generateArticleTags\":false,\"useKeywordsInTags\":true,\"useCategoriesInTags\":true,\"usePostTagsInTags\":true}},\"twitter\":{\"general\":{\"enable\":true,\"useOgData\":false,\"defaultCardType\":\"summary_large_image\",\"defaultImageSourcePosts\":\"default\",\"customFieldImagePosts\":null,\"defaultImagePosts\":\"https://wordpress-test.ddev.site/wp-content/uploads/2026/10/custom-theme-logo-for-light-background.png\",\"showAuthor\":true,\"additionalData\":false},\"homePage\":{\"image\":\"\",\"title\":\"\",\"description\":\"\",\"cardType\":\"summary\"}}},\"searchAppearance\":{\"global\":{\"separator\":\"-\",\"siteTitle\":\"#site_title #separator_sa #tagline\",\"metaDescription\":\"#tagline\",\"keywords\":null,\"schema\":{\"websiteName\":\"#site_title\",\"websiteAlternateName\":null,\"siteRepresents\":\"organization\",\"person\":null,\"organizationName\":\"#site_title\",\"organizationDescription\":\"#tagline\",\"organizationLogo\":\"\",\"personName\":null,\"personLogo\":\"\",\"phone\":null,\"email\":null,\"foundingDate\":null,\"numberOfEmployees\":{\"isRange\":null,\"from\":null,\"to\":null,\"number\":null}}},\"advanced\":{\"globalRobotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noindexPaginated\":true,\"nofollowPaginated\":true,\"noindexFeed\":true,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"noIndexEmptyCat\":true,\"removeStopWords\":false,\"useKeywords\":false,\"keywordsLooking\":true,\"useCategoriesForMetaKeywords\":false,\"useTagsForMetaKeywords\":false,\"dynamicallyGenerateKeywords\":false,\"pagedFormat\":\"#separator_sa Page #page_number\",\"runShortcodes\":false,\"crawlCleanup\":{\"enable\":false,\"feeds\":{\"global\":true,\"globalComments\":false,\"staticBlogPage\":true,\"authors\":true,\"postComments\":false,\"search\":false,\"attachments\":false,\"archives\":{\"all\":false,\"included\":[]},\"taxonomies\":{\"all\":false,\"included\":[\"category\"]},\"atom\":false,\"rdf\":false,\"paginated\":false}},\"unwantedBots\":{\"all\":false,\"settings\":{\"googleAdsBot\":false,\"openAiGptBot\":false,\"commonCrawlCcBot\":false,\"googleGeminiVertexAiBots\":false}},\"searchCleanup\":{\"enable\":false,\"settings\":{\"maxAllowedNumberOfChars\":50,\"emojisAndSymbols\":false,\"commonPatterns\":false,\"redirectPrettyUrls\":false,\"preventCrawling\":false}},\"blockArgs\":{\"enable\":false,\"optimizeUtmParameters\":false,\"logsRetention\":\"{\\\"label\\\":\\\"1 week\\\",\\\"value\\\":\\\"week\\\"}\"},\"removeCategoryBase\":false},\"archives\":{\"author\":{\"show\":true,\"title\":\"#author_name #separator_sa #site_title\",\"metaDescription\":\"#author_bio\",\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"keywords\":null}},\"date\":{\"show\":true,\"title\":\"#archive_date #separator_sa #site_title\",\"metaDescription\":\"\",\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"keywords\":null}},\"search\":{\"show\":false,\"title\":\"#search_term #separator_sa #site_title\",\"metaDescription\":\"\",\"advanced\":{\"robotsMeta\":{\"default\":false,\"noindex\":true,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"keywords\":null}}}},\"searchStatistics\":{\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\"]}},\"tools\":{\"robots\":{\"enable\":false,\"rules\":[],\"robotsDetected\":true},\"importExport\":{\"backup\":{\"lastTime\":null,\"data\":null}},\"seoAlerts\":{\"enable\":true,\"alerts\":{\"noindexHomepage\":true,\"robotsTxtError\":true,\"xmlSitemapError\":true},\"recipients\":[],\"slackMemberIds\":[]}},\"deprecated\":{\"breadcrumbs\":{\"enable\":true},\"searchAppearance\":{\"global\":{\"descriptionFormat\":null,\"schema\":{\"enableSchemaMarkup\":true}},\"advanced\":{\"autogenerateDescriptions\":true,\"runShortcodesInDescription\":true,\"useContentForAutogeneratedDescriptions\":false,\"excludePosts\":[],\"excludeTerms\":[],\"noPaginationForCanonical\":true}},\"sitemap\":{\"general\":{\"advancedSettings\":{\"dynamic\":true}}}},\"writingAssistant\":{\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\"]}}}','auto'),
(478,'aioseo_options_lite','{\"advanced\":{\"usageTracking\":false}}','auto'),
(479,'aioseo_options_dynamic','{\"sitemap\":{\"priority\":{\"postTypes\":{\"post\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"page\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"attachment\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"}},\"taxonomies\":{\"category\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"},\"post_tag\":{\"priority\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\",\"frequency\":\"{\\\"label\\\":\\\"default\\\",\\\"value\\\":\\\"default\\\"}\"}}}},\"social\":{\"facebook\":{\"general\":{\"postTypes\":{\"post\":{\"objectType\":\"article\"},\"page\":{\"objectType\":\"article\"},\"attachment\":{\"objectType\":\"article\"}}}}},\"searchAppearance\":{\"postTypes\":{\"post\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"bulkEditing\":\"enabled\"},\"title\":\"#post_title #separator_sa #site_title\",\"metaDescription\":\"#post_excerpt\",\"schemaType\":\"Article\",\"webPageType\":\"WebPage\",\"articleType\":\"BlogPosting\",\"customFields\":null},\"page\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"bulkEditing\":\"enabled\"},\"title\":\"#post_title #separator_sa #site_title\",\"metaDescription\":\"#post_content\",\"schemaType\":\"WebPage\",\"webPageType\":\"WebPage\",\"articleType\":\"BlogPosting\",\"customFields\":null},\"attachment\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true,\"bulkEditing\":\"enabled\"},\"title\":\"#post_title #separator_sa #site_title\",\"metaDescription\":\"#attachment_caption\",\"schemaType\":\"ItemPage\",\"webPageType\":\"ItemPage\",\"articleType\":\"BlogPosting\",\"customFields\":null,\"redirectAttachmentUrls\":\"attachment\"}},\"taxonomies\":{\"category\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true},\"title\":\"#taxonomy_title #separator_sa #site_title\",\"metaDescription\":\"#taxonomy_description\"},\"post_tag\":{\"show\":true,\"advanced\":{\"robotsMeta\":{\"default\":true,\"noindex\":false,\"nofollow\":false,\"noarchive\":false,\"noimageindex\":false,\"notranslate\":false,\"nosnippet\":false,\"noodp\":false,\"maxSnippet\":-1,\"maxVideoPreview\":-1,\"maxImagePreview\":\"large\"},\"showDateInGooglePreview\":true,\"showPostThumbnailInSearch\":true,\"showMetaBox\":true},\"title\":\"#taxonomy_title #separator_sa #site_title\",\"metaDescription\":\"#taxonomy_description\"}},\"archives\":[]},\"seoAnalysis\":{\"postTypes\":{\"all\":true,\"included\":[\"post\",\"page\"]},\"postStatuses\":{\"all\":false,\"included\":[\"publish\",\"draft\",\"private\"]},\"taxonomies\":{\"all\":true,\"included\":[]},\"excludePosts\":[],\"excludeTerms\":[]}}','auto'),
(482,'aioseo_options_dynamic_localized','a:4:{s:42:\"searchAppearance_taxonomies_category_title\";s:41:\"#taxonomy_title #separator_sa #site_title\";s:52:\"searchAppearance_taxonomies_category_metaDescription\";s:21:\"#taxonomy_description\";s:42:\"searchAppearance_taxonomies_post_tag_title\";s:41:\"#taxonomy_title #separator_sa #site_title\";s:52:\"searchAppearance_taxonomies_post_tag_metaDescription\";s:21:\"#taxonomy_description\";}','auto'),
(522,'action_scheduler_migration_status','complete','auto'),
(523,'as_has_wp_comment_logs','no','on');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(1,2,'_wp_page_template','default'),
(2,3,'_wp_page_template','default'),
(4,9,'_form','<div class=\"contact-form\">\n  <div class=\"contact-form__row\">\n    <label>\n      Full Name *\n      [text* your-name autocomplete:name placeholder \"Your full name\"]\n    </label>\n\n    <label>\n      Phone Number *\n      [tel* your-phone class:js-phone-mask autocomplete:tel minlength:19 maxlength:19 placeholder \"+380 (__) ___-__-__\"]\n    </label>\n  </div>\n\n  <div class=\"contact-form__row\">\n    <label>\n      Topic\n      [select your-topic first_as_label \"Select a topic\" \"General Inquiry\" \"Website Development\" \"Design & UX\" \"Technical Support\"]\n    </label>\n\n    <label>\n      Age\n      [number your-age min:1 max:120 placeholder \"Your age (optional)\"]\n    </label>\n  </div>\n\n  <label>\n    Message\n    [textarea your-message placeholder \"Tell us about your request\"]\n  </label>\n\n  <div class=\"contact-form__consent\">\n    [acceptance your-consent] I agree to the processing of my personal data for the purpose of responding to my inquiry. [/acceptance]\n  </div>\n\n  [submit class:contact-form__submit \"Send Message\"]\n</div>'),
(5,9,'_mail','a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:35:\"[_site_title] - New contact request\";s:6:\"sender\";s:50:\"[_site_title] <wordpress@wordpress-test.ddev.site>\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:4:\"body\";s:4324:\"<table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#f1f5f9;font-family:Arial,Helvetica,sans-serif;color:#263449;\">\n  <tr>\n    <td align=\"center\" style=\"padding:32px 12px;\">\n\n      <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:600px;background-color:#ffffff;border-radius:14px;overflow:hidden;\">\n\n        <!-- Header -->\n        <tr>\n          <td style=\"background-color:#101e38;padding:34px 36px;\">\n            <p style=\"margin:0 0 24px;font-size:12px;font-weight:bold;letter-spacing:2px;color:#8ed8ff;\">\n              ✦ SPACE LABORATORY\n            </p>\n            <h1 style=\"margin:0 0 12px;font-size:27px;line-height:1.3;font-weight:bold;color:#ffffff;\">\n              New contact request\n            </h1>\n            <p style=\"margin:0;font-size:14px;line-height:1.6;color:#b9c9dd;\">\n              A new message has been submitted through your website.\n            </p>\n          </td>\n        </tr>\n\n        <!-- Contact details -->\n        <tr>\n          <td style=\"padding:32px 36px 16px;\">\n\n            <p style=\"margin:0 0 22px;font-size:12px;font-weight:bold;letter-spacing:1.5px;color:#51799b;\">\n              CONTACT DETAILS\n            </p>\n\n            <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;\">\n\n              <tr>\n                <td style=\"padding:0 0 18px;border-bottom:1px solid #e8edf3;\">\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Full Name</p>\n                  <p style=\"margin:0;font-size:16px;font-weight:bold;color:#172a44;\">[your-name]</p>\n                </td>\n              </tr>\n\n              <tr>\n                <td style=\"padding:18px 0;border-bottom:1px solid #e8edf3;\">\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Phone Number</p>\n                  <p style=\"margin:0;font-size:16px;font-weight:bold;color:#172a44;\">\n                    <a href=\"tel:[your-phone]\" style=\"color:#247cab;text-decoration:none;\">[your-phone]</a>\n                  </p>\n                </td>\n              </tr>\n\n              <tr>\n                <td style=\"padding:18px 0;border-bottom:1px solid #e8edf3;\">\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Topic</p>\n                  <p style=\"margin:0;font-size:15px;color:#172a44;\">[your-topic]</p>\n                </td>\n              </tr>\n\n              <tr>\n                <td style=\"padding:18px 0;border-bottom:1px solid #e8edf3;\">\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Age</p>\n                  <p style=\"margin:0;font-size:15px;color:#172a44;\">[your-age]</p>\n                </td>\n              </tr>\n\n            </table>\n          </td>\n        </tr>\n\n        <!-- Message -->\n        <tr>\n          <td style=\"padding:8px 36px 24px;\">\n            <p style=\"margin:0 0 12px;font-size:12px;font-weight:bold;letter-spacing:1.5px;color:#51799b;\">\n              MESSAGE\n            </p>\n            <div style=\"background-color:#f0f7fc;border-left:3px solid #61b9ed;border-radius:6px;padding:20px;font-size:15px;line-height:1.7;color:#263449;white-space:pre-line;overflow-wrap:break-word;\">[your-message]</div>\n          </td>\n        </tr>\n\n        <!-- Consent -->\n        <tr>\n          <td style=\"padding:0 36px 32px;\">\n            <p style=\"margin:0 0 8px;font-size:12px;font-weight:bold;letter-spacing:1.5px;color:#51799b;\">\n              CONSENT\n            </p>\n            <p style=\"margin:0;font-size:13px;line-height:1.6;color:#697b90;\">\n              [your-consent]\n            </p>\n          </td>\n        </tr>\n\n        <!-- Footer -->\n        <tr>\n          <td style=\"background-color:#f7f9fc;border-top:1px solid #e8edf3;padding:24px 36px;\">\n            <p style=\"margin:0 0 8px;font-size:12px;color:#7d8da3;\">\n              This is an automated notification from your website.\n            </p>\n            <a href=\"[_site_url]\" style=\"font-size:13px;font-weight:bold;color:#247cab;text-decoration:none;\">\n              Visit website\n            </a>\n          </td>\n        </tr>\n\n      </table>\n\n      <p style=\"margin:20px 0 0;font-size:11px;color:#93a1b2;\">\n        © [_site_title] · Contact form notification\n      </p>\n\n    </td>\n  </tr>\n</table>\";s:18:\"additional_headers\";s:0:\"\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:1;s:13:\"exclude_blank\";b:1;}'),
(6,9,'_mail_2','a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:50:\"[_site_title] <wordpress@wordpress-test.ddev.site>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:220:\"Message Body:\n[your-message]\n\n-- \nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:1;s:13:\"exclude_blank\";b:1;}'),
(7,9,'_messages','a:22:{s:12:\"mail_sent_ok\";s:51:\"Thank you! Your message has been sent successfully.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:27:\"Please fill out this field.\";s:16:\"invalid_too_long\";s:32:\"This field has a too long input.\";s:17:\"invalid_too_short\";s:33:\"This field has a too short input.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:31:\"The uploaded file is too large.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:12:\"invalid_date\";s:41:\"Please enter a date in YYYY-MM-DD format.\";s:14:\"date_too_early\";s:32:\"This field has a too early date.\";s:13:\"date_too_late\";s:31:\"This field has a too late date.\";s:14:\"invalid_number\";s:22:\"Please enter a number.\";s:16:\"number_too_small\";s:34:\"This field has a too small number.\";s:16:\"number_too_large\";s:34:\"This field has a too large number.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:13:\"invalid_email\";s:30:\"Please enter an email address.\";s:11:\"invalid_url\";s:19:\"Please enter a URL.\";s:11:\"invalid_tel\";s:32:\"Please enter a telephone number.\";}'),
(8,9,'_additional_settings','acceptance_as_validation: on\nflamingo_name: \"[your-name]\"\nflamingo_email: \"\"\nflamingo_subject: \"Write to Us - [your-topic]\"'),
(9,9,'_locale','en_US'),
(10,9,'_hash','6cf3c7e474d2cf6363103f16526bb5aab23a8a8db206c89703afc91bc8d99d40'),
(11,10,'_wp_attached_file','2026/10/custom-theme-logo-for-light-background.png'),
(12,10,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1755;s:6:\"height\";i:366;s:4:\"file\";s:50:\"2026/10/custom-theme-logo-for-light-background.png\";s:8:\"filesize\";i:490759;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:49:\"custom-theme-logo-for-light-background-300x63.png\";s:5:\"width\";i:300;s:6:\"height\";i:63;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22316;}s:5:\"large\";a:5:{s:4:\"file\";s:51:\"custom-theme-logo-for-light-background-1024x214.png\";s:5:\"width\";i:1024;s:6:\"height\";i:214;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:185107;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:50:\"custom-theme-logo-for-light-background-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:8005;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:50:\"custom-theme-logo-for-light-background-768x160.png\";s:5:\"width\";i:768;s:6:\"height\";i:160;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:110832;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:51:\"custom-theme-logo-for-light-background-1536x320.png\";s:5:\"width\";i:1536;s:6:\"height\";i:320;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:386183;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(13,11,'_wp_trash_meta_status','publish'),
(14,11,'_wp_trash_meta_time','1793306782'),
(15,12,'_wp_trash_meta_status','publish'),
(16,12,'_wp_trash_meta_time','1793306920'),
(17,13,'_wp_attached_file','2026/10/favicon-3.png'),
(18,13,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1254;s:6:\"height\";i:1254;s:4:\"file\";s:21:\"2026/10/favicon-3.png\";s:8:\"filesize\";i:999545;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:21:\"favicon-3-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:68593;}s:5:\"large\";a:5:{s:4:\"file\";s:23:\"favicon-3-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:584651;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:21:\"favicon-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:22002;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:21:\"favicon-3-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:347532;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(19,14,'_wp_attached_file','2026/10/cropped-favicon-3.png'),
(20,14,'_wp_attachment_context','site-icon'),
(21,14,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:29:\"2026/10/cropped-favicon-3.png\";s:8:\"filesize\";i:170090;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:29:\"cropped-favicon-3-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:66679;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:29:\"cropped-favicon-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21782;}s:13:\"site_icon-270\";a:5:{s:4:\"file\";s:29:\"cropped-favicon-3-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:56404;}s:13:\"site_icon-192\";a:5:{s:4:\"file\";s:29:\"cropped-favicon-3-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:32614;}s:13:\"site_icon-180\";a:5:{s:4:\"file\";s:29:\"cropped-favicon-3-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:29306;}s:12:\"site_icon-64\";a:5:{s:4:\"file\";s:27:\"cropped-favicon-3-64x64.png\";s:5:\"width\";i:64;s:6:\"height\";i:64;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:5513;}s:12:\"site_icon-32\";a:5:{s:4:\"file\";s:27:\"cropped-favicon-3-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1841;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(22,15,'_wp_trash_meta_status','publish'),
(23,15,'_wp_trash_meta_time','1793309446'),
(24,16,'_wp_trash_meta_status','publish'),
(25,16,'_wp_trash_meta_time','1793309763'),
(26,17,'_menu_item_type','custom'),
(27,17,'_menu_item_menu_item_parent','0'),
(28,17,'_menu_item_object_id','17'),
(29,17,'_menu_item_object','custom'),
(30,17,'_menu_item_target',''),
(31,17,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(32,17,'_menu_item_xfn',''),
(33,17,'_menu_item_url','/#faqs'),
(35,18,'_menu_item_type','custom'),
(36,18,'_menu_item_menu_item_parent','0'),
(37,18,'_menu_item_object_id','18'),
(38,18,'_menu_item_object','custom'),
(39,18,'_menu_item_target',''),
(40,18,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(41,18,'_menu_item_xfn',''),
(42,18,'_menu_item_url','/#contacts'),
(53,20,'_menu_item_type','custom'),
(54,20,'_menu_item_menu_item_parent','0'),
(55,20,'_menu_item_object_id','20'),
(56,20,'_menu_item_object','custom'),
(57,20,'_menu_item_target',''),
(58,20,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(59,20,'_menu_item_xfn',''),
(60,20,'_menu_item_url','/#benefits'),
(62,21,'_menu_item_type','custom'),
(63,21,'_menu_item_menu_item_parent','0'),
(64,21,'_menu_item_object_id','21'),
(65,21,'_menu_item_object','custom'),
(66,21,'_menu_item_target',''),
(67,21,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(68,21,'_menu_item_xfn',''),
(69,21,'_menu_item_url','/#about'),
(71,22,'_menu_item_type','custom'),
(72,22,'_menu_item_menu_item_parent','0'),
(73,22,'_menu_item_object_id','22'),
(74,22,'_menu_item_object','custom'),
(75,22,'_menu_item_target',''),
(76,22,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(77,22,'_menu_item_xfn',''),
(78,22,'_menu_item_url','/#contact-form'),
(80,24,'_edit_last','2'),
(82,25,'_edit_last','2'),
(84,23,'_edit_last','2'),
(93,6,'_edit_last','2'),
(94,6,'_ct_homepage_hero','a:5:{s:5:\"title\";s:38:\"Reliable solutions for modern websites\";s:8:\"subtitle\";s:219:\"We create clear, functional, and user-friendly web experiences for businesses and personal projects. Our approach focuses on clean structure, responsive layouts, and features that are easy to manage and scale over time.\";s:11:\"button_text\";s:16:\"Submit a request\";s:10:\"button_url\";s:13:\"#contact-form\";s:7:\"gallery\";a:3:{i:0;i:31;i:1;i:32;i:2;i:33;}}'),
(95,31,'_wp_attached_file','2026/10/Observatory.jpg'),
(96,31,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1536;s:6:\"height\";i:1020;s:4:\"file\";s:23:\"2026/10/Observatory.jpg\";s:8:\"filesize\";i:157453;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"Observatory-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7841;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"Observatory-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:59813;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"Observatory-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3769;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"Observatory-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:36696;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(97,31,'_wp_attachment_image_alt','image description'),
(98,32,'_wp_attached_file','2026/10/heic1509a.jpg'),
(99,32,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1280;s:6:\"height\";i:959;s:4:\"file\";s:21:\"2026/10/heic1509a.jpg\";s:8:\"filesize\";i:327770;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:21:\"heic1509a-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:73644;}s:5:\"large\";a:5:{s:4:\"file\";s:22:\"heic1509a-1024x767.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:767;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:202765;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:21:\"heic1509a-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:63036;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:21:\"heic1509a-768x575.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:146846;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:32:\"NASA, ESA, the Hubble Heritage T\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:538:\"  This NASA/ESA Hubble Space Telescope image of the cluster Westerlund 2 and its surroundings has been released to celebrate Hubble’s 25th year in orbit and a quarter of a century of new discoveries, stunning images and outstanding science. The image’s central region, containing the star cluster, blends visible-light data taken by the Advanced Camera for Surveys and near-infrared exposures taken by the Wide Field Camera 3. The surrounding region is composed of visible-light observations taken by the Advanced Camera for Surveys.\";s:17:\"created_timestamp\";s:10:\"1429802100\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:50:\"Westerlund 2 — Hubble’s 25th anniversary image\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:4:{i:0;s:6:\"Gum 29\";i:1;s:6:\"RCW 49\";i:2;s:12:\"Westerlund 2\";i:3;s:6:\"WR 20a\";}s:3:\"alt\";s:0:\"\";}}'),
(100,33,'_wp_attached_file','2026/10/gP2SlH.jpeg'),
(101,33,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1920;s:6:\"height\";i:1200;s:4:\"file\";s:19:\"2026/10/gP2SlH.jpeg\";s:8:\"filesize\";i:2932714;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:19:\"gP2SlH-300x188.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:188;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:28909;}s:5:\"large\";a:5:{s:4:\"file\";s:20:\"gP2SlH-1024x640.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:640;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:208159;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:19:\"gP2SlH-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19800;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:19:\"gP2SlH-768x480.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:480;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:120506;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:20:\"gP2SlH-1536x960.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:960;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:445409;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:27:\"Hubble Telescope Wallpapers\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:27:\"Hubble Telescope Wallpapers\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}}'),
(110,6,'_ct_homepage_about','a:5:{s:5:\"title\";s:18:\"About Our Approach\";s:11:\"button_text\";s:16:\"Explore Our Work\";s:10:\"button_url\";s:1:\"#\";s:7:\"gallery\";a:6:{i:0;i:44;i:1;i:45;i:2;i:46;i:3;i:47;i:4;i:48;i:5;i:49;}s:11:\"description\";s:1232:\"We believe that a good website should be both visually appealing and easy to use. Our approach combines thoughtful design, clear structure, and practical functionality to create digital experiences that feel natural and consistent across different devices.\r\n\r\nWe begin by understanding the purpose of each page and the information visitors need most. This helps us organize content into meaningful sections, establish a clear visual hierarchy, and make navigation straightforward without unnecessary distractions.\r\n\r\nAttention to detail is an important part of the process. From typography and spacing to responsive layouts and interactive elements, every decision should support readability, accessibility, and performance. Small improvements can make a noticeable difference in how comfortable a website feels to use.\r\n\r\nWe also value flexibility and simplicity behind the scenes. Content should be easy to update, components should work well together, and new features should fit naturally into the existing structure. A well-organized foundation makes everyday maintenance easier and leaves room for future changes.\r\n\r\nThis balance helps us create reliable solutions that remain useful and easy to improve as each project grows.\";}'),
(111,44,'_wp_attached_file','2026/10/pexels-damir-28893489-scaled.jpg'),
(112,44,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:1374;s:6:\"height\";i:2560;s:4:\"file\";s:40:\"2026/10/pexels-damir-28893489-scaled.jpg\";s:8:\"filesize\";i:1250731;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:33:\"pexels-damir-28893489-161x300.jpg\";s:5:\"width\";i:161;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14214;}s:5:\"large\";a:5:{s:4:\"file\";s:34:\"pexels-damir-28893489-550x1024.jpg\";s:5:\"width\";i:550;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:174708;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:33:\"pexels-damir-28893489-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8236;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:34:\"pexels-damir-28893489-768x1431.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1431;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:359803;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:34:\"pexels-damir-28893489-824x1536.jpg\";s:5:\"width\";i:824;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:421117;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:35:\"pexels-damir-28893489-1099x2048.jpg\";s:5:\"width\";i:1099;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:792264;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}s:14:\"original_image\";s:25:\"pexels-damir-28893489.jpg\";}'),
(113,45,'_wp_attached_file','2026/10/pexels-annija-u-492300719-16047151-scaled.jpg'),
(114,45,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:1709;s:6:\"height\";i:2560;s:4:\"file\";s:53:\"2026/10/pexels-annija-u-492300719-16047151-scaled.jpg\";s:8:\"filesize\";i:929750;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"pexels-annija-u-492300719-16047151-200x300.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19054;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"pexels-annija-u-492300719-16047151-684x1024.jpg\";s:5:\"width\";i:684;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:187896;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"pexels-annija-u-492300719-16047151-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7989;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:47:\"pexels-annija-u-492300719-16047151-768x1150.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:230811;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:48:\"pexels-annija-u-492300719-16047151-1025x1536.jpg\";s:5:\"width\";i:1025;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:387200;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:48:\"pexels-annija-u-492300719-16047151-1367x2048.jpg\";s:5:\"width\";i:1367;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:635630;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}s:14:\"original_image\";s:38:\"pexels-annija-u-492300719-16047151.jpg\";}'),
(115,46,'_wp_attached_file','2026/10/pexels-damir-18894621-scaled.jpg'),
(116,46,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:1367;s:6:\"height\";i:2560;s:4:\"file\";s:40:\"2026/10/pexels-damir-18894621-scaled.jpg\";s:8:\"filesize\";i:539190;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:33:\"pexels-damir-18894621-160x300.jpg\";s:5:\"width\";i:160;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8505;}s:5:\"large\";a:5:{s:4:\"file\";s:34:\"pexels-damir-18894621-547x1024.jpg\";s:5:\"width\";i:547;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:91632;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:33:\"pexels-damir-18894621-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4801;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:34:\"pexels-damir-18894621-768x1439.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1439;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:177746;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:34:\"pexels-damir-18894621-820x1536.jpg\";s:5:\"width\";i:820;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:202787;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:35:\"pexels-damir-18894621-1093x2048.jpg\";s:5:\"width\";i:1093;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:352362;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}s:14:\"original_image\";s:25:\"pexels-damir-18894621.jpg\";}'),
(117,47,'_wp_attached_file','2026/10/pexels-morlaiim-285925855-34485377-scaled.jpg'),
(118,47,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:1707;s:6:\"height\";i:2560;s:4:\"file\";s:53:\"2026/10/pexels-morlaiim-285925855-34485377-scaled.jpg\";s:8:\"filesize\";i:1048354;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"pexels-morlaiim-285925855-34485377-200x300.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:18094;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"pexels-morlaiim-285925855-34485377-683x1024.jpg\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:194687;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"pexels-morlaiim-285925855-34485377-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6865;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:47:\"pexels-morlaiim-285925855-34485377-768x1152.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:242402;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:48:\"pexels-morlaiim-285925855-34485377-1024x1536.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:414136;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:48:\"pexels-morlaiim-285925855-34485377-1365x2048.jpg\";s:5:\"width\";i:1365;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:700572;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}s:14:\"original_image\";s:38:\"pexels-morlaiim-285925855-34485377.jpg\";}'),
(119,48,'_wp_attached_file','2026/10/pexels-kenzhar-sharap-125323072-18227137-scaled.jpg'),
(120,48,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:1707;s:6:\"height\";i:2560;s:4:\"file\";s:59:\"2026/10/pexels-kenzhar-sharap-125323072-18227137-scaled.jpg\";s:8:\"filesize\";i:429833;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:52:\"pexels-kenzhar-sharap-125323072-18227137-200x300.jpg\";s:5:\"width\";i:200;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13779;}s:5:\"large\";a:5:{s:4:\"file\";s:53:\"pexels-kenzhar-sharap-125323072-18227137-683x1024.jpg\";s:5:\"width\";i:683;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:99201;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:52:\"pexels-kenzhar-sharap-125323072-18227137-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5328;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"pexels-kenzhar-sharap-125323072-18227137-768x1152.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1152;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:118834;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:54:\"pexels-kenzhar-sharap-125323072-18227137-1024x1536.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:187774;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:54:\"pexels-kenzhar-sharap-125323072-18227137-1365x2048.jpg\";s:5:\"width\";i:1365;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:298695;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:7:\"Kenzhar\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}s:14:\"original_image\";s:44:\"pexels-kenzhar-sharap-125323072-18227137.jpg\";}'),
(121,49,'_wp_attached_file','2026/10/pexels-oksana-bulgaru-176523174-20680807-scaled.jpg'),
(122,49,'_wp_attachment_metadata','a:7:{s:5:\"width\";i:1439;s:6:\"height\";i:2560;s:4:\"file\";s:59:\"2026/10/pexels-oksana-bulgaru-176523174-20680807-scaled.jpg\";s:8:\"filesize\";i:1434745;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:52:\"pexels-oksana-bulgaru-176523174-20680807-169x300.jpg\";s:5:\"width\";i:169;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19730;}s:5:\"large\";a:5:{s:4:\"file\";s:53:\"pexels-oksana-bulgaru-176523174-20680807-576x1024.jpg\";s:5:\"width\";i:576;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:240049;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:52:\"pexels-oksana-bulgaru-176523174-20680807-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8644;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:53:\"pexels-oksana-bulgaru-176523174-20680807-768x1366.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:1366;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:430082;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:53:\"pexels-oksana-bulgaru-176523174-20680807-864x1536.jpg\";s:5:\"width\";i:864;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:542957;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:54:\"pexels-oksana-bulgaru-176523174-20680807-1152x2048.jpg\";s:5:\"width\";i:1152;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:949992;}}s:10:\"image_meta\";a:13:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}s:3:\"alt\";s:0:\"\";}s:14:\"original_image\";s:44:\"pexels-oksana-bulgaru-176523174-20680807.jpg\";}'),
(133,9,'_flamingo','a:1:{s:7:\"channel\";i:5;}'),
(302,62,'_menu_item_type','custom'),
(303,62,'_menu_item_menu_item_parent','0'),
(304,62,'_menu_item_object_id','62'),
(305,62,'_menu_item_object','custom'),
(306,62,'_menu_item_target',''),
(307,62,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(308,62,'_menu_item_xfn',''),
(309,62,'_menu_item_url','/#benefits'),
(311,63,'_menu_item_type','custom'),
(312,63,'_menu_item_menu_item_parent','0'),
(313,63,'_menu_item_object_id','63'),
(314,63,'_menu_item_object','custom'),
(315,63,'_menu_item_target',''),
(316,63,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(317,63,'_menu_item_xfn',''),
(318,63,'_menu_item_url','/#about'),
(320,64,'_menu_item_type','custom'),
(321,64,'_menu_item_menu_item_parent','0'),
(322,64,'_menu_item_object_id','64'),
(323,64,'_menu_item_object','custom'),
(324,64,'_menu_item_target',''),
(325,64,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(326,64,'_menu_item_xfn',''),
(327,64,'_menu_item_url','/#contact-form'),
(329,65,'_menu_item_type','custom'),
(330,65,'_menu_item_menu_item_parent','0'),
(331,65,'_menu_item_object_id','65'),
(332,65,'_menu_item_object','custom'),
(333,65,'_menu_item_target',''),
(334,65,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(335,65,'_menu_item_xfn',''),
(336,65,'_menu_item_url','/#contacts'),
(338,66,'_menu_item_type','custom'),
(339,66,'_menu_item_menu_item_parent','0'),
(340,66,'_menu_item_object_id','66'),
(341,66,'_menu_item_object','custom'),
(342,66,'_menu_item_target',''),
(343,66,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(344,66,'_menu_item_xfn',''),
(345,66,'_menu_item_url','/#faqs'),
(347,20,'_wp_old_date','2026-10-29'),
(348,21,'_wp_old_date','2026-10-29'),
(349,22,'_wp_old_date','2026-10-29'),
(350,18,'_wp_old_date','2026-10-29'),
(351,17,'_wp_old_date','2026-10-29'),
(355,67,'_wp_trash_meta_status','publish'),
(356,67,'_wp_trash_meta_time','1793469227'),
(357,69,'_wp_attached_file','2026/10/facebook.svg'),
(358,69,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:337;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:20:\"2026/10/facebook.svg\";s:5:\"sizes\";a:0:{}}'),
(359,70,'_wp_attached_file','2026/10/linkedin.svg'),
(360,70,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:401;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:20:\"2026/10/linkedin.svg\";s:5:\"sizes\";a:0:{}}'),
(367,74,'_wp_attached_file','2026/10/instagram.svg'),
(368,74,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:366;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:21:\"2026/10/instagram.svg\";s:5:\"sizes\";a:0:{}}'),
(370,75,'_wp_trash_meta_status','publish'),
(371,75,'_wp_trash_meta_time','1793469764'),
(372,76,'_wp_attached_file','2026/10/inst.svg'),
(373,76,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:369;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:16:\"2026/10/inst.svg\";s:5:\"sizes\";a:0:{}}'),
(374,77,'_wp_attached_file','2026/10/fb.svg'),
(375,77,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:292;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:14:\"2026/10/fb.svg\";s:5:\"sizes\";a:0:{}}'),
(376,78,'_wp_attached_file','2026/10/in.svg'),
(377,78,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:390;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:14:\"2026/10/in.svg\";s:5:\"sizes\";a:0:{}}'),
(378,79,'_wp_attached_file','2026/10/facebook-1.svg'),
(379,79,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:337;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:22:\"2026/10/facebook-1.svg\";s:5:\"sizes\";a:0:{}}'),
(380,80,'_wp_attached_file','2026/10/instagram-1.svg'),
(381,80,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:366;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:23:\"2026/10/instagram-1.svg\";s:5:\"sizes\";a:0:{}}'),
(382,81,'_wp_attached_file','2026/10/linkedin-1.svg'),
(383,81,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:401;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:22:\"2026/10/linkedin-1.svg\";s:5:\"sizes\";a:0:{}}'),
(385,83,'_wp_attached_file','2026/10/fb-2.svg'),
(386,83,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:292;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:16:\"2026/10/fb-2.svg\";s:5:\"sizes\";a:0:{}}'),
(387,84,'_wp_attached_file','2026/10/in-2.svg'),
(388,84,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:390;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:16:\"2026/10/in-2.svg\";s:5:\"sizes\";a:0:{}}'),
(389,85,'_wp_attached_file','2026/10/inst-2.svg'),
(390,85,'_wp_attachment_metadata','a:5:{s:8:\"filesize\";i:369;s:5:\"width\";i:48;s:6:\"height\";i:48;s:4:\"file\";s:18:\"2026/10/inst-2.svg\";s:5:\"sizes\";a:0:{}}'),
(391,82,'_wp_trash_meta_status','publish'),
(392,82,'_wp_trash_meta_time','1793471959'),
(393,86,'wp_pattern_sync_status','unsynced'),
(395,6,'_ct_homepage_contacts','a:2:{s:5:\"title\";s:8:\"Contacts\";s:3:\"map\";s:447:\"<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2540.6437852204613!2d30.519572176936315!3d50.44773538755885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d4ce56b2456d3b%3A0xd062ae171b57e947!2z0LLRg9C70LjRhtGPINCl0YDQtdGJ0LDRgtC40LosINCa0LjRl9CyLCAwMjAwMA!5e0!3m2!1suk!2sua!4v1793474571822!5m2!1suk!2sua\" title=\"Location on Google Maps\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\" allowfullscreen></iframe>\";}'),
(396,6,'_aioseo_title','Space Laboratory | Exploring the Universe'),
(397,6,'_aioseo_description','We explore distant galaxies, observe celestial bodies, and occasionally peek through people\'s windows from outer space. Strictly for scientific purposes!'),
(398,6,'_aioseo_og_title',''),
(399,6,'_aioseo_og_description',''),
(400,6,'_aioseo_og_article_section',''),
(401,6,'_aioseo_twitter_title',''),
(402,6,'_aioseo_twitter_description',''),
(403,6,'_aioseo_keywords','a:0:{}'),
(404,6,'_aioseo_og_article_tags','a:0:{}'),
(405,49,'_wp_attachment_image_alt','image description'),
(406,48,'_wp_attachment_image_alt','image description'),
(407,47,'_wp_attachment_image_alt','image description'),
(408,46,'_wp_attachment_image_alt','image description'),
(409,45,'_wp_attachment_image_alt','image description'),
(410,44,'_wp_attachment_image_alt','image description'),
(411,33,'_wp_attachment_image_alt','image description'),
(412,32,'_wp_attachment_image_alt','image description');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `type_status_author` (`post_type`,`post_status`,`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(1,2,'2026-10-29 19:34:03','2026-10-29 19:34:03','<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->','Hello world!','','publish','open','open','','hello-world','','','2026-10-29 19:34:03','2026-10-29 19:34:03','',0,'https://wordpress-test.ddev.site/?p=1',0,'post','',1),
(2,2,'2026-10-29 19:34:03','2026-10-29 19:34:03','<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\">\n<!-- wp:paragraph -->\n<p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p>\n<!-- /wp:paragraph -->\n</blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"https://wordpress-test.ddev.site/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->','Sample Page','','publish','closed','open','','sample-page','','','2026-10-29 19:34:03','2026-10-29 19:34:03','',0,'https://wordpress-test.ddev.site/?page_id=2',0,'page','',0),
(3,2,'2026-10-29 19:34:03','2026-10-29 19:34:03','<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: https://wordpress-test.ddev.site.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n','Privacy Policy','','draft','closed','open','','privacy-policy','','','2026-10-29 19:34:03','2026-10-29 19:34:03','',0,'https://wordpress-test.ddev.site/?page_id=3',0,'page','',0),
(4,0,'2026-10-29 19:34:03','2026-10-29 19:34:03','<!-- wp:page-list /-->','Navigation','','publish','closed','closed','','navigation','','','2026-10-29 19:34:03','2026-10-29 19:34:03','',0,'https://wordpress-test.ddev.site/2026/10/29/navigation/',0,'wp_navigation','',0),
(5,2,'2026-10-29 19:34:16','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2026-10-29 19:34:16','0000-00-00 00:00:00','',0,'https://wordpress-test.ddev.site/?p=5',0,'post','',0),
(6,2,'2026-10-29 19:53:53','2026-10-29 19:53:53','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"benefits\"} -->\n<div id=\"benefits\" class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Responsive Layouts</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our solutions are designed to adapt smoothly to different screen sizes and devices. Content remains clear, accessible, and easy to navigate on desktop, tablet, and mobile.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Flexible Solutions</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Every project has its own requirements and opportunities. We focus on building flexible components that can be adapted, extended, and reused as needs change.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Easy Content Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Updating website content should be simple and convenient. A clear editing experience makes it easier to manage information, publish updates, and keep everything organized.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">User-Friendly Experience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We pay attention to how visitors interact with every page and feature. Intuitive navigation, readable content, and thoughtful details help create a comfortable browsing experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Ready for Growth</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A well-structured website provides a reliable foundation for future development. New sections, features, and content can be introduced as the project continues to evolve.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:shortcode -->\n[theme_about]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"write-to-us-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"contact-form\"} -->\n<div id=\"contact-form\" class=\"wp-block-group write-to-us-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Write to Us</h2>\n<!-- /wp:heading -->\n\n<!-- wp:shortcode -->\n[contact-form-7 id=\"6cf3c7e\" title=\"Write to Us\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group -->\n\n<!-- wp:shortcode -->\n[theme_contacts]\n<!-- /wp:shortcode -->','Home','','publish','closed','closed','','home','','','2026-11-01 21:12:13','2026-11-01 21:12:13','',0,'https://wordpress-test.ddev.site/?page_id=6',0,'page','',0),
(7,2,'2026-10-29 19:53:32','2026-10-29 19:53:32','{\"version\":3,\"isGlobalStylesUserThemeJSON\":true}','Custom Styles','','publish','closed','closed','','wp-global-styles-custom-theme','','','2026-10-29 19:53:32','2026-10-29 19:53:32','',0,'https://wordpress-test.ddev.site/2026/10/29/wp-global-styles-custom-theme/',0,'wp_global_styles','',0),
(8,2,'2026-10-29 19:53:53','2026-10-29 19:53:53','','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-29 19:53:53','2026-10-29 19:53:53','',6,'https://wordpress-test.ddev.site/?p=8',0,'revision','',0),
(9,0,'2026-10-29 20:21:58','2026-10-29 20:21:58','<div class=\"contact-form\">\r\n  <div class=\"contact-form__row\">\r\n    <label>\r\n      Full Name *\r\n      [text* your-name autocomplete:name placeholder \"Your full name\"]\r\n    </label>\r\n\r\n    <label>\r\n      Phone Number *\r\n      [tel* your-phone class:js-phone-mask autocomplete:tel minlength:19 maxlength:19 placeholder \"+380 (__) ___-__-__\"]\r\n    </label>\r\n  </div>\r\n\r\n  <div class=\"contact-form__row\">\r\n    <label>\r\n      Topic\r\n      [select your-topic first_as_label \"Select a topic\" \"General Inquiry\" \"Website Development\" \"Design & UX\" \"Technical Support\"]\r\n    </label>\r\n\r\n    <label>\r\n      Age\r\n      [number your-age min:1 max:120 placeholder \"Your age (optional)\"]\r\n    </label>\r\n  </div>\r\n\r\n  <label>\r\n    Message\r\n    [textarea your-message placeholder \"Tell us about your request\"]\r\n  </label>\r\n\r\n  <div class=\"contact-form__consent\">\r\n    [acceptance your-consent] I agree to the processing of my personal data for the purpose of responding to my inquiry. [/acceptance]\r\n  </div>\r\n\r\n  [submit class:contact-form__submit \"Send Message\"]\r\n</div>\n1\n[_site_title] - New contact request\n[_site_title] <wordpress@wordpress-test.ddev.site>\n[_site_admin_email]\n<table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:#f1f5f9;font-family:Arial,Helvetica,sans-serif;color:#263449;\">\r\n  <tr>\r\n    <td align=\"center\" style=\"padding:32px 12px;\">\r\n\r\n      <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:600px;background-color:#ffffff;border-radius:14px;overflow:hidden;\">\r\n\r\n        <!-- Header -->\r\n        <tr>\r\n          <td style=\"background-color:#101e38;padding:34px 36px;\">\r\n            <p style=\"margin:0 0 24px;font-size:12px;font-weight:bold;letter-spacing:2px;color:#8ed8ff;\">\r\n              ✦ SPACE LABORATORY\r\n            </p>\r\n            <h1 style=\"margin:0 0 12px;font-size:27px;line-height:1.3;font-weight:bold;color:#ffffff;\">\r\n              New contact request\r\n            </h1>\r\n            <p style=\"margin:0;font-size:14px;line-height:1.6;color:#b9c9dd;\">\r\n              A new message has been submitted through your website.\r\n            </p>\r\n          </td>\r\n        </tr>\r\n\r\n        <!-- Contact details -->\r\n        <tr>\r\n          <td style=\"padding:32px 36px 16px;\">\r\n\r\n            <p style=\"margin:0 0 22px;font-size:12px;font-weight:bold;letter-spacing:1.5px;color:#51799b;\">\r\n              CONTACT DETAILS\r\n            </p>\r\n\r\n            <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;\">\r\n\r\n              <tr>\r\n                <td style=\"padding:0 0 18px;border-bottom:1px solid #e8edf3;\">\r\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Full Name</p>\r\n                  <p style=\"margin:0;font-size:16px;font-weight:bold;color:#172a44;\">[your-name]</p>\r\n                </td>\r\n              </tr>\r\n\r\n              <tr>\r\n                <td style=\"padding:18px 0;border-bottom:1px solid #e8edf3;\">\r\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Phone Number</p>\r\n                  <p style=\"margin:0;font-size:16px;font-weight:bold;color:#172a44;\">\r\n                    <a href=\"tel:[your-phone]\" style=\"color:#247cab;text-decoration:none;\">[your-phone]</a>\r\n                  </p>\r\n                </td>\r\n              </tr>\r\n\r\n              <tr>\r\n                <td style=\"padding:18px 0;border-bottom:1px solid #e8edf3;\">\r\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Topic</p>\r\n                  <p style=\"margin:0;font-size:15px;color:#172a44;\">[your-topic]</p>\r\n                </td>\r\n              </tr>\r\n\r\n              <tr>\r\n                <td style=\"padding:18px 0;border-bottom:1px solid #e8edf3;\">\r\n                  <p style=\"margin:0 0 6px;font-size:12px;color:#7d8da3;\">Age</p>\r\n                  <p style=\"margin:0;font-size:15px;color:#172a44;\">[your-age]</p>\r\n                </td>\r\n              </tr>\r\n\r\n            </table>\r\n          </td>\r\n        </tr>\r\n\r\n        <!-- Message -->\r\n        <tr>\r\n          <td style=\"padding:8px 36px 24px;\">\r\n            <p style=\"margin:0 0 12px;font-size:12px;font-weight:bold;letter-spacing:1.5px;color:#51799b;\">\r\n              MESSAGE\r\n            </p>\r\n            <div style=\"background-color:#f0f7fc;border-left:3px solid #61b9ed;border-radius:6px;padding:20px;font-size:15px;line-height:1.7;color:#263449;white-space:pre-line;overflow-wrap:break-word;\">[your-message]</div>\r\n          </td>\r\n        </tr>\r\n\r\n        <!-- Consent -->\r\n        <tr>\r\n          <td style=\"padding:0 36px 32px;\">\r\n            <p style=\"margin:0 0 8px;font-size:12px;font-weight:bold;letter-spacing:1.5px;color:#51799b;\">\r\n              CONSENT\r\n            </p>\r\n            <p style=\"margin:0;font-size:13px;line-height:1.6;color:#697b90;\">\r\n              [your-consent]\r\n            </p>\r\n          </td>\r\n        </tr>\r\n\r\n        <!-- Footer -->\r\n        <tr>\r\n          <td style=\"background-color:#f7f9fc;border-top:1px solid #e8edf3;padding:24px 36px;\">\r\n            <p style=\"margin:0 0 8px;font-size:12px;color:#7d8da3;\">\r\n              This is an automated notification from your website.\r\n            </p>\r\n            <a href=\"[_site_url]\" style=\"font-size:13px;font-weight:bold;color:#247cab;text-decoration:none;\">\r\n              Visit website\r\n            </a>\r\n          </td>\r\n        </tr>\r\n\r\n      </table>\r\n\r\n      <p style=\"margin:20px 0 0;font-size:11px;color:#93a1b2;\">\r\n        © [_site_title] · Contact form notification\r\n      </p>\r\n\r\n    </td>\r\n  </tr>\r\n</table>\n\n\n1\n1\n\n[_site_title] \"[your-subject]\"\n[_site_title] <wordpress@wordpress-test.ddev.site>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis email is a receipt for your contact form submission on our website ([_site_title] [_site_url]) in which your email address was used. If that was not you, please ignore this message.\nReply-To: [_site_admin_email]\n\n1\n1\nThank you! Your message has been sent successfully.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nPlease fill out this field.\nThis field has a too long input.\nThis field has a too short input.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe uploaded file is too large.\nThere was an error uploading the file.\nPlease enter a date in YYYY-MM-DD format.\nThis field has a too early date.\nThis field has a too late date.\nPlease enter a number.\nThis field has a too small number.\nThis field has a too large number.\nThe answer to the quiz is incorrect.\nPlease enter an email address.\nPlease enter a URL.\nPlease enter a telephone number.\nacceptance_as_validation: on\r\nflamingo_name: \"[your-name]\"\r\nflamingo_email: \"\"\r\nflamingo_subject: \"Write to Us - [your-topic]\"','Write to Us','','publish','closed','closed','','contact-form-1','','','2026-11-01 20:49:56','2026-11-01 20:49:56','',0,'https://wordpress-test.ddev.site/?post_type=wpcf7_contact_form&#038;p=9',0,'wpcf7_contact_form','',0),
(10,2,'2026-10-29 20:45:51','2026-10-29 20:45:51','','custom-theme-logo-for-light-background','','inherit','open','closed','','custom-theme-logo-for-light-background','','','2026-10-29 20:45:51','2026-10-29 20:45:51','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/custom-theme-logo-for-light-background.png',0,'attachment','image/png',0),
(11,2,'2026-10-29 20:46:22','2026-10-29 20:46:22','{\"custom-theme::custom_logo\":{\"value\":10,\"type\":\"theme_mod\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-29 20:46:22\"}}','','','trash','closed','closed','','0bdda9ad-c8b3-4a67-b131-ce3aab5a45ea','','','2026-10-29 20:46:22','2026-10-29 20:46:22','',0,'https://wordpress-test.ddev.site/0bdda9ad-c8b3-4a67-b131-ce3aab5a45ea/',0,'customize_changeset','',0),
(12,2,'2026-10-29 20:48:40','2026-10-29 20:48:40','{\"blogdescription\":{\"value\":\"Tagline\",\"type\":\"option\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-29 20:48:40\"}}','','','trash','closed','closed','','556bd3a9-9a42-4d40-96d4-83a73cf45a41','','','2026-10-29 20:48:40','2026-10-29 20:48:40','',0,'https://wordpress-test.ddev.site/556bd3a9-9a42-4d40-96d4-83a73cf45a41/',0,'customize_changeset','',0),
(13,2,'2026-10-29 21:30:37','2026-10-29 21:30:37','','favicon (3)','','inherit','open','closed','','favicon-3','','','2026-10-29 21:30:37','2026-10-29 21:30:37','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/favicon-3.png',0,'attachment','image/png',0),
(14,2,'2026-10-29 21:30:43','2026-10-29 21:30:43','https://wordpress-test.ddev.site/wp-content/uploads/2026/10/cropped-favicon-3.png','cropped-favicon-3.png','','inherit','open','closed','','cropped-favicon-3-png','','','2026-10-29 21:30:43','2026-10-29 21:30:43','',13,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/cropped-favicon-3.png',0,'attachment','image/png',0),
(15,2,'2026-10-29 21:30:46','2026-10-29 21:30:46','{\"site_icon\":{\"value\":14,\"type\":\"option\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-29 21:30:46\"}}','','','trash','closed','closed','','22cfcb08-5f2a-42c7-8ab5-eb5a1edbf67d','','','2026-10-29 21:30:46','2026-10-29 21:30:46','',0,'https://wordpress-test.ddev.site/22cfcb08-5f2a-42c7-8ab5-eb5a1edbf67d/',0,'customize_changeset','',0),
(16,2,'2026-10-29 21:36:03','2026-10-29 21:36:03','{\"custom-theme::ct_phone\":{\"value\":\"+380000000000\",\"type\":\"theme_mod\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-29 21:36:03\"}}','','','trash','closed','closed','','5e994177-3c4c-4413-bf41-be5d47530daa','','','2026-10-29 21:36:03','2026-10-29 21:36:03','',0,'https://wordpress-test.ddev.site/5e994177-3c4c-4413-bf41-be5d47530daa/',0,'customize_changeset','',0),
(17,2,'2026-10-31 16:59:25','2026-10-29 21:38:28','','FAQs','','publish','closed','closed','','faqs','','','2026-10-31 16:59:25','2026-10-31 16:59:25','',0,'https://wordpress-test.ddev.site/?p=17',5,'nav_menu_item','',0),
(18,2,'2026-10-31 16:59:25','2026-10-29 21:38:28','','Contacts','','publish','closed','closed','','contacts','','','2026-10-31 16:59:25','2026-10-31 16:59:25','',0,'https://wordpress-test.ddev.site/?p=18',4,'nav_menu_item','',0),
(20,2,'2026-10-31 16:59:25','2026-10-29 21:52:14','','Benefits','','publish','closed','closed','','benefits','','','2026-10-31 16:59:25','2026-10-31 16:59:25','',0,'https://wordpress-test.ddev.site/?p=20',1,'nav_menu_item','',0),
(21,2,'2026-10-31 16:59:25','2026-10-29 21:52:14','','About','','publish','closed','closed','','about','','','2026-10-31 16:59:25','2026-10-31 16:59:25','',0,'https://wordpress-test.ddev.site/?p=21',2,'nav_menu_item','',0),
(22,2,'2026-10-31 16:59:25','2026-10-29 21:52:14','','Write to us','','publish','closed','closed','','write-to-us','','','2026-10-31 16:59:25','2026-10-31 16:59:25','',0,'https://wordpress-test.ddev.site/?p=22',3,'nav_menu_item','',0),
(23,2,'2026-10-30 11:09:52','2026-10-30 11:09:52','<div>\r\n<div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero deleniti deserunt soluta quia iste, inventore eius officia voluptates necessitatibus in, illo repellendus doloremque. Molestias similique perferendis a saepe, aliquam tenetur.</div>\r\n<div>Laudantium eius hic obcaecati consequuntur nam deleniti, quo cupiditate quod, iusto voluptatibus dolor debitis impedit, mollitia laborum magni voluptate. Aliquid tempore deleniti quas aperiam ipsam, tenetur laborum aliquam in incidunt.</div>\r\n</div>','An interesting question','','publish','closed','closed','','an-interesting-question','','','2026-10-30 11:10:50','2026-10-30 11:10:50','',0,'https://wordpress-test.ddev.site/?post_type=faq&#038;p=23',0,'faq','',0),
(24,2,'2026-10-30 11:09:54','2026-10-30 11:09:54','<div>\r\n<div>Cum similique, animi voluptate beatae ipsam praesentium vero placeat mollitia! Dignissimos incidunt, doloremque temporibus iusto error debitis repudiandae? Excepturi voluptates maxime iure suscipit quisquam eius, aliquam quibusdam quasi fugit voluptas.</div>\r\n<div>Perferendis ipsam facilis laboriosam autem accusantium esse dignissimos adipisci ea, doloribus dolore quisquam fugit sunt dolores corrupti assumenda dicta culpa ipsa blanditiis molestiae? Eligendi vel, nisi temporibus distinctio illum ipsum.</div>\r\n<div>Modi, magni reiciendis eum labore ipsum quae optio alias laudantium quibusdam tempore dignissimos voluptates architecto? Iure repellendus veritatis cumque obcaecati qui rem velit voluptate natus, voluptatibus quia, corrupti vero. Tenetur?</div>\r\n<div>Nemo dolore voluptatum delectus quasi dignissimos dolorem soluta accusantium non, ipsam earum in odit. Porro reiciendis dignissimos, eos iusto dicta velit. Explicabo adipisci nesciunt deserunt ab alias recusandae natus aut.</div>\r\n</div>','A very interesting question','','publish','closed','closed','','a-very-interesting-question','','','2026-10-30 11:10:13','2026-10-30 11:10:13','',0,'https://wordpress-test.ddev.site/?post_type=faq&#038;p=24',1,'faq','',0),
(25,2,'2026-10-30 11:10:47','2026-10-30 11:10:47','<div>\r\n<div>2Rem reiciendis amet nam atque nobis quas asperiores hic debitis maiores ut ullam similique quasi voluptatem minima pariatur, quibusdam, optio numquam? Tempore et laboriosam porro laudantium dolore incidunt exercitationem quaerat!</div>\r\n<div>Reprehenderit doloribus, molestiae voluptates iusto mollitia ipsam dolore dolor exercitationem voluptate laborum porro iste suscipit officiis dicta atque, optio fugit aut ullam eaque pariatur sequi maiores esse dolorem laudantium. Eum.</div>\r\n<div>Dicta earum illum facilis repellat accusantium nemo, nesciunt impedit id minima deleniti. Pariatur, inventore alias deserunt iste nemo vero nesciunt aut sunt totam quos natus. Mollitia omnis quam dolorum repellendus.</div>\r\n<div>Pariatur minima ipsa itaque corporis. Vero facere commodi quidem laborum excepturi repudiandae maiores odit cumque illo repellendus saepe nam sint, corrupti ratione esse ex adipisci ullam? Excepturi ipsam exercitationem a!</div>\r\n</div>','The most interesting question','','publish','closed','closed','','the-most-interesting-question','','','2026-10-30 11:10:19','2026-10-30 11:10:19','',0,'https://wordpress-test.ddev.site/?post_type=faq&#038;p=25',2,'faq','',0),
(30,2,'2026-10-30 18:40:35','2026-10-30 18:40:35','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-30 18:40:35','2026-10-30 18:40:35','',6,'https://wordpress-test.ddev.site/?p=30',0,'revision','',0),
(31,2,'2026-10-30 19:02:24','2026-10-30 19:02:24','','Observatory','','inherit','open','closed','','observatory','','','2026-10-30 19:02:40','2026-10-30 19:02:40','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/Observatory.jpg',0,'attachment','image/jpeg',0),
(32,2,'2026-10-30 19:04:07','2026-10-30 19:04:07','','Westerlund 2 — Hubble’s 25th anniversary image','  This NASA/ESA Hubble Space Telescope image of the cluster Westerlund 2 and its surroundings has been released to celebrate Hubble’s 25th year in orbit and a quarter of a century of new discoveries, stunning images and outstanding science. The image’s central region, containing the star cluster, blends visible-light data taken by the Advanced Camera for Surveys and near-infrared exposures taken by the Wide Field Camera 3. The surrounding region is composed of visible-light observations taken by the Advanced Camera for Surveys.','inherit','open','closed','','westerlund-2-hubbles-25th-anniversary-image','','','2026-11-01 21:48:51','2026-11-01 21:48:51','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/heic1509a.jpg',0,'attachment','image/jpeg',0),
(33,2,'2026-10-30 19:07:36','2026-10-30 19:07:36','','Hubble Telescope Wallpapers','Hubble Telescope Wallpapers','inherit','open','closed','','hubble-telescope-wallpapers','','','2026-11-01 21:48:49','2026-11-01 21:48:49','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/gP2SlH.jpeg',0,'attachment','image/jpeg',0),
(36,2,'2026-10-30 19:28:54','2026-10-30 19:28:54','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\"}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-30 19:28:54','2026-10-30 19:28:54','',6,'https://wordpress-test.ddev.site/?p=36',0,'revision','',0),
(38,2,'2026-10-30 19:32:48','2026-10-30 19:32:48','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-30 19:32:48','2026-10-30 19:32:48','',6,'https://wordpress-test.ddev.site/?p=38',0,'revision','',0),
(40,2,'2026-10-30 19:36:26','2026-10-30 19:36:26','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Responsive Layouts</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our solutions are designed to adapt smoothly to different screen sizes and devices. Content remains clear, accessible, and easy to navigate on desktop, tablet, and mobile.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Flexible Solutions</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Every project has its own requirements and opportunities. We focus on building flexible components that can be adapted, extended, and reused as needs change.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Easy Content Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Updating website content should be simple and convenient. A clear editing experience makes it easier to manage information, publish updates, and keep everything organized.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">User-Friendly Experience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We pay attention to how visitors interact with every page and feature. Intuitive navigation, readable content, and thoughtful details help create a comfortable browsing experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Ready for Growth</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A well-structured website provides a reliable foundation for future development. New sections, features, and content can be introduced as the project continues to evolve.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-30 19:36:26','2026-10-30 19:36:26','',6,'https://wordpress-test.ddev.site/?p=40',0,'revision','',0),
(42,2,'2026-10-30 20:17:49','2026-10-30 20:17:49','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"benefits\"} -->\n<div id=\"benefits\" class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Responsive Layouts</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our solutions are designed to adapt smoothly to different screen sizes and devices. Content remains clear, accessible, and easy to navigate on desktop, tablet, and mobile.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Flexible Solutions</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Every project has its own requirements and opportunities. We focus on building flexible components that can be adapted, extended, and reused as needs change.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Easy Content Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Updating website content should be simple and convenient. A clear editing experience makes it easier to manage information, publish updates, and keep everything organized.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">User-Friendly Experience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We pay attention to how visitors interact with every page and feature. Intuitive navigation, readable content, and thoughtful details help create a comfortable browsing experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Ready for Growth</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A well-structured website provides a reliable foundation for future development. New sections, features, and content can be introduced as the project continues to evolve.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-30 20:17:49','2026-10-30 20:17:49','',6,'https://wordpress-test.ddev.site/?p=42',0,'revision','',0),
(43,2,'2026-10-30 20:38:04','2026-10-30 20:38:04','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"benefits\"} -->\n<div id=\"benefits\" class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Responsive Layouts</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our solutions are designed to adapt smoothly to different screen sizes and devices. Content remains clear, accessible, and easy to navigate on desktop, tablet, and mobile.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Flexible Solutions</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Every project has its own requirements and opportunities. We focus on building flexible components that can be adapted, extended, and reused as needs change.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Easy Content Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Updating website content should be simple and convenient. A clear editing experience makes it easier to manage information, publish updates, and keep everything organized.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">User-Friendly Experience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We pay attention to how visitors interact with every page and feature. Intuitive navigation, readable content, and thoughtful details help create a comfortable browsing experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Ready for Growth</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A well-structured website provides a reliable foundation for future development. New sections, features, and content can be introduced as the project continues to evolve.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:shortcode -->\n[theme_about]\n<!-- /wp:shortcode -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-30 20:38:04','2026-10-30 20:38:04','',6,'https://wordpress-test.ddev.site/?p=43',0,'revision','',0),
(44,2,'2026-10-30 20:43:07','2026-10-30 20:43:07','','pexels-damir-28893489','','inherit','open','closed','','pexels-damir-28893489','','','2026-11-01 21:48:46','2026-11-01 21:48:46','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/pexels-damir-28893489.jpg',0,'attachment','image/jpeg',0),
(45,2,'2026-10-30 20:43:10','2026-10-30 20:43:10','','pexels-annija-u-492300719-16047151','','inherit','open','closed','','pexels-annija-u-492300719-16047151','','','2026-11-01 21:48:44','2026-11-01 21:48:44','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/pexels-annija-u-492300719-16047151.jpg',0,'attachment','image/jpeg',0),
(46,2,'2026-10-30 20:43:15','2026-10-30 20:43:15','','pexels-damir-18894621','','inherit','open','closed','','pexels-damir-18894621','','','2026-11-01 21:48:41','2026-11-01 21:48:41','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/pexels-damir-18894621.jpg',0,'attachment','image/jpeg',0),
(47,2,'2026-10-30 20:43:22','2026-10-30 20:43:22','','pexels-morlaiim-285925855-34485377','','inherit','open','closed','','pexels-morlaiim-285925855-34485377','','','2026-11-01 21:48:37','2026-11-01 21:48:37','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/pexels-morlaiim-285925855-34485377.jpg',0,'attachment','image/jpeg',0),
(48,2,'2026-10-30 20:43:30','2026-10-30 20:43:30','','pexels-kenzhar-sharap-125323072-18227137','','inherit','open','closed','','pexels-kenzhar-sharap-125323072-18227137','','','2026-11-01 21:48:32','2026-11-01 21:48:32','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/pexels-kenzhar-sharap-125323072-18227137.jpg',0,'attachment','image/jpeg',0),
(49,2,'2026-10-30 20:43:36','2026-10-30 20:43:36','','pexels-oksana-bulgaru-176523174-20680807','','inherit','open','closed','','pexels-oksana-bulgaru-176523174-20680807','','','2026-11-01 21:48:28','2026-11-01 21:48:28','',6,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/pexels-oksana-bulgaru-176523174-20680807.jpg',0,'attachment','image/jpeg',0),
(53,2,'2026-10-31 12:58:24','2026-10-31 12:58:24','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"benefits\"} -->\n<div id=\"benefits\" class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Responsive Layouts</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our solutions are designed to adapt smoothly to different screen sizes and devices. Content remains clear, accessible, and easy to navigate on desktop, tablet, and mobile.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Flexible Solutions</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Every project has its own requirements and opportunities. We focus on building flexible components that can be adapted, extended, and reused as needs change.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Easy Content Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Updating website content should be simple and convenient. A clear editing experience makes it easier to manage information, publish updates, and keep everything organized.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">User-Friendly Experience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We pay attention to how visitors interact with every page and feature. Intuitive navigation, readable content, and thoughtful details help create a comfortable browsing experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Ready for Growth</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A well-structured website provides a reliable foundation for future development. New sections, features, and content can be introduced as the project continues to evolve.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:shortcode -->\n[theme_about]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"write-to-us-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"contact-form\"} -->\n<div id=\"contact-form\" class=\"wp-block-group write-to-us-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Write to Us</h2>\n<!-- /wp:heading -->\n\n<!-- wp:shortcode -->\n[contact-form-7 id=\"6cf3c7e\" title=\"Write to Us\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-31 12:58:24','2026-10-31 12:58:24','',6,'https://wordpress-test.ddev.site/?p=53',0,'revision','',0),
(62,2,'2026-10-31 16:59:28','2026-10-31 16:59:28','','Benefits','','publish','closed','closed','','benefits-2','','','2026-10-31 16:59:28','2026-10-31 16:59:28','',0,'https://wordpress-test.ddev.site/?p=62',1,'nav_menu_item','',0),
(63,2,'2026-10-31 16:59:28','2026-10-31 16:59:28','','About','','publish','closed','closed','','about-2','','','2026-10-31 16:59:28','2026-10-31 16:59:28','',0,'https://wordpress-test.ddev.site/?p=63',2,'nav_menu_item','',0),
(64,2,'2026-10-31 16:59:28','2026-10-31 16:59:28','','Contact Form','','publish','closed','closed','','contact-form','','','2026-10-31 16:59:28','2026-10-31 16:59:28','',0,'https://wordpress-test.ddev.site/?p=64',3,'nav_menu_item','',0),
(65,2,'2026-10-31 16:59:28','2026-10-31 16:59:28','','Contact Details','','publish','closed','closed','','contact-details','','','2026-10-31 16:59:28','2026-10-31 16:59:28','',0,'https://wordpress-test.ddev.site/?p=65',4,'nav_menu_item','',0),
(66,2,'2026-10-31 16:59:28','2026-10-31 16:59:28','','FAQs','','publish','closed','closed','','faqs-2','','','2026-10-31 16:59:28','2026-10-31 16:59:28','',0,'https://wordpress-test.ddev.site/?p=66',5,'nav_menu_item','',0),
(67,2,'2026-10-31 17:53:47','2026-10-31 17:53:47','{\"custom-theme::ct_social_links\":{\"value\":[{\"title\":\"Facebook\",\"url\":\"https://www.facebook.com/\",\"icon\":0}],\"type\":\"theme_mod\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-31 17:53:47\"},\"custom-theme::ct_email\":{\"value\":\"reviewer@example.test\",\"type\":\"theme_mod\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-31 17:41:52\"},\"custom-theme::ct_address\":{\"value\":\"Київ, вул. Хрещатик, 1\",\"type\":\"theme_mod\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-31 17:38:49\"}}','','','trash','closed','closed','','8fd9a70d-4381-474d-ba26-20a64a9551a2','','','2026-10-31 17:53:47','2026-10-31 17:53:47','',0,'https://wordpress-test.ddev.site/?p=67',0,'customize_changeset','',0),
(69,2,'2026-10-31 17:53:59','2026-10-31 17:53:59','','facebook','','inherit','open','closed','','facebook','','','2026-10-31 17:53:59','2026-10-31 17:53:59','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/facebook.svg',0,'attachment','image/svg+xml',0),
(70,2,'2026-10-31 17:54:07','2026-10-31 17:54:07','','linkedin','','inherit','open','closed','','linkedin','','','2026-10-31 17:54:07','2026-10-31 17:54:07','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/linkedin.svg',0,'attachment','image/svg+xml',0),
(74,2,'2026-10-31 17:54:07','2026-10-31 17:54:07','','instagram','','inherit','open','closed','','instagram','','','2026-10-31 17:54:07','2026-10-31 17:54:07','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/instagram.svg',0,'attachment','image/svg+xml',0),
(75,2,'2026-10-31 18:02:44','2026-10-31 18:02:44','{\"custom-theme::ct_social_links\":{\"value\":[{\"title\":\"Facebook\",\"url\":\"https://www.facebook.com/\",\"icon\":69},{\"title\":\"Linkedin\",\"url\":\"https://www.linkedin.com/\",\"icon\":70},{\"title\":\"Instagram\",\"url\":\"https://www.instagram.com/\",\"icon\":74}],\"type\":\"theme_mod\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-31 18:02:44\"}}','','','trash','closed','closed','','6062bed3-5c8a-4c87-93f5-c88f556518b9','','','2026-10-31 18:02:44','2026-10-31 18:02:44','',0,'https://wordpress-test.ddev.site/?p=75',0,'customize_changeset','',0),
(76,2,'2026-10-31 18:37:21','2026-10-31 18:37:21','','inst','','inherit','open','closed','','inst','','','2026-10-31 18:37:21','2026-10-31 18:37:21','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/inst.svg',0,'attachment','image/svg+xml',0),
(77,2,'2026-10-31 18:37:21','2026-10-31 18:37:21','','fb','','inherit','open','closed','','fb','','','2026-10-31 18:37:21','2026-10-31 18:37:21','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/fb.svg',0,'attachment','image/svg+xml',0),
(78,2,'2026-10-31 18:37:21','2026-10-31 18:37:21','','in','','inherit','open','closed','','in','','','2026-10-31 18:37:21','2026-10-31 18:37:21','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/in.svg',0,'attachment','image/svg+xml',0),
(79,2,'2026-10-31 18:37:41','2026-10-31 18:37:41','','facebook','','inherit','open','closed','','facebook-2','','','2026-10-31 18:37:41','2026-10-31 18:37:41','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/facebook-1.svg',0,'attachment','image/svg+xml',0),
(80,2,'2026-10-31 18:37:41','2026-10-31 18:37:41','','instagram','','inherit','open','closed','','instagram-2','','','2026-10-31 18:37:41','2026-10-31 18:37:41','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/instagram-1.svg',0,'attachment','image/svg+xml',0),
(81,2,'2026-10-31 18:37:41','2026-10-31 18:37:41','','linkedin','','inherit','open','closed','','linkedin-2','','','2026-10-31 18:37:41','2026-10-31 18:37:41','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/linkedin-1.svg',0,'attachment','image/svg+xml',0),
(82,2,'2026-10-31 18:39:19','2026-10-31 18:39:19','{\"custom-theme::ct_social_links\":{\"value\":[{\"title\":\"Facebook\",\"url\":\"https://www.facebook.com/\",\"icon\":83},{\"title\":\"Linkedin\",\"url\":\"https://www.linkedin.com/\",\"icon\":84},{\"title\":\"Instagram\",\"url\":\"https://www.instagram.com/\",\"icon\":85}],\"type\":\"theme_mod\",\"user_id\":2,\"date_modified_gmt\":\"2026-10-31 18:39:19\"}}','','','trash','closed','closed','','bd202753-0dc2-45d0-91e9-6f151279b27d','','','2026-10-31 18:39:19','2026-10-31 18:39:19','',0,'https://wordpress-test.ddev.site/?p=82',0,'customize_changeset','',0),
(83,2,'2026-10-31 18:38:55','2026-10-31 18:38:55','','fb-2','','inherit','open','closed','','fb-2','','','2026-10-31 18:38:55','2026-10-31 18:38:55','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/fb-2.svg',0,'attachment','image/svg+xml',0),
(84,2,'2026-10-31 18:38:55','2026-10-31 18:38:55','','in-2','','inherit','open','closed','','in-2','','','2026-10-31 18:38:55','2026-10-31 18:38:55','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/in-2.svg',0,'attachment','image/svg+xml',0),
(85,2,'2026-10-31 18:38:55','2026-10-31 18:38:55','','inst-2','','inherit','open','closed','','inst-2','','','2026-10-31 18:38:55','2026-10-31 18:38:55','',0,'https://wordpress-test.ddev.site/wp-content/uploads/2026/10/inst-2.svg',0,'attachment','image/svg+xml',0),
(86,2,'2026-10-31 18:56:11','2026-10-31 18:56:11','<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"benefits\"} -->\n<div id=\"benefits\" class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Responsive Layouts</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our solutions are designed to adapt smoothly to different screen sizes and devices. Content remains clear, accessible, and easy to navigate on desktop, tablet, and mobile.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Flexible Solutions</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Every project has its own requirements and opportunities. We focus on building flexible components that can be adapted, extended, and reused as needs change.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Easy Content Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Updating website content should be simple and convenient. A clear editing experience makes it easier to manage information, publish updates, and keep everything organized.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">User-Friendly Experience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We pay attention to how visitors interact with every page and feature. Intuitive navigation, readable content, and thoughtful details help create a comfortable browsing experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Ready for Growth</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A well-structured website provides a reliable foundation for future development. New sections, features, and content can be introduced as the project continues to evolve.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->','Benefits Section','','publish','closed','closed','','benefits-section','','','2026-10-31 18:56:11','2026-10-31 18:56:11','',0,'https://wordpress-test.ddev.site/benefits-section/',0,'wp_block','',0),
(88,2,'2026-10-31 19:25:07','2026-10-31 19:25:07','<!-- wp:shortcode -->\n[theme_hero]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"benefits-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"benefits\"} -->\n<div id=\"benefits\" class=\"wp-block-group benefits-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Benefits</h2>\n<!-- /wp:heading -->\n\n<!-- wp:group {\"layout\":{\"type\":\"grid\",\"columnCount\":3}} -->\n<div class=\"wp-block-group\"><!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Modern Design</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We create clean, attractive layouts that combine visual simplicity with practical functionality. Every detail is carefully considered to provide a consistent and enjoyable experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Responsive Layouts</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Our solutions are designed to adapt smoothly to different screen sizes and devices. Content remains clear, accessible, and easy to navigate on desktop, tablet, and mobile.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Flexible Solutions</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Every project has its own requirements and opportunities. We focus on building flexible components that can be adapted, extended, and reused as needs change.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Easy Content Management</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Updating website content should be simple and convenient. A clear editing experience makes it easier to manage information, publish updates, and keep everything organized.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">User-Friendly Experience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>We pay attention to how visitors interact with every page and feature. Intuitive navigation, readable content, and thoughtful details help create a comfortable browsing experience.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\"><!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">Ready for Growth</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A well-structured website provides a reliable foundation for future development. New sections, features, and content can be introduced as the project continues to evolve.</p>\n<!-- /wp:paragraph --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group --></div>\n<!-- /wp:group -->\n\n<!-- wp:shortcode -->\n[theme_about]\n<!-- /wp:shortcode -->\n\n<!-- wp:group {\"className\":\"write-to-us-section container\",\"layout\":{\"type\":\"constrained\"},\"anchor\":\"contact-form\"} -->\n<div id=\"contact-form\" class=\"wp-block-group write-to-us-section container\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Write to Us</h2>\n<!-- /wp:heading -->\n\n<!-- wp:shortcode -->\n[contact-form-7 id=\"6cf3c7e\" title=\"Write to Us\"]\n<!-- /wp:shortcode --></div>\n<!-- /wp:group -->\n\n<!-- wp:shortcode -->\n[theme_contacts]\n<!-- /wp:shortcode -->','Home','','inherit','closed','closed','','6-revision-v1','','','2026-10-31 19:25:07','2026-10-31 19:25:07','',6,'https://wordpress-test.ddev.site/?p=88',0,'revision','',0),
(90,2,'2026-11-02 06:18:48','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2026-11-02 06:18:48','0000-00-00 00:00:00','',0,'https://wordpress-test.ddev.site/?p=90',0,'post','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(1,1,0),
(7,2,0),
(17,3,0),
(18,3,0),
(20,3,0),
(21,3,0),
(22,3,0),
(62,6,0),
(63,6,0),
(64,6,0),
(65,6,0),
(66,6,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,1),
(2,2,'wp_theme','',0,1),
(3,3,'nav_menu','',0,5),
(4,4,'flamingo_inbound_channel','',0,0),
(5,5,'flamingo_inbound_channel','',4,0),
(6,6,'nav_menu','',0,5);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Uncategorized','uncategorized',0),
(2,'custom-theme','custom-theme',0),
(3,'Header Menu','header-menu',0),
(4,'Contact Form 7','contact-form-7',0),
(5,'Write to Us','contact-form-1',0),
(6,'Footer Menu','footer-menu',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(28,2,'nickname','reviewer'),
(29,2,'first_name',''),
(30,2,'last_name',''),
(31,2,'description',''),
(32,2,'rich_editing','true'),
(33,2,'syntax_highlighting','true'),
(34,2,'infinite_scrolling','true'),
(35,2,'comment_shortcuts','false'),
(36,2,'admin_color','modern'),
(37,2,'use_ssl','0'),
(38,2,'show_admin_bar_front','true'),
(39,2,'locale',''),
(40,2,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(41,2,'wp_user_level','10'),
(42,2,'dismissed_wp_pointers',''),
(43,2,'aioseo_profiles_same_username','a:3:{s:6:\"enable\";b:0;s:8:\"username\";s:0:\"\";s:8:\"included\";a:7:{i:0;s:15:\"facebookPageUrl\";i:1;s:10:\"twitterUrl\";i:2;s:9:\"tiktokUrl\";i:3;s:12:\"pinterestUrl\";i:4;s:12:\"instagramUrl\";i:5;s:10:\"youtubeUrl\";i:6;s:11:\"linkedinUrl\";}}'),
(44,2,'aioseo_facebook_page_url',''),
(45,2,'aioseo_twitter_url',''),
(46,2,'aioseo_instagram_url',''),
(47,2,'aioseo_tiktok_url',''),
(48,2,'aioseo_pinterest_url',''),
(49,2,'aioseo_youtube_url',''),
(50,2,'aioseo_linkedin_url',''),
(51,2,'aioseo_tumblr_url',''),
(52,2,'aioseo_yelp_page_url',''),
(53,2,'aioseo_sound_cloud_url',''),
(54,2,'aioseo_wikipedia_url',''),
(55,2,'aioseo_myspace_url',''),
(56,2,'aioseo_word_press_url',''),
(57,2,'aioseo_bluesky_url',''),
(58,2,'aioseo_threads_url',''),
(59,2,'aioseo_profiles_additional_urls',''),
(61,2,'wp_dashboard_quick_press_last_post_id','90'),
(62,2,'aioseo_newsroom_seen_version','5.0.4');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(2,'reviewer','$wp$2y$10$a/BZ1xX1WXoUE2ExdvFUle6hctDJBXNzyBexzsg/z1bWUAsfyzrQy','reviewer','reviewer@example.test','','2026-11-02 06:17:57','',0,'Reviewer');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

