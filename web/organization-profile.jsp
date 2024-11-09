<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Chi tiết tổ chức - Charifit</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">

        <style>
            .org-details-section {
                padding: 60px 0;
            }
            .org-header {
                margin-bottom: 30px;
            }
            .org-info {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 5px;
                margin-bottom: 30px;
            }
            .org-stats {
                display: flex;
                justify-content: space-around;
                background: #fff;
                padding: 20px;
                border-radius: 5px;
                margin-bottom: 30px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            .stat-item {
                text-align: center;
                padding: 15px;
            }
            .stat-number {
                font-size: 24px;
                font-weight: bold;
                color: #FF5F13;
            }
            .stat-label {
                color: #666;
                margin-top: 5px;
            }
            .project-table {
                margin-top: 30px;
            }
            .project-manage-btn {
                background: #FF5F13;
                color: white;
                padding: 12px 30px;
                border-radius: 5px;
                display: inline-block;
                margin-bottom: 20px;
                text-decoration: none;
                transition: background 0.3s ease;
            }
            .project-manage-btn:hover {
                background: #e54d0a;
                color: white;
                text-decoration: none;
            }
            .project-detail-btn {
                background: #007bff;
                color: white;
                padding: 8px 15px;
                border-radius: 3px;
                text-decoration: none;
                transition: background 0.3s ease;
            }
            .project-detail-btn:hover {
                background: #0056b3;
                color: white;
                text-decoration: none;
            }
            .org-image {
                width: 100%;
                max-height: 300px;
                object-fit: cover;
                border-radius: 5px;
                margin-bottom: 20px;
            }
        </style>
    </head>

    <body>
        <!-- Header include here -->
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

        <!-- bradcam_area_start -->
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Hồ sơ tổ chức</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end -->

        <!-- Organization Details Start -->
        <div class="org-details-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="org-header">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h2>${organization.name}</h2>
                                    <p>ID Tổ chức: ${organization.organizationId}</p>
                                </div>
                                <a href="organization-edit?id=${organization.organizationId}" class="btn btn-primary">
                                    <i class="fa fa-edit"></i> Chỉnh sửa thông tin tổ chức
                                </a>
                            </div>
                        </div>

                        <div class="org-info">
                            <img src="${organization.image}" alt="${organization.name}" class="org-image">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Thông tin liên hệ</h4>
                                    <p><i class="fa fa-globe"></i> Website: <a href="${organization.website}" target="_blank">${organization.website}</a></p>
                                    <p><i class="fa fa-phone"></i> ĐT: ${organization.phone}</p>
                                    <p><i class="fa fa-envelope"></i> Email: ${organization.email}</p>
                                </div>
                                <div class="col-md-6">
                                    <h4>Chi tiết tổ chức</h4>
                                    <p><i class="fa fa-check-circle"></i> Trạng thái: ${organization.organizationStatus}</p>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-12">
                                    <h4>Mô tả</h4>
                                    <p>${organization.description}</p>
                                </div>
                            </div>
                        </div>

                        <div class="org-stats">
                            <div class="stat-item">
                                <div class="stat-number">${totalProjects}</div>
                                <div class="stat-label">Tổng số dự án</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">${pendingProjects}</div>
                                <div class="stat-label">Dự án chờ</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">${approvedProjects}</div>
                                <div class="stat-label">Dự án được chấp thuân</div>
                            </div>
                            <div class="stat-item">
                                <div class="stat-number">${rejectedProjects}</div>
                                <div class="stat-label">Dự án bị từ chối</div>
                            </div>
                        </div>
                        <!-- Projects Section -->
                        <div class="projects-section">
                            <div class="d-flex justify-content-between align-items-center">
                                <h3>Các dự án</h3>
                                <a href="project-management?orgId=${organization.organizationId}" class="project-manage-btn">
                                    <i class="fa fa-cog"></i> Quản lý các dự án
                                </a>
                            </div>

                            <div class="project-table">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Tên dự án</th>
                                            <th>Ngày bắt đầu</th>
                                            <th>Ngày kết thúc</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="project" items="${projects}">
                                            <tr>
                                                <td>${project.title}</td>
                                                <td><fmt:formatDate value="${project.startDate}" pattern="dd/MM/yyyy"/></td>
                                                <td><fmt:formatDate value="${project.endDate}" pattern="dd/MM/yyyy"/></td>
                                                <td>
                                                    <span class="badge badge-${project.status == 'Active' ? 'success' : 'secondary'}">
                                                        ${project.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="project-details-fo?id=${project.projectId}" class="project-detail-btn">
                                                        <i class="fa fa-eye"></i> Chi tiết
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Right Sidebar - Could add additional widgets here -->
                    <div class="col-lg-4">
                        <!-- Add any sidebar content here -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Organization Details End -->

        <!-- Footer include here -->
        <footer class="footer">
            <div class="footer_top">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-4 col-md-6 col-lg-4 ">
                            <div class="footer_widget">
                                <div class="footer_logo">
                                    <a href="#">
                                        <img src="img/footer_logo.png" alt="">
                                    </a>
                                </div>
                                <p class="address_text">Lorem ipsum dolor sit amet, <br> consectetur adipiscing elit, sed do <br> eiusmod tempor incididunt ut labore.
                                </p>
                                <div class="socail_links">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <i class="ti-facebook"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="ti-twitter-alt"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-dribbble"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <div class="col-xl-2 col-md-6 col-lg-2">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Services
                                </h3>
                                <ul class="links">
                                    <li><a href="#">Donate</a></li>
                                    <li><a href="#">Sponsor</a></li>
                                    <li><a href="#">Fundraise</a></li>
                                    <li><a href="#">Volunteer</a></li>
                                    <li><a href="#">Partner</a></li>
                                    <li><a href="#">Jobs</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Contacts
                                </h3>
                                <div class="contacts">
                                    <p>+2(305) 587-3407 <br>
                                        info@loveuscharity.com <br>
                                        Flat 20, Reynolds Neck, North
                                        Helenaville, FV77 8WS
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-md-6 col-lg-3">
                            <div class="footer_widget">
                                <h3 class="footer_title">
                                    Top News
                                </h3>
                                <ul class="news_links">
                                    <li>
                                        <div class="thumb">
                                            <a href="#">
                                                <img src="img/news/news_1.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <a href="#">
                                                <h4>School for African 
                                                    Childrens</h4>
                                            </a>
                                            <span>Jun 12, 2019</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumb">
                                            <a href="#">
                                                <img src="img/news/news_2.png" alt="">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <a href="#">
                                                <h4>School for African 
                                                    Childrens</h4>
                                            </a>
                                            <span>Jun 12, 2019</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy-right_text">
                <div class="container">
                    <div class="row">
                        <div class="bordered_1px "></div>
                        <div class="col-xl-12">
                            <p class="copy_right text-center">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>

                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- JS here -->
        <script src="js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/ajax-form.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/imagesloaded.pkgd.min.js"></script>
        <script src="js/scrollIt.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/nice-select.min.js"></script>
        <script src="js/jquery.slicknav.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/gijgo.min.js"></script>
    </body>
</html>