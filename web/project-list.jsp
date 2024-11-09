<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Charifit - Project List</title>
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
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">
        <!-- <link rel="stylesheet" href="css/responsive.css"> -->
        <style>
            .project-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 20px;
                padding: 20px;
            }
            .project-card {
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .project-image {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }
            .project-info {
                padding: 15px;
            }
            .project-title {
                font-size: 18px;
                font-weight: bold;
                margin: 0 0 10px;
            }
            .project-title a {
                color: #333;
                text-decoration: none;
            }
            .project-org {
                color: #666;
                font-size: 14px;
                margin-bottom: 10px;
            }
            .custom_progress_bar {
                margin-bottom: 10px;
            }
        </style>
    </head>

    <body>
        <!--[if lte IE 9]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
            <![endif]-->

        <!-- header-start -->
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
        <!-- header-end -->

        <!-- bradcam_area_start  -->
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Dự án của chúng tôi:</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end  -->

        <!-- popular_causes_area_start  -->
        <div class="popular_causes_area section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb-55">
                            <h3><span>Dự án của chúng tôi</span></h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="project-grid" id="projectGrid">
                            <c:forEach var="project" items="${projects}">
                                <div class="project-card">
                                    <div class="thumb">
                                        <img src="${project.image}" alt="${project.title}" class="project-image">
                                    </div>
                                    <div class="project-info">
                                        <h4 class="project-title">
                                            <a href="project-details?id=${project.projectId}">${project.title}</a>
                                        </h4>
                                        <p class="project-org">Được tạo bởi: ${project.createdByOrg}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="pagination" id="pagination"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- popular_causes_area_end  -->

        <!-- footer_start  -->
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
        <!-- footer_end  -->

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
        <!--contact js-->
        <script src="js/contact.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/mail-script.js"></script>

        <script src="js/main.js"></script>

        <script>
                                    const projectsPerPage = 5; // Số dự án mỗi trang
                                    const projects = document.querySelectorAll('.project-card');
                                    const totalPages = Math.ceil(projects.length / projectsPerPage);
                                    let currentPage = 1;

                                    function showPage(page) {
                                        currentPage = page;
                                        const start = (currentPage - 1) * projectsPerPage;
                                        const end = start + projectsPerPage;

                                        projects.forEach((project, index) => {
                                            project.style.display = (index >= start && index < end) ? 'block' : 'none';
                                        });

                                        renderPagination();
                                    }

                                    function renderPagination() {
                                        const pagination = document.getElementById('pagination');
                                        pagination.innerHTML = '';

                                        if (currentPage > 1) {
                                            const prev = document.createElement('a');
                                            prev.innerText = 'Previous';
                                            prev.href = '#';
                                            prev.onclick = () => showPage(currentPage - 1);
                                            pagination.appendChild(prev);
                                        }

                                        for (let i = 1; i <= totalPages; i++) {
                                            const pageLink = document.createElement('a');
                                            pageLink.innerText = i;
                                            pageLink.href = '#';
                                            pageLink.className = (i === currentPage) ? 'active' : '';
                                            pageLink.onclick = () => showPage(i);
                                            pagination.appendChild(pageLink);
                                        }

                                        if (currentPage < totalPages) {
                                            const next = document.createElement('a');
                                            next.innerText = 'Next';
                                            next.href = '#';
                                            next.onclick = () => showPage(currentPage + 1);
                                            pagination.appendChild(next);
                                        }
                                    }

                                    // Hiển thị trang đầu tiên khi tải
                                    showPage(1);
        </script>

    </body>

</html>

