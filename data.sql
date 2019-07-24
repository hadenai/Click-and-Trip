-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: clickAndTrip
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `agency`
--

DROP TABLE IF EXISTS `agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_creation` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `presentation` longtext COLLATE utf8mb4_unicode_ci,
  `flagship` longtext COLLATE utf8mb4_unicode_ci,
  `deleted` tinyint(1) DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validate` tinyint(1) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_70C0C6E6E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agency`
--

LOCK TABLES `agency` WRITE;
/*!40000 ALTER TABLE `agency` DISABLE KEYS */;
INSERT INTO `agency` VALUES (319,'fbrunet@wanadoo.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$Q2EvcEtiRDBiMkRrZDRoNg$GHIdPJeATG12MqqxESSRVImgGxFizZc+qGT4PWGCer8','Réunion (La)','Olivier','9, place Renée Leclercq\n66111 Nicolas','Diaz','Claude','Guillot',2001,'Dolorem nihil quisquam officia et ea aperiam sit qui ratione est excepturi aut et eaque deserunt expedita quam quaerat eum eos sed officiis dolore at ut quam deserunt officiis modi necessitatibus ab impedit velit sed amet commodi accusantium quasi sapiente eveniet quis quaerat praesentium qui animi quam omnis cupiditate.','Vitae quia corrupti harum doloremque quod at aut enim et magnam est voluptas ullam doloremque sunt quia culpa beatae impedit sint et.','Dolore et explicabo adipisci optio maiores voluptatem commodi.',0,'+33 (0)9 06 26 83 43',0,NULL,NULL),(320,'michel.perrot@bouygtel.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$dDN4dXIwUHNZQ1U4SlE0NA$zWcuocWAAIk7hcCpTS3jRzj7uAMCu3f7HC/8esFZ/To','Saint-Marin (Rép. de)','Didier','57, rue de Perret\n37 363 Kleindan','Samson','Marc','Breton',2002,'Quam ratione fugiat doloribus fugit assumenda est quo similique facere consequuntur praesentium rem porro ut itaque nihil nihil vero sunt nihil consequatur ut voluptas voluptatem harum at enim amet veritatis aut aut et ratione rerum accusamus aut dolorem autem repellendus aperiam tempora.','Sit et incidunt quis facilis quae non est rem id sequi laboriosam in hic laudantium repudiandae.','Magni necessitatibus qui ea nostrum architecto ut ipsa minus dolor ut error.',0,'07 66 83 21 96',0,NULL,NULL),(321,'lucy94@yahoo.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$WC5xb2xkY21DUVAzckgvSg$sZU9w5mwIj4QvEl9VISg/x6qMwNU4R8iR3iVzQpJ/YU','République tchèque','MeyerBourg','50, rue René Leduc\n06 736 PineauVille','Blanchet','Marc','Imbert',2003,'Odio nemo qui vero adipisci sit quia aspernatur earum dolorem velit ea qui eius sint non nihil quos aliquam et earum maxime facilis impedit possimus quidem quo laboriosam exercitationem qui qui dolor repudiandae enim.','In et neque eius amet quis facere qui tempore et velit accusantium velit voluptates est consequatur nihil doloremque totam eos cum distinctio excepturi maiores quidem doloribus quibusdam at consectetur molestiae.','Aliquid eos culpa quod ea et aut sunt illo aut optio.',0,'0757256890',0,NULL,NULL),(322,'guillon.laurent@live.com','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$MUQ4MkxIWlA0c2xML0IwYw$53RkHKICi2ldu4vXFjqlmPZKa1dDskx7u/hTyAZojmw','Malte','Bonnin','8, place de Masson\n66612 Gay','Gallet et Fils','Claude','Grondin',2004,'Accusamus aut veniam quos delectus delectus provident est quia praesentium eos error et ut iusto natus eos distinctio nobis placeat est nesciunt temporibus voluptatem omnis dolor dolores quo nihil fugiat illo qui voluptatem est vel nihil voluptatibus sed sit dicta nesciunt aut itaque.','Maiores molestiae ipsa recusandae blanditiis ut ut recusandae necessitatibus deleniti officiis voluptatibus praesentium quo id recusandae ipsum nemo molestias sunt ducimus reiciendis nisi blanditiis.','Sit minima unde eos est sit distinctio maxime impedit.',0,'0180083391',0,NULL,NULL),(323,'colin.susanne@club-internet.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$VC4uNHoxSkVCTDR3bndrWA$SME/b2PW8Tn0v2omJzYQrzNaBr5afSE3C24QVC21weg','Samoa','Daniel','68, place Martineau\n13671 Boulayboeuf','Dias Fouquet S.A.','Michel','Becker',2005,'Reprehenderit voluptas architecto necessitatibus eaque et cumque modi ipsum perspiciatis itaque maiores perferendis et nihil eligendi iusto quis deleniti reprehenderit voluptate est assumenda neque animi adipisci eum ducimus enim similique fugit assumenda expedita.','Voluptatem perspiciatis minima ad excepturi molestiae dolorum error et sit et et sed voluptatem autem optio.','Et dolores consequatur eligendi vero libero voluptatem labore sint et.',0,'01 20 10 47 96',0,NULL,NULL),(324,'leleu.josephine@gmail.com','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$MXdGdDdKLjFRd1VhQnNvLw$E+mad/QgK0PX560GUwTmhML/njYLYVKboMEeUDJJ0l8','Suède','Ledoux','58, boulevard Paul Joly\n69097 Clercboeuf','Sauvage Imbert S.A.R.L.','Eugène','Samson',2006,'Distinctio amet numquam aspernatur tempore et quo et qui laudantium et voluptas id minus totam vero reprehenderit laboriosam quas maxime et reiciendis illum et ratione deleniti.','Porro sed eum incidunt ut similique quidem saepe quis cumque blanditiis consequatur molestias quis voluptas quia.','Maxime repellat velit nihil nemo qui quia voluptates et.',0,'+33 1 98 05 09 87',0,NULL,NULL),(325,'genevieve.roussel@orange.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$c3dEVE5DN2kzcEZMd0JKVg$J9ldP8aC6NxOXOLGMKe9YUOue9LCsDqdaqT8pYqpgVo','Aruba','Goncalves','19, chemin Julien Olivier\n83 844 Joseph','Bailly SARL','Éric','Boyer',2007,'Dolor quia quia eligendi incidunt vel occaecati sapiente molestias cupiditate repudiandae impedit soluta laboriosam et minus repellendus similique nostrum eligendi harum earum vel et tempora pariatur laboriosam non et modi ad et ratione qui ipsum et voluptas est maiores ad nobis illo non distinctio accusamus non sed sunt ipsum officia quia ex eos minus aut dicta.','Provident aut praesentium eius impedit blanditiis corporis dolores dignissimos inventore et consequatur corporis alias autem aut voluptas doloremque rerum mollitia.','Enim atque dolorum nihil corporis perferendis laudantium quis commodi dolores molestiae reprehenderit id voluptates.',0,'0985085322',0,NULL,NULL),(326,'marie26@gmail.com','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$R1IvbWIwUDc1MHlSbkVraw$9ZsHp7IzvtlaLRw2c8KkeWQzIbLJs3Y6v6TaoAIQk5s','Inde','Denis','45, avenue Sébastien Bigot\n14722 Meyernec','Teixeira','Théodore','Gerard',2008,'Quisquam aut corrupti voluptates itaque ipsa velit nemo nulla in quidem et suscipit aliquid fugit ullam aperiam omnis dolorem aliquid dolores dolores illo voluptas consequatur magni ex atque facere neque non saepe mollitia deserunt et id qui adipisci consequatur nostrum hic et molestias quasi nisi laboriosam quod quia hic modi totam unde dolorem culpa voluptatem.','Odio et eos molestiae recusandae cumque voluptatem nobis excepturi saepe et ea id et sed cum sequi eveniet facere explicabo cupiditate nihil totam vero mollitia nulla laboriosam officia vel adipisci ea reiciendis.','Sed ducimus illum tempore sit qui repellat ea qui qui temporibus molestias dolor id.',0,'+33 (0)9 62 14 38 08',0,NULL,NULL),(327,'grenier.tristan@hotmail.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$YkExSUY5M2Z5WG9WaWVhaw$7nG/D5WAWOM/BJcL/lG/xFyBrsohoe41TyyAxni0+/E','Ouzbékistan','Jacques','34, rue Théodore Traore\n10 146 Blot','Chevallier Dupre et Fils','Paul','Pereira',2009,'Quae aliquid sunt ab ut sit illum doloribus nulla eius voluptates dolorem reprehenderit repellendus odit cumque vitae illo non quidem ut neque repellat necessitatibus debitis commodi et omnis omnis ducimus debitis perspiciatis sed eligendi vel sunt impedit dolores iste ea eaque blanditiis id aut consequuntur alias qui laborum.','A recusandae sed quis unde optio sunt eum aut illum et et voluptas unde expedita tempore in.','Ducimus voluptas fugiat similique quo minus cumque et necessitatibus suscipit est veniam eius.',0,'+33 (0)8 98 65 77 45',0,NULL,NULL),(328,'cousin.christophe@voila.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$RE9aWVRaRXFVTnFHL3o4Rw$OTeSxXK9m/ng4FckTqcfhXqi4BYHP9fSy0zjACBVZtA','Yemen','Ramos-sur-Traore','69, rue Rémy Masse\n51 297 Bonnet-sur-Bourgeois','Pruvost SAS','Rémy','Philippe',2010,'Non eos dolor sit et aut error id in est qui voluptas eos deserunt ab enim vitae eum accusantium ex deleniti sunt quos natus minima nostrum dolorem sit sint et ipsa omnis velit.','Quae tenetur ipsa autem molestiae ut veritatis nobis nisi delectus necessitatibus aspernatur atque sequi corporis veniam qui alias ut est voluptatem quaerat omnis qui rerum.','Ut ratione voluptatum sit doloribus sequi aut ut placeat facilis.',0,'0467412857',0,NULL,NULL),(329,'zpires@wanadoo.fr','[\"ROLE_AGENCY\"]','$argon2i$v=19$m=1024,t=2,p=2$SUNENUZYMS5TajU1d1R2Sw$AAfJmMPZc/qOfPLNWLGrB85WGXLM1r6XuINz0YMUOik','Japon','Legendre-sur-Maillard','431, boulevard de Diaz\n01553 BigotBourg','Martins','Julien','Ribeiro',2011,'Aperiam eveniet veniam est voluptatibus ut laboriosam nihil quasi aut quia fugit accusantium iusto esse aut voluptas velit vel a quas et totam accusamus recusandae deserunt ratione accusamus ut est inventore sed laudantium ducimus autem inventore ut eligendi deserunt officia dolor ad delectus debitis quae pariatur sit officia illo id perferendis aut odit cupiditate.','Ratione vero repellendus dolor ut cumque sint voluptatem quae quia cupiditate numquam et non excepturi asperiores error sequi et esse dolorem et consequatur quidem qui fugiat autem aut impedit.','Similique tenetur laudantium sequi delectus qui corporis blanditiis cupiditate est dolor aliquid architecto.',0,'0993906996',0,NULL,NULL);
/*!40000 ALTER TABLE `agency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C7440455E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (104,'francois.lucie@martineau.fr','[\"ROLE_CLIENTS\"]','$argon2i$v=19$m=1024,t=2,p=2$TjVXbk51ZkhqMDQuOFF1cQ$HzGXx9M4JIcQ09zndLTF7M/EbywnCvRhvyxZpAqWTTY',664629320,'Théophile','Besnard','2018-03-19','863, impasse Gabrielle Lemaitre\n54 644 Grenier',0,NULL,NULL),(105,'cjacob@free.fr','[\"ROLE_CLIENTS\"]','$argon2i$v=19$m=1024,t=2,p=2$aldpdEJzRzVqVzZrdDJnWA$LOkqBAro4ZAkHw7NsGqAwx+qOaY46BHRmKVsbgiG/sU',33,'Frédéric','Roux','1978-06-01','impasse Grondin\n05646 Poulainnec',0,NULL,NULL),(106,'maurice36@techer.com','[\"ROLE_CLIENTS\"]','$argon2i$v=19$m=1024,t=2,p=2$dHhRRXJ6UVQxeFgzWWNWOA$Ai0n05dQlwZDvuI+8blciS3Ji6M36QAHoxOBgmPJQhA',33,'Alain','Albert','1999-07-19','52, boulevard Henry\n49170 Tessier-sur-Barre',0,NULL,NULL),(107,'christophe98@renaud.org','[\"ROLE_CLIENTS\"]','$argon2i$v=19$m=1024,t=2,p=2$bFdRRVVMbmYzMy9tWEh0Qg$trmKubMC0Ns+DHsKj9IJhYQxGFqDgIUBHAJJCco5rk4',33,'Noël','Mallet','1995-01-25','chemin Philippine Pottier\n00066 Legrand-sur-Bodin',0,NULL,NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A2B072882298D193` (`stage_id`),
  CONSTRAINT `FK_A2B072882298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_27BA704B19EB6921` (`client_id`),
  KEY `IDX_27BA704BCDEADB2A` (`agency_id`),
  KEY `IDX_27BA704B5D83CC1` (`state_id`),
  CONSTRAINT `FK_27BA704B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_27BA704B5D83CC1` FOREIGN KEY (`state_id`) REFERENCES `state_history` (`id`),
  CONSTRAINT `FK_27BA704BCDEADB2A` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (79,104,319,219,'2009-08-13','2014-04-21',NULL),(80,105,320,220,'1995-03-24','1973-07-31',NULL),(81,106,321,221,'1990-08-24','1985-09-12',NULL);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `histories_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `send_at` datetime NOT NULL,
  `content` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `sender` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307F22BC1E8C` (`histories_id`),
  KEY `IDX_B6BD307FCDEADB2A` (`agency_id`),
  KEY `IDX_B6BD307F19EB6921` (`client_id`),
  CONSTRAINT `FK_B6BD307F19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `FK_B6BD307F22BC1E8C` FOREIGN KEY (`histories_id`) REFERENCES `history` (`id`),
  CONSTRAINT `FK_B6BD307FCDEADB2A` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3470 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (3041,81,321,105,'2010-01-03 00:33:43','message not for admin number: 1',0,'agency','client'),(3042,80,320,104,'2003-12-18 20:25:05','message not for admin number: 2',0,'client','agency'),(3043,79,319,107,'1977-08-27 06:35:10','message not for admin number: 3',0,'client','agency'),(3044,79,319,104,'2004-10-08 11:07:04','message not for admin number: 4',0,'agency','client'),(3045,79,319,104,'1979-09-24 22:55:58','message not for admin number: 5',0,'client','agency'),(3046,81,321,106,'1997-05-08 18:17:08','message not for admin number: 6',0,'client','agency'),(3047,81,321,107,'2013-11-07 22:48:13','message in Admin conv, sent by:client to:user',1,'client','user'),(3048,79,319,106,'1987-01-22 10:31:50','message not for admin number: 8',0,'client','agency'),(3049,79,319,104,'2009-10-13 21:37:49','message not for admin number: 9',0,'client','agency'),(3050,79,319,104,'1985-06-15 18:39:49','message not for admin number: 10',0,'client','agency'),(3051,80,320,105,'1985-01-31 00:06:02','message not for admin number: 11',0,'agency','client'),(3052,79,319,106,'1973-12-29 12:01:42','message not for admin number: 12',0,'client','agency'),(3053,79,319,105,'1985-06-18 04:49:22','message not for admin number: 13',0,'client','agency'),(3054,81,321,105,'1992-04-25 20:24:55','message in Admin conv, sent by:user to:client',1,'user','client'),(3055,81,321,104,'1973-02-18 06:46:29','message not for admin number: 15',0,'client','agency'),(3056,79,319,105,'1998-09-14 03:50:45','message not for admin number: 16',0,'client','agency'),(3057,80,320,107,'2016-05-15 17:38:23','message not for admin number: 17',0,'agency','client'),(3058,80,320,107,'1989-03-12 20:40:02','message not for admin number: 18',0,'client','agency'),(3059,81,321,107,'2014-08-15 08:25:44','message not for admin number: 19',0,'client','agency'),(3060,79,319,107,'1990-07-28 17:26:24','message not for admin number: 20',0,'client','agency'),(3061,79,319,106,'1987-11-20 14:04:45','message in Admin conv, sent by:user to:client',1,'user','client'),(3062,79,319,106,'2012-09-15 02:51:09','message not for admin number: 22',0,'client','agency'),(3063,80,320,107,'2016-09-24 00:16:43','message not for admin number: 23',0,'client','agency'),(3064,80,320,106,'1986-06-08 03:49:15','message not for admin number: 24',0,'client','agency'),(3065,81,321,107,'1979-08-26 13:54:37','message not for admin number: 25',0,'agency','client'),(3066,80,320,104,'1974-09-09 06:35:03','message not for admin number: 26',0,'client','agency'),(3067,81,321,106,'1983-04-22 07:55:45','message not for admin number: 27',0,'agency','client'),(3068,79,319,106,'1988-05-21 13:57:02','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3069,80,320,107,'1989-04-07 00:56:48','message not for admin number: 29',0,'client','agency'),(3070,81,321,104,'1978-04-12 04:52:53','message not for admin number: 30',0,'agency','client'),(3071,79,319,107,'1998-08-08 18:13:21','message not for admin number: 31',0,'agency','client'),(3072,80,320,104,'1994-01-11 23:52:46','message not for admin number: 32',0,'agency','client'),(3073,81,321,106,'1996-08-10 18:12:59','message not for admin number: 33',0,'client','agency'),(3074,79,319,104,'2003-11-27 08:25:34','message not for admin number: 34',0,'agency','client'),(3075,81,321,104,'2007-02-15 09:00:20','message in Admin conv, sent by:user to:client',1,'user','client'),(3076,79,319,107,'1979-10-12 18:42:50','message not for admin number: 36',0,'client','agency'),(3077,81,321,106,'2016-08-10 05:37:11','message not for admin number: 37',0,'agency','client'),(3078,79,319,104,'2011-07-09 03:21:57','message not for admin number: 38',0,'client','agency'),(3079,79,319,104,'1995-04-10 13:57:03','message not for admin number: 39',0,'client','agency'),(3080,80,320,106,'2009-12-13 16:39:23','message not for admin number: 40',0,'agency','client'),(3081,80,320,104,'1988-03-31 07:57:43','message not for admin number: 41',0,'client','agency'),(3082,81,321,105,'1990-05-11 05:46:08','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3083,81,321,107,'1986-12-23 07:35:48','message not for admin number: 43',0,'agency','client'),(3084,79,319,107,'2012-10-27 02:59:23','message not for admin number: 44',0,'agency','client'),(3085,79,319,105,'1992-03-28 14:24:45','message not for admin number: 45',0,'agency','client'),(3086,81,321,106,'1984-04-22 08:01:29','message not for admin number: 46',0,'client','agency'),(3087,80,320,107,'2000-05-19 23:25:22','message not for admin number: 47',0,'client','agency'),(3088,80,320,105,'1988-01-12 18:59:25','message not for admin number: 48',0,'agency','client'),(3089,79,319,107,'1973-07-14 01:57:50','message in Admin conv, sent by:user to:client',1,'user','client'),(3090,80,320,104,'1979-01-20 11:01:25','message not for admin number: 50',0,'client','agency'),(3091,79,319,104,'1979-07-26 20:28:53','message not for admin number: 51',0,'agency','client'),(3092,80,320,107,'2019-03-25 09:00:26','message not for admin number: 52',0,'client','agency'),(3093,79,319,105,'2004-02-05 23:23:28','message not for admin number: 53',0,'client','agency'),(3094,79,319,104,'2008-07-21 09:31:55','message not for admin number: 54',0,'client','agency'),(3095,81,321,104,'1992-03-16 01:26:25','message not for admin number: 55',0,'client','agency'),(3096,79,319,107,'2014-10-09 14:17:43','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3097,80,320,107,'2000-06-30 14:36:22','message not for admin number: 57',0,'agency','client'),(3098,81,321,105,'1978-02-18 14:09:54','message not for admin number: 58',0,'client','agency'),(3099,80,320,107,'1972-04-13 18:37:51','message not for admin number: 59',0,'agency','client'),(3100,81,321,104,'2007-04-11 11:17:20','message not for admin number: 60',0,'agency','client'),(3101,79,319,107,'1981-03-29 21:09:51','message not for admin number: 61',0,'client','agency'),(3102,80,320,106,'2008-03-10 21:21:25','message not for admin number: 62',0,'agency','client'),(3103,79,319,107,'1989-04-23 17:44:14','message in Admin conv, sent by:client to:user',1,'client','user'),(3104,80,320,106,'2002-10-07 12:51:53','message not for admin number: 64',0,'agency','client'),(3105,80,320,105,'2012-10-26 11:12:22','message not for admin number: 65',0,'agency','client'),(3106,81,321,104,'2018-12-10 09:08:03','message not for admin number: 66',0,'agency','client'),(3107,81,321,106,'1971-06-19 05:13:33','message not for admin number: 67',0,'agency','client'),(3108,79,319,104,'2007-07-08 22:52:33','message not for admin number: 68',0,'agency','client'),(3109,79,319,104,'1973-05-16 06:44:44','message not for admin number: 69',0,'client','agency'),(3110,79,319,105,'2014-04-15 01:58:33','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3111,81,321,106,'1993-01-28 17:07:08','message not for admin number: 71',0,'client','agency'),(3112,80,320,107,'1996-11-15 09:49:51','message not for admin number: 72',0,'client','agency'),(3113,79,319,105,'2005-06-13 20:42:05','message not for admin number: 73',0,'agency','client'),(3114,81,321,105,'2003-07-12 15:00:06','message not for admin number: 74',0,'client','agency'),(3115,81,321,105,'1980-09-07 16:03:02','message not for admin number: 75',0,'agency','client'),(3116,80,320,105,'1972-07-01 14:47:53','message not for admin number: 76',0,'client','agency'),(3117,79,319,105,'2017-10-07 12:32:13','message in Admin conv, sent by:client to:user',1,'client','user'),(3118,80,320,106,'1991-06-24 08:35:05','message not for admin number: 78',0,'agency','client'),(3119,79,319,107,'1989-04-18 12:02:41','message not for admin number: 79',0,'client','agency'),(3120,80,320,105,'1989-03-21 06:35:03','message not for admin number: 80',0,'agency','client'),(3121,80,320,104,'1980-01-05 12:21:49','message not for admin number: 81',0,'agency','client'),(3122,79,319,105,'1996-03-21 15:59:35','message not for admin number: 82',0,'agency','client'),(3123,80,320,106,'1974-07-15 17:01:42','message not for admin number: 83',0,'client','agency'),(3124,79,319,106,'1977-01-06 19:32:57','message in Admin conv, sent by:user to:client',1,'user','client'),(3125,80,320,106,'2017-09-01 16:54:59','message not for admin number: 85',0,'agency','client'),(3126,80,320,106,'2014-07-01 18:30:06','message not for admin number: 86',0,'agency','client'),(3127,80,320,107,'1982-06-18 07:08:36','message not for admin number: 87',0,'client','agency'),(3128,79,319,104,'1974-01-06 18:42:49','message not for admin number: 88',0,'agency','client'),(3129,80,320,106,'2013-07-11 04:51:09','message not for admin number: 89',0,'client','agency'),(3130,79,319,104,'1973-02-09 18:40:55','message not for admin number: 90',0,'agency','client'),(3131,80,320,107,'2000-08-02 21:14:05','message in Admin conv, sent by:user to:client',1,'user','client'),(3132,79,319,107,'1973-05-12 20:46:04','message not for admin number: 92',0,'client','agency'),(3133,80,320,104,'2015-09-29 12:26:42','message not for admin number: 93',0,'agency','client'),(3134,80,320,106,'2010-07-01 21:11:26','message not for admin number: 94',0,'client','agency'),(3135,80,320,107,'1997-05-14 16:53:57','message not for admin number: 95',0,'client','agency'),(3136,81,321,105,'1975-12-28 23:56:07','message not for admin number: 96',0,'agency','client'),(3137,80,320,105,'2003-02-07 14:54:00','message not for admin number: 97',0,'client','agency'),(3138,81,321,107,'1987-02-25 08:00:07','message in Admin conv, sent by:user to:client',1,'user','client'),(3139,79,319,105,'1987-02-28 13:34:12','message not for admin number: 99',0,'client','agency'),(3140,80,320,105,'1978-08-08 03:01:56','message not for admin number: 100',0,'agency','client'),(3141,80,320,107,'2014-07-03 11:45:16','message not for admin number: 101',0,'agency','client'),(3142,80,320,106,'2011-12-04 17:33:59','message not for admin number: 102',0,'client','agency'),(3143,81,321,105,'1993-09-28 02:08:32','message not for admin number: 103',0,'agency','client'),(3144,80,320,106,'1994-09-02 06:59:56','message not for admin number: 104',0,'agency','client'),(3145,81,321,107,'1981-06-07 08:52:40','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3146,79,319,105,'2014-05-16 05:47:49','message not for admin number: 106',0,'client','agency'),(3147,81,321,104,'1987-05-06 05:25:00','message not for admin number: 107',0,'client','agency'),(3148,79,319,106,'1992-04-05 01:12:45','message not for admin number: 108',0,'agency','client'),(3149,81,321,104,'2002-08-27 08:47:05','message not for admin number: 109',0,'client','agency'),(3150,81,321,104,'1989-06-21 02:26:41','message not for admin number: 110',0,'agency','client'),(3151,81,321,107,'1977-06-23 12:46:07','message not for admin number: 111',0,'agency','client'),(3152,79,319,106,'2011-09-02 17:06:14','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3153,81,321,105,'1991-10-23 20:37:19','message not for admin number: 113',0,'client','agency'),(3154,79,319,104,'1989-08-29 09:24:03','message not for admin number: 114',0,'agency','client'),(3155,79,319,107,'1975-12-06 17:48:40','message not for admin number: 115',0,'agency','client'),(3156,79,319,104,'1979-06-25 06:23:13','message not for admin number: 116',0,'agency','client'),(3157,80,320,106,'1994-01-20 06:18:42','message not for admin number: 117',0,'agency','client'),(3158,79,319,107,'2009-12-06 13:43:43','message not for admin number: 118',0,'agency','client'),(3159,79,319,105,'2011-05-20 02:07:29','message in Admin conv, sent by:client to:user',1,'client','user'),(3160,79,319,106,'1985-12-18 11:40:58','message not for admin number: 120',0,'client','agency'),(3161,79,319,106,'1984-09-21 10:04:43','message not for admin number: 121',0,'agency','client'),(3162,79,319,106,'1974-03-18 16:45:08','message not for admin number: 122',0,'agency','client'),(3163,81,321,105,'1981-07-04 08:48:21','message not for admin number: 123',0,'agency','client'),(3164,79,319,106,'2013-06-04 14:40:26','message not for admin number: 124',0,'client','agency'),(3165,79,319,105,'2016-01-02 09:45:03','message not for admin number: 125',0,'agency','client'),(3166,79,319,105,'2014-05-02 10:26:40','message in Admin conv, sent by:client to:user',1,'client','user'),(3167,80,320,107,'2007-08-22 18:13:25','message not for admin number: 127',0,'agency','client'),(3168,81,321,104,'1983-09-11 10:38:50','message not for admin number: 128',0,'agency','client'),(3169,80,320,104,'2016-03-22 07:19:01','message not for admin number: 129',0,'client','agency'),(3170,80,320,106,'1997-07-20 09:43:35','message not for admin number: 130',0,'client','agency'),(3171,81,321,106,'2015-02-23 15:47:18','message not for admin number: 131',0,'agency','client'),(3172,81,321,107,'2015-07-06 22:19:22','message not for admin number: 132',0,'client','agency'),(3173,81,321,106,'2011-09-09 00:17:38','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3174,79,319,105,'2016-02-12 19:49:38','message not for admin number: 134',0,'agency','client'),(3175,79,319,105,'1997-02-26 09:58:15','message not for admin number: 135',0,'client','agency'),(3176,80,320,104,'2008-12-12 10:57:33','message not for admin number: 136',0,'agency','client'),(3177,81,321,104,'1970-01-30 20:57:07','message not for admin number: 137',0,'client','agency'),(3178,81,321,104,'2005-08-18 08:36:55','message not for admin number: 138',0,'agency','client'),(3179,80,320,104,'1977-10-06 00:36:00','message not for admin number: 139',0,'agency','client'),(3180,81,321,105,'2019-04-09 11:10:56','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3181,80,320,104,'1981-05-09 20:05:35','message not for admin number: 141',0,'client','agency'),(3182,80,320,107,'1990-05-18 00:03:00','message not for admin number: 142',0,'client','agency'),(3183,80,320,105,'1993-05-09 06:17:28','message not for admin number: 143',0,'client','agency'),(3184,80,320,106,'1978-05-03 11:08:39','message not for admin number: 144',0,'agency','client'),(3185,79,319,106,'1994-10-05 09:09:31','message not for admin number: 145',0,'agency','client'),(3186,79,319,106,'1989-03-20 20:49:14','message not for admin number: 146',0,'agency','client'),(3187,80,320,104,'1997-05-30 20:26:21','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3188,79,319,106,'1994-11-24 04:27:38','message not for admin number: 148',0,'client','agency'),(3189,79,319,105,'1990-01-16 09:53:42','message not for admin number: 149',0,'agency','client'),(3190,79,319,104,'2001-03-21 08:12:23','message not for admin number: 150',0,'client','agency'),(3191,79,319,107,'2004-04-23 12:11:36','message not for admin number: 151',0,'client','agency'),(3192,79,319,107,'1987-10-25 12:18:08','message not for admin number: 152',0,'client','agency'),(3193,81,321,105,'2008-07-21 06:21:01','message not for admin number: 153',0,'client','agency'),(3194,80,320,104,'1973-08-14 22:47:41','message in Admin conv, sent by:user to:client',1,'user','client'),(3195,81,321,104,'1992-08-03 15:07:07','message not for admin number: 155',0,'client','agency'),(3196,80,320,105,'2012-04-17 02:09:13','message not for admin number: 156',0,'client','agency'),(3197,80,320,105,'1980-03-22 21:57:11','message not for admin number: 157',0,'agency','client'),(3198,79,319,105,'2005-09-23 04:57:23','message not for admin number: 158',0,'agency','client'),(3199,81,321,106,'1994-02-22 11:22:35','message not for admin number: 159',0,'agency','client'),(3200,80,320,107,'1986-06-10 01:40:40','message not for admin number: 160',0,'agency','client'),(3201,80,320,104,'1971-05-19 21:24:07','message in Admin conv, sent by:client to:user',1,'client','user'),(3202,79,319,107,'2016-01-03 07:12:14','message not for admin number: 162',0,'client','agency'),(3203,80,320,106,'2001-03-17 00:17:46','message not for admin number: 163',0,'client','agency'),(3204,81,321,106,'2010-03-12 14:22:30','message not for admin number: 164',0,'client','agency'),(3205,81,321,105,'2008-07-02 07:21:26','message not for admin number: 165',0,'client','agency'),(3206,81,321,104,'1986-07-10 09:06:21','message not for admin number: 166',0,'agency','client'),(3207,80,320,107,'2003-05-31 10:41:12','message not for admin number: 167',0,'agency','client'),(3208,79,319,107,'1970-09-27 15:55:21','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3209,80,320,104,'2015-08-01 03:23:51','message not for admin number: 169',0,'agency','client'),(3210,80,320,107,'1971-04-20 19:51:46','message not for admin number: 170',0,'agency','client'),(3211,79,319,107,'1986-12-26 03:25:34','message not for admin number: 171',0,'agency','client'),(3212,81,321,105,'1973-01-04 01:34:03','message not for admin number: 172',0,'agency','client'),(3213,80,320,105,'1978-10-25 05:42:28','message not for admin number: 173',0,'agency','client'),(3214,79,319,107,'2013-04-24 16:05:13','message not for admin number: 174',0,'agency','client'),(3215,81,321,106,'1988-05-19 08:40:21','message in Admin conv, sent by:user to:client',1,'user','client'),(3216,81,321,106,'1982-04-12 05:51:07','message not for admin number: 176',0,'agency','client'),(3217,80,320,105,'1998-03-17 20:16:16','message not for admin number: 177',0,'client','agency'),(3218,79,319,107,'1993-02-25 16:42:11','message not for admin number: 178',0,'agency','client'),(3219,81,321,107,'2001-09-08 02:52:31','message not for admin number: 179',0,'client','agency'),(3220,79,319,104,'1978-01-13 14:58:37','message not for admin number: 180',0,'client','agency'),(3221,79,319,105,'1991-03-06 14:58:05','message not for admin number: 181',0,'client','agency'),(3222,81,321,104,'1971-03-31 03:54:17','message in Admin conv, sent by:client to:user',1,'client','user'),(3223,80,320,107,'1982-08-27 04:15:29','message not for admin number: 183',0,'agency','client'),(3224,81,321,104,'1991-02-24 20:48:04','message not for admin number: 184',0,'client','agency'),(3225,79,319,107,'1980-08-27 00:42:00','message not for admin number: 185',0,'client','agency'),(3226,79,319,107,'1982-08-31 01:47:54','message not for admin number: 186',0,'agency','client'),(3227,80,320,105,'1990-05-16 01:53:40','message not for admin number: 187',0,'client','agency'),(3228,79,319,104,'1993-06-02 23:47:27','message not for admin number: 188',0,'client','agency'),(3229,81,321,107,'2001-02-17 15:07:32','message in Admin conv, sent by:client to:user',1,'client','user'),(3230,80,320,107,'2000-01-14 17:19:41','message not for admin number: 190',0,'client','agency'),(3231,80,320,104,'2010-09-13 14:04:04','message not for admin number: 191',0,'agency','client'),(3232,81,321,107,'1977-10-27 15:04:40','message not for admin number: 192',0,'client','agency'),(3233,80,320,104,'1981-01-05 00:53:06','message not for admin number: 193',0,'client','agency'),(3234,79,319,107,'2007-01-17 23:40:31','message not for admin number: 194',0,'agency','client'),(3235,80,320,104,'1988-11-24 23:46:35','message not for admin number: 195',0,'agency','client'),(3236,80,320,105,'1993-11-20 11:57:33','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3237,79,319,104,'2011-09-11 09:49:13','message not for admin number: 197',0,'client','agency'),(3238,80,320,106,'2014-04-25 04:02:20','message not for admin number: 198',0,'client','agency'),(3239,81,321,106,'1974-03-02 13:28:31','message not for admin number: 199',0,'agency','client'),(3240,79,319,106,'1995-07-20 12:53:24','message not for admin number: 200',0,'agency','client'),(3241,81,321,107,'1973-01-31 20:13:38','message not for admin number: 201',0,'client','agency'),(3242,79,319,105,'1979-07-11 22:48:40','message not for admin number: 202',0,'agency','client'),(3243,81,321,105,'2009-01-06 15:10:20','message in Admin conv, sent by:client to:user',1,'client','user'),(3244,79,319,105,'1975-11-15 08:07:20','message not for admin number: 204',0,'agency','client'),(3245,80,320,105,'1984-12-25 09:01:33','message not for admin number: 205',0,'agency','client'),(3246,81,321,106,'2007-07-20 21:55:03','message not for admin number: 206',0,'client','agency'),(3247,81,321,105,'2002-12-19 23:26:02','message not for admin number: 207',0,'agency','client'),(3248,80,320,105,'1974-03-10 00:04:30','message not for admin number: 208',0,'agency','client'),(3249,81,321,104,'2013-07-19 16:24:42','message not for admin number: 209',0,'agency','client'),(3250,81,321,107,'1988-09-05 19:14:15','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3251,79,319,104,'1977-05-31 17:53:13','message not for admin number: 211',0,'agency','client'),(3252,81,321,105,'1971-04-02 20:27:24','message not for admin number: 212',0,'client','agency'),(3253,80,320,107,'1977-12-14 05:49:11','message not for admin number: 213',0,'client','agency'),(3254,81,321,106,'1970-08-24 06:42:10','message not for admin number: 214',0,'client','agency'),(3255,81,321,105,'2003-07-14 11:42:19','message not for admin number: 215',0,'agency','client'),(3256,81,321,104,'1975-12-23 14:12:30','message not for admin number: 216',0,'agency','client'),(3257,81,321,107,'1991-11-22 09:14:44','message in Admin conv, sent by:client to:user',1,'client','user'),(3258,80,320,104,'2008-04-03 18:18:32','message not for admin number: 218',0,'client','agency'),(3259,79,319,106,'1978-05-05 03:19:36','message not for admin number: 219',0,'agency','client'),(3260,80,320,106,'1984-04-11 04:39:34','message not for admin number: 220',0,'client','agency'),(3261,79,319,105,'1992-05-15 14:56:40','message not for admin number: 221',0,'agency','client'),(3262,80,320,104,'1988-11-03 14:48:02','message not for admin number: 222',0,'agency','client'),(3263,80,320,105,'1988-11-02 01:26:19','message not for admin number: 223',0,'agency','client'),(3264,80,320,104,'1999-07-10 19:29:27','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3265,81,321,106,'1991-09-13 02:22:45','message not for admin number: 225',0,'client','agency'),(3266,79,319,104,'1996-08-16 10:57:16','message not for admin number: 226',0,'client','agency'),(3267,79,319,107,'1996-02-04 02:51:08','message not for admin number: 227',0,'client','agency'),(3268,80,320,106,'1983-11-14 17:42:07','message not for admin number: 228',0,'client','agency'),(3269,79,319,106,'1995-08-08 07:05:48','message not for admin number: 229',0,'client','agency'),(3270,79,319,107,'2012-08-15 09:33:15','message not for admin number: 230',0,'agency','client'),(3271,81,321,105,'2003-10-14 11:02:01','message in Admin conv, sent by:user to:client',1,'user','client'),(3272,79,319,105,'1986-09-22 07:15:44','message not for admin number: 232',0,'agency','client'),(3273,81,321,107,'1998-12-31 05:53:38','message not for admin number: 233',0,'agency','client'),(3274,81,321,105,'1985-05-02 11:13:50','message not for admin number: 234',0,'agency','client'),(3275,80,320,104,'2012-12-11 19:09:35','message not for admin number: 235',0,'agency','client'),(3276,79,319,107,'2001-08-23 13:26:50','message not for admin number: 236',0,'agency','client'),(3277,79,319,104,'1986-02-03 21:58:06','message not for admin number: 237',0,'agency','client'),(3278,79,319,105,'1989-10-12 18:22:14','message in Admin conv, sent by:user to:client',1,'user','client'),(3279,79,319,104,'2000-08-02 06:44:42','message not for admin number: 239',0,'agency','client'),(3280,79,319,104,'1988-08-01 08:09:41','message not for admin number: 240',0,'agency','client'),(3281,79,319,107,'1987-04-21 23:43:38','message not for admin number: 241',0,'client','agency'),(3282,80,320,106,'1996-09-05 10:40:45','message not for admin number: 242',0,'agency','client'),(3283,80,320,105,'2018-06-25 14:02:48','message not for admin number: 243',0,'client','agency'),(3284,79,319,106,'1999-06-13 21:59:38','message not for admin number: 244',0,'client','agency'),(3285,80,320,105,'1997-07-16 23:42:23','message in Admin conv, sent by:client to:user',1,'client','user'),(3286,79,319,107,'1977-03-24 15:38:34','message not for admin number: 246',0,'client','agency'),(3287,80,320,105,'1995-03-14 10:24:45','message not for admin number: 247',0,'client','agency'),(3288,81,321,104,'1996-11-12 04:50:57','message not for admin number: 248',0,'agency','client'),(3289,80,320,106,'2014-02-20 20:38:30','message not for admin number: 249',0,'agency','client'),(3290,80,320,104,'2019-06-10 22:19:44','message not for admin number: 250',0,'client','agency'),(3291,80,320,106,'2015-09-12 06:37:25','message not for admin number: 251',0,'client','agency'),(3292,81,321,104,'1996-05-22 08:33:23','message in Admin conv, sent by:user to:client',1,'user','client'),(3293,81,321,105,'1997-06-20 04:30:30','message not for admin number: 253',0,'agency','client'),(3294,79,319,106,'1997-02-23 03:33:36','message not for admin number: 254',0,'client','agency'),(3295,81,321,105,'2000-05-10 05:24:58','message not for admin number: 255',0,'client','agency'),(3296,79,319,105,'1982-03-30 10:28:29','message not for admin number: 256',0,'client','agency'),(3297,79,319,106,'1994-08-22 02:51:53','message not for admin number: 257',0,'agency','client'),(3298,80,320,106,'2018-10-27 19:23:34','message not for admin number: 258',0,'agency','client'),(3299,80,320,104,'2008-10-12 00:02:14','message in Admin conv, sent by:user to:client',1,'user','client'),(3300,81,321,107,'1979-07-06 09:49:03','message not for admin number: 260',0,'client','agency'),(3301,80,320,105,'2016-09-09 00:24:38','message not for admin number: 261',0,'agency','client'),(3302,81,321,104,'1994-01-10 12:26:49','message not for admin number: 262',0,'client','agency'),(3303,81,321,104,'1976-12-25 22:43:18','message not for admin number: 263',0,'client','agency'),(3304,80,320,107,'1999-01-19 18:03:04','message not for admin number: 264',0,'client','agency'),(3305,81,321,105,'1993-08-04 20:10:10','message not for admin number: 265',0,'agency','client'),(3306,80,320,104,'2009-07-26 10:38:16','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3307,79,319,106,'2010-02-25 07:12:23','message not for admin number: 267',0,'client','agency'),(3308,81,321,104,'1997-08-16 12:44:51','message not for admin number: 268',0,'client','agency'),(3309,79,319,107,'1998-09-27 10:23:18','message not for admin number: 269',0,'agency','client'),(3310,81,321,104,'1999-04-21 05:56:11','message not for admin number: 270',0,'client','agency'),(3311,79,319,106,'2015-02-14 19:18:32','message not for admin number: 271',0,'client','agency'),(3312,81,321,104,'1972-11-10 22:59:35','message not for admin number: 272',0,'client','agency'),(3313,80,320,105,'1972-01-26 23:20:51','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3314,79,319,107,'2016-02-20 14:42:36','message not for admin number: 274',0,'client','agency'),(3315,79,319,107,'1970-09-26 19:01:17','message not for admin number: 275',0,'client','agency'),(3316,80,320,106,'1986-12-14 02:28:42','message not for admin number: 276',0,'agency','client'),(3317,79,319,106,'1991-07-06 10:18:49','message not for admin number: 277',0,'client','agency'),(3318,81,321,105,'2012-01-09 21:32:49','message not for admin number: 278',0,'client','agency'),(3319,81,321,106,'2019-06-04 11:16:43','message not for admin number: 279',0,'agency','client'),(3320,79,319,106,'1998-05-17 12:54:52','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3321,79,319,104,'2006-05-30 02:21:29','message not for admin number: 281',0,'client','agency'),(3322,80,320,107,'2017-07-06 19:33:04','message not for admin number: 282',0,'client','agency'),(3323,79,319,105,'1989-12-05 16:17:18','message not for admin number: 283',0,'agency','client'),(3324,79,319,107,'2015-04-18 12:31:01','message not for admin number: 284',0,'agency','client'),(3325,81,321,107,'1998-05-11 12:55:13','message not for admin number: 285',0,'client','agency'),(3326,81,321,106,'1988-08-25 10:35:53','message not for admin number: 286',0,'agency','client'),(3327,80,320,105,'1996-10-16 20:57:59','message in Admin conv, sent by:client to:user',1,'client','user'),(3328,81,321,104,'2010-04-09 13:35:36','message not for admin number: 288',0,'agency','client'),(3329,79,319,105,'2006-04-30 08:59:14','message not for admin number: 289',0,'client','agency'),(3330,81,321,106,'2004-07-27 06:46:28','message not for admin number: 290',0,'client','agency'),(3331,81,321,104,'1993-02-27 20:05:26','message not for admin number: 291',0,'client','agency'),(3332,80,320,104,'1994-07-03 19:54:44','message not for admin number: 292',0,'client','agency'),(3333,80,320,105,'1994-07-15 03:42:05','message not for admin number: 293',0,'client','agency'),(3334,81,321,104,'2019-05-07 00:26:35','message in Admin conv, sent by:client to:user',1,'client','user'),(3335,80,320,105,'1970-05-05 04:23:12','message not for admin number: 295',0,'client','agency'),(3336,81,321,105,'2001-06-28 07:38:16','message not for admin number: 296',0,'agency','client'),(3337,81,321,107,'2009-01-02 08:01:04','message not for admin number: 297',0,'agency','client'),(3338,79,319,107,'1988-11-07 04:08:17','message not for admin number: 298',0,'agency','client'),(3339,81,321,104,'1979-03-12 11:34:08','message not for admin number: 299',0,'agency','client'),(3340,81,321,107,'2006-12-24 08:13:10','message not for admin number: 300',0,'client','agency'),(3341,80,320,106,'2008-09-05 20:38:52','message in Admin conv, sent by:client to:user',1,'client','user'),(3342,81,321,107,'2014-06-15 00:35:23','message not for admin number: 302',0,'agency','client'),(3343,81,321,104,'1976-01-10 23:18:34','message not for admin number: 303',0,'client','agency'),(3344,80,320,104,'1972-05-01 18:23:56','message not for admin number: 304',0,'agency','client'),(3345,80,320,104,'1972-07-30 05:40:28','message not for admin number: 305',0,'client','agency'),(3346,81,321,107,'1989-09-11 11:13:32','message not for admin number: 306',0,'client','agency'),(3347,79,319,106,'2016-06-04 16:35:51','message not for admin number: 307',0,'client','agency'),(3348,80,320,107,'1997-09-30 11:57:22','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3349,81,321,107,'2019-01-03 05:53:25','message not for admin number: 309',0,'agency','client'),(3350,79,319,104,'2002-11-30 20:00:49','message not for admin number: 310',0,'agency','client'),(3351,81,321,104,'1981-06-27 15:16:46','message not for admin number: 311',0,'agency','client'),(3352,80,320,107,'1979-05-14 16:16:02','message not for admin number: 312',0,'client','agency'),(3353,81,321,105,'2013-11-20 18:51:11','message not for admin number: 313',0,'client','agency'),(3354,81,321,105,'2016-08-02 01:02:43','message not for admin number: 314',0,'agency','client'),(3355,81,321,105,'2018-02-15 15:30:13','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3356,81,321,105,'1980-08-17 05:47:56','message not for admin number: 316',0,'client','agency'),(3357,80,320,106,'1977-05-19 04:28:01','message not for admin number: 317',0,'client','agency'),(3358,79,319,106,'1981-06-30 21:06:42','message not for admin number: 318',0,'client','agency'),(3359,81,321,105,'2010-05-29 19:22:42','message not for admin number: 319',0,'client','agency'),(3360,81,321,107,'1974-12-18 14:03:57','message not for admin number: 320',0,'client','agency'),(3361,80,320,105,'2013-02-03 04:51:49','message not for admin number: 321',0,'client','agency'),(3362,81,321,107,'1988-06-09 03:36:50','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3363,81,321,105,'1982-07-10 02:25:30','message not for admin number: 323',0,'client','agency'),(3364,81,321,107,'1994-08-10 06:06:28','message not for admin number: 324',0,'agency','client'),(3365,79,319,105,'1988-04-20 09:32:52','message not for admin number: 325',0,'agency','client'),(3366,79,319,106,'1994-11-06 17:02:07','message not for admin number: 326',0,'agency','client'),(3367,81,321,107,'2000-01-09 03:19:25','message not for admin number: 327',0,'client','agency'),(3368,79,319,106,'2002-06-13 02:04:26','message not for admin number: 328',0,'agency','client'),(3369,80,320,107,'1971-01-21 18:08:38','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3370,81,321,106,'1988-07-19 12:54:09','message not for admin number: 330',0,'agency','client'),(3371,79,319,106,'1977-11-02 12:42:48','message not for admin number: 331',0,'client','agency'),(3372,79,319,107,'1984-11-20 20:06:04','message not for admin number: 332',0,'client','agency'),(3373,80,320,104,'1971-01-27 17:31:58','message not for admin number: 333',0,'agency','client'),(3374,79,319,104,'1998-08-14 15:12:22','message not for admin number: 334',0,'client','agency'),(3375,79,319,105,'1993-07-28 23:53:03','message not for admin number: 335',0,'agency','client'),(3376,80,320,104,'2006-12-20 22:48:09','message in Admin conv, sent by:user to:client',1,'user','client'),(3377,80,320,105,'2009-04-04 21:41:52','message not for admin number: 337',0,'client','agency'),(3378,81,321,104,'1980-02-08 11:45:28','message not for admin number: 338',0,'client','agency'),(3379,81,321,107,'2008-01-15 07:02:30','message not for admin number: 339',0,'client','agency'),(3380,79,319,104,'1982-08-24 19:57:01','message not for admin number: 340',0,'client','agency'),(3381,80,320,105,'1987-07-21 22:03:48','message not for admin number: 341',0,'client','agency'),(3382,81,321,107,'2006-03-02 20:10:26','message not for admin number: 342',0,'client','agency'),(3383,80,320,106,'2003-09-03 13:47:53','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3384,80,320,106,'1983-02-18 10:46:23','message not for admin number: 344',0,'agency','client'),(3385,80,320,104,'1970-10-21 01:08:03','message not for admin number: 345',0,'client','agency'),(3386,80,320,104,'2011-04-11 11:16:15','message not for admin number: 346',0,'agency','client'),(3387,79,319,105,'1994-05-20 19:03:39','message not for admin number: 347',0,'client','agency'),(3388,79,319,107,'1971-05-21 01:26:15','message not for admin number: 348',0,'client','agency'),(3389,79,319,105,'1992-05-05 12:29:42','message not for admin number: 349',0,'agency','client'),(3390,81,321,106,'1981-01-02 03:48:34','message in Admin conv, sent by:agency to:user',1,'agency','user'),(3391,79,319,105,'2018-03-18 16:01:00','message not for admin number: 351',0,'agency','client'),(3392,81,321,107,'1975-11-27 07:02:49','message not for admin number: 352',0,'client','agency'),(3393,80,320,106,'2003-11-04 09:05:39','message not for admin number: 353',0,'agency','client'),(3394,79,319,104,'2011-12-01 23:14:44','message not for admin number: 354',0,'client','agency'),(3395,81,321,107,'2017-12-05 08:21:40','message not for admin number: 355',0,'agency','client'),(3396,81,321,107,'1981-06-29 10:36:39','message not for admin number: 356',0,'client','agency'),(3397,80,320,104,'1997-02-22 09:52:32','message in Admin conv, sent by:client to:user',1,'client','user'),(3398,79,319,104,'2006-11-16 01:19:34','message not for admin number: 358',0,'client','agency'),(3399,81,321,106,'1975-12-12 04:48:35','message not for admin number: 359',0,'agency','client'),(3400,80,320,104,'1987-03-27 05:20:27','message not for admin number: 360',0,'client','agency'),(3401,79,319,104,'2019-01-24 19:46:03','message not for admin number: 361',0,'client','agency'),(3402,80,320,104,'2011-04-06 11:05:20','message not for admin number: 362',0,'agency','client'),(3403,81,321,105,'1978-09-16 16:10:20','message not for admin number: 363',0,'agency','client'),(3404,81,321,107,'1973-12-29 04:34:51','message in Admin conv, sent by:client to:user',1,'client','user'),(3405,79,319,105,'1987-08-05 04:34:07','message not for admin number: 365',0,'client','agency'),(3406,81,321,107,'1984-08-05 10:51:12','message not for admin number: 366',0,'agency','client'),(3407,79,319,104,'2015-07-17 03:13:59','message not for admin number: 367',0,'agency','client'),(3408,80,320,104,'1979-08-04 11:29:41','message not for admin number: 368',0,'agency','client'),(3409,79,319,106,'1981-03-15 02:51:57','message not for admin number: 369',0,'agency','client'),(3410,81,321,104,'1986-05-12 08:15:29','message not for admin number: 370',0,'agency','client'),(3411,80,320,104,'1983-04-03 22:57:08','message in Admin conv, sent by:client to:user',1,'client','user'),(3412,79,319,105,'1982-08-29 05:06:34','message not for admin number: 372',0,'client','agency'),(3413,80,320,107,'1974-12-31 09:34:57','message not for admin number: 373',0,'client','agency'),(3414,81,321,105,'1979-08-11 19:15:56','message not for admin number: 374',0,'client','agency'),(3415,79,319,107,'1971-05-07 12:46:33','message not for admin number: 375',0,'agency','client'),(3416,79,319,105,'1970-07-22 03:23:30','message not for admin number: 376',0,'agency','client'),(3417,79,319,106,'1999-04-11 21:32:34','message not for admin number: 377',0,'agency','client'),(3418,80,320,105,'2009-06-05 17:49:57','message in Admin conv, sent by:user to:client',1,'user','client'),(3419,79,319,104,'2001-05-19 12:02:34','message not for admin number: 379',0,'client','agency'),(3420,81,321,106,'2003-12-24 09:28:50','message not for admin number: 380',0,'client','agency'),(3421,80,320,106,'1982-04-28 10:28:41','message not for admin number: 381',0,'agency','client'),(3422,80,320,107,'1982-07-02 11:04:15','message not for admin number: 382',0,'client','agency'),(3423,79,319,105,'1977-06-13 09:24:19','message not for admin number: 383',0,'agency','client'),(3424,80,320,105,'2001-09-12 20:09:02','message not for admin number: 384',0,'client','agency'),(3425,81,321,107,'2011-02-27 23:26:01','message in Admin conv, sent by:user to:agency',1,'user','agency'),(3426,80,320,105,'2000-02-02 04:24:41','message not for admin number: 386',0,'agency','client'),(3427,81,321,106,'2016-06-21 12:21:10','message not for admin number: 387',0,'agency','client'),(3428,80,320,104,'1992-09-21 00:23:33','message not for admin number: 388',0,'agency','client'),(3429,80,320,106,'1991-12-19 19:19:07','message not for admin number: 389',0,'client','agency'),(3430,81,321,107,'1995-07-15 15:25:51','message not for admin number: 390',0,'agency','client'),(3431,80,320,106,'2006-11-16 00:26:52','message not for admin number: 391',0,'client','agency'),(3432,79,319,106,'1978-12-31 14:04:12','message in Admin conv, sent by:user to:client',1,'user','client'),(3433,79,319,104,'1975-06-18 06:42:05','message not for admin number: 393',0,'client','agency'),(3434,80,320,106,'2000-07-30 23:14:20','message not for admin number: 394',0,'client','agency'),(3435,80,320,104,'1980-11-03 06:06:06','message not for admin number: 395',0,'agency','client'),(3436,80,320,104,'2000-08-20 19:12:48','message not for admin number: 396',0,'agency','client'),(3437,79,319,104,'1984-09-02 16:35:35','message not for admin number: 397',0,'client','agency'),(3438,79,319,104,'2002-01-27 22:01:58','message not for admin number: 398',0,'client','agency'),(3439,80,320,107,'1974-11-17 04:42:48','message in Admin conv, sent by:user to:client',1,'user','client'),(3440,79,319,107,'2019-07-19 12:05:57','hey adm',1,'agency','client'),(3441,79,319,105,'2019-07-19 12:06:03','hey rx',0,'agency','client'),(3442,79,319,106,'2019-07-19 12:07:05','albert',1,'user','client'),(3443,81,321,106,'2019-07-19 12:08:28','blanch',1,'user','agency'),(3444,80,320,105,'2019-07-19 12:08:57','samson',1,'user','agency'),(3445,81,321,104,'2019-07-19 12:09:03','besnard',1,'user','client'),(3446,79,319,104,'2019-07-19 12:09:16','diaz',1,'user','agency'),(3447,79,319,107,'2019-07-19 12:09:23','mallet',1,'user','client'),(3448,79,319,105,'2019-07-19 12:09:30','roux',1,'user','client'),(3449,79,319,104,'2019-07-19 12:09:50','test',1,'user','agency'),(3450,79,319,106,'2019-07-19 12:12:05','test',1,'user','client'),(3451,79,319,104,'2019-07-19 12:12:17','1',1,'user','agency'),(3452,80,320,105,'2019-07-19 12:12:22','é',1,'user','agency'),(3453,81,321,104,'2019-07-19 12:12:26','3',1,'user','client'),(3454,79,319,107,'2019-07-19 12:12:30','4',1,'user','client'),(3455,81,321,106,'2019-07-19 12:12:33','5',1,'user','agency'),(3456,79,319,105,'2019-07-19 12:12:37','6',1,'user','client'),(3457,79,319,106,'2019-07-19 12:12:42','7',1,'user','client'),(3458,79,319,104,'2019-07-19 14:23:00','2eme 1',1,'user','agency'),(3459,81,321,104,'2019-07-19 14:28:14','test',1,'user','client'),(3460,81,321,104,'2019-07-19 14:28:48','3 bes',1,'user','client'),(3461,79,319,107,'2019-07-19 14:28:55','test',1,'user','client'),(3462,79,319,104,'2019-07-19 14:29:01','tes',1,'user','agency'),(3463,81,321,104,'2019-07-19 14:51:36','3 besnard',1,'user','client'),(3464,79,319,106,'2019-07-19 15:00:59',' Higuain à la Roma, les dernières infos. Le Corriere dello Sport annonce un accord total entre la Roma et la Juve. Seul problème ? Le joueur souhaite rester à Turin pour pour y tenter sa chance. D\'après le média italien, les deux clubs feraient front commun pour convaincre l\'Argentin que son transfert à la Roma serait dans l\'intérêt de tous en essayant notamment de prolonger son contrat de 2 à 4 ans afin d\'étaler son salaire (9 millions l\'année) sur la période ce qui permettrait au club de la Louve de payer le joueur. ',0,'agency','client'),(3465,81,321,106,'2019-07-19 15:13:53','5 conv',1,'user','agency'),(3466,79,319,105,'2019-07-19 15:16:00','rx',1,'user','client'),(3467,79,319,106,'2019-07-19 15:16:13','alb',1,'user','client'),(3468,81,321,104,'2019-07-19 15:31:45','besn',1,'user','client'),(3469,81,321,104,'2019-07-19 15:36:13','bens',1,'user','client');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stages_id` int(11) NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `price` int(11) NOT NULL,
  `persons` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CAC822D98E55E70A` (`stages_id`),
  CONSTRAINT `FK_CAC822D98E55E70A` FOREIGN KEY (`stages_id`) REFERENCES `stage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1351,2836,NULL,NULL,100,2),(1352,2837,NULL,NULL,100,2),(1353,2838,NULL,NULL,100,2),(1354,2839,NULL,NULL,100,2),(1355,2840,NULL,NULL,100,2),(1356,2841,NULL,NULL,100,2),(1357,2842,NULL,NULL,100,2),(1358,2843,NULL,NULL,100,2),(1359,2844,NULL,NULL,100,2),(1360,2845,NULL,NULL,100,2),(1361,2846,NULL,NULL,100,2),(1362,2847,NULL,NULL,100,2),(1363,2848,NULL,NULL,100,2),(1364,2849,NULL,NULL,100,2),(1365,2850,NULL,NULL,100,2),(1366,2851,NULL,NULL,100,2),(1367,2852,NULL,NULL,100,2),(1368,2853,NULL,NULL,100,2),(1369,2854,NULL,NULL,100,2),(1370,2855,NULL,NULL,100,2),(1371,2856,NULL,NULL,100,2),(1372,2857,NULL,NULL,100,2),(1373,2858,NULL,NULL,100,2),(1374,2859,NULL,NULL,100,2),(1375,2860,NULL,NULL,100,2),(1376,2861,NULL,NULL,100,2),(1377,2862,NULL,NULL,100,2),(1378,2863,NULL,NULL,100,2),(1379,2864,NULL,NULL,100,2),(1380,2865,NULL,NULL,100,2),(1381,2866,NULL,NULL,100,2),(1382,2867,NULL,NULL,100,2),(1383,2868,NULL,NULL,100,2),(1384,2869,NULL,NULL,100,2),(1385,2870,NULL,NULL,100,2),(1386,2871,NULL,NULL,100,2),(1387,2872,NULL,NULL,100,2),(1388,2873,NULL,NULL,100,2),(1389,2874,NULL,NULL,100,2),(1390,2875,NULL,NULL,100,2),(1391,2876,NULL,NULL,100,2),(1392,2877,NULL,NULL,100,2),(1393,2878,NULL,NULL,100,2),(1394,2879,NULL,NULL,100,2),(1395,2880,NULL,NULL,100,2),(1396,2881,NULL,NULL,100,2),(1397,2882,NULL,NULL,100,2),(1398,2883,NULL,NULL,100,2),(1399,2884,NULL,NULL,100,2),(1400,2885,NULL,NULL,100,2);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `people` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (156,'Solo'),(157,'En couple'),(158,'En famille'),(159,'Entre amis'),(160,'En Groupe');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size_stage`
--

DROP TABLE IF EXISTS `size_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `size_stage` (
  `size_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  PRIMARY KEY (`size_id`,`stage_id`),
  KEY `IDX_13AC515E498DA827` (`size_id`),
  KEY `IDX_13AC515E2298D193` (`stage_id`),
  CONSTRAINT `FK_13AC515E2298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_13AC515E498DA827` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size_stage`
--

LOCK TABLES `size_stage` WRITE;
/*!40000 ALTER TABLE `size_stage` DISABLE KEYS */;
INSERT INTO `size_stage` VALUES (157,2836),(157,2837),(157,2838),(157,2839),(157,2840),(157,2841),(157,2842),(157,2843),(157,2844),(157,2845),(157,2846),(157,2847),(157,2848),(157,2849),(157,2850),(157,2851),(157,2852),(157,2853),(157,2854),(157,2855),(157,2856),(157,2857),(157,2858),(157,2859),(157,2860),(157,2861),(157,2862),(157,2863),(157,2864),(157,2865),(157,2866),(157,2867),(157,2868),(157,2869),(157,2870),(157,2871),(157,2872),(157,2873),(157,2874),(157,2875),(157,2876),(157,2877),(157,2878),(157,2879),(157,2880),(157,2881),(157,2882),(157,2883),(157,2884),(157,2885),(157,2886),(157,2887),(157,2888),(157,2889),(157,2890),(157,2891),(157,2892),(157,2893),(157,2894),(157,2895),(157,2896),(157,2897),(157,2898),(157,2899),(157,2900),(157,2901),(157,2902),(157,2903),(157,2904),(157,2905),(157,2906),(157,2907),(157,2908),(157,2909),(157,2910),(157,2911),(157,2912),(157,2913),(157,2914),(157,2915),(157,2916),(157,2917),(157,2918),(157,2919),(157,2920),(157,2921),(157,2922),(157,2923),(157,2924),(157,2925),(157,2926),(157,2927),(157,2928),(157,2929),(157,2930),(157,2931),(157,2932),(157,2933),(157,2934),(157,2935),(157,2936),(157,2937),(157,2938),(157,2939),(157,2940),(158,2836),(158,2837),(158,2838),(158,2839),(158,2840),(158,2841),(158,2842),(158,2843),(158,2844),(158,2845),(158,2846),(158,2847),(158,2848),(158,2849),(158,2850),(158,2851),(158,2852),(158,2853),(158,2854),(158,2855),(158,2856),(158,2857),(158,2858),(158,2859),(158,2860),(158,2861),(158,2862),(158,2863),(158,2864),(158,2865),(158,2866),(158,2867),(158,2868),(158,2869),(158,2870),(158,2871),(158,2872),(158,2873),(158,2874),(158,2875),(158,2876),(158,2877),(158,2878),(158,2879),(158,2880),(158,2881),(158,2882),(158,2883),(158,2884),(158,2885),(158,2886),(158,2887),(158,2888),(158,2889),(158,2890),(158,2891),(158,2892),(158,2893),(158,2894),(158,2895),(158,2896),(158,2897),(158,2898),(158,2899),(158,2900),(158,2901),(158,2902),(158,2903),(158,2904),(158,2905),(158,2906),(158,2907),(158,2908),(158,2909),(158,2910),(158,2911),(158,2912),(158,2913),(158,2914),(158,2915),(158,2916),(158,2917),(158,2918),(158,2919),(158,2920),(158,2921),(158,2922),(158,2923),(158,2924),(158,2925),(158,2926),(158,2927),(158,2928),(158,2929),(158,2930),(158,2931),(158,2932),(158,2933),(158,2934),(158,2935),(158,2936),(158,2937),(158,2938),(158,2939),(158,2940),(159,2836),(159,2837),(159,2838),(159,2839),(159,2840),(159,2841),(159,2842),(159,2843),(159,2844),(159,2845),(159,2846),(159,2847),(159,2848),(159,2849),(159,2850),(159,2851),(159,2852),(159,2853),(159,2854),(159,2855),(159,2856),(159,2857),(159,2858),(159,2859),(159,2860),(159,2861),(159,2862),(159,2863),(159,2864),(159,2865),(159,2866),(159,2867),(159,2868),(159,2869),(159,2870),(159,2871),(159,2872),(159,2873),(159,2874),(159,2875),(159,2876),(159,2877),(159,2878),(159,2879),(159,2880),(159,2881),(159,2882),(159,2883),(159,2884),(159,2885),(159,2886),(159,2887),(159,2888),(159,2889),(159,2890),(159,2891),(159,2892),(159,2893),(159,2894),(159,2895),(159,2896),(159,2897),(159,2898),(159,2899),(159,2900),(159,2901),(159,2902),(159,2903),(159,2904),(159,2905),(159,2906),(159,2907),(159,2908),(159,2909),(159,2910),(159,2911),(159,2912),(159,2913),(159,2914),(159,2915),(159,2916),(159,2917),(159,2918),(159,2919),(159,2920),(159,2921),(159,2922),(159,2923),(159,2924),(159,2925),(159,2926),(159,2927),(159,2928),(159,2929),(159,2930),(159,2931),(159,2932),(159,2933),(159,2934),(159,2935),(159,2936),(159,2937),(159,2938),(159,2939),(159,2940),(160,2836),(160,2837),(160,2838),(160,2839),(160,2840),(160,2841),(160,2842),(160,2843),(160,2844),(160,2845),(160,2846),(160,2847),(160,2848),(160,2849),(160,2850),(160,2851),(160,2852),(160,2853),(160,2854),(160,2855),(160,2856),(160,2857),(160,2858),(160,2859),(160,2860),(160,2861),(160,2862),(160,2863),(160,2864),(160,2865),(160,2866),(160,2867),(160,2868),(160,2869),(160,2870),(160,2871),(160,2872),(160,2873),(160,2874),(160,2875),(160,2876),(160,2877),(160,2878),(160,2879),(160,2880),(160,2881),(160,2882),(160,2883),(160,2884),(160,2885),(160,2886),(160,2887),(160,2888),(160,2889),(160,2890),(160,2891),(160,2892),(160,2893),(160,2894),(160,2895),(160,2896),(160,2897),(160,2898),(160,2899),(160,2900),(160,2901),(160,2902),(160,2903),(160,2904),(160,2905),(160,2906),(160,2907),(160,2908),(160,2909),(160,2910),(160,2911),(160,2912),(160,2913),(160,2914),(160,2915),(160,2916),(160,2917),(160,2918),(160,2919),(160,2920),(160,2921),(160,2922),(160,2923),(160,2924),(160,2925),(160,2926),(160,2927),(160,2928),(160,2929),(160,2930),(160,2931),(160,2932),(160,2933),(160,2934),(160,2935),(160,2936),(160,2937),(160,2938),(160,2939),(160,2940);
/*!40000 ALTER TABLE `size_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage`
--

DROP TABLE IF EXISTS `stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL,
  `validate` tinyint(1) DEFAULT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_stage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C27C9369CDEADB2A` (`agency_id`),
  CONSTRAINT `FK_C27C9369CDEADB2A` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2941 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage`
--

LOCK TABLES `stage` WRITE;
/*!40000 ALTER TABLE `stage` DISABLE KEYS */;
INSERT INTO `stage` VALUES (2836,319,1,'CAMBODGE','AV-CA-001','De Phnom penh à Battambang jusqu’aux temples de Siem Reap','de-phnom-penh-a-battambang-jusquaux-temples-de-siem-reap',7,0),(2837,319,1,'CAMBODGE','AV-CA-002','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle',4,0),(2838,319,1,'CAMBODGE','AV-CA-003','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-1',3,0),(2839,319,1,'CAMBODGE','AV-CA-004','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-2',2,0),(2840,319,1,'CAMBODGE','AV-CA-005','Découverte de Phnom penh :  la ville capitale du Cambodge','decouverte-de-phnom-penh-la-ville-capitale-du-cambodge',2,0),(2841,319,1,'CAMBODGE','AV-CA-006','De Phnom penh aux temples de Siem Reap','de-phnom-penh-aux-temples-de-siem-reap',6,0),(2842,319,1,'CAMBODGE','AV-CA-007','De Phnom penh aux temples de Siem Reap','de-phnom-penh-aux-temples-de-siem-reap-1',5,0),(2843,319,1,'CAMBODGE','AV-CA-008','De Phnom penh – Kratie – Koh Trong – Kompong Thom – Siem reap','de-phnom-penh-kratie-koh-trong-kompong-thom-siem-reap',4,0),(2844,319,1,'CAMBODGE','AV-CA-009','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-3',3,0),(2845,319,1,'CAMBODGE','AV-CA-010','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-4',4,0),(2846,319,1,'CAMBODGE','AV-CA-011','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-5',2,0),(2847,319,1,'CAMBODGE','AV-CA-012','Découverte de Phnom penh :  la ville capitale du Cambodge','decouverte-de-phnom-penh-la-ville-capitale-du-cambodge-1',2,0),(2848,319,1,'CAMBODGE','AV-CA-013','De Phnom penh aux temples de Siem Reap','de-phnom-penh-aux-temples-de-siem-reap-2',6,0),(2849,319,1,'CAMBODGE','AV-CA-014','De Phnom penh aux temples de Siem Reap','de-phnom-penh-aux-temples-de-siem-reap-3',5,0),(2850,319,1,'CAMBODGE','AV-CA-015','De Phnom penh à Battambang jusqu’aux temples de Siem Reap','de-phnom-penh-a-battambang-jusquaux-temples-de-siem-reap-1',7,0),(2851,319,1,'CAMBODGE','AV-CA-016','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-6',3,0),(2852,319,1,'CAMBODGE','AV-CA-017','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-7',2,0),(2853,319,1,'CAMBODGE','AV-CA-018','Découverte de Phnom penh :  la ville capitale du Cambodge','decouverte-de-phnom-penh-la-ville-capitale-du-cambodge-2',2,0),(2854,319,1,'CAMBODGE','AV-CA-019','De Phnom penh aux temples de Siem Reap','de-phnom-penh-aux-temples-de-siem-reap-4',6,0),(2855,319,1,'CAMBODGE','AV-CA-020','De Phnom penh aux temples de Siem Reap','de-phnom-penh-aux-temples-de-siem-reap-5',5,0),(2856,319,1,'CAMBODGE','AV-CA-021','De Phnom penh – Kratie – Koh Trong – Kompong Thom – Siem reap','de-phnom-penh-kratie-koh-trong-kompong-thom-siem-reap-1',4,0),(2857,319,1,'CAMBODGE','AV-CA-022','Découverte des temples à Siem Reap : les temples d’Angkor & le lac Tonle','decouverte-des-temples-a-siem-reap-les-temples-dangkor-le-lac-tonle-8',4,0),(2858,319,1,'CAMBODGE','AV-CA-023','De Phnom penh à Battambang jusqu’aux temples de Siem Reap','de-phnom-penh-a-battambang-jusquaux-temples-de-siem-reap-2',7,0),(2859,320,1,'VIETNAM','AV-VIN-001','Ha Noi– Ninh Binh – Hai Phong – Ha Long – Ha','ha-noi-ninh-binh-hai-phong-ha-long-ha',3,0),(2860,320,1,'VIETNAM','AV-VIN-002','NOM Ancien village de bonsaïs et village de porcelaines','nom-ancien-village-de-bonsais-et-village-de-porcelaines',1,0),(2861,320,1,'VIETNAM','AV-VIN-003','Ancien village Duong Lam & la fameuse pagode THAY','ancien-village-duong-lam-la-fameuse-pagode-thay',1,0),(2862,320,1,'VIETNAM','AV-VIN-004','Ha Noi– Ha Long – Bai Tu Long - Ha Noi','ha-noi-ha-long-bai-tu-long-ha-noi',2,0),(2863,320,1,'VIETNAM','AV-VIN-005','Hanoi– Mai Chau – réserve Pu Luong – Ninh Binh – Hai Phong – Ha Long – Hanoi','hanoi-mai-chau-reserve-pu-luong-ninh-binh-hai-phong-ha-long-hanoi',5,0),(2864,320,1,'VIETNAM','AV-VIN-006','Ha Noi– Ha Long – Bai Tu Long - Ha Noi.','ha-noi-ha-long-bai-tu-long-ha-noi-1',2,0),(2865,320,1,'VIETNAM','AV-VIN-007','Hanoi– Mai Chau – réserve Pu Luong – Ninh Binh – Hai Phong – Ha Long – Hanoi','hanoi-mai-chau-reserve-pu-luong-ninh-binh-hai-phong-ha-long-hanoi-1',5,0),(2866,320,1,'VIETNAM','AV-VIN-008','Le vent sauvage du haut tonkin : Ha Noi– Duong Lam – Nghia Lo – Tu le - Mu Cang Chai - Sapa – Bac Ha –Noi :','le-vent-sauvage-du-haut-tonkin-ha-noi-duong-lam-nghia-lo-tu-le-mu-cang-chai-sapa-bac-ha-noi',5,0),(2867,320,1,'VIETNAM','AV-VIN-009','Ha Noi– Ninh Binh – Hai Phong – Ha Long – Ha Noi','ha-noi-ninh-binh-hai-phong-ha-long-ha-noi',3,0),(2868,320,1,'VIETNAM','AV-VIN-010','Ancien village NOM, village de bonsaïs et village de porcelaines','ancien-village-nom-village-de-bonsais-et-village-de-porcelaines',1,0),(2869,320,1,'VIETNAM','AV-VIN-011','Ancien village Duong Lam & la fameuse pagode THAY','ancien-village-duong-lam-la-fameuse-pagode-thay-1',1,0),(2870,320,1,'VIETNAM','AV-VIN-012','Visite de Hanoi – la capitale millénaire','visite-de-hanoi-la-capitale-millenaire',2,0),(2871,320,1,'VIETNAM','AV-VIN-013','Ha Noi– Ha Long – Bai Tu Long - Ha Noi','ha-noi-ha-long-bai-tu-long-ha-noi-2',2,0),(2872,321,1,'VIETNAM','AV-VINC-014','Visite de Hue authentique et balade à vélo','visite-de-hue-authentique-et-balade-a-velo',1,0),(2873,321,1,'VIETNAM','AV-VINC-016','Visite des ruines Champa de la vallée My Son  - au départ de Hoi An – balade en bateau sur la rivière Thu bon et visite du village de Thanh Ha.','visite-des-ruines-champa-de-la-vallee-my-son-au-depart-de-hoi-an-balade-en-bateau-sur-la-riviere-thu-bon-et-visite-du-village-de-thanh-ha',1,0),(2874,321,1,'VIETNAM','AV-VINC-017','Visite de hoi An','visite-de-hoi-an',1,0),(2875,321,1,'VIETNAM','AV-VINC-018','Hue, Da Nang & Hoi An : De la cité impériale de Hue au col des nuages, Da Nang et Hoi An','hue-da-nang-hoi-an-de-la-cite-imperiale-de-hue-au-col-des-nuages-da-nang-et-hoi-an',4,0),(2876,321,1,'VIETNAM','AV-VINC-019','Hue, Da Nang & Hoi An','hue-da-nang-hoi-an',3,0),(2877,321,1,'VIETNAM','AV-VINC-020','Hue & Bana Hill & Hoi de','hue-bana-hill-hoi-de',4,0),(2878,321,1,'VIETNAM','AV-VINC-021','Hue, Da Nang & Hoi An','hue-da-nang-hoi-an-1',4,0),(2879,321,1,'VIETNAM','AV-VINC-022','Hue, Da Nang & Hoi An  de','hue-da-nang-hoi-an-de',3,0),(2880,321,1,'VIETNAM','AV-VINC-023','Hue & Bana Hill & Hoi An','hue-bana-hill-hoi-an',4,0),(2881,321,1,'VIETNAM','AV-VINC-024','Découverte de l’ethnie Cotu : Da Nang (ou Hoi An) -  Dong Giang, au départ de Da Nang ou de Hoi An','decouverte-de-lethnie-cotu-da-nang-ou-hoi-an-dong-giang-au-depart-de-da-nang-ou-de-hoi-an',2,0),(2882,321,1,'VIETNAM','AV-VINC-025','Hue, Da Nang & Hoi An','hue-da-nang-hoi-an-2',4,0),(2883,321,1,'VIETNAM','AV-VINC-026','Hue, Da Nang & Hoi An','hue-da-nang-hoi-an-3',4,0),(2884,321,1,'VIETNAM','AV-VINC-027','Hue, Da Nang & Hoi An  /','hue-da-nang-hoi-an-4',3,0),(2885,321,1,'VIETNAM','AV-VINC-028','Hue & Bana Hill & Hoi An','hue-bana-hill-hoi-an-1',4,0),(2886,321,1,'VIETNAM','AV-VINC-029','Hue, Da Nang & Hoi An','hue-da-nang-hoi-an-5',4,0),(2887,321,1,'VIETNAM','AV-VINC-030','Hue, Da Nang & Hoi An','hue-da-nang-hoi-an-6',3,0),(2888,321,1,'VIETNAM','AV-VINC-031','Hue & Bana Hill & Hoi An : De la cité impériale de Hue au col des nuages, station d’altitude Bana Hill  et Hoi An Nombre','hue-bana-hill-hoi-an-de-la-cite-imperiale-de-hue-au-col-des-nuages-station-daltitude-bana-hill-et-hoi-an-nombre',4,0),(2889,321,1,'VIETNAM','AV-VINC-032','Découverte de l’ethnie Cotu : Da Nang (ou Hoi An) -  Dong Giang, au départ de Da Nang ou de Hoi An','decouverte-de-lethnie-cotu-da-nang-ou-hoi-an-dong-giang-au-depart-de-da-nang-ou-de-hoi-an-1',2,0),(2890,321,1,'VIETNAM','AV-VINC-033','Découverte de l’ethnie Cotu : Da Nang (ou Hoi An) -  Dong Giang, au départ de Da Nang ou de Hoi An','decouverte-de-lethnie-cotu-da-nang-ou-hoi-an-dong-giang-au-depart-de-da-nang-ou-de-hoi-an-2',2,0),(2891,322,1,'VIETNAM','AV-VIS-034','Visite des tunnels de Cu Chi et le temple Cao Dai & assister à la messe du midi-  au départ de Sai gon (Ho Chi Minh ville)','visite-des-tunnels-de-cu-chi-et-le-temple-cao-dai-assister-a-la-messe-du-midi-au-depart-de-sai-gon-ho-chi-minh-ville',1,0),(2892,322,1,'VIETNAM','AV-VIS-035','Visite des tunnels de Cu Chi -  au départ de Sai gon (Ho Chi Minh ville)','visite-des-tunnels-de-cu-chi-au-depart-de-sai-gon-ho-chi-minh-ville',1,0),(2893,322,1,'VIETNAM','AV-VIS-036','Visite de Sai gon – Cholon  au départ de Sai gon (Ho Chi Minh ville)','visite-de-sai-gon-cholon-au-depart-de-sai-gon-ho-chi-minh-ville',1,0),(2894,322,1,'VIETNAM','AV-VIS-037','Le jardin du Mekong: Ho Chi Minh – Ben Tre - Cai Lay – Sa dec - Long Xuyen  -  Sai gon (Ho Chi Minh ville)','le-jardin-du-mekong-ho-chi-minh-ben-tre-cai-lay-sa-dec-long-xuyen-sai-gon-ho-chi-minh-ville',3,0),(2895,322,1,'VIETNAM','AV-VIS-038','Le delta Mekong en profondeur: Ho Chi Minh – Ben Tre – Cai Lay -  Sa Dec – Long Xuyen – Chau Doc – Tra Su – Ha Tien','le-delta-mekong-en-profondeur-ho-chi-minh-ben-tre-cai-lay-sa-dec-long-xuyen-chau-doc-tra-su-ha-tien',5,0),(2896,322,1,'VIETNAM','AV-VIS-039','Le delta Mekong authentique: Ho Chi Minh – Ben Tre – Cau Ke (Tra Vinh) - Long Xuyen  -  Sa Dec - Sai gon (Ho Chi Minh ville)','le-delta-mekong-authentique-ho-chi-minh-ben-tre-cau-ke-tra-vinh-long-xuyen-sa-dec-sai-gon-ho-chi-minh-ville',4,0),(2897,322,1,'VIETNAM','AV-VIS-040','La vie sur eau au delta Mekong : Ho Chi Minh - Cai be – Sa Dec – Long Xuyen  - Chau Doc – Tra Su - Sai gon (Ho Chi Minh ville)  ( cette excursion a pas mal de route ! surtout le retour Chau Doc – Sai gon en plus de 5h de route)','la-vie-sur-eau-au-delta-mekong-ho-chi-minh-cai-be-sa-dec-long-xuyen-chau-doc-tra-su-sai-gon-ho-chi-minh-ville-cette-excursion-a-pas-mal-de-route-surtout-le-retour-chau-doc-sai-gon-en-plus-de-5h-de-route',3,0),(2898,322,1,'VIETNAM','AV-VIS-041','La vie sur eau au delta Mekong : Ho Chi Minh - Cai be – Vinh Long – Can Tho  - Sai gon (Ho Chi Minh ville)','la-vie-sur-eau-au-delta-mekong-ho-chi-minh-cai-be-vinh-long-can-tho-sai-gon-ho-chi-minh-ville',2,0),(2899,322,1,'VIETNAM','AV-VIS-042','La vie sur eau au delta Mekong : Ho Chi Minh - Cai be – Vinh Long – Can Tho  - Sai gon (Ho Chi Minh ville)','la-vie-sur-eau-au-delta-mekong-ho-chi-minh-cai-be-vinh-long-can-tho-sai-gon-ho-chi-minh-ville-1',2,0),(2900,322,1,'VIETNAM','AV-VIS-043','La vie sur eau au delta Mekong : Ho Chi Minh - Cai be – Vinh Long – Can Tho  - Sai gon (Ho Chi Minh ville)','la-vie-sur-eau-au-delta-mekong-ho-chi-minh-cai-be-vinh-long-can-tho-sai-gon-ho-chi-minh-ville-2',2,0),(2901,322,1,'VIETNAM','AV-VIS-044','La vie sur eau au delta Mekong : Ho Chi Minh - Cai be – Vinh Long – Can Tho  - Sai gon (Ho Chi Minh ville)','la-vie-sur-eau-au-delta-mekong-ho-chi-minh-cai-be-vinh-long-can-tho-sai-gon-ho-chi-minh-ville-3',2,0),(2902,322,1,'VIETNAM','AV-VIS-045','La belle nature du delta Mekong à Ben Tre -  au départ de Sai gon (Ho Chi Minh ville)','la-belle-nature-du-delta-mekong-a-ben-tre-au-depart-de-sai-gon-ho-chi-minh-ville',1,0),(2903,323,1,'LAOS','AV-LA-001','Découvertes au Nord du Laos ( Vientiane – VangVeng – Luang Prabang)','decouvertes-au-nord-du-laos-vientiane-vangveng-luang-prabang',6,0),(2904,323,1,'LAOS','AV-LA-002','Découvertes au Nord du Laos ( Vientiane – VangVeng – Luang Prabang)','decouvertes-au-nord-du-laos-vientiane-vangveng-luang-prabang-1',6,0),(2905,323,1,'LAOS','AV-LA-003','Découvertes au Nord du Laos ( Vientiane – VangVeng – Luang Prabang)','decouvertes-au-nord-du-laos-vientiane-vangveng-luang-prabang-2',6,0),(2906,323,1,'LAOS','AV-LA-004','Hors sentiers battus :  Luang Prabang _Muang Xai – Muang La_ Nong Khiaw _ Muang Ngoy – Luang Prabang','hors-sentiers-battus-luang-prabang-muang-xai-muang-la-nong-khiaw-muang-ngoy-luang-prabang',5,0),(2907,324,1,'LAOS','AV-LA-005','Découvertes au SUD du Laos ( Boloven – Pakse, Wat Phout, cascades du Mekong','decouvertes-au-sud-du-laos-boloven-pakse-wat-phout-cascades-du-mekong',4,0),(2908,324,1,'LAOS','AV-LA-006','Découvertes au SUD du Laos ( Boloven – Pakse, Wat Phout, cascades du Mekong','decouvertes-au-sud-du-laos-boloven-pakse-wat-phout-cascades-du-mekong-1',4,0),(2909,324,1,'LAOS','AV-LA-007','Découvertes au SUD du Laos ( Boloven – Pakse, Wat Phout, cascades du Mekong','decouvertes-au-sud-du-laos-boloven-pakse-wat-phout-cascades-du-mekong-2',4,0),(2910,325,1,'LAOS','AV-LA-008','Découverte de l’ancienne capitale Luang Prabang','decouverte-de-lancienne-capitale-luang-prabang',3,0),(2911,325,1,'LAOS','AV-LA-009','Découverte de l’ancienne capitale Luang Prabang','decouverte-de-lancienne-capitale-luang-prabang-1',3,0),(2912,325,1,'LAOS','AV-LA-010','Découverte de l’ancienne capitale Luang Prabang','decouverte-de-lancienne-capitale-luang-prabang-2',3,0),(2913,325,1,'LAOS','AV-LA-012','Découverte de l’ancienne capitale Luang Prabang','decouverte-de-lancienne-capitale-luang-prabang-3',2,0),(2914,325,1,'LAOS','AV-LA-013','Découverte de l’ancienne capitale Luang Prabang','decouverte-de-lancienne-capitale-luang-prabang-4',3,0),(2915,325,1,'LAOS','AV-LA-014','Découverte de l’ancienne capitale Luang Prabang','decouverte-de-lancienne-capitale-luang-prabang-5',2,0),(2916,326,1,'SRI LANKA','MT-SR-001','Triangle culturel','triangle-culturel',4,0),(2917,326,1,'SRI LANKA','MT-SR-002','Triangle culturel','triangle-culturel-1',4,0),(2918,326,1,'SRI LANKA','MT-SR-003','Kandy – Nuwara Eliya – Kandy','kandy-nuwara-eliya-kandy',3,0),(2919,326,1,'SRI LANKA','MT-SR-004','Kandy – Nuwara Eliya – Kandy','kandy-nuwara-eliya-kandy-1',3,0),(2920,326,1,'SRI LANKA','MT-SR-005','Galle – Yala – Nuwara Eliya –Ella- Galle','galle-yala-nuwara-eliya-ella-galle',3,0),(2921,326,1,'SRI LANKA','MT-SR-006','Galle – Yala – Nuwara Eliya –Ella- Galle','galle-yala-nuwara-eliya-ella-galle-1',3,0),(2922,326,1,'SRI LANKA','MT-SR-007','Nature et vie sauvage au sein du triangle culturel','nature-et-vie-sauvage-au-sein-du-triangle-culturel',4,0),(2923,326,1,'SRI LANKA','MT-SR-008','Nature et vie sauvage','nature-et-vie-sauvage',4,0),(2924,327,1,'COSTA RICA','TC-CO-001','Randonnées et farniente au pied du volcan Arenal','randonnees-et-farniente-au-pied-du-volcan-arenal',3,0),(2925,327,1,'COSTA RICA','TC-CO-002','A la découverte de la petite Amazonie Costaricienne : Tortuguero','a-la-decouverte-de-la-petite-amazonie-costaricienne-tortuguero',3,0),(2926,327,1,'COSTA RICA','TC-CO-003','A la découverte du refuge Maquenque à la frontière nicaraguayenne','a-la-decouverte-du-refuge-maquenque-a-la-frontiere-nicaraguayenne',3,0),(2927,327,1,'COSTA RICA','TC-CO-004','Randonnées et farniente à Manuel Antonio','randonnees-et-farniente-a-manuel-antonio',3,0),(2928,327,1,'COSTA RICA','TC-CO-005','A l’assaut du Corcovado : Nature et Aventure','a-lassaut-du-corcovado-nature-et-aventure',4,0),(2929,328,1,'GUADELOUPE','FG-GU-001','D’îles en îles','diles-en-iles',5,0),(2930,328,1,'GUADELOUPE','FG-GU-002','Echappée culturelle du papillon - (Pointe-à-Pitre ; Grande-Terre)','echappee-culturelle-du-papillon-pointe-a-pitre-grande-terre',4,0),(2931,328,1,'GUADELOUPE','FG-GU-003','L’appel de la mer','lappel-de-la-mer',5,0),(2932,328,1,'GUADELOUPE','FG-GU-004','L’archipel au coeur de l’archipel ( Terre de haut et Terre de bas - Las Saintes )','larchipel-au-coeur-de-larchipel-terre-de-haut-et-terre-de-bas-las-saintes',3,0),(2933,328,1,'GUADELOUPE','FG-GU-005','Les secrets de la nature','les-secrets-de-la-nature',5,0),(2934,328,1,'GUADELOUPE','FG-GU-006','Splendeur de la faune et la flore marine  - (Sainte-Rose, Deshaies, Bouillante)','splendeur-de-la-faune-et-la-flore-marine-sainte-rose-deshaies-bouillante',4,0),(2935,328,1,'GUADELOUPE','FG-GU-007','Tradition et décor de Sainte Marie (Deshaies - Pointe Noire- Sainte Rose)','tradition-et-decor-de-sainte-marie-deshaies-pointe-noire-sainte-rose',4,0),(2936,329,1,'LA REUNION','CR-RU-001','«Prenez de la hauteur »','prenez-de-la-hauteur',3,0),(2937,329,1,'LA REUNION','CR-RU-002','Relaxation et détente en lodge','relaxation-et-detente-en-lodge',2,0),(2938,329,1,'LA REUNION','CR-RU-003','Entre la Fournaise et Cilaos la station thermale','entre-la-fournaise-et-cilaos-la-station-thermale',4,0),(2939,329,1,'LA REUNION','CR-RU-004','La Vanille & le Rhum » suivi d’Helbourg','la-vanille-le-rhum-suivi-dhelbourg',3,0),(2940,329,1,'LA REUNION','CR-RU-005','A la découverte de Mafate : La Nouvelle - Marla par le cirque de Salazie','a-la-decouverte-de-mafate-la-nouvelle-marla-par-le-cirque-de-salazie',3,0);
/*!40000 ALTER TABLE `stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_history`
--

DROP TABLE IF EXISTS `stage_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_history` (
  `stage_id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  PRIMARY KEY (`stage_id`,`history_id`),
  KEY `IDX_AD4330062298D193` (`stage_id`),
  KEY `IDX_AD4330061E058452` (`history_id`),
  CONSTRAINT `FK_AD4330061E058452` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AD4330062298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_history`
--

LOCK TABLES `stage_history` WRITE;
/*!40000 ALTER TABLE `stage_history` DISABLE KEYS */;
INSERT INTO `stage_history` VALUES (2853,79),(2854,79),(2855,79),(2863,80),(2864,80),(2865,80),(2873,81),(2874,81),(2875,81);
/*!40000 ALTER TABLE `stage_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_history`
--

DROP TABLE IF EXISTS `state_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_history`
--

LOCK TABLES `state_history` WRITE;
/*!40000 ALTER TABLE `state_history` DISABLE KEYS */;
INSERT INTO `state_history` VALUES (218,'Attente admin'),(219,'Accepté par admin'),(220,'Refusé par admin'),(221,'Refusé par agence'),(222,'Attente paiement'),(223,'Payé'),(224,'Voyage effectué');
/*!40000 ALTER TABLE `state_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style`
--

DROP TABLE IF EXISTS `style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style`
--

LOCK TABLES `style` WRITE;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` VALUES (156,'Standard'),(157,'Chez l’habitant'),(158,'Charme'),(159,'Luxe'),(160,'Responsable');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `style_stage`
--

DROP TABLE IF EXISTS `style_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `style_stage` (
  `style_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  PRIMARY KEY (`style_id`,`stage_id`),
  KEY `IDX_8A9DD92BACD6074` (`style_id`),
  KEY `IDX_8A9DD922298D193` (`stage_id`),
  CONSTRAINT `FK_8A9DD922298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8A9DD92BACD6074` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `style_stage`
--

LOCK TABLES `style_stage` WRITE;
/*!40000 ALTER TABLE `style_stage` DISABLE KEYS */;
INSERT INTO `style_stage` VALUES (156,2851),(156,2852),(156,2853),(156,2854),(156,2855),(156,2856),(156,2857),(156,2858),(156,2866),(156,2867),(156,2868),(156,2869),(156,2870),(156,2871),(156,2872),(156,2873),(156,2874),(156,2875),(156,2876),(156,2888),(156,2889),(156,2890),(156,2891),(156,2892),(156,2893),(156,2894),(156,2895),(156,2897),(156,2898),(156,2899),(156,2900),(156,2902),(156,2904),(156,2905),(156,2908),(156,2909),(156,2912),(156,2915),(156,2916),(156,2917),(156,2920),(156,2922),(156,2924),(156,2925),(156,2926),(156,2928),(156,2932),(156,2934),(156,2936),(156,2938),(156,2939),(156,2940),(157,2866),(157,2881),(157,2882),(157,2883),(157,2884),(157,2896),(157,2897),(157,2898),(157,2899),(157,2901),(157,2921),(157,2929),(158,2836),(158,2837),(158,2838),(158,2839),(158,2840),(158,2841),(158,2842),(158,2843),(158,2860),(158,2861),(158,2862),(158,2863),(158,2864),(158,2877),(158,2878),(158,2879),(158,2880),(158,2903),(158,2906),(158,2910),(158,2913),(158,2919),(158,2923),(158,2927),(158,2930),(158,2931),(158,2933),(158,2935),(158,2937),(159,2844),(159,2845),(159,2846),(159,2847),(159,2848),(159,2849),(159,2850),(159,2859),(159,2865),(159,2885),(159,2886),(159,2887),(159,2907),(159,2911),(159,2914),(159,2918);
/*!40000 ALTER TABLE `style_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme`
--

DROP TABLE IF EXISTS `theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme`
--

LOCK TABLES `theme` WRITE;
/*!40000 ALTER TABLE `theme` DISABLE KEYS */;
INSERT INTO `theme` VALUES (218,'Culture & Traditions'),(219,'Sport & aventure'),(220,'Bien être & Spiritualité'),(221,'Nature & Vie sauvage'),(222,'Fêtes et Festivals'),(223,'Iles & Plages de rêves'),(224,'Responsable');
/*!40000 ALTER TABLE `theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_stage`
--

DROP TABLE IF EXISTS `theme_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theme_stage` (
  `theme_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  PRIMARY KEY (`theme_id`,`stage_id`),
  KEY `IDX_9A5E188C59027487` (`theme_id`),
  KEY `IDX_9A5E188C2298D193` (`stage_id`),
  CONSTRAINT `FK_9A5E188C2298D193` FOREIGN KEY (`stage_id`) REFERENCES `stage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9A5E188C59027487` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_stage`
--

LOCK TABLES `theme_stage` WRITE;
/*!40000 ALTER TABLE `theme_stage` DISABLE KEYS */;
INSERT INTO `theme_stage` VALUES (218,2836),(218,2837),(218,2838),(218,2839),(218,2840),(218,2841),(218,2842),(218,2844),(218,2845),(218,2846),(218,2847),(218,2848),(218,2849),(218,2850),(218,2851),(218,2852),(218,2853),(218,2854),(218,2855),(218,2856),(218,2857),(218,2858),(218,2859),(218,2860),(218,2861),(218,2862),(218,2863),(218,2864),(218,2865),(218,2866),(218,2867),(218,2868),(218,2869),(218,2870),(218,2871),(218,2872),(218,2873),(218,2874),(218,2875),(218,2876),(218,2877),(218,2878),(218,2879),(218,2880),(218,2881),(218,2882),(218,2883),(218,2884),(218,2885),(218,2886),(218,2887),(218,2888),(218,2889),(218,2890),(218,2891),(218,2892),(218,2893),(218,2894),(218,2895),(218,2896),(218,2897),(218,2898),(218,2899),(218,2900),(218,2901),(218,2903),(218,2904),(218,2905),(218,2906),(218,2907),(218,2908),(218,2909),(218,2910),(218,2911),(218,2912),(218,2913),(218,2914),(218,2915),(218,2916),(218,2917),(218,2918),(218,2919),(218,2920),(218,2922),(218,2923),(218,2926),(218,2928),(218,2929),(218,2930),(218,2931),(218,2932),(218,2933),(218,2934),(218,2935),(218,2936),(218,2937),(218,2938),(219,2864),(219,2866),(219,2867),(219,2897),(219,2919),(219,2920),(219,2921),(219,2922),(219,2926),(219,2928),(219,2929),(220,2903),(220,2905),(220,2906),(220,2907),(220,2908),(220,2909),(220,2910),(220,2911),(220,2912),(220,2913),(220,2914),(220,2915),(220,2916),(220,2917),(220,2918),(220,2940),(221,2836),(221,2837),(221,2838),(221,2839),(221,2840),(221,2841),(221,2842),(221,2844),(221,2845),(221,2846),(221,2847),(221,2848),(221,2849),(221,2850),(221,2851),(221,2852),(221,2853),(221,2854),(221,2855),(221,2856),(221,2857),(221,2858),(221,2859),(221,2863),(221,2864),(221,2865),(221,2866),(221,2867),(221,2872),(221,2875),(221,2891),(221,2896),(221,2902),(221,2905),(221,2906),(221,2907),(221,2908),(221,2909),(221,2910),(221,2911),(221,2912),(221,2913),(221,2914),(221,2919),(221,2920),(221,2921),(221,2922),(221,2923),(221,2924),(221,2925),(221,2926),(221,2927),(221,2928),(221,2929),(221,2930),(221,2931),(221,2933),(221,2934),(221,2935),(221,2936),(221,2937),(221,2938),(221,2939),(223,2860),(223,2863),(223,2865),(223,2868),(223,2872),(223,2901),(224,2843),(224,2883),(224,2884),(224,2891),(224,2892);
/*!40000 ALTER TABLE `theme_stage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-19 17:38:45
