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
import entity.BorrowTicket;
import entity.Reader;

/**
 * Servlet implementation class BorrowControl
 */
@WebServlet(name = "BorrowControl", urlPatterns = {"/borrow"})
public class BorrowControl extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    BookDAO dao = new BookDAO();
	    
	    // Lấy ID sách từ nút "Đăng ký mượn" bên trang chi tiết truyền sang
	    String selectedBid = request.getParameter("bid"); 
	    
	    List<BorrowTicket> listB = dao.getAllBorrowTickets();
	    List<Reader> listR = dao.getListReaderForBorrow();
	    List<Book> listBooks = dao.getListBookForBorrow();
	    
	    request.setAttribute("listB", listB);
	    request.setAttribute("listR", listR);
	    request.setAttribute("listBooks", listBooks);
	    
	    // Gửi ID sách xuống JSP để đánh dấu 'selected'
	    request.setAttribute("selectedBid", selectedBid); 

	    request.getRequestDispatcher("borrow-list.jsp").forward(request, response);
	}
}