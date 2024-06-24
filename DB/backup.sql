-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2024_06_20_110444_create_products_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'MyApp','1c1f34f025d2f87fe251356fa248e478eb5c1563c75e25fd355d34b75487499b','[\"*\"]',NULL,NULL,'2024-06-20 17:54:39','2024-06-20 17:54:39'),(2,'App\\Models\\User',1,'MyApp','ff3f195f7b9e330ac6138adb76a3ee27c4dc9e2db5c2b2965f15ed1b974aca80','[\"*\"]',NULL,NULL,'2024-06-20 17:56:39','2024-06-20 17:56:39'),(3,'App\\Models\\User',1,'MyApp','f30a1c517ef1a052840b7ef69602ba5f8c0c9924ffa3a52daceac87cbcbe26a1','[\"*\"]',NULL,NULL,'2024-06-20 18:04:57','2024-06-20 18:04:57'),(5,'App\\Models\\User',3,'u@k.com','36c489679a4670fc711d8772fb20a3db41544a2fd39bd6eb040c390c32799f2b','[\"*\"]',NULL,NULL,'2024-06-20 18:48:24','2024-06-20 18:48:24'),(9,'App\\Models\\User',1,'u@s.com','09e90b9b7a6b1945eddf45a710cca6a8431a5c0048b6b81a9d2dd65f85cb13eb','[\"*\"]',NULL,NULL,'2024-06-20 19:13:22','2024-06-20 19:13:22'),(12,'App\\Models\\User',4,'a@b.com','84c05d6d978d923b4fab3016a1ebb7bc3445f1d60817bb4cde32a9a00fea3409','[\"*\"]','2024-06-21 16:00:26',NULL,'2024-06-21 10:29:51','2024-06-21 16:00:26');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Huwaei p8','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.',22400,18,NULL,'2024-06-21 10:55:32','2024-06-21 15:02:03'),(2,'Huwaei p38 X Lite','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.',45988,6,NULL,'2024-06-21 11:09:06','2024-06-21 11:09:06'),(3,'Huwaei mate8','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.',55400,185,NULL,'2024-06-21 15:14:58','2024-06-21 15:14:58'),(4,'Huwaei mate8','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.',55400,185,NULL,'2024-06-21 15:15:02','2024-06-21 15:15:02'),(5,'Huwaei mate8','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.',55400,185,'2024-06-21 16:00:15','2024-06-21 15:15:03','2024-06-21 16:00:15'),(7,'Huawai nova 2','Temporibus iusto eos rem. Autem ea magnam suscipit quis. At provident modi.\nAliquid nesciunt deserunt. Ipsa tempora error ipsa accusantium deserunt adipisci quaerat. Placeat quos nulla corporis sit suscipit laboriosam aut eveniet.\nEaque natus earum accusamus laboriosam distinctio ab unde fugit. Laborum voluptatem amet placeat soluta minus deserunt nam magni porro. Qui eaque exercitationem placeat adipisci nulla placeat quod optio voluptas.',37540,6,'2024-06-24 16:08:22','2024-06-23 18:43:50','2024-06-24 16:08:22'),(9,'Huawai nova 2','Temporibus iusto eos rem. Autem ea magnam suscipit quis. At provident modi.\nAliquid nesciunt deserunt. Ipsa tempora error ipsa accusantium deserunt adipisci quaerat. Placeat quos nulla corporis sit suscipit laboriosam aut eveniet.\nEaque natus earum accusamus laboriosam distinctio ab unde fugit. Laborum voluptatem amet placeat soluta minus deserunt nam magni porro. Qui eaque exercitationem placeat adipisci nulla placeat quod optio voluptas.',37540,6,NULL,'2024-06-23 18:44:09','2024-06-24 16:08:00'),(10,'Huawai nova a2','Sed exercitationem ad repellat non quasi sed ipsam. Commodi magnam at earum illum numquam doloremque quae rem. Adipisci id consequatur ex veritatis laborum eius eius.\nFacere nisi voluptates consequuntur sapiente repellendus magni doloremque. Repudiandae est officia at blanditiis autem. Unde voluptas incidunt provident quisquam.\nDoloribus mollitia perferendis quam. Natus blanditiis debitis sint blanditiis reiciendis ad fugit fugiat in. Officiis illum dignissimos quasi nobis libero voluptatum.',32600,6,NULL,'2024-06-23 18:45:54','2024-06-23 18:45:54'),(11,'Honor smart 7','Iste voluptate soluta nam. Perferendis molestias corrupti nihil repellat nesciunt. Soluta quod modi excepturi molestiae.\nTempore quo neque mollitia sit. Beatae exercitationem velit aspernatur consequatur quasi repellendus. Quod laborum nemo voluptates veniam molestiae.\nProvident quibusdam eos ullam perspiciatis tempora eos voluptas accusamus. Quod veritatis adipisci dolorum ipsa. Alias rem laudantium maxime dolore eveniet.',44834,6,NULL,'2024-06-24 14:56:01','2024-06-24 14:56:01'),(12,'Honor smart 5','Hic suscipit labore quam optio eveniet velit. Magnam quia placeat. Qui doloremque sequi voluptates facilis quia velit velit.\nAmet a quibusdam. Facere maxime qui facilis beatae veritatis accusamus. Laboriosam quibusdam fugit ut.\nVoluptas esse soluta vero eaque occaecati omnis. Aut voluptatum accusamus occaecati. Deleniti sapiente quisquam.',52600,2,NULL,'2024-06-24 15:23:24','2024-06-24 15:23:24'),(13,'Honor smart','Hic suscipit labore quam optio eveniet velit. Magnam quia placeat. Qui doloremque sequi voluptates facilis quia velit velit.\nAmet a quibusdam. Facere maxime qui facilis beatae veritatis accusamus. Laboriosam quibusdam fugit ut.\nVoluptas esse soluta vero eaque occaecati omnis. Aut voluptatum accusamus occaecati. Deleniti sapiente quisquam.',22600,93,NULL,'2024-06-24 15:25:07','2024-06-24 15:56:55');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ursula Stein','u@s.com',NULL,'$2y$10$IcmwYH.PAAVKBOknrIut4ehVSblsOJ2xjnx1AXNIATSrN0mZaALs6',NULL,'2024-06-20 09:36:14','2024-06-20 09:36:14'),(3,'United Kingdom','u@k.com',NULL,'$2y$10$aAuubydZkcMkqOAbe0n7iOIAmf8yXolLD/OoAkDXyhXcLstSVWoXW',NULL,'2024-06-20 18:16:31','2024-06-20 18:16:31'),(4,'Abel Bekar','a@b.com',NULL,'$2y$10$b1EhmGRHNQWG7jpFiwzG.epJnF9sDb07eETn5LNBZ4a3nzINsX60G',NULL,'2024-06-20 19:16:18','2024-06-20 19:16:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-24 16:21:39
