package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;

/**
 * Servlet implementation class AddControl
 */
@WebServlet(name = "AddControl", urlPatterns = {"/add"}) // Phải có dấu gạch chéo /
public class AddControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8"); // Để không bị lỗi font tiếng Việt

	    // 1. Lấy dữ liệu từ các ô Input của Form
	    String title = request.getParameter("title");
	    String author = request.getParameter("author");
	    String category = request.getParameter("category");
	    String quantity = request.getParameter("quantity");
	    String image = request.getParameter("image");

	    // 2. Gọi DAO để chèn vào Database
	    BookDAO dao = new BookDAO();
	    dao.insertBook(title, author, category, Integer.parseInt(quantity), image);

	    // 3. Thêm xong thì quay về trang danh sách sách
	    response.sendRedirect("books"); 
	}

}
