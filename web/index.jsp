<%-- 
    Document   : elements
    Created on : Sep 18, 2024, 8:49:16 AM
    Author     : FPT
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- <link rel="stylesheet" href="css/responsive.css"> -->
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
    </style>
    <body>
        <c:set var="idc" value="${requestScope.idc}"/>
        <form id="f1" action="home" method="get">
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
                                            <li><a href="#"> <i class="fa fa-phone"></i></a></li>
                                            <li><a href="#"> <i class="fa fa-envelope"></i></a></li>
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
                                                <li><a href="About.html">Giới Thiệu</a></li>
                                                <li><a href="Blog">blog <i class="ti-angle-down"></i></a>
                                                </li>
                                                <li><a href="project-list">Dự Án <i class="ti-angle-down"></i></a>
                                                    <ul class="submenu">
                                                        <li><a href="CampaignUser">Chiến Dịch</a></li>
                                                        <li><a href="Cause.html">Sự Kiện</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="contact">Liên Hệ</a></li>
                                                <!-- Ô nhập tìm kiếm cho di động -->

                                                <!-- Biểu tượng thông báo cho di động -->

                                            </ul>
                                        </nav>
                                    </div>
                                </div>

                                <div class="col-xl-3 col-lg-3 d-none d-lg-flex justify-content-end align-items-center">
                                    <!-- Ô nhập tìm kiếm cho desktop -->
                                    <!--                                    -->

                                    <div class="search-bar me-3 position-relative">
                                        <div  class="d-flex align-items-center">

                                            <input type="text" id="searchinput" name="searchTitle" placeholder="tìm kiếm dự án ..."  value="${requestScope.valuesearch}" aria-label="Search" class="form-control me-2" required="Chưa nhập dữ liệu để tìm kiếm">
                                            <button type="submit" class="btn btn-search">
                                                <i class="fas fa-search"></i> <!-- Biểu tượng tìm kiếm -->
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

                                                        <h4 style="margin: 25px;">Thông báo</h4>
                                                        <li style="margin-bottom: 20px; text-align: center; color: #a7acb1 "> Bạn không có thông báo nào</li>
                                                        </c:if>

                                                    <!-- Lặp qua danh sách thông báo nếu không trống -->
                                                    <c:forEach var="notification" items="${notifications}">
                                                        <h4 style="margin: 25px;">Thông báo</h4>
                                                        <li>
                                                            <a href="notification/${notification.notificationId}">
                                                                <span>${notification.message}</span>
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>

                                            </div>

                                            <!-- Biểu tượng user -->
                                            <a href="#" class="user-icon" id="user-toggle">
                                                <img src="${requestScope.user.getImage()}" alt="User" class="user-avatar"> <!-- Hình ảnh đại diện -->
                                            </a>
                                            <!-- Dropdown user -->
                                            <div class="user-dropdown">
                                                <ul>
                                                    <li><a href="#">Trang cá nhân</a></li>
                                                    <c:if test="${userOr.getOrganizationStatus() == 'active'}">
                                                    <li><a href="#">Trang cá nhân tổ chức</a></li>
                                                    </c:if>
                                                    <li><a href="login.jsp">Đăng xuất</a></li>
                                                </ul>
                                            </div>


                                        </div>
                                    </c:if>
                                    <c:if test="${requestScope.user == null}">
                                        <div></div>
                                        <div style="margin-left: 20px; margin-right: 20px;"><h4> <a href="login.jsp">Login</a></h4></div>

                                    </c:if>

                                    <!--</form>-->
                                </div>

                                <div class="col-12">
                                    <div class="mobile_menu d-block d-lg-none"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- header-end -->

            <!-- slider_area_start -->
            <div class="slider_area">
                <div class="single_slider  d-flex align-items-center slider_bg_1 overlay2">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9">
                                <div class="slider_text ">
                                    <span>Bắt đầu ngay hôm nay.</span>
                                    <h3>Đồng hành cùng cộng đồng thiện nguyện</h3>
                                    
                                    <a href="About.html" class="boxed-btn3">Đọc Thêm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider_area_end -->

            <br><!-- comment -->
            <br>
            <div class="filter-bar">
                <select name="category" id="filterDropdown" class="filter-select" onchange="change()">

                    <option value="0">Tất cả</option>
                    <c:forEach items="${categories}" var="category">
                        <option ${(idc==category.getCategoryId())?'selected':''} value="${category.getCategoryId()}">${category.getCategoryName()}</option>
                    </c:forEach>
                </select>
                <c:if test="${userOr.getOrganizationStatus() == 'active'}">
                    <a href="login.jsp" class="crtprj-btn">Khởi tạo dự án thiện nguyện</a>
                </c:if>
                <c:if test="${userOr.getOrganizationStatus() != 'active' || empty userOr}">
                    <div onclick="RejectAction('organempty')" class="crtprj-btn">Khởi tạo dự án thiện nguyện</div>
                </c:if>
            </div>

            <div class="popular_causes_area section_padding">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="section_title text-center mb-55">
                                <h3><span>Chiến dịch thiện nguyện</span></h3>
                            </div>
                        </div>
                    </div>
                    <c:if var="c" test="${requestScope.campaigns.isEmpty()}">

                        <h3 style="font-family: serif; color: #666; text-align: center; font-weight: bold">Chúng tôi không thấy kết quả nào</h3>
                        <h4 style="font-family: serif; color: #666; text-align: center">Make sure all words are spelled correctly or try a different keyword</h4>
                    </c:if>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="custom_causes_active owl-carousel"> 
                                <c:forEach var="c" items="${requestScope.campaigns}">
                                    <div class="single_cause" id="campaignslist">
                                        <div class="thumb">
                                            <img src="${c.image}" alt="">
                                        </div>
                                        <div class="causes_content">
                                            <div class="custom_progress_bar">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style=" width: 100%;">
                                                        <!--                                                        <span class="progres_count">
                                                                                                                    
                                                                                                                </span>-->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="balance d-flex justify-content-between align-items-center">
                                                <span> <a style="font-weight: bold;color: darkseagreen" >Start:</a> ${c.getStartDate()} </span>
                                                <span  ><a style="font-weight: bold;color: darkseagreen">End:</a> ${c.getEndDate()} </span>
                                            </div>
                                            <h4 class="single-line-limit">${c.getTitle()}</h4>
                                            <p class="single-line-limit" >Tạo bởi <a  style="font-weight: bold; color: darkseagreen">${c.getCreatedByOrg().getName()}</a></p>
                                            <a class="read_more" href="cause_details.html">Read More</a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--<div id="results"></div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- reson_area_start  -->
            <div class="popular_causes_area section_padding">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="section_title text-center mb-55">
                                <h3><span>Sự kiện thiện nguyện</span></h3>
                            </div>
                        </div>
                    </div>
                    <c:if var="c" test="${requestScope.events.isEmpty()}">

                        <h3 style="font-family: serif; color: #666; text-align: center; font-weight: bold">We found no results</h3>
                        <h4 style="font-family: serif; color: #666; text-align: center">Make sure all words are spelled correctly or try a different keyword</h4>
                    </c:if>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="custom_causes_active owl-carousel"> 

                                <c:forEach var="ev" items="${requestScope.events}">
                                    <div class="single_cause">
                                        <div class="thumb">
                                            <img src="${ev.image}" alt="">
                                        </div>
                                        <div class="causes_content">
                                            <div class="custom_progress_bar">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style=" width: 100%;">
                                                        <!--                                                        <span class="progres_count">
                                                                                                                    
                                                                                                                </span>-->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="balance d-flex justify-content-between align-items-center">
                                                <span> <a style="font-weight: bold;color: darkseagreen" >Start:</a> ${ev.getStartDate()} </span>
                                                <span  ><a style="font-weight: bold;color: darkseagreen">End:</a> ${ev.getEndDate()} </span>
                                            </div>
                                            <h4 class="single-line-limit">${ev.getTitle()}</h4>
                                            <p class="single-line-limit">Tạo bởi <a style="font-weight: bold; color: darkseagreen">${ev.getCreatedByOrg().getName()}</a></p>
                                            <a class="read_more" href="cause_details.html">Read More</a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--<div id="results"></div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- reson_area_end  -->

            <!-- latest_activites_area_start  -->

            <!-- latest_activites_area_end  -->

            <!-- popular_causes_area_start  -->

            <!-- popular_causes_area_end  -->

            <!-- counter_area_start  -->
            <div class="counter_area">
                <div class="container">
                    <div class="counter_bg overlay">
                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="single_counter d-flex align-items-center justify-content-center">
                                    <div class="icon">
                                        <i class="flaticon-calendar"></i>
                                    </div>
                                    <div class="events">
                                        <h3 class="counter">${orgcount}</h3>
                                        <p>Organization</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="single_counter d-flex align-items-center justify-content-center">
                                    <div class="icon">
                                        <i class="flaticon-heart-beat"></i>
                                    </div>
                                    <div class="events">
                                        <h3 class="counter">${countproject}</h3>
                                        <p>Project</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="single_counter d-flex align-items-center justify-content-center">
                                    <div class="icon">
                                        <i class="flaticon-in-love"></i>
                                    </div>
                                    <div class="events">
                                        <h3 class="counter">${countuser}</h3>
                                        <p>Member</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="single_counter d-flex align-items-center justify-content-center">
                                    <div class="icon">
                                        <i class="flaticon-hug"></i>
                                    </div>
                                    <div class="events">
                                        <h3 class="counter">${countvolun}</h3>
                                        <p>volunteer</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- counter_area_end  -->

            <!-- our_volunteer_area_start  -->
            <div class="our_volunteer_area section_padding">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="section_title text-center mb-55">
                                <h3><span>Our Volunteer</span></h3>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <c:forEach var="volunteer" items="${volunteer}">
                            <div class="col-lg-4 col-md-6">
                                <div class="single_volenteer">
                                    <div class="volenteer_thumb">
                                        <img src="${volunteer.getImage()}" alt="">
                                    </div>
                                    <div class="voolenteer_info d-flex align-items-end">
                                        <div class="social_links">
                                            <ul>
                                                <li>
                                                    <a href="#"> <i class="fa fa-facebook"></i> </a>
                                                </li>
                                                <li>
                                                    <a href="#"> <i class="fa fa-pinterest"></i> </a>
                                                </li>
                                                <li>
                                                    <a href="#"> <i class="fa fa-linkedin"></i> </a>
                                                </li>
                                                <li>
                                                    <a href="#"> <i class="fa fa-twitter"></i> </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="info_inner">
                                            <h4>${volunteer.getUsername()}</h4>
                                            <p>${volunteer.getRole()}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                </div>

            </div>

            <div style="text-align: center; margin-bottom: 30px">
                <c:if test="${(user.role) == 'volunteer'}">
                    <div style="display: flex; justify-content: center">
                        <div style="color: white" onclick="RejectAction('volunteerexist')" class="campaign-btn">Become a volunteer </div>
                    </div>
                </c:if>

                <c:if test="${(user.role) != 'volunteer'&& yourcv == null}">
                    <a href="volunteerregis" class="campaign-btn">Become a volunteer </a>
                </c:if>
                <c:if test="${(user.role) != 'volunteer' && yourcv != null}">
                    <div style="display: flex; justify-content: center">
                        <div style="color: white" onclick="RejectAction('volunteersentcv')" class="campaign-btn">Become a volunteer </div>
                    </div>
                </c:if>
            </div>

            <!-- our_volunteer_area_end  -->

            <!-- news__area_start  -->
            <div class="news__area section_padding">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="section_title text-center mb-55">
                                <h3><span>News & Updates</span></h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="news_active owl-carousel">

                                <c:forEach var="be" items="${requestScope.news}">
                                    <div class="single__blog d-flex align-items-center">
                                        <div class="thum">
                                            <div class="image-new">
                                                <img src="${be.getImage()}" alt="">
                                            </div>
                                        </div>
                                        <div class="newsinfo">

                                            <span>${be.getCreatedAt()}</span>
                                            <a href="single-blog.html">
                                                <h3>${be.getTitle()}</h3>
                                            </a>
                                            <p class="Content-news">${be.getContent()}</p>
                                            <a class="read_more" href="single-blog.html">Read More</a>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- news__area_end  -->


            <div data-scroll-index='1' class="make_donation_area section_padding">
                <div class="container">
                    <div class="campaign-header">Call for donations from Charity account</div>

                    <div class="campaign-container">
                        <div class="campaign-section">
                            <i class="fas fa-users"></i>
                            <h3>Regis Organization</h3>
                            <p>Create an account and user account on the Thien Nguyen app to start using transparent fundraising features.</p>
                        </div>
                        <div class="campaign-section">
                            <i class="fas fa-hands-helping"></i>
                            <h3>Create campaign</h3>
                            <p>Design, manage fundraising goals, and post and update charity events with simple steps.</p>
                        </div>
                        <div class="campaign-section">
                            <i class="fas fa-share-square"></i>
                            <h3>Share campaign</h3>
                            <p>Share your campaign with friends, family and community via social networks. At the same time, call for support to spread the campaign.</p>
                        </div>
                    </div>


                    <div style="text-align: center;">
                        <c:if test="${empty userOr || userOr.getOrganizationStatus() == 'inactive'}">
                            <a href="regisorg"  class="campaign-btn">Register now</a>
                        </c:if>
                        <c:if test="${!empty userOr && userOr.getOrganizationStatus() == 'active'}">
                            <div style="display: flex; justify-content: center">
                                <div style="color: white; width: 170px"  style="color: white" onclick="RejectAction('organexist')" class="campaign-btn">Register now</div>
                            </div>
                        </c:if>
                        <c:if test="${userOr.getOrganizationStatus() == 'pending'}">
                            <div style="display: flex; justify-content: center">
                                <div  style="color: white; width: 170px" onclick="RejectAction('organpending')" class="campaign-btn">Register now</div >
                            </div>
                        </c:if>

                    </div>



                </div>
            </div>

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
                                    
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- footer_end  -->

            <!-- link that opens popup -->

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
        </form>
    </body>
    <script>
                                        // Lấy các phần tử
                                        const notificationToggle = document.getElementById('notification-toggle');
                                        const notificationDropdown = document.querySelector('.notification-dropdown');
                                        const userToggle = document.getElementById('user-toggle');
                                        const userDropdown = document.querySelector('.user-dropdown');
