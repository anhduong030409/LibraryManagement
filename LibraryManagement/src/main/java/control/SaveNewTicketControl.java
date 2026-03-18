package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;

/**
 * Servlet implementation class SaveNewTicketControl
 */
@WebServlet("/saveNewTicket")
public class SaveNewTicketControl extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Lấy dữ liệu từ Form
        int rid = Integer.parseInt(request.getParameter("rid"));
        String[] bids = request.getParameterValues("bid"); // Lấy danh sách ID sách đã chọn
        String bdate = request.getParameter("bdate");
        String ddate = request.getParameter("ddate");

        BookDAO dao = new BookDAO();
        dao.insertMultipleBorrow(rid, bids, bdate, ddate);
        
        // Quay về trang danh sách phiếu mượn
        response.sendRedirect("borrow");
    }
}