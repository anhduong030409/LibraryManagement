package control;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.BookDAO;

/**
 * Servlet implementation class AddControl
 */
@WebServlet(name = "AddControl", urlPatterns = {"/add"}) // Phải có dấu gạch chéo /
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50   // 50MB
	)
public class AddControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");

	    // Khi dùng Multipart, phải lấy dữ liệu text thông qua Helper Method hoặc getPart
	    // Dưới đây là cách lấy dữ liệu text an toàn nhất:
	    String title = getValue(request.getPart("title"));
	    String author = getValue(request.getPart("author"));
	    String category = getValue(request.getPart("category"));
	    String quantityStr = getValue(request.getPart("quantity"));
	    String imageUrl = getValue(request.getPart("image_url")); // Lấy từ input dán link

	    // Xử lý lấy file ảnh từ máy
	    Part filePart = request.getPart("image_file"); 
	    String fileName = filePart.getSubmittedFileName();
	    String savePath = "";

	    if (fileName != null && !fileName.isEmpty()) {
	        // Xác định thư mục lưu trữ (Sử dụng đường dẫn tương đối để dễ hiển thị)
	        String appPath = request.getServletContext().getRealPath("");
	        String uploadFilePath = appPath + File.separator + "uploads";
	        
	        File uploadDir = new File(uploadFilePath);
	        if (!uploadDir.exists()) uploadDir.mkdirs();

	        filePart.write(uploadFilePath + File.separator + fileName);
	        savePath = "uploads/" + fileName; 
	    } else {
	        // Nếu không có file tải lên, sử dụng link URL người dùng dán vào
	        savePath = imageUrl;
	    }

	    // Kiểm tra và parse số lượng
	    int quantity = 1;
	    try {
	        quantity = Integer.parseInt(quantityStr);
	    } catch (Exception e) {}

	    // GỌI DAO: Truyền savePath (đường dẫn ảnh cuối cùng) vào đây
	    BookDAO dao = new BookDAO();
	    dao.insertBook(title, author, category, quantity, savePath);

	    response.sendRedirect("books"); 
	}

	// Hàm phụ trợ để đọc giá trị từ Part (Dùng cho Multipart form)
	private String getValue(Part part) throws IOException {
	    if (part == null) return null;
	    java.io.BufferedReader reader = new java.io.BufferedReader(new java.io.InputStreamReader(part.getInputStream(), "UTF-8"));
	    StringBuilder value = new StringBuilder();
	    char[] buffer = new char[1024];
	    int length;
	    while ((length = reader.read(buffer)) != -1) {
	        value.append(buffer, 0, length);
	    }
	    return value.toString().trim();
	}

}