// Hiển thị/Ẩn dropdown thông báo
                                        notificationToggle.addEventListener('click', function (event) {
                                            event.preventDefault(); // Ngăn chặn hành động mặc định
                                            notificationDropdown.classList.toggle('show-dropdown');
                                        });
// Hiển thị/Ẩn dropdown user
                                        userToggle.addEventListener('click', function (event) {
                                            event.preventDefault(); // Ngăn chặn hành động mặc định
                                            userDropdown.classList.toggle('show-dropdown');
                                        });
// Đóng dropdown khi nhấn ra ngoài
                                        document.addEventListener('click', function (event) {
                                            if (!notificationToggle.contains(event.target) && !notificationDropdown.contains(event.target)) {
                                                notificationDropdown.classList.remove('show-dropdown');
                                            }
                                            if (!userToggle.contains(event.target) && !userDropdown.contains(event.target)) {
                                                userDropdown.classList.remove('show-dropdown');
                                            }
                                        });
    </script>
    <script type="text/javascript">
        function change() {
            document.getElementById("f1").submit();
        }


        function handleDropdownChange() {
            const dropdown = document.getElementById('filterDropdown');
            const selectedValue = dropdown.value; // Giá trị đã chọn
            const search = document.getElementById('searchinput').value;
            // Kiểm tra nếu giá trị không phải là '0' (có nghĩa là không phải 'Tất cả')
            if (selectedValue !== '0' || search !== '') {
                // Thực hiện cuộn trang đến vị trí cụ thể
                window.scrollTo({top: 850, behavior: 'smooth'});
            }
        }
        handleDropdownChange();
