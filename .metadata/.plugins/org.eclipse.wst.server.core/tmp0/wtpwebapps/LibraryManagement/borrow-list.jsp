<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Thư Viện Pro - Quản Lý Mượn/Trả</title>

    <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>

<body id="page-top">

    <div id="wrapper">
        <jsp:include page="sidebar.jsp"></jsp:include>
        
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <jsp:include page="navbar.jsp"></jsp:include>

                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Quản Lý Mượn/Trả Sách</h1>
                    </div>
                    
                    <div class="mb-4">
                        <a href="#" class="btn btn-primary btn-icon-split">
                            <span class="icon text-white-50"><i class="fas fa-plus"></i></span>
                            <span class="text">Lập phiếu mượn mới</span>
                        </a>
                    </div>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh sách giao dịch mượn/trả</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã Phiếu</th>
                                            <th>Tên Độc Giả</th>
                                            <th>Tên Đầu Sách</th>
                                            <th>Ngày Mượn</th>
                                            <th>Hạn Trả</th>
                                            <th>Trạng Thái</th>
                                            <th>Thao Tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>PM001</td>
                                            <td>Nguyễn Văn Bình</td>
                                            <td>Lập trình Java Web</td>
                                            <td>01/03/2026</td>
                                            <td>15/03/2026</td>
                                            <td><span class="badge badge-warning">Đang mượn</span></td>
                                            <td>
                                                <button class="btn btn-success btn-sm" title="Xác nhận trả sách">Trả sách</button>
                                                <button class="btn btn-info btn-sm" title="Chỉnh sửa phiếu"><i class="fas fa-edit"></i></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>PM002</td>
                                            <td>Trần Thị Dung</td>
                                            <td>Cấu trúc dữ liệu</td>
                                            <td>20/02/2026</td>
                                            <td>05/03/2026</td>
                                            <td><span class="badge badge-success">Đã trả</span></td>
                                            <td>
                                                <span class="badge badge-light">Giao dịch hoàn tất</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>PM003</td>
                                            <td>Lê Văn Cường</td>
                                            <td>Thiết kế Web</td>
                                            <td>10/02/2026</td>
                                            <td>24/02/2026</td>
                                            <td><span class="badge badge-danger">Quá hạn</span></td>
                                            <td>
                                                <button class="btn btn-danger btn-sm" title="Gửi nhắc nhở">Nhắc nhở</button>
                                                <button class="btn btn-success btn-sm">Trả sách</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    
    <script>
        $(document).ready(function() {
            $('#dataTable').DataTable({
                "language": {
                    "sProcessing":   "Đang xử lý...",
                    "sLengthMenu":   "Xem _MENU_ mục",
                    "sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
                    "sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                    "sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
                    "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                    "sSearch":       "Tìm kiếm:",
                    "oPaginate": {
                        "sFirst":    "Đầu",
                        "sPrevious": "Trước",
                        "sNext":     "Tiếp",
                        "sLast":     "Cuối"
                    }
                }
            });
        });
    </script>
</body>
</html>