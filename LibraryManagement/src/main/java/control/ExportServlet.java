package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;

/**
 * Servlet implementation class ExportServlet
 */
@WebServlet("/export")
public class ExportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    
	    // XÓA DẤU LẠ: Reset buffer để loại bỏ bất kỳ ký tự rác nào phát sinh trước đó
	    response.resetBuffer();
	    
	    response.setContentType("application/vnd.ms-excel");
	    response.setCharacterEncoding("UTF-8");
	    response.setHeader("Content-Disposition", "attachment; filename=bao_cao_tong_hop.xls");

	    PrintWriter writer = response.getWriter();
	    BookDAO dao = new BookDAO();

	    writer.println("<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>");
	    writer.println("<head><meta charset='UTF-8'></head><body>");

	    // --- PHẦN 1: BÁO CÁO MƯỢN TRẢ ---
	    writer.println("<h3>DANH SÁCH MƯỢN TRẢ</h3>");
	    writer.println("<table border='1'><tr style='background-color: #f2f2f2; font-weight: bold;'>");
	    writer.println("<th>Tên độc giả</th><th>Danh sách sách</th><th>Ngày mượn</th><th>Hạn trả</th><th>Trạng thái</th></tr>");
	    
	    List<String[]> borrowData = dao.getReportData();
	    for (String[] row : borrowData) {
	        writer.println("<tr>");
	        for (int i = 0; i < row.length; i++) {
	            String cellData = (row[i] != null) ? row[i].trim() : "";
	            if (i == 1) { // Xuống dòng cho danh sách sách
	                cellData = cellData.replace("; ", "<br style='mso-data-placement:same-cell;'>").replace(";", "br style='mso-data-placement:same-cell;");
	            }
	            writer.print("<td style='vertical-align: top;'>" + cellData + "</td>");
	        }
	        writer.println("</tr>");
	    }
	    writer.println("</table><br>");

	    // --- PHẦN 2: DANH SÁCH TẤT CẢ SÁCH ---
	    writer.println("<h3>DANH SÁCH KHO SÁCH</h3>");
	    writer.println("<table border='1'><tr style='background-color: #d1ecf1; font-weight: bold;'>");
	    writer.println("<th>Mã sách</th><th>Tên sách</th><th>Tác giả</th><th>Thể loại</th><th>Số lượng</th></tr>");
	    
	    for (String[] row : dao.getAllBooksForReport()) {
	        writer.println("<tr>");
	        for (String cell : row) writer.print("<td>" + (cell != null ? cell.trim() : "") + "</td>");
	        writer.println("</tr>");
	    }
	    writer.println("</table><br>");

	    // --- PHẦN 3: DANH SÁCH ĐỘC GIẢ ---
	    writer.println("<h3>DANH SÁCH ĐỘC GIẢ</h3>");
	    writer.println("<table border='1'><tr style='background-color: #d4edda; font-weight: bold;'>");
	    writer.println("<th>Mã ĐG</th><th>Họ tên</th><th>Số điện thoại</th><th>Email</th></tr>");
	    
	    for (String[] row : dao.getAllReadersForReport()) {
	        writer.println("<tr>");
	        for (String cell : row) writer.print("<td>" + (cell != null ? cell.trim() : "") + "</td>");
	        writer.println("</tr>");
	    }
	    writer.println("</table>");

	    writer.println("</body></html>");
	}

}
