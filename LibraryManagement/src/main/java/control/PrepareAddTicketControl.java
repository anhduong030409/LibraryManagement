package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import entity.Book;
import entity.Reader;

/**
 * Servlet implementation class PrepareAddTicketControl
 */
@WebServlet("/prepareAddTicket")
public class PrepareAddTicketControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        BookDAO dao = new BookDAO();
        
        // Gọi 2 hàm mới đổi tên
        List<Reader> listR = dao.getListReaderForBorrow();
        List<Book> listB = dao.getListBookForBorrow();
        
        // Đẩy dữ liệu sang JSP
        request.setAttribute("listR", listR);
        request.setAttribute("listB", listB);
        request.getRequestDispatcher("add-ticket.jsp").forward(request, response);
    }
}