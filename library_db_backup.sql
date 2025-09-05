-- MySQL dump 10.13  Distrib 8.4.5, for Win64 (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.4.5

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(150) NOT NULL,
  `category_id` int NOT NULL,
  `available_copies` int DEFAULT '1',
  `total_copies` int DEFAULT '1',
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Linear Algebra and Its Applications','Gilbert Strang',1,5,8,'Math'),(2,'Discrete Mathematics and Its Applications','Kenneth H. Rosen',1,6,8,'Math'),(3,'Calculus: Early Transcendentals','James Stewart',1,6,8,'Math'),(4,'Introduction to Probability','Joseph K. Blitzstein',1,6,8,'Math'),(5,'Mathematical Statistics with Applications','Dennis Wackerly',1,7,8,'Math'),(6,'A First Course in Abstract Algebra','John B. Fraleigh',1,7,8,'Math'),(7,'Principles of Mathematical Analysis','Walter Rudin',1,6,8,'Math'),(8,'Numerical Analysis','Richard L. Burden',1,7,8,'Math'),(9,'Graph Theory','Reinhard Diestel',1,7,8,'Math'),(10,'Convex Optimization','Stephen Boyd',1,7,8,'Math'),(11,'Linux Administration Handbook','Evi Nemeth',2,7,8,'Linux'),(12,'How Linux Works','Brian Ward',2,6,8,'Linux'),(13,'Linux Pocket Guide','Daniel J. Barrett',2,7,8,'Linux'),(14,'The Linux Command Line','William E. Shotts, Jr.',2,7,8,'Linux'),(15,'Linux Kernel Development','Robert Love',2,7,8,'Linux'),(16,'UNIX and Linux System Administration Handbook','Evi Nemeth',2,7,8,'Linux'),(17,'Linux System Programming','Robert Love',2,7,8,'Linux'),(18,'Advanced Programming in the UNIX Environment','W. Richard Stevens',2,6,8,'Linux'),(19,'Linux Bible','Christopher Negus',2,7,8,'Linux'),(20,'Linux Network Administration','Evi Nemeth',2,7,8,'Linux'),(21,'Operating System Concepts','Abraham Silberschatz',3,7,8,'Operating_System'),(22,'Modern Operating Systems','Andrew S. Tanenbaum',3,7,8,'Operating_System'),(23,'Operating Systems: Internals and Design Principles','William Stallings',3,6,8,'Operating_System'),(24,'Operating Systems: Three Easy Pieces','Remzi H. Arpaci-Dusseau',3,7,8,'Operating_System'),(25,'The Design of the UNIX Operating System','Maurice J. Bach',3,7,8,'Operating_System'),(26,'Linux Kernel Development','Robert Love',3,7,8,'Operating_System'),(27,'Windows Internals','Mark Russinovich',3,7,8,'Operating_System'),(28,'System Programming','Sibsankar Haldar',3,7,8,'Operating_System'),(29,'Distributed Systems','Andrew S. Tanenbaum',3,7,8,'Operating_System'),(30,'Principles of Concurrent and Distributed Programming','M. Ben-Ari',3,7,8,'Operating_System'),(31,'Learning Python','Mark Lutz',4,6,8,'Python'),(32,'Fluent Python','Luciano Ramalho',4,7,8,'Python'),(33,'Python Crash Course','Eric Matthes',4,7,8,'Python'),(34,'Automate the Boring Stuff with Python','Al Sweigart',4,6,8,'Python'),(35,'Python Cookbook','David Beazley',4,7,8,'Python'),(36,'Effective Python','Brett Slatkin',4,7,8,'Python'),(37,'Python for Data Analysis','Wes McKinney',4,7,8,'Python'),(38,'Deep Learning with Python','François Chollet',4,7,8,'Python'),(39,'Python Tricks: A Buffet of Awesome Python Features','Dan Bader',4,6,8,'Python'),(40,'Head First Python','Paul Barry',4,6,8,'Python');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_records`
--

DROP TABLE IF EXISTS `borrow_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrow_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `borrow_records_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_records`
--

LOCK TABLES `borrow_records` WRITE;
/*!40000 ALTER TABLE `borrow_records` DISABLE KEYS */;
INSERT INTO `borrow_records` VALUES (1,101,1,'2025-08-01','2025-08-15',NULL),(2,102,2,'2025-08-01','2025-08-15',NULL),(3,103,3,'2025-08-02','2025-08-16',NULL),(4,104,4,'2025-08-02','2025-08-16',NULL),(5,105,5,'2025-08-03','2025-08-17',NULL),(6,106,6,'2025-08-03','2025-08-17',NULL),(7,107,7,'2025-08-04','2025-08-18',NULL),(8,101,8,'2025-08-04','2025-08-18',NULL),(9,102,9,'2025-08-05','2025-08-19',NULL),(10,103,10,'2025-08-05','2025-08-19',NULL),(11,104,11,'2025-08-06','2025-08-20',NULL),(12,105,12,'2025-08-06','2025-08-20',NULL),(13,106,13,'2025-08-07','2025-08-21',NULL),(14,107,14,'2025-08-07','2025-08-21',NULL),(15,101,15,'2025-08-08','2025-08-22',NULL),(16,102,16,'2025-08-08','2025-08-22',NULL),(17,103,17,'2025-08-09','2025-08-23',NULL),(18,104,18,'2025-08-09','2025-08-23',NULL),(19,105,19,'2025-08-10','2025-08-24',NULL),(20,106,20,'2025-08-10','2025-08-24',NULL),(21,107,21,'2025-08-11','2025-08-25',NULL),(22,101,22,'2025-08-11','2025-08-25',NULL),(23,102,23,'2025-08-12','2025-08-26',NULL),(24,103,24,'2025-08-12','2025-08-26',NULL),(25,104,25,'2025-08-13','2025-08-27',NULL),(26,105,26,'2025-08-13','2025-08-27',NULL),(27,106,27,'2025-08-14','2025-08-28',NULL),(28,107,28,'2025-08-14','2025-08-28',NULL),(29,101,29,'2025-08-15','2025-08-29',NULL),(30,102,30,'2025-08-15','2025-08-29',NULL),(31,103,31,'2025-08-16','2025-08-30',NULL),(32,104,32,'2025-08-16','2025-08-30',NULL),(33,105,33,'2025-08-17','2025-08-31',NULL),(34,106,34,'2025-08-17','2025-08-31',NULL),(35,107,35,'2025-08-18','2025-09-01',NULL),(36,101,36,'2025-08-18','2025-09-01',NULL),(37,102,37,'2025-08-19','2025-09-02',NULL),(38,103,38,'2025-08-19','2025-09-02',NULL),(39,104,39,'2025-08-20','2025-09-03',NULL),(40,105,40,'2025-08-20','2025-09-03',NULL),(41,106,1,'2025-08-21','2025-09-04',NULL),(42,107,3,'2025-08-21','2025-09-04',NULL),(43,101,7,'2025-08-22','2025-09-05',NULL),(44,102,12,'2025-08-22','2025-09-05',NULL),(45,103,18,'2025-08-23','2025-09-06',NULL),(46,104,23,'2025-08-23','2025-09-06',NULL),(47,105,31,'2025-08-24','2025-09-07',NULL),(48,106,34,'2025-08-24','2025-09-07',NULL),(49,107,39,'2025-08-25','2025-09-08',NULL),(50,101,40,'2025-08-25','2025-09-08',NULL),(51,1,1,'2025-09-04','2025-09-18',NULL),(52,1,2,'2025-09-04','2025-09-18',NULL),(53,101,4,'2025-09-05','2025-09-19',NULL);
/*!40000 ALTER TABLE `borrow_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Linux'),(1,'Math'),(3,'Operating_System'),(4,'Python');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','librarian','user') DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rajesh Kumar','admin123','admin'),(11,'Anjali Sharma','libpass1','librarian'),(12,'Suresh Patel','libpass2','librarian'),(101,'Priya Singh','user123','user'),(102,'Ravi Desai','user234','user'),(103,'Neha Joshi','user345','user'),(104,'Amit Malhotra','user456','user'),(105,'Sneha Reddy','user567','user'),(106,'Manoj Gupta','user678','user'),(107,'Kavita Nair','user789','user');
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

-- Dump completed on 2025-09-05 16:25:11
