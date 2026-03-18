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

@WebServlet("/edit")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class EditControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            // 1. Lấy dữ liệu an toàn
            String id = getValue(request.getPart("id"));
            String title = getValue(request.getPart("title"));
            String author = getValue(request.getPart("author"));
            String category = getValue(request.getPart("category"));
            String quantityStr = getValue(request.getPart("quantity"));
            String imageUrl = getValue(request.getPart("image_url"));

            // 2. Xử lý ảnh
            Part filePart = request.getPart("image_file");
            String fileName = (filePart != null) ? filePart.getSubmittedFileName() : "";
            String finalImagePath = "";

            if (fileName != null && !fileName.isEmpty()) {
                String appPath = request.getServletContext().getRealPath("");
                String uploadPath = appPath + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                filePart.write(uploadPath + File.separator + fileName);
                finalImagePath = "uploads/" + fileName;
            } else {
                finalImagePath = imageUrl; // Giữ link cũ hoặc link mới dán vào
            }

            // 3. Thực hiện update
            int quantity = 0;
            if(quantityStr != null) quantity = Integer.parseInt(quantityStr);
            
            BookDAO dao = new BookDAO();
            // CHÚ Ý THỨ TỰ TRUYỀN VÀO ĐỂ KHỚP VỚI DAO CỦA BẠN
            dao.updateBook(id, title, author, category, quantity, finalImagePath);

        } catch (Exception e) {
            e.printStackTrace(); // Xem lỗi đỏ ở console nếu vẫn không lưu được
        }
        
        response.sendRedirect("books");
    }

    private String getValue(Part part) throws IOException {
        if (part == null) return null;
        try (java.io.BufferedReader reader = new java.io.BufferedReader(
                new java.io.InputStreamReader(part.getInputStream(), "UTF-8"))) {
            StringBuilder value = new StringBuilder();
            char[] buffer = new char[1024];
            int length;
            while ((length = reader.read(buffer)) != -1) {
                value.append(buffer, 0, length);
            }
            return value.toString().trim();
        }
    }
}