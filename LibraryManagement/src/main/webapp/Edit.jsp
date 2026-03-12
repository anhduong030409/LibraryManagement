<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Thư Viện Pro - Quản Lý Sách</title>
    <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
</head>

<body id="page-top">
    <div id="wrapper">
        <jsp:include page="sidebar.jsp"></jsp:include>
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <jsp:include page="navbar.jsp"></jsp:include>

	<div class="container-fluid">
	    <h1 class="h3 mb-4 text-gray-800">Chỉnh sửa thông tin sách</h1>
	    <div class="card shadow mb-4">
	        <div class="card-body">
	            <form action="edit" method="post">
	                <input name="id" value="${st.id}" type="hidden">
	                
	                <div class="form-group">
	                    <label>Tên sách</label>
	                    <input name="title" value="${st.title}" type="text" class="form-control" required>
	                </div>
	                <div class="form-group">
	                    <label>Tác giả</label>
	                    <input name="author" value="${st.author}" type="text" class="form-control" required>
	                </div>
	                <div class="form-group">
    <label>Thể loại</label>
    <select name="category" class="form-control" required>
        <option value="" disabled>Chọn thể loại</option>
        
        <optgroup label="Khoa học & Công nghệ">
            <option value="Công nghệ thông tin" ${st.category == 'Công nghệ thông tin' ? 'selected' : ''}>Công nghệ thông tin</option>
            <option value="Khoa học tự nhiên" ${st.category == 'Khoa học tự nhiên' ? 'selected' : ''}>Khoa học tự nhiên</option>
            <option value="Trí tuệ nhân tạo" ${st.category == 'Trí tuệ nhân tạo' ? 'selected' : ''}>Trí tuệ nhân tạo</option>
        </optgroup>
        
        <optgroup label="Kinh tế & Kỹ năng">
            <option value="Kinh tế - Tài chính" ${st.category == 'Kinh tế - Tài chính' ? 'selected' : ''}>Kinh tế - Tài chính</option>
            <option value="Quản trị kinh doanh" ${st.category == 'Quản trị kinh doanh' ? 'selected' : ''}>Quản trị kinh doanh</option>
            <option value="Kỹ năng sống (Self-help)" ${st.category == 'Kỹ năng sống (Self-help)' ? 'selected' : ''}>Kỹ năng sống (Self-help)</option>
        </optgroup>
        
        <optgroup label="Văn hóa - Nghệ thuật">
            <option value="Văn học trong nước" ${st.category == 'Văn học trong nước' ? 'selected' : ''}>Văn học trong nước</option>
            <option value="Văn học nước ngoài" ${st.category == 'Văn học nước ngoài' ? 'selected' : ''}>Văn học nước ngoài</option>
            <option value="Lịch sử - Triết học" ${st.category == 'Lịch sử - Triết học' ? 'selected' : ''}>Lịch sử - Triết học</option>
            <option value="Nghệ thuật - Hội họa" ${st.category == 'Nghệ thuật - Hội họa' ? 'selected' : ''}>Nghệ thuật - Hội họa</option>
        </optgroup>
        
        <optgroup label="Khác">
            <option value="Ngoại ngữ" ${st.category == 'Ngoại ngữ' ? 'selected' : ''}>Ngoại ngữ</option>
            <option value="Tạp chí / Truyện tranh" ${st.category == 'Tạp chí / Truyện tranh' ? 'selected' : ''}>Tạp chí / Truyện tranh</option>
            <option value="Sách giáo khoa" ${st.category == 'Sách giáo khoa' ? 'selected' : ''}>Sách giáo khoa</option>
        </optgroup>
    </select>
</div>
	                <div class="form-group">
	                    <label>Số lượng</label>
	                    <input name="quantity" value="${st.quantity}" type="number" class="form-control" required>
	                </div>
	                <div class="form-group">
					    <label>Link ảnh mới</label>
					    <input name="image" value="${st.image}" type="text" class="form-control">
					</div>
	                
	                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
	                <a href="books" class="btn btn-secondary">Hủy bỏ</a>
	            </form>
	        </div>
	        <jsp:include page="footer.jsp"></jsp:include>
	    </div>
	</div>

    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    
    
</body>
</html>