package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;

/**
 * Servlet implementation class DeleteReaderControl
 */
@WebServlet(name = "DeleteReaderControl", urlPatterns = {"/deleteReader"})
public class DeleteReaderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReaderControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Lấy student_id từ request
        String sid = request.getParameter("sid");

        // 2. Gọi DAO để xóa
        BookDAO dao = new BookDAO();
        dao.deleteReader(sid);

        // 3. Xóa xong thì quay lại trang danh sách (Servlet /readers)
        response.sendRedirect("readers");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
