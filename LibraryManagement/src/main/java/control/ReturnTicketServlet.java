package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BookDAO;

@WebServlet(name = "ReturnTicketServlet", urlPatterns = {"/returnTicket"})
public class ReturnTicketServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Lấy ID của phiếu mượn cần trả
        String tid = request.getParameter("tid");
        
        // 2. Gọi DAO thực hiện trả sách
        BookDAO dao = new BookDAO();
        dao.returnTicket(tid);
        
        // 3. Quay lại trang quản lý phiếu mượn
        response.sendRedirect("borrow"); 
        // Lưu ý: "manageBorrow" phải là urlPattern của Servlet hiển thị file borrow-list.jsp
    }
}