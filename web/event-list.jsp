<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Charifit - Event List</title>
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
            .event-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                gap: 20px;
                padding: 20px;
            }
            .event-card {
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .event-info {
                padding: 15px;
            }
            .event-title {
                font-size: 18px;
                font-weight: bold;
                margin: 0 0 10px;
            }
            .event-stats {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
                color: #666;
                font-size: 14px;
            }
            .progress {
                height: 5px;
                margin-bottom: 10px;
            }
            .progress-bar {
                background-color: #4CAF50;
            }
        </style>
    </head>

    <body>
        <!-- Header section - same as project-list.jsp -->
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
                            <h3>Danh sách sự kiện</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end  -->

        <!-- event_area_start  -->
        <div class="popular_causes_area section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb-55">
                            <h3><span>Danh sách sự kiện</span></h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="event-grid">
                            <c:forEach var="event" items="${events}">
                                <div class="event-card">
                                    <div class="event-info">
                                        <h4 class="event-title">${event.itemName}</h4>
                                        <div class="event-stats">
                                            <span>Cần: ${event.quantityNeeded} ${event.unit}</span>
                                            <span>Đã được tài trợ: ${event.quantityProvided} ${event.unit}</span>
                                        </div>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" 
                                                 style="width: ${(event.quantityProvided / event.quantityNeeded) * 100}%" 
                                                 aria-valuenow="${(event.quantityProvided / event.quantityNeeded) * 100}" 
                                                 aria-valuemin="0" 
                                                 aria-valuemax="100">
                                            </div>
                                        </div>
                                        <div class="text-center mt-3">
                                            <a href="event-details?id=${event.eventId}" class="btn btn-primary">View Details</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="pagination">
                            <c:if test="${currentPage > 1}">
                                <a href="?page=${currentPage - 1}" class="btn btn-secondary">Previous</a>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <a href="?page=${i}" class="btn ${i == currentPage ? 'btn-primary' : 'btn-secondary'}">${i}</a>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages}">
                                <a href="?page=${currentPage + 1}" class="btn btn-secondary">Tiếp</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- event_area_end  -->

        <!-- footer_start  -->
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
                        
                    </div>
                </div>
            </div>
            <div class="copy-right_text">
                <div class="container">
                    <div class="footer_border"></div>
                    <div class="row">
                        <div class="col-xl-12">
                            <p class="copy_right text-center">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
        <script src="js/main.js"></script>
    </body>
</html>