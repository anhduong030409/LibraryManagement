package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    public Connection getConnection() throws Exception {
        // Lưu ý: library_db là tên database bạn tạo trong SQL Workbench
        String url = "jdbc:mysql://localhost:3306/library_db";
        String user = "root";
        String pass = "123456"; // ĐIỀN MẬT KHẨU MYSQL CỦA BẠN VÀO ĐÂY
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }
}