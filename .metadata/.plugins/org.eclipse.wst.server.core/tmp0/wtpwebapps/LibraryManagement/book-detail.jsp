<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi tiết sách - ${book.title}</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="sidebar.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<jsp:include page="navbar.jsp"></jsp:include>

				<div class="container-fluid">
					<div class="card shadow-lg border-0 rounded-lg">
						<div class="container-fluid">
							<div class="mb-4">
								<a href="books" class="btn btn-sm btn-light shadow-sm border">
									<i class="fas fa-arrow-left mr-1"></i> Quay lại danh sách
								</a>
							</div>

							<div class="card shadow-lg border-0 rounded-lg">
								<div class="row no-gutters">
									<div
										class="col-md-4 bg-light d-flex align-items-center justify-content-center p-5">
										<div class="book-cover-wrapper shadow">
											<img src="${book.image}" class="img-fluid rounded shadow-lg"
												alt="${book.title}"
												style="width: 100%; max-height: 500px; object-fit: contain;">
										</div>
									</div>

									<div class="col-md-8">
										<div class="card-body p-5">
											<div class="mb-2">
												<span class="badge badge-pill badge-primary px-3 py-2">${book.category}</span>
												<span class="text-muted small ml-2">Mã sách:
													#00${book.id}</span>
											</div>

											<h1 class="display-4 font-weight-bold text-gray-900 mb-3">${book.title}</h1>

											<h5 class="text-primary mb-4">
												<i class="fas fa-user-nib mr-2"></i>Tác giả: <span
													class="text-dark">${book.author}</span>
											</h5>

											<div class="row mb-4">
												<div class="col-6 col-md-4">
													<div class="p-3 border rounded bg-light">
														<small class="text-uppercase text-muted d-block">Trạng
															thái</small> <span
															class="font-weight-bold ${book.quantity > 0 ? 'text-success' : 'text-danger'}">
															${book.quantity > 0 ? 'Còn sách' : 'Hết sách'} </span>
													</div>
												</div>
												<div class="col-6 col-md-4">
													<div class="p-3 border rounded bg-light">
														<small class="text-uppercase text-muted d-block">Số
															lượng kho</small> <span class="font-weight-bold text-dark">${book.quantity}
															cuốn</span>
													</div>
												</div>
											</div>

											<h5 class="font-weight-bold">Tóm tắt nội dung:</h5>
											<p class="text-secondary leading-relaxed">
												Cuốn sách <strong>"${book.title}"</strong> của tác giả <strong>${book.author}</strong>
												là một trong những tác phẩm tiêu biểu thuộc thể loại <strong>${book.category}</strong>.
												Nội dung mang đến những kiến thức sâu sắc và giá trị, phù
												hợp cho mọi độc giả muốn khám phá và nâng cao vốn hiểu biết
												của mình trong lĩnh vực này.
											</p>

											<hr class="my-4">

											<div class="d-flex align-items-center">
												<a href="borrow?bid=${book.id}"
													class="btn btn-primary btn-lg px-5 shadow mr-3 ${book.quantity == 0 ? 'disabled' : ''}">
													<i class="fas fa-shopping-cart mr-2"></i>Đăng ký mượn
												</a> <a href="loadBook?bid=${book.id}"
													class="btn btn-outline-info btn-lg"> <i
													class="fas fa-edit"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<style>
.book-cover-wrapper {
	transition: transform 0.3s ease;
}

.book-cover-wrapper:hover {
	transform: scale(1.05);
}

.leading-relaxed {
	line-height: 1.8;
}
</style>
					</div>
				</div>

			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>