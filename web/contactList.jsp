<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Bảng Điều khiển</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />


        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .chart-container {
                position: relative;
                width: 50%;
                height: 50%;
            }
        </style>
        <style>
            body, html {
                height: 100%;
                margin: 0;
                font-family: Arial, sans-serif;
            }

            .container {
                padding: 20px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 20px;
            }

            .col-sm-6, .col-md-3, .col-md-9 {
                padding: 15px;
                box-sizing: border-box;
            }

            .col-md-3 {
                flex: 1;
                min-width: 200px;
            }

            .col-md-9 {
                flex: 1 0 100%;
            }

            .card {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                padding: 20px;
                margin-bottom: 20px;
            }

            .card-header {
                font-size: 1.25em;
                margin-bottom: 15px;
            }

            .chart-container {
                width: 100%;
                height: 400px;
            }

            .card-title {
                font-weight: bold;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            function deleteContact(contactId) {
                Swal.fire({
                    title: 'Bạn có chắc muốn xóa?',
                    text: 'Thao tác này không thể khôi phục!',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Xóa',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Gửi yêu cầu xóa đến server bằng AJAX
                        $.ajax({
                            url: 'staffcontact',
                            type: 'POST',
                            data: {action: 'delete', id: contactId},
                            success: function () {
                                Swal.fire({
                                    title: 'Xóa thành công!',
                                    icon: 'success',
                                    timer: 200000
                                }).then(() => {
                                    // Cập nhật lại giao diện sau khi xóa
                                    location.reload();
                                });
                            },
                            error: function () {
                                Swal.fire('Có lỗi xảy ra!', 'Vui lòng thử lại sau.', 'error');
                            }
                        });
                    }
                })
            }
        </script>


        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />

        <!-- Font Awesome -->



        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <link rel="stylesheet" href="assets/css/fonts.min.css" />
        <link rel="stylesheet" href="assets/css/fonts.css" />
        <link rel="stylesheet" href="assets/css/plugins.css" />
    </head>
    <body >
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar" data-background-color="dark">
                <div class="sidebar-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="index.html" class="logo">
                            <img
                                src="img/logo.png"
                                alt="navbar brand"
                                class="navbar-brand"
                                height="20"
                                />
                        </a>
                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="gg-menu-right"></i>
                            </button>
                            <button class="btn btn-toggle sidenav-toggler">
                                <i class="gg-menu-left"></i>
                            </button>
                        </div>
                        <button class="topbar-toggler more">
                            <i class="gg-more-vertical-alt"></i>
                        </button>
                    </div>
                    <!-- End Logo Header -->
                </div>
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-secondary">
                            <li class="nav-item active">
                                <a href="staff">
                                    <i class="fas fa-tachometer-alt"></i> <!-- Icon cho Dashboard -->
                                    <p>Bảng điều kiển </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="project">
                                    <i class="fas fa-folder"></i> <!-- Icon cho Project -->
                                    <p>Dự án</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="userList">
                                    <i class="fa-solid fa-user"></i> <!-- Icon cho Project -->
                                    <p>Người dùng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="event-manage">
                                    <i class="fa-solid fa-calendar-days"></i> <!-- Icon cho Event -->
                                    <p>Sự kiện</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="CampaignList">
                                    <i class="fa-solid fa-campground"></i> <!-- Icon cho Campaign -->
                                    <p>Chiến dịch</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="organization-manage">
                                    <i class="fa-solid fa-sitemap"></i> <!-- Icon cho Campaign -->
                                    <p>Tổ chức</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="staffcontact">
                                    <i class="fa-solid fa-address-book"></i> <!-- Icon cho Contact -->
                                    <p>Liên hệ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="BlogList">
                                    <i class="fa-solid fa-address-book"></i> <!-- Icon cho Contact -->
                                    <p>Tin tức</p>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="staff" class="logo">
                                <img
                                    src="img/logo.png"
                                    alt="navbar brand"
                                    class="navbar-brand"
                                    height="20"
                                    />
                            </a>
                            <div class="nav-toggle">
                                <button class="btn btn-toggle toggle-sidebar">
                                    <i class="gg-menu-right"></i>
                                </button>
                                <button class="btn btn-toggle sidenav-toggler">
                                    <i class="gg-menu-left"></i>
                                </button>
                            </div>
                            <button class="topbar-toggler more">
                                <i class="gg-more-vertical-alt"></i>
                            </button>
                        </div>
                        <!-- End Logo Header -->
                    </div>
                    <!-- Navbar Header -->
                    <nav
                        class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
                        >
                        <div class="container-fluid">
