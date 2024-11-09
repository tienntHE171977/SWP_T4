<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Charifit</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- <link rel="manifest" href="site.webmanifest"> -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!--        <link rel="stylesheet" href="css/themify-icons.css">-->
        <link rel="stylesheet" href="css/nice-select.css">
        <!--        <link rel="stylesheet" href="css/flaticon.css">-->
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
    </head>
    <style>
        .user_notification {
            display: flex; /* Sử dụng flexbox để căn chỉnh theo hàng */
            align-items: center; /* Căn giữa theo chiều dọc */
            margin-left: 15px; /* Khoảng cách bên trái giữa các biểu tượng */
        }

        .notification-icon {
            display: flex; /* Căn giữa biểu tượng thông báo */
            align-items: center; /* Căn giữa theo chiều dọc */
            margin-right: 10px; /* Khoảng cách giữa biểu tượng thông báo và hình đại diện */
            font-size: 28px; /* Kích thước lớn cho biểu tượng thông báo */
            margin-right: 20px;
            color: white
        }

        .user-icon {
            display: flex; /* Căn giữa hình ảnh */
            align-items: center; /* Căn giữa theo chiều dọc */
        }

        .user-avatar {
            width: 40px; /* Chiều rộng hình ảnh */
            height: 40px; /* Chiều cao hình ảnh */
            border-radius: 50%; /* Bo góc thành hình tròn */
            object-fit: cover; /* Đảm bảo hình ảnh không bị méo */
        }

        /* Đảm bảo không có thuộc tính display: none; cho phần tử khi ở chế độ di động */
        .d-lg-none {
            display: none; /* Chỉ ẩn cho màn hình lớn */
        }

        @media (max-width: 767px) {
            .user_notification {
                display: flex; /* Đảm bảo hiển thị khi ở chế độ di động */
            }
        }
        /* Ẩn dropdown mặc định */
        /* Ẩn dropdown mặc định */
        .notification-dropdown {
            display: none;
            position: absolute;
            top: 40px; /* Điều chỉnh theo vị trí của biểu tượng */
            right: 0;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 400px;
        }
        .user-dropdown {
            display: none;
            position: absolute;
            top: 40px; /* Điều chỉnh theo vị trí của biểu tượng */
            right: 0;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 200px;
        }

        /* Danh sách dropdown */
        .notification-dropdown ul,
        .user-dropdown ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .notification-dropdown ul li,
        .user-dropdown ul li {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        .notification-dropdown ul li:last-child,
        .user-dropdown ul li:last-child {
            border-bottom: none;
        }

        .notification-dropdown ul li a,
        .user-dropdown ul li a {
            text-decoration: none;
            color: #333;
            display: block;
        }

        .notification-dropdown ul li a:hover,
        .user-dropdown ul li a:hover {
            background-color: #f1f1f1;
        }

        /* Hiển thị dropdown */
        .show-dropdown {
            display: block;
        }
        .campaign-container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }
        .campaign-header {
            text-align: center;
            margin-bottom: 50px;
            color: black;
            font-size: 24px;
            font-weight: normal;
            text-decoration: underline;
        }
        .campaign-section {
            text-align: center;
            width: 30%;
        }
        .campaign-section i {
            margin-top: 50px;
            font-size: 80px;
            color: #3cc78f;
            margin-bottom: 20px;
        }
        .campaign-section h3 {
            color: #333;
            font-size: 20px;
            margin-bottom: 15px;
        }
        .campaign-section p {
            color: #666;
            line-height: 1.5;
        }
        .campaign-btn {
            background-color: #3cc78f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 50px;
        }
        /*        .campaign-btn:hover {
                    background-color: #666;
                }*/
        .search-bar {
            display: flex;
        }

        .btn-search {
            background-color: transparent; /* Nền trong suốt */
            border: none; /* Không có đường viền */
            outline: none; /* Không có viền khi nhấn */
            cursor: pointer; /* Con trỏ khi di chuột qua */
        }

        .btn-search i {
            color: #000; /* Màu sắc của biểu tượng */
            font-size: 18px; /* Kích thước biểu tượng */
        }
        .custom_causes_active {
            display: flex; /* Sử dụng flexbox để căn giữa */
            justify-content: flex-start; /* Căn trái cho các thẻ */
            overflow: hidden; /* Ẩn phần thừa ra ngoài */
        }

        .single_cause {
            width: 90%; /* Mỗi thẻ chiếm 1/3 chiều rộng của hàng */
            box-sizing: border-box; /* Để tính toán chiều rộng chính xác */
            transition: transform 0.3s ease; /* Thêm hiệu ứng chuyển động */
        }

        /* Căn chỉnh cho màn hình nhỏ */
        @media (max-width: 768px) {
            .single_cause {
                width: 100%; /* Hiển thị 1 thẻ cho màn hình nhỏ */
            }
        }

        @media (min-width: 769px) and (max-width: 1024px) {
            .single_cause {
                width: 50%; /* Hiển thị 2 thẻ cho màn hình trung bình */
            }
        }
        .filter-bar {
            justify-content: flex-start;
            display: flex;
            gap: 10px;
            margin-top: 50px;
            margin-bottom: -30px;

            padding: 10px;
            background-color: #f3fcf8;
            border-radius: 20px;
            overflow-x: auto;
        }

        .filter-select {
            padding: 5px 15px;
            margin-left: 200px;
            border: none;
            background-color: #fff;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .crtprj-btn {
            padding: 5px 15px;
            margin-left: 50px;
            border: none;
            background-color: #3cc78f;
            border-radius: 20px;
            color: black;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .filter-button.active {
            background-color: #3cc78f;
            color: #000;
        }

        .filter-button:hover {
            background-color: #f0f0f0;
        }

        .single-line-limit {
            width: 250px; /* Độ rộng tối đa của dòng */
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .Content-news {
            overflow: hidden;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 7; /* Số dòng bạn muốn giới hạn */
            line-clamp: 7; /* Số dòng bạn muốn giới hạn, cho các trình duyệt hỗ trợ */
            height: calc(1.2em * 8); /* Chiều cao tương ứng với số dòng giới hạn */

        }
        .image-new {
            width: 264px; /* Set the desired width */
            height: 424px; /* Set the desired height */
            /*border-radius: 8px;  Rounded corners if desired */
            /*box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);  Optional shadow */
            overflow: hidden; /* Ensures content stays within the rounded corners */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .thum img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the image covers the container, cropping as necessary */
            object-position: center; /* Center the cropped image */
            display: block;
        }
        #chat-bubble {
            position: fixed;
            bottom: 100px;
            right: 30px;
            width: 300px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: none;
            flex-direction: column;
            z-index: 1000;
        }

        .chat-header {
            background-color: #3cc78f;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 10px 10px 0 0;
        }

        .chat-body {
            padding: 10px;
            height: 200px;
            overflow-y: auto;
        }

        .chat-footer {
            padding: 10px;
            border-top: 1px solid #ddd;
        }

        #chat-toggle {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background-color: #3cc78f;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 16px;
            cursor: pointer;
            z-index: 1000;
        }

    </style>

    <body>
        <!-- Header section remains the same -->
        <header>
                <div class="header-area">
                    <div class="header-top_area">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xl-6 col-md-12 col-lg-8">
                                    <div class="short_contact_list">
                                        <ul>
                                            <li><a href="#"> <i class="fa fa-phone"></i>0999999999</a></li>
                                            <li><a href="#"> <i class="fa fa-envelope"></i>team4charifit@gmail.com</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-6 col-lg-4">
                                    <div class="social_media_links d-none d-lg-block">
                                        <a href="#">
                                            <!--<i class="fa fa-facebook"></i>-->
                                        </a>
                                        <a href="#">
                                            <!--<i class="fa fa-pinterest-p"></i>-->
                                        </a>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="sticky-header" class="main-header-area">
                        <div class="container-fluid">
                            <div class="row align-items-center">
                                <div class="col-xl-3 col-lg-3">
                                    <div class="logo">
                                        <a href="home">
                                            <img src="img/logo.png" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6">
                                    <div class="main-menu">
                                        <nav>
                                            <ul id="navigation">
                                                <li><a href="home">Trang chủ</a></li>
                                                <li><a href="About.html">Giới thiệu</a></li>
                                                <li><a href="Blog">Tin tức <i class="ti-angle-down"></i></a></li>
                                                <li><a href="project-list">Dự án <i class="ti-angle-down"></i></a>
                                                    <ul class="submenu">
                                                        <li><a href="CampaignUser">Chiến dịch</a></li>
                                                        <li><a href="Cause.html">Sự kiện</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="contact">Liên hệ</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>

                            </div>

                            <div class="col-xl-3 col-lg-3 d-none d-lg-flex justify-content-end align-items-center">
                                <!-- Ô nhập tìm kiếm cho desktop -->
                                <!--                                    -->

                                <div class="search-bar me-3 position-relative">
                                    <div  class="d-flex align-items-center">

                                        <input type="text" id="searchinput" name="searchTitle" placeholder="tìm kiếm các chiến dịch"  value="${requestScope.valuesearch}" aria-label="Search" class="form-control me-2" required="Chưa nhập dữ liệu để tìm kiếm">
                                        <button type="submit" class="btn btn-search">
                                            <i class="fa-solid fa-magnifying-glass"></i> <!-- Biểu tượng tìm kiếm -->
                                        </button>
                                    </div>
                                </div>


                                <!-- Biểu tượng thông báo và người dùng cho desktop -->
                                <c:if test="${requestScope.user != null}">
                                    <div class="user_notification position-relative">
                                        <!-- Thông báo -->
                                        <a href="#" class="notification-icon me-3" id="notification-toggle">
                                            <i class="fa fa-bell"></i> <!-- Biểu tượng thông báo -->
                                        </a>
                                        <!-- Dropdown thông báo -->
                                        <div class="notification-dropdown">
                                            <ul>
                                                <!-- Kiểm tra nếu danh sách thông báo trống -->
                                                <c:if test="${notic ==null || notic.isEmpty()}">
                                                    <li>Không có thông báo</li>
                                                    </c:if>

                                                <!-- Lặp qua danh sách thông báo nếu không trống -->
                                                <c:forEach var="notification" items="${notifications}">
                                                    <li>
                                                        <a href="notification/${notification.notificationId}">
                                                            <span>${notification.message}</span>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>

                                        </div>


                                        <a href="#" class="user-icon" id="user-toggle">
                                            <img src="${requestScope.user.getImage()}" alt="User" class="user-avatar"> <!-- Hình ảnh đại diện -->
                                        </a>
                                        <!-- Dropdown user -->
                                        <div class="user-dropdown">
                                            <ul>
                                                <li><a href="editUser">Hồ sơ người dùng</a></li>
                                                <li><a href="changePass">Đổi mật khẩu</a></li>
                                                    <c:if test="${userOr.getOrganizationStatus() == 'active'}">
                                                    <li><a href="organization-profile?created_by=${user.getUserId()}">Hồ sơ tổ chức</a></li>
                                                    </c:if>
                                                <li><a href="logout">Đăng xuất</a></li>
                                            </ul>

                                        </div>
                                        <!-- Biểu tượng user -->

                                    </div>
                                </c:if>
                                <c:if test="${requestScope.user == null}">
                                    <div></div>
                                    <div style="margin-left: 20px; margin-right: 20px;"><h4> <a href="login">Đăng nhập</a></h4></div>

                                </c:if>

                                <!--</form>-->
                            </div>

                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </header>

        <!-- bradcam_area_start  -->
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Quản lý sự kiện cho dự án</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end  -->

        <div class="popular_causes_area section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb-55">
                            <h3><span>Quản lý sự kiện cho dự án</span></h3>
                            <p>ID dự án: ${projectId}</p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-right mb-4">
                            <a href="${pageContext.request.contextPath}/project-details-fo?id=${projectId}" 
                               class="btn btn-secondary mr-2">
                                <i class="fa fa-arrow-left"></i> Quay về dự án
                            </a>
                            <a href="${pageContext.request.contextPath}/event-create?projectId=${projectId}" 
                               class="btn btn-primary">
                                <i class="fa fa-plus"></i> Thêm sự kiện mới
                            </a>
                        </div>

                        <div class="event-table-container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên vật phẩm</th>
                                        <th>Tiến trình</th>
                                        <th>Cần</th>
                                        <th>Được tài trợ</th>
                                        <th>Đơn vị</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="event" items="${events}">
                                        <tr>
                                            <td>${event.eventId}</td>
                                            <td>${event.itemName}</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" 
                                                         style="width: ${(event.quantityProvided / event.quantityNeeded) * 100}%" 
                                                         aria-valuenow="${(event.quantityProvided / event.quantityNeeded) * 100}" 
                                                         aria-valuemin="0" 
                                                         aria-valuemax="100">
                                                    </div>
                                                </div>
                                                <small class="text-muted">
                                                    ${String.format("%.1f", (event.quantityProvided / event.quantityNeeded) * 100)}%
                                                </small>
                                            </td>
                                            <td>${event.quantityNeeded}</td>
                                            <td>${event.quantityProvided}</td>
                                            <td>${event.unit}</td>
                                            <td class="action-buttons">
                                                <a href="${pageContext.request.contextPath}/event-update?id=${event.eventId}&projectId=${projectId}" 
                                                   class="btn btn-sm btn-info">
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/event-details?id=${event.eventId}&projectId=${projectId}"
                                                   class="btn btn-sm btn-success">
                                                    <i class="fa fa-eye"></i>
                                                </a>
                                                <button onclick="confirmDelete(${event.eventId}, ${projectId})" 
                                                        class="btn btn-sm btn-danger">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer section remains the same -->
        <footer class="footer">
            <div class="footer_top">
                <div class="container">

                    <div class="col-xl-12 col-md-12 col-lg-12 ">
                        <div class="footer_widget">
                            <div class="footer_logo">
                                <a href="#">
                                    <img src="img/footer_logo.png" alt="">
                                </a>
                            </div>
                            <p class="address_text">Chung tay vì cộng đồng. Vì một thế hệ mới và một tương lai tươi sáng
                            </p>


                        </div>
                    </div>
                </div>
            </div>

        </footer>

        <!-- JS here -->
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/ajax-form.js"></script>
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scrollIt.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.slicknav.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js/gijgo.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script>
                                    function confirmDelete(eventId, projectId) {
                                        if (confirm('Are you sure you want to delete this event?')) {
                                            window.location.href = '${pageContext.request.contextPath}/event-delete?id=' + eventId + '&projectId=' + projectId;
                                        }
                                    }
        </script>

        <!-- Include all the JS files from the original template -->
    </body>
</html>