// Lắng nghe sự kiện 'change' cho dropdown
        document.getElementById('filterDropdown').addEventListener('submit', handleDropdownChange);
//        document.getElementById("f1").onsubmit = function (event) {
//            event.preventDefault(); // Ngăn chặn việc submit form theo cách mặc định để điều khiển quá trình
//
//            // Thực hiện gửi dữ liệu (ví dụ bằng AJAX nếu cần) hoặc yêu cầu tới server
//            setTimeout(() => {
//                // Sau khi submit, reset form
//                document.getElementById("f1").reset();
//
//                // Cuộn đến vị trí mong muốn sau khi reset
//                window.scrollTo({top: 500, behavior: 'smooth'});
//            }, 100); // Thời gian chờ để quá trình gửi hoàn tất trước khi reset và cuộn
//        };
    </script>
    <script>
        $(document).ready(function () {
            $('.custom_causes_active.owl-carousel').owlCarousel({
                items: 3, // Hiển thị tối đa 3 thẻ trong một hàng
                loop: false, // Không lặp vô tận
                margin: 10, // Khoảng cách giữa các thẻ
                responsive: {
                    0: {
                        items: 1 // Hiển thị 1 thẻ cho màn hình nhỏ
                    },
                    600: {
                        items: 2 // Hiển thị 2 thẻ cho màn hình trung bình
                    },
                    1000: {
                        items: 3 // Hiển thị 3 thẻ cho màn hình lớn
                    }
                }
            });
        });
    </script>
    <script>
        function RejectAction(id) {
            if (id === 'volunteerexist') {
                swal("Action failed!", "you are already a volunteer!", "warning");
            } else if (id === 'volunteersentcv') {
                swal("Action failed!", "You have sent your CV, please wait for approval!", "warning");
            } else if (id === 'organexist') {
                swal("Action failed!", "you have an organization!", "warning");
            } else if (id === 'organpending') {
                swal("Action failed!", "Your organization creation request is pending!", "warning");
            }
            else if (id === 'organempty') {
                swal("Action failed!", "Only organizations can create projects, register to open an organization now!", "warning");
            }
        }
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
</html>