<!--                            <nav
                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button type="submit" class="btn btn-search pe-1">
                                            <i class="fa-solid fa-magnifying-glass search-icon"></i>
                                        </button>
                                    </div>
                                    <input
                                        type="text"
                                        placeholder="Search ..."
                                        class="form-control"
                                        />
                                </div>

                            </nav>-->

                            <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
<!--                                <li
                                    class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                                    >
                                    <a
                                        class="nav-link dropdown-toggle"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        role="button"
                                        aria-expanded="false"
                                        aria-haspopup="true"
                                        >
                                        <i class="fa fa-search"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-search animated fadeIn">
                                        <form class="navbar-left navbar-form nav-search">
                                            <div class="input-group">
                                                <input
                                                    type="text"
                                                    placeholder="Search ..."
                                                    class="form-control"
                                                    />
                                            </div>
                                        </form>
                                    </ul>
                                </li>-->

                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-bell"></i>
                                        <span class="notification">${notifications.size()}</span>
                                    </a>
                                    <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                                        <li>
                                            <div class="dropdown-title">
                                                You have ${notifications.size()} new notifications
                                            </div>
                                        </li>
                                        <li>
                                            <div class="notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <c:forEach var="notification" items="${notifications}">
                                                        <a href="#">
                                                            <div class="notif-icon notif-primary">
                                                                <i class="fa fa-info-circle"></i>
                                                            </div>
                                                            <div class="notif-content">
                                                                <span class="block">${notification.message}</span>
                                                                <span class="time">${notification.createdAt}</span>
                                                            </div>
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);">See all notifications<i class="fa fa-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </li>


                                <li class="nav-item topbar-user dropdown hidden-caret">
                                    <a
                                        class="dropdown-toggle profile-pic"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        aria-expanded="false"
                                        >
                                        <div class="avatar-sm">
                                            <img
                                                src="${staff.getUser().getImage()}" alt="Staff Avatar"
                                                class="avatar-img rounded-circle"
                                                />
                                        </div>
                                        <span class="profile-username">
                                            <span class="op-7">Chào,</span>
                                            <span class="fw-bold">${staff.getUser().getFullname()}</span>
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                                        <div class="dropdown-user-scroll scrollbar-outer">
                                            <li>
                                                <div class="user-box">
                                                    <div class="avatar-lg">
                                                        <img
                                                            src="${staff.getUser().getImage()}"
                                                            alt="image profile"
                                                            class="avatar-img rounded"
                                                            />
                                                    </div>
                                                    <div class="u-text">
                                                        <h4>${staff.getUser().getFullname()}</h4>
                                                        <p class="text-muted"></p>
                                                        <a
                                                            href="staffProfile.jsp"
                                                            class="btn btn-xs btn-secondary btn-sm"
                                                            >Xem hồ sơ</a
                                                        >
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown-divider"></div>

                                                <a class="dropdown-item" href="changepasswordstaff">Đổi mật khẩu</a>

                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="editStaff">Cài đặt tài khoản</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="logout">Đăng xuất</a>
                                            </li>
                                        </div>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <!-- End Navbar -->
                </div>

                <div class="container" >
                    <div class="page-inner">
                        <div
                            class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
                            >
                            <div>
                                <h3 class="fw-bold mb-3">Bảng điều khiển</h3>
                                <h6 class="op-7 mb-2">Bảng điều khiển nhân viên</h6>
                            </div>

                        </div>
                        <div class="container">
                            <div class="page-inner">
                                <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
                                    <div>
                                        <h3 class="fw-bold mb-3">Bảng điều khiển Liên hệ</h3>
                                        

                                    </div>
                                </div>


                                <form action="staffcontact" method="get" class="d-flex mb-3">
                                    <input type="text" name="searchName" placeholder="Tìm kiếm theo tên" class="form-control me-2" value="${param.searchName}">
                                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                </form>

                                <!-- Row for Transaction History -->
                                <div class="row" >
                                    <div class="col-md-12">
                                        <div class="card card-round">
                                            <h3></h3>
                                            <div class="card-header">
                                                <div class="card-tools">
                                                    <form action="staffcontact" method="get" class="mb-3">
                                                        <select name="status" class="form-control" onchange="this.form.submit()">
                                                            <option value="">Tất cả</option>
                                                            <option value="new" ${param.status == 'new' ? 'selected' : ''}>mới</option>
                                                            <option value="in progress" ${param.status == 'in progress' ? 'selected' : ''}>đang duyệt</option>
                                                            <option value="resolved" ${param.status == 'resolved' ? 'selected' : ''}>từ chối</option>
                                                        </select>
                                                    </form>
                                                </div>
                                            </div>
                                            <div class="card-body p-0">
                                                <div class="table-responsive">
                                                    <table class="table align-items-center mb-0">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th scope="col">ID</th>
                                                                <th scope="col" class="text-end">Tiên </th>
                                                                <th scope="col" class="text-end">Email</th>
                                                                <th scope="col" class="text-end">Chủ đề</th>
                                                                <th scope="col" class="text-end">Trạng thái</th>
                                                                <th scope="col" class="text-end">Tạo ngày </th>
                                                                <th scope="col" class="text-end">Hành động</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:choose>
                                                                <c:when test="${not empty contacts}">
                                                                    <c:forEach var="contact" items="${contacts}">
                                                                        <tr>
                                                                            <td>${contact.contact_id}</td>
                                                                            <td class="text-end">${contact.name}</td>
                                                                            <td class="text-end">${contact.email}</td>
                                                                            <td class="text-end">${contact.subject}</td>
                                                                            <td class="text-end">
                                                                                <span class="badge badge-${contact.status == 'new' ? 'warning' : contact.status == 'in progress' ? 'info' : 'success'}">
                                                                                    ${contact.status}
                                                                                </span>
                                                                            </td>
                                                                            <td class="text-end">${contact.created_at}</td>
                                                                            <td class="text-end">
                                                                                <a href="staffcontact?action=view&id=${contact.contact_id}" class="btn btn-sm btn-info">Xem</a>
                                                                                <c:if test="${contact.status == 'new'}">
                                                                                    <a href="staffcontact?action=assign&id=${contact.contact_id}" class="btn btn-sm btn-primary">Giao cho tôi</a>
                                                                                </c:if>
                                                                                <button href="staffcontact?action=delete&id=${contact.contact_id}" onclick="deleteContact(${contact.contact_id})" class="btn btn-sm btn-danger">Xóa</button>
                                                                                <!--                                                                                    <button onclick="deleteContact(20)">Delete Contact</button>-->
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <tr>
                                                                        <td colspan="7" class="text-center">Không tìm thấy địa chỉ liên hệ nào</td>
                                                                    </tr>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </tbody>
                                                        <c:if test="${totalPages > 1}">
                                                            <nav aria-label="Page navigation">
                                                                <ul class="pagination justify-content-center">
                                                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                                                            <a class="page-link" href="staffcontact?page=${i}">${i}</a>
                                                                        </li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </nav>
                                                        </c:if>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <footer class="footer">
                <div class="container-fluid d-flex justify-content-between">
                    <nav class="pull-left">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" href="http://www.themekita.com">
                                    Team4
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"> Hỗ trợ </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"> Giấy phép </a>
                            </li>
                        </ul>
                    </nav>
                    <div class="copyright">
                        2024, tạo <i class="fa fa-heart heart text-danger"></i> bởi
                        <a href="http://www.themekita.com">Team4</a>
                    </div>
                    
                </div>
            </footer>
        </div>


    </div>
    <!--   Core JS Files   -->
    <script src="assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="assets/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="assets/js/plugin/jsvectormap/world.js"></script>

    <!-- Sweet Alert -->
    <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="assets/js/kaiadmin.min.js"></script>
    <script>

    </script>


</body>
</html>
