-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
  `author` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `image` varchar(500) DEFAULT 'https://via.placeholder.com/150',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,'Thiên Quan Tứ Phúc','Mặc Hương Đồng Khứu','Văn học nước ngoài',603,'https://i.pinimg.com/736x/e4/fe/8e/e4fe8e71fd77530117dac41f6ef7daa0.jpg'),(3,'Hẹn Gặp Lại Quốc Vương Của Tôi','Ôn Viễn','Văn học nước ngoài',500,'https://i.pinimg.com/1200x/70/22/98/70229841255c1b835847269644a02953.jpg'),(4,'Ma Đạo Tổ Sư','Mặc Hương Đồng Khứu','Văn học nước ngoài',555,'https://i.pinimg.com/1200x/0a/42/0a/0a420ac124a4ed9f95a1ed7bcacea8b9.jpg'),(5,'Hệ Thống Tự Cứu Của Nhân Vật Phản Diện','Mặc Hương Đồng Khứu','Văn học nước ngoài',451,'https://i.pinimg.com/736x/81/53/6f/81536f4e6f0f5ac7d0f002e614c45e42.jpg'),(6,'Mắt Biếc','Nguyễn Nhật Ánh','Văn học trong nước',999,'https://i.pinimg.com/736x/d3/8f/97/d38f978462ada4023930f636237478b4.jpg'),(7,'Tôi Thấy Hoa Vàng Trên Cỏ Xanh','Nguyễn Nhật Ánh','Văn học trong nước',1001,'https://i.pinimg.com/736x/d5/56/6b/d5566bfadc45d5773f71ea3137cf339f.jpg'),(8,'Làm Bạn Với Bầu Trời','Nguyễn Nhật Ánh','Văn học trong nước',1000,'https://i.pinimg.com/1200x/93/e6/e3/93e6e340246aa66a325c7e4a57fb8833.jpg'),(9,'Cho Tôi Xin Một Vé Đi Tuổi Thơ','Nguyễn Nhật Ánh','Văn học trong nước',889,'https://i.pinimg.com/736x/ad/30/7a/ad307a39d84529821615c349db6bc45d.jpg'),(10,'Ngồi Khóc Trên Cây','Nguyễn Nhật Ánh','Văn học trong nước',1112,'https://i.pinimg.com/1200x/15/8b/39/158b39e69cce1aab282c5a293cb0a837.jpg'),(12,'Trại Hoa Vàng','Nguyễn Nhật Ánh','Văn học trong nước',100,'https://i.pinimg.com/1200x/e7/1e/99/e71e992356e8043a50afb287f971337a.jpg'),(13,'Hoàng Tử Bé','Saint Exupéry','Văn học nước ngoài',2000,'https://i.pinimg.com/736x/f7/bf/18/f7bf18dd18926c42387309c4c3cf7292.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_details`
--

DROP TABLE IF EXISTS `borrow_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrow_details_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `borrow_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `borrow_details_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_details`
--

LOCK TABLES `borrow_details` WRITE;
/*!40000 ALTER TABLE `borrow_details` DISABLE KEYS */;
INSERT INTO `borrow_details` VALUES (1,17,2),(3,1,2),(4,1,3),(5,2,3);
/*!40000 ALTER TABLE `borrow_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow_tickets`
--

DROP TABLE IF EXISTS `borrow_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow_tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Đang mượn',
  PRIMARY KEY (`id`),
  KEY `reader_id` (`reader_id`),
  CONSTRAINT `borrow_tickets_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_tickets`
--

LOCK TABLES `borrow_tickets` WRITE;
/*!40000 ALTER TABLE `borrow_tickets` DISABLE KEYS */;
INSERT INTO `borrow_tickets` VALUES (1,2,'2026-03-18','2026-03-19','Đã trả'),(2,3,'2026-03-18','2026-03-19','Đang mượn');
/*!40000 ALTER TABLE `borrow_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readers`
--

DROP TABLE IF EXISTS `readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (2,'25810012','Dương Nhật Ánh Dương','25810012@student.hcmute.edu.vn','0904688126','2026-03-16'),(3,'25810020','Vũ Huy Hoàng','25810020@student.hcmute.edu.vn','0936284999','2026-03-04'),(4,'25810009','Trần Thanh Danh','25810009@student.hcmute.edu.vn','0393846284','2026-02-09'),(5,'25810013','Hồ Viết Triều Dương','25810013@student.hcmute.edu.vn','0976194650','2026-01-31'),(6,'25810014','Hồ Ngũ Đạt','25810014@student.hcmute.edu.vn','0939735461','2026-03-04'),(7,'25610029','Hồ Huyền Mỹ Duyên','25610029@student.hcmute.edu.vn','0937284924','2026-03-02');
/*!40000 ALTER TABLE `readers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','Quản trị viên',1);
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

-- Dump completed on 2026-03-18 19:27:40
