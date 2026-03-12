-- 1. Tạo Database mới
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;

-- 2. Bảng tài khoản Admin (Để đăng nhập vào hệ thống quản lý)
CREATE TABLE IF NOT EXISTS admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    fullname VARCHAR(100)
);

-- Bước A: Xóa bảng cũ (nếu có) để cập nhật cấu trúc mới nhất
DROP TABLE IF EXISTS admins;
-- Xóa bảng cũ nếu đã tạo để làm lại cho sạch
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    fullname NVARCHAR(100),
    role INT DEFAULT 0 -- 1 là Quản lý (Admin), 0 là Nhân viên
);

-- Thêm tài khoản Admin để bạn đăng nhập được ngay
INSERT INTO users (username, password, fullname, role) 
VALUES ('admin', '123', 'Quản trị viên', 1);

-- Thêm tài khoản nhân viên để test thử
INSERT INTO users (username, password, fullname, role) 
VALUES ('nhanvien', '123', 'Nguyễn Văn A', 0);

-- 3. Bảng Sách
CREATE TABLE IF NOT EXISTS books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    category VARCHAR(100),
    quantity INT DEFAULT 0
);

-- 4. Bảng Độc giả (Sinh viên)
CREATE TABLE IF NOT EXISTS readers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(20) NOT NULL UNIQUE,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    join_date DATE
);

-- 5. Bảng Phiếu mượn (Kết nối Sách và Độc giả)
CREATE TABLE IF NOT EXISTS borrow_tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reader_id INT,
    book_id INT,
    borrow_date DATE,
    due_date DATE,
    status VARCHAR(50), -- 'Đang mượn', 'Đã trả', 'Quá hạn'
    FOREIGN KEY (reader_id) REFERENCES readers(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- 6. Thêm dữ liệu mẫu để test
INSERT INTO admins (username, password, fullname) VALUES ('admin', '123456', 'Quản trị viên');
INSERT INTO books (title, author, category, quantity) VALUES ('Lập trình Java Web', 'Nguyễn Văn A', 'Công nghệ', 15);
INSERT INTO readers (student_id, fullname, email, phone, join_date) VALUES ('SV001', 'Nguyễn Văn Bình', 'binh@gmail.com', '0987654321', '2026-03-01');

ALTER TABLE `books` ADD COLUMN `image` VARCHAR(500) NULL;
UPDATE `books` SET `image` = 'https://cucdaubu.wordpress.com/wp-content/uploads/2018/02/e68e80e6a18ce295afe280b5e296a1e280b2e295afefb8b5e294bbe29481e294bb.jpg' WHERE id = 3;

SELECT * FROM users;