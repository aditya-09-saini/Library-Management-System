-- MySQL dump 10.13  Distrib 8.4.6, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.4.6

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
-- Table structure for table `book_orders`
--

DROP TABLE IF EXISTS `book_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_title` varchar(200) NOT NULL,
  `author` varchar(150) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `quantity` int DEFAULT '1',
  `order_date` date DEFAULT (curdate()),
  `supplier_name` varchar(100) DEFAULT NULL,
  `status` enum('ordered','received','cancelled') DEFAULT 'ordered',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `book_orders_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_orders`
--

LOCK TABLES `book_orders` WRITE;
/*!40000 ALTER TABLE `book_orders` DISABLE KEYS */;
INSERT INTO `book_orders` VALUES (1,'Advanced Linear Algebra','Steven Roman',1,5,'2025-09-15','EduWorld Publishers','received'),(2,'Calculus for Scientists and Engineers','William Briggs',1,4,'2025-09-16','Pearson India','received'),(3,'Computer Networks','Andrew S. Tanenbaum',6,6,'2025-09-18','TechBooks Pvt. Ltd.','ordered'),(4,'Introduction to Algorithms','Thomas H. Cormen',2,5,'2025-09-20','Campus Publications','ordered'),(5,'Database System Concepts','Abraham Silberschatz',7,4,'2025-09-22','EduWorld Publishers','received'),(6,'Deep Learning','Ian Goodfellow',8,3,'2025-09-25','TechZone Distributors','ordered'),(7,'Python Programming for Beginners','Eric Matthes',5,8,'2025-09-26','TechBooks Pvt. Ltd.','received'),(8,'Artificial Intelligence: A Modern Approach','Stuart Russell',8,5,'2025-09-28','Pearson India','ordered'),(9,'Electronic Devices and Circuit Theory','Robert L. Boylestad',9,6,'2025-09-29','Campus Publications','received'),(10,'Cyber Security Essentials','Charles Brooks',10,5,'2025-09-30','SecureLearn Ltd.','received'),(11,'Operating System Concepts','Abraham Silberschatz',3,5,'2025-10-01','EduWorld Publishers','received'),(12,'Machine Learning with Python','Sebastian Raschka',4,5,'2025-10-02','TechBooks Pvt. Ltd.','ordered'),(13,'Network Security and Cryptography','William Stallings',6,4,'2025-10-02','SecureLearn Ltd.','ordered'),(14,'Data Structures and Algorithms in Python','Michael T. Goodrich',2,5,'2025-10-03','Campus Publications','received'),(15,'Digital Logic Design','M. Morris Mano',9,4,'2025-10-04','EduWorld Publishers','ordered'),(16,'Operating Systems: Three Easy Pieces','Remzi H. Arpaci-Dusseau',3,3,'2025-10-05','TechZone Distributors','cancelled'),(17,'The Art of Computer Programming','Donald Knuth',2,2,'2025-10-06','Campus Publications','ordered'),(18,'Cyber Security and Ethical Hacking','Jon Erickson',10,5,'2025-10-06','SecureLearn Ltd.','received'),(19,'Introduction to Data Science','Laura Igual',4,4,'2025-10-07','TechBooks Pvt. Ltd.','ordered'),(20,'Electronic Communication Systems','George Kennedy',9,3,'2025-10-08','Campus Publications','received');
/*!40000 ALTER TABLE `book_orders` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Linear Algebra and Its Applications','Gilbert Strang',1,5,8),(2,'Calculus: Early Transcendentals','James Stewart',1,6,8),(3,'Discrete Mathematics and Its Applications','Kenneth H. Rosen',1,7,9),(4,'Probability and Statistics for Engineers','W. W. Hines',1,4,6),(5,'Numerical Analysis','Richard L. Burden',1,6,8),(6,'Introduction to Graph Theory','Douglas B. West',1,5,7),(7,'Principles of Mathematical Analysis','Walter Rudin',1,7,9),(8,'Advanced Engineering Mathematics','Erwin Kreyszig',1,5,8),(9,'Complex Variables and Applications','Ruel Churchill',1,4,7),(10,'Real Analysis','H. L. Royden',1,6,8),(11,'Computer Networks','Andrew S. Tanenbaum',2,6,8),(12,'Computer Organization and Architecture','William Stallings',2,7,9),(13,'The C Programming Language','Brian W. Kernighan',2,6,8),(14,'Data Structures Using C','Reema Thareja',2,8,10),(15,'Let Us C','Yashavant Kanetkar',2,5,8),(16,'Programming in C++','Balagurusamy',2,6,8),(17,'Algorithms Unlocked','Thomas H. Cormen',2,7,9),(18,'Fundamentals of Computer Algorithms','Ellis Horowitz',2,6,8),(19,'Head First Java','Kathy Sierra',2,5,7),(20,'Introduction to Automata Theory','Hopcroft & Ullman',2,7,9),(21,'Operating System Concepts','Abraham Silberschatz',3,6,8),(22,'Modern Operating Systems','Andrew S. Tanenbaum',3,7,9),(23,'Operating Systems: Three Easy Pieces','Remzi H. Arpaci-Dusseau',3,5,7),(24,'Operating Systems Design and Implementation','Andrew S. Tanenbaum',3,5,8),(25,'Linux Kernel Development','Robert Love',3,6,8),(26,'UNIX Internals','Uresh Vahalia',3,6,8),(27,'System Programming','Donovan & Kernighan',3,7,9),(28,'The Design of the UNIX Operating System','Maurice J. Bach',3,5,8),(29,'Windows Internals','Mark Russinovich',3,5,8),(30,'Distributed Systems','Andrew S. Tanenbaum',3,6,8),(31,'Python for Data Analysis','Wes McKinney',4,7,9),(32,'Data Science from Scratch','Joel Grus',4,6,8),(33,'Hands-On Machine Learning with Scikit-Learn','Aurélien Géron',4,6,8),(34,'Practical Statistics for Data Scientists','Peter Bruce',4,7,9),(35,'Data Mining: Concepts and Techniques','Jiawei Han',4,6,8),(36,'Big Data Fundamentals','Thomas Erl',4,5,8),(37,'The Data Warehouse Toolkit','Ralph Kimball',4,6,9),(38,'Storytelling with Data','Cole Nussbaumer',4,7,8),(39,'An Introduction to Statistical Learning','Gareth James',4,7,9),(40,'Deep Learning with Python','François Chollet',4,5,7),(41,'Learning Python','Mark Lutz',5,7,9),(42,'Fluent Python','Luciano Ramalho',5,6,8),(43,'Python Crash Course','Eric Matthes',5,6,8),(44,'Automate the Boring Stuff with Python','Al Sweigart',5,7,9),(45,'Effective Python','Brett Slatkin',5,6,8),(46,'Python Tricks','Dan Bader',5,6,8),(47,'Think Python','Allen B. Downey',5,7,9),(48,'Programming Python','Mark Lutz',5,6,8),(49,'Python Cookbook','David Beazley',5,6,8),(50,'Head First Python','Paul Barry',5,5,7),(51,'Data Communications and Networking','Behrouz A. Forouzan',6,6,8),(52,'Computer Networking: A Top-Down Approach','James F. Kurose',6,7,9),(53,'TCP/IP Illustrated','W. Richard Stevens',6,6,8),(54,'Network Security Essentials','William Stallings',6,6,8),(55,'Network Fundamentals','Cisco Press',6,5,8),(56,'Wireless Communications','Theodore S. Rappaport',6,6,8),(57,'Introduction to Networking','Charles Severance',6,6,8),(58,'CCNA Study Guide','Todd Lammle',6,5,7),(59,'Routing TCP/IP','Jeff Doyle',6,6,9),(60,'Network Warrior','Gary A. Donahue',6,6,8),(61,'Database System Concepts','Abraham Silberschatz',7,7,9),(62,'Fundamentals of Database Systems','Ramez Elmasri',7,6,8),(63,'SQL For Data Analysis','Cathy Tanimura',7,7,9),(64,'SQL Queries for Mere Mortals','John L. Viescas',7,6,8),(65,'NoSQL Distilled','Martin Fowler',7,6,8),(66,'Database Management Systems','Raghu Ramakrishnan',7,6,8),(67,'Learning SQL','Alan Beaulieu',7,7,9),(68,'SQL in 10 Minutes','Ben Forta',7,5,8),(69,'MySQL Cookbook','Paul DuBois',7,6,8),(70,'Mastering PostgreSQL','Hans-Jürgen Schönig',7,6,8),(71,'Artificial Intelligence: A Modern Approach','Stuart Russell',8,7,9),(72,'Machine Learning','Tom M. Mitchell',8,6,8),(73,'Deep Learning','Ian Goodfellow',8,5,8),(74,'AI Superpowers','Kai-Fu Lee',8,6,8),(75,'Reinforcement Learning','Richard S. Sutton',8,5,8),(76,'Introduction to AI Robotics','Robin Murphy',8,6,8),(77,'Neural Networks and Deep Learning','Michael Nielsen',8,6,8),(78,'Hands-On Neural Networks','Sudharsan Ravichandiran',8,5,7),(79,'Artificial Intelligence Basics','Tom Taulli',8,6,8),(80,'Speech and Language Processing','Daniel Jurafsky',8,6,8),(81,'Electronic Devices and Circuit Theory','Robert L. Boylestad',9,6,8),(82,'Microelectronic Circuits','Sedra & Smith',9,7,9),(83,'Principles of Electronics','V.K. Mehta',9,6,8),(84,'Digital Electronics','Anand Kumar',9,7,9),(85,'Electronics Fundamentals','Thomas L. Floyd',9,5,8),(86,'Power Electronics','Mohan Ned',9,6,8),(87,'Basic Electrical Engineering','Mittle & Mittal',9,6,8),(88,'Analog and Digital Communication','Simon Haykin',9,5,8),(89,'Electronic Instrumentation','H.S. Kalsi',9,6,8),(90,'Circuit Analysis','Charles K. Alexander',9,7,9),(91,'Cybersecurity and Cyberwar','P.W. Singer',10,6,8),(92,'The Art of Deception','Kevin Mitnick',10,6,8),(93,'Hacking: The Art of Exploitation','Jon Erickson',10,7,9),(94,'Network Security Bible','Eric Cole',10,5,8),(95,'Practical Malware Analysis','Michael Sikorski',10,5,8),(96,'CEH Certified Ethical Hacker','Matt Walker',10,7,9),(97,'Metasploit: The Penetration Tester?s Guide','David Kennedy',10,6,8),(98,'Blue Team Field Manual','Alan White',10,5,8),(99,'Security+ Guide to Network Security','Mark Ciampa',10,7,9),(100,'The Web Application Hacker?s Handbook','Dafydd Stuttard',10,6,8);
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
  `borrow_date` date DEFAULT (curdate()),
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrow_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `borrow_records_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_records`
--

LOCK TABLES `borrow_records` WRITE;
/*!40000 ALTER TABLE `borrow_records` DISABLE KEYS */;
INSERT INTO `borrow_records` VALUES (1,4,1,'2025-08-05','2025-08-20','2025-08-19'),(2,4,12,'2025-09-02','2025-09-17',NULL),(3,4,23,'2025-09-20','2025-10-05',NULL),(4,5,4,'2025-08-07','2025-08-22','2025-08-20'),(5,5,15,'2025-09-03','2025-09-18',NULL),(6,5,30,'2025-09-25','2025-10-10',NULL),(7,6,6,'2025-08-10','2025-08-25','2025-08-23'),(8,6,25,'2025-09-12','2025-09-27',NULL),(9,6,56,'2025-10-02','2025-10-17',NULL),(10,7,9,'2025-08-15','2025-08-30','2025-08-28'),(11,7,33,'2025-09-10','2025-09-25',NULL),(12,7,71,'2025-10-01','2025-10-16',NULL),(13,8,10,'2025-08-12','2025-08-27','2025-08-26'),(14,8,40,'2025-09-08','2025-09-23',NULL),(15,8,84,'2025-10-01','2025-10-16',NULL),(16,9,14,'2025-08-11','2025-08-26','2025-08-25'),(17,9,44,'2025-09-09','2025-09-24',NULL),(18,9,87,'2025-10-04','2025-10-19',NULL),(19,10,17,'2025-08-18','2025-09-02','2025-09-01'),(20,10,52,'2025-09-12','2025-09-27',NULL),(21,10,90,'2025-10-05','2025-10-20',NULL),(22,11,19,'2025-08-14','2025-08-29','2025-08-28'),(23,11,46,'2025-09-10','2025-09-25',NULL),(24,11,93,'2025-10-03','2025-10-18',NULL),(25,12,21,'2025-08-22','2025-09-06','2025-09-04'),(26,12,60,'2025-09-17','2025-10-02',NULL),(27,12,98,'2025-10-09','2025-10-24',NULL),(28,13,24,'2025-08-20','2025-09-04','2025-09-02'),(29,13,65,'2025-09-12','2025-09-27',NULL),(30,13,100,'2025-10-03','2025-10-18',NULL),(31,14,27,'2025-08-25','2025-09-09','2025-09-07'),(32,14,49,'2025-09-15','2025-09-30',NULL),(33,14,81,'2025-10-10','2025-10-25',NULL),(34,15,28,'2025-08-16','2025-08-31','2025-08-30'),(35,15,57,'2025-09-15','2025-09-30',NULL),(36,15,88,'2025-10-12','2025-10-27',NULL),(37,16,31,'2025-08-20','2025-09-04','2025-09-03'),(38,16,63,'2025-09-22','2025-10-07',NULL),(39,16,82,'2025-10-15','2025-10-30',NULL),(40,17,34,'2025-08-10','2025-08-25','2025-08-24'),(41,17,70,'2025-09-20','2025-10-05',NULL),(42,17,91,'2025-10-12','2025-10-27',NULL),(43,18,36,'2025-08-21','2025-09-05','2025-09-04'),(44,18,66,'2025-09-17','2025-10-02',NULL),(45,18,85,'2025-10-08','2025-10-23',NULL),(46,19,37,'2025-08-24','2025-09-08','2025-09-07'),(47,19,73,'2025-09-18','2025-10-03',NULL),(48,19,96,'2025-10-11','2025-10-26',NULL),(49,20,42,'2025-08-26','2025-09-10','2025-09-09'),(50,20,75,'2025-09-20','2025-10-05',NULL),(51,20,99,'2025-10-15','2025-10-30',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (8,'Artificial Intelligence'),(2,'Computer Science'),(10,'Cyber Security'),(4,'Data Science'),(7,'Database Systems'),(9,'Electronics'),(1,'Mathematics'),(6,'Networking'),(3,'Operating Systems'),(5,'Python Programming');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damaged_books`
--

DROP TABLE IF EXISTS `damaged_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damaged_books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `damage_description` text,
  `fine_amount` decimal(10,2) DEFAULT '0.00',
  `reported_date` date DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `user_id` (`user_id`),
  KEY `record_id` (`record_id`),
  CONSTRAINT `damaged_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  CONSTRAINT `damaged_books_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `damaged_books_ibfk_3` FOREIGN KEY (`record_id`) REFERENCES `borrow_records` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damaged_books`
--

LOCK TABLES `damaged_books` WRITE;
/*!40000 ALTER TABLE `damaged_books` DISABLE KEYS */;
INSERT INTO `damaged_books` VALUES (1,3,4,2,'Minor tear on last few pages',25.00,'2025-09-14'),(2,7,5,5,'Coffee stains on front cover',40.00,'2025-09-15'),(3,9,6,8,'Writing and pencil marks throughout pages',30.00,'2025-09-17'),(4,12,7,11,'Water damage on half of the pages',75.00,'2025-09-18'),(5,15,8,13,'Spine partially broken',60.00,'2025-09-19'),(6,18,9,15,'Front cover torn off',90.00,'2025-09-20'),(7,20,10,17,'Loose binding and corner damage',45.00,'2025-09-21'),(8,22,11,19,'Pages scribbled with pen',25.00,'2025-09-22'),(9,24,12,21,'Back cover missing',70.00,'2025-09-23'),(10,27,13,23,'Pages detached from binding',55.00,'2025-09-23'),(11,30,14,25,'Water spill on 10 pages',35.00,'2025-09-24'),(12,32,15,26,'Cover bent and folded edges',20.00,'2025-09-24'),(13,35,16,28,'Torn index page',15.00,'2025-09-25'),(14,38,17,30,'Ink stains on multiple pages',40.00,'2025-09-26'),(15,41,18,33,'Slight page burn on edges',25.00,'2025-09-27'),(16,44,19,35,'Cover worn and faded',20.00,'2025-09-28'),(17,46,20,37,'Binding loosened and pages falling out',80.00,'2025-09-28'),(18,48,9,39,'Front page ripped',30.00,'2025-09-29'),(19,50,10,40,'Spine damage due to mishandling',60.00,'2025-09-29'),(20,53,12,42,'Pen marks on diagrams and margins',25.00,'2025-09-30'),(21,56,14,43,'Cover detached from main binding',75.00,'2025-09-30'),(22,59,15,45,'Severe folding on multiple pages',35.00,'2025-10-01'),(23,62,16,47,'Minor tear and writing on title page',20.00,'2025-10-02');
/*!40000 ALTER TABLE `damaged_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fines`
--

DROP TABLE IF EXISTS `fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `record_id` int NOT NULL,
  `due_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `fine_amount` decimal(10,2) DEFAULT '0.00',
  `status` enum('unpaid','paid') DEFAULT 'unpaid',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `record_id` (`record_id`),
  CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`record_id`) REFERENCES `borrow_records` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fines`
--

LOCK TABLES `fines` WRITE;
/*!40000 ALTER TABLE `fines` DISABLE KEYS */;
INSERT INTO `fines` VALUES (1,5,10,'2025-09-15','2025-09-30',75.00,'unpaid'),(2,6,14,'2025-09-25','2025-10-02',35.00,'unpaid'),(3,7,19,'2025-09-20','2025-09-25',25.00,'unpaid'),(4,8,22,'2025-09-18','2025-09-30',60.00,'paid'),(5,10,27,'2025-09-22','2025-09-30',40.00,'unpaid'),(6,13,31,'2025-09-18','2025-09-22',20.00,'paid'),(7,19,44,'2025-09-25','2025-10-06',55.00,'unpaid');
/*!40000 ALTER TABLE `fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `record_id` int DEFAULT NULL,
  `message` text,
  `sent_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `type` enum('reminder','overdue') DEFAULT 'reminder',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `record_id` (`record_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`record_id`) REFERENCES `borrow_records` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,4,5,'Reminder: Return your borrowed book before due date (Record ID 5).','2025-09-12 10:00:00','reminder'),(2,5,10,'Overdue: Your book (Record ID 10) is overdue by 5 days.','2025-09-20 09:30:00','overdue'),(3,6,14,'Reminder: Return your book (Record ID 14) before 2025-09-25.','2025-09-22 11:00:00','reminder'),(4,6,14,'Overdue: Book (Record ID 14) overdue by 3 days.','2025-09-28 09:45:00','overdue'),(5,7,19,'Reminder: Return your borrowed book soon (Record ID 19).','2025-09-18 10:30:00','reminder'),(6,8,22,'Overdue: Book (Record ID 22) overdue by 2 days.','2025-09-20 13:00:00','overdue'),(7,9,24,'Reminder: Return book (Record ID 24) by 2025-09-27.','2025-09-25 12:15:00','reminder'),(8,10,27,'Overdue: Book (Record ID 27) overdue by 4 days.','2025-09-30 15:10:00','overdue'),(9,11,29,'Reminder: Book (Record ID 29) due soon. Please return before 2025-09-25.','2025-09-23 16:45:00','reminder'),(10,12,30,'Reminder: Return book (Record ID 30) before 2025-09-24.','2025-09-22 14:30:00','reminder'),(11,13,31,'Overdue: Book (Record ID 31) overdue by 2 days.','2025-09-22 09:50:00','overdue'),(12,14,33,'Reminder: Your borrowed book (Record ID 33) is due on 2025-09-26.','2025-09-24 10:20:00','reminder'),(13,15,36,'Overdue: Please return your book (Record ID 36) immediately.','2025-09-29 08:30:00','overdue'),(14,16,37,'Reminder: Return book (Record ID 37) before 2025-09-30.','2025-09-28 12:00:00','reminder'),(15,17,40,'Reminder: Return your borrowed book before 2025-10-02.','2025-09-29 10:10:00','reminder'),(16,18,41,'Reminder: Return book (Record ID 41) soon.','2025-09-30 13:25:00','reminder'),(17,19,44,'Overdue: Book (Record ID 44) overdue by 4 days.','2025-10-04 09:00:00','overdue'),(18,20,47,'Reminder: Book (Record ID 47) due in 2 days.','2025-10-02 11:50:00','reminder');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rajesh Kumar','admin123','admin'),(2,'Anjali Sharma','libpass1','librarian'),(3,'Suresh Patel','libpass2','librarian'),(4,'Priya Singh','user123','user'),(5,'Ravi Desai','user234','user'),(6,'Neha Joshi','user345','user'),(7,'Amit Malhotra','user456','user'),(8,'Sneha Reddy','user567','user'),(9,'Manoj Gupta','user678','user'),(10,'Kavita Nair','user789','user'),(11,'Deepak Mehta','user890','user'),(12,'Rohit Verma','user901','user'),(13,'Simran Kaur','user012','user'),(14,'Aditya Sharma','user013','user'),(15,'Pooja Mishra','user014','user'),(16,'Nikhil Tiwari','user015','user'),(17,'Isha Agarwal','user016','user'),(18,'Ankit Yadav','user017','user'),(19,'Meera Das','user018','user'),(20,'Vivek Bansal','user019','user');
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

-- Dump completed on 2025-11-06 19:00:22
