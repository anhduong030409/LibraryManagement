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

/**
 * Servlet implementation class SearchNavControl
 */
@WebServlet("/search-nav")
public class SearchNavControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchNavControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        
        BookDAO dao = new BookDAO();
        // Lấy danh sách kết quả dựa trên từ khóa
        List<Book> list = dao.searchAll(txtSearch);
        
        if (list.size() == 1) {
            // Nếu chỉ có 1 kết quả duy nhất, chuyển hướng thẳng đến trang chi tiết
            response.sendRedirect("detail?bid=" + list.get(0).getId());
        } else {
            // Nếu có nhiều kết quả hoặc không có kết quả, trả về trang danh sách
            request.setAttribute("listB", list);
            request.setAttribute("txtS", txtSearch);
            request.getRequestDispatcher("books-list.jsp").forward(request, response);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
