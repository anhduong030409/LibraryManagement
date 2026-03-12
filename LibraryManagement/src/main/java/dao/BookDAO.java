package dao;

import context.DBContext;
import entity.Book;
import entity.User;

import java.sql.*;
import java.util.*;

public class BookDAO {
    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        String query = "SELECT * FROM books";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Giả sử bảng books có 5 cột: id, title, author, category, quantity, image
                list.add(new Book(rs.getInt(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
    //xóa
    public void deleteBook(String id) {
        String query = "DELETE FROM books WHERE id = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {}
    }
    
    //thêm
    public void insertBook(String title, String author, String category, int quantity, String image) {
        String query = "INSERT INTO books (title, author, category, quantity, image) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection conn = new DBContext().getConnection(); // Kết nối DB
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setString(3, category);
            ps.setInt(4, quantity);
            ps.setString(5, image); // Thêm link ảnh
            ps.executeUpdate(); // Thực thi lệnh insert
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //sửa
	 // 1. Lấy thông tin 1 cuốn sách dựa vào ID
	    public Book getBookByID(String id) {
	        String query = "select * from books where id = ?";
	        try {
	            Connection conn = new DBContext().getConnection();
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, id);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                return new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6));
	            }
	        } catch (Exception e) {}
	        return null;
	    }
	
	    // 2. Cập nhật thông tin sách
	    public void updateBook(String id, String title, String author, String category, int quantity, String image) {
	        // Câu lệnh SQL phải có 'image = ?'
	        String query = "UPDATE books SET title = ?, author = ?, category = ?, quantity = ?, image = ? WHERE id = ?";
	        try {
	            Connection conn = new DBContext().getConnection();
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, title);
	            ps.setString(2, author);
	            ps.setString(3, category);
	            ps.setInt(4, quantity);
	            ps.setString(5, image); // Đây là link ảnh mới
	            ps.setString(6, id);
	            
	            ps.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    public List<Book> searchAll(String txtSearch) {
	        List<Book> list = new ArrayList<>();
	        String query = "SELECT * FROM books WHERE LOWER(title) LIKE ? OR LOWER(author) LIKE ?";
	        try {
	            Connection conn = new DBContext().getConnection();
	            PreparedStatement ps = conn.prepareStatement(query);
	            String searchPattern = "%" + txtSearch.toLowerCase() + "%";
	            ps.setString(1, searchPattern);
	            ps.setString(2, searchPattern);
	            
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                // Nhớ lấy đủ 6 tham số bao gồm cả cột image (rs.getString(6))
	                list.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), 
	                                  rs.getString(4), rs.getInt(5), rs.getString(6)));
	            }
	        } catch (Exception e) {}
	        return list;
	    }
	    
	    public User login(String user, String pass) {
	        // Câu lệnh SQL truy vấn vào bảng users mới tạo
	        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
	        try {
	            Connection conn = new DBContext().getConnection(); // Kết nối DB
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, user);
	            ps.setString(2, pass);
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                return new User(rs.getInt(1), 
	                                rs.getString(2), 
	                                rs.getString(3), 
	                                rs.getNString(4), // Lấy fullname tiếng Việt
	                                rs.getInt(5));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null; // Trả về null nếu không tìm thấy tài khoản khớp
	    }
	    
	    
	    
}