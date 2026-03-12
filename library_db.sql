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
  `image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'Ma Đạo Tổ Sư','Mặc Hương Đồng Khứu','Công nghệ thông tin',2000,'https://cucdaubu.wordpress.com/wp-content/uploads/2018/02/e68e80e6a18ce295afe280b5e296a1e280b2e295afefb8b5e294bbe29481e294bb.jpg'),(4,'Hẹn Gặp Lại, Quốc Vương Của Tôi','Ôn Viễn','Đam mỹ, Xuyên không',1000,'https://weavocado.wordpress.com/wp-content/uploads/2022/07/biaver2.jpg'),(5,'Thiên Quan Tứ Phúc','Mặc Hương Đồng Khứu','Văn học',1000,'https://i.pinimg.com/736x/e4/fe/8e/e4fe8e71fd77530117dac41f6ef7daa0.jpg'),(6,'Bỏ Chồng','Hồ Biểu Chánh','Văn học trong nước',300,'https://isach.info/images/story/cover/bo_chong__ho_bieu_chanh.jpg'),(7,'Con Nhà Giàu','Hồ Biểu Chánh','Văn học trong nước',300,'https://isach.info/images/story/cover/con_nha_giau__ho_bieu_chanh.jpg'),(8,'Con Chó Của Dòng Họ Baskerville','Arthur Conan Doyle','Văn học nước ngoài',250,'https://isach.info/images/story/cover/con_cho_cua_dong_ho_baskerville__sir_arthur_conan_doyle.jpg'),(10,'Cơm Thầy Cơm Cô','Vũ Trọng Phụng','Văn học trong nước',555,'https://www.sachhayonline.com/themes/tinhte/public/images/book-photos/24.jpg'),(11,'Bướm Trắng','Nhất Linh','Văn học trong nước',900,'https://www.sachhayonline.com/themes/tinhte/public/images/book-photos/12.jpg'),(12,'Bỏ Vợ','Hồ Biểu Chánh','Văn học trong nước',650,'https://dtv-ebook.com.vn/images/files_2/2019/bo-vo-ho-bieu-chanh.jpg'),(13,'Chiếc Nhẫn Tình Cờ','Arthur Conan Doyle','Văn học nước ngoài',1000,'https://dtv-ebook.com.vn/images/truyen-online/ebook-chiec-nhan-tinh-co-prc-pdf-epub.jpg'),(14,'Bức Thư Hối Hận','Hồ Biểu Chánh','Văn học trong nước',300,'https://www.sachhayonline.com/themes/tinhte/public/images/book-photos/42.png'),(15,'Bleach - Sứ Giả Thần Chết','Kubo Tite','Tạp chí / Truyện tranh',150,'https://www.sachhayonline.com/uploads/books/69719fdfe8c67_1769054175.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
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
  `book_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reader_id` (`reader_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `borrow_tickets_ibfk_1` FOREIGN KEY (`reader_id`) REFERENCES `readers` (`id`),
  CONSTRAINT `borrow_tickets_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow_tickets`
--

LOCK TABLES `borrow_tickets` WRITE;
/*!40000 ALTER TABLE `borrow_tickets` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readers`
--

LOCK TABLES `readers` WRITE;
/*!40000 ALTER TABLE `readers` DISABLE KEYS */;
INSERT INTO `readers` VALUES (1,'SV001','Nguyễn Văn Bình','binh@gmail.com','0987654321','2026-03-01');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','Quản trị viên',1),(2,'nhanvien','123','Nguyễn Văn A',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-13  2:06:40
