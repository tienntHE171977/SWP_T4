<%-- 
    Document   : elements
    Created on : Sep 18, 2024, 8:49:16 AM
    Author     : FPT
--%>

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
        <link href='http://fonts.googleapis.com/css?family=Rokkitt:400,700|Lato:400,300' rel='stylesheet' type='text/css'>
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
        <!-- <link rel="stylesheet" href="css/responsive.css"> -->
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
        .notification-dropdown,
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
            /*font-weight: bold;*/
            text-decoration: underline;
        }
        .campaign-section {
            text-align: center;
            width: 30%;
        }
        .campaign-section i {
            font-size: 50px;
            color: #ff6e40;
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
            background-color: #ff6e40;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 30px;
        }
        .campaign-btn:hover {
            background-color: #ff5c29;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #009966;
            margin: 0;
            padding: 0;
        }
        .RegContainer {
            max-width: 800px;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .RegSectionHeader {
            background-color: #999999;
            color: white;
            padding: 10px;
            border-radius: 4px;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .RegFormGroup {
            margin-bottom: 25px; /* Increased spacing between form groups */
        }
        .RegFormGroup label {
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }
        .RegFormGroup input[type="email"],
        .RegFormGroup input[type="tel"],
        .RegFormGroup input[type="text"],
        .RegFormGroup input[type="date"],
        .RegFormGroup input[type="url"] {
            width: 100%;
            padding: 12px; /* Adjusted padding for better visibility */
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
            font-size: 16px;
        }
        .RegFile {
            width: 100%;
            padding: 12px; /* Adjusted padding for better visibility */
            border: 1px #ccc;
            border-radius: 10px;
            margin-top: 5px;
            font-size: 16px;
        }

        .RegSubmitButton {
            display: block;
            width: 20%;
            padding: 12px;
            background-color: #3cc78f;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            float: right;
        }
        /*        .RegSubmitButton:hover {
                    background-color: #ff5c29;
                }*/
    </style>
    <style>
        html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,abbr,address,cite,code,del,dfn,em,img,ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video {
            border:0;
            font:inherit;
            font-size:100%;
            margin:0;
            padding:0;
            vertical-align:baseline;
        }

        html, body {
            background: white; /* Thay đổi từ #181818 thành #000000 */
            font-family: 'Lato', helvetica, arial, sans-serif;
            font-size: 16px;
            color: #222;
        }

        article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section {
            display:block;
        }



        .clear {
            clear: both;
        }

        p {
            font-size: 1em;
            line-height: 1.4em;
            margin-bottom: 20px;
            color: #444;
        }

        #cv {
            width: 90%;
            max-width: 800px;
            background: #f3f3f3;
            margin: 30px auto;
        }

        .mainDetails {
            padding: 25px 35px;
            border-bottom: 2px solid #cf8a05;
            background: #ededed;
        }

        #name h1 {
            font-size: 2.5em;
            font-weight: 700;
            font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
            margin-bottom: -6px;
        }

        #name h2 {
            font-size: 2em;
            margin-left: 2px;
            font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
        }

        #mainArea {
            padding: 0 40px;
        }

        #headshot {
            width: 12.5%;
            float: left;
            margin-right: 30px;
        }

        #headshot img {
            width: 100%;
            height: auto;
            -webkit-border-radius: 50px;
            border-radius: 50px;
        }

        #name {
            float: left;
        }

        #contactDetails {
            float: right;
        }

        #contactDetails ul {
            list-style-type: none;
            font-size: 0.9em;
            margin-top: 2px;
        }

        #contactDetails ul li {
            margin-bottom: 3px;
            color: #444;
        }

        #contactDetails ul li a, a[href^=tel] {
            color: #444;
            text-decoration: none;
            -webkit-transition: all .3s ease-in;
            -moz-transition: all .3s ease-in;
            -o-transition: all .3s ease-in;
            -ms-transition: all .3s ease-in;
            transition: all .3s ease-in;
        }

        #contactDetails ul li a:hover {
            color: #cf8a05;
        }


        section {
            border-top: 1px solid #dedede;
            padding: 20px 0 0;
        }

        section:first-child {
            border-top: 0;
        }

        section:last-child {
            padding: 20px 0 10px;
        }

        .sectionTitle {
            float: left;
            width: 25%;
        }

        .sectionContent {
            float: right;
            width: 72.5%;
        }

        .sectionTitle h1 {
            font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
            font-style: italic;
            font-size: 1.5em;
            color: #cf8a05;
        }

        .sectionContent h2 {
            font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
            font-size: 1.5em;
            margin-bottom: -2px;
        }

        .subDetails {
            font-size: 0.8em;
            font-style: italic;
            margin-bottom: 3px;
        }

        .keySkills {
            list-style-type: none;
            -moz-column-count:3;
            -webkit-column-count:3;
            column-count:3;
            margin-bottom: 20px;
            font-size: 1em;
            color: #444;
        }

        .keySkills ul li {
            margin-bottom: 3px;
        }

        @media all and (min-width: 602px) and (max-width: 800px) {
            #headshot {
                display: none;
            }

            .keySkills {
                -moz-column-count:2;
                -webkit-column-count:2;
                column-count:2;
            }
        }

        @media all and (max-width: 601px) {
            #cv {
                width: 95%;
                margin: 10px auto;
                min-width: 280px;
            }

            #headshot {
                display: none;
            }

            #name, #contactDetails {
                float: none;
                width: 100%;
                text-align: center;
            }

            .sectionTitle, .sectionContent {
                float: none;
                width: 100%;
            }


            .sectionTitle {
                margin-left: -2px;
                font-size: 1.25em;
            }

            .keySkills {
                -moz-column-count:2;
                -webkit-column-count:2;
                column-count:2;
            }
        }

        @media all and (max-width: 480px) {
            .mainDetails {
                padding: 15px 15px;
            }

            section {
                padding: 15px 0 0;
            }

            #mainArea {
                padding: 0 25px;
            }


            .keySkills {
                -moz-column-count:1;
                -webkit-column-count:1;
                column-count:1;
            }

            #name h1 {
                line-height: .8em;
                margin-bottom: 4px;
            }
        }

        @media print {
            #cv {
                width: 100%;
            }
        }

        @-webkit-keyframes reset {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 0;
            }
        }

        @-webkit-keyframes fade-in {
            0% {
                opacity: 0;
            }
            40% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @-moz-keyframes reset {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 0;
            }
        }

        @-moz-keyframes fade-in {
            0% {
                opacity: 0;
            }
            40% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes reset {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 0;
            }
        }

        @keyframes fade-in {
            0% {
                opacity: 0;
            }
            40% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        .instaFade {
            -webkit-animation-name: reset, fade-in;
            -webkit-animation-duration: 1.5s;
            -webkit-animation-timing-function: ease-in;

            -moz-animation-name: reset, fade-in;
            -moz-animation-duration: 1.5s;
            -moz-animation-timing-function: ease-in;

            animation-name: reset, fade-in;
            animation-duration: 1.5s;
            animation-timing-function: ease-in;
        }

        .quickFade {
            -webkit-animation-name: reset, fade-in;
            -webkit-animation-duration: 2.5s;
            -webkit-animation-timing-function: ease-in;

            -moz-animation-name: reset, fade-in;
            -moz-animation-duration: 2.5s;
            -moz-animation-timing-function: ease-in;

            animation-name: reset, fade-in;
            animation-duration: 2.5s;
            animation-timing-function: ease-in;
        }

        .delayOne {
            -webkit-animation-delay: 0, .5s;
            -moz-animation-delay: 0, .5s;
            animation-delay: 0, .5s;
        }

        .delayTwo {
            -webkit-animation-delay: 0, 1s;
            -moz-animation-delay: 0, 1s;
            animation-delay: 0, 1s;
        }

        .delayThree {
            -webkit-animation-delay: 0, 1.5s;
            -moz-animation-delay: 0, 1.5s;
            animation-delay: 0, 1.5s;
        }

        .delayFour {
            -webkit-animation-delay: 0, 2s;
            -moz-animation-delay: 0, 2s;
            animation-delay: 0, 2s;
        }

        .delayFive {
            -webkit-animation-delay: 0, 2.5s;
            -moz-animation-delay: 0, 2.5s;
            animation-delay: 0, 2.5s;
        }
    </style>

    <body style="background-color: #ccffcc; margin-top: 50px">
        <header>
            <div style="background-color: white" class="header-area ">
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
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-pinterest-p"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                    <a href="#">
                                        <i class="fa fa-twitter"></i>
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
                                            <li class="user_notification d-block d-lg-none">
                                                <a href="#" class="notification-icon">
                                                    <i class="fa fa-bell"></i> <!-- Biểu tượng thông báo -->
                                                </a>
                                                <a href="#" class="user-icon">
                                                    <img src="D:\FALL24\SWP\SWP_team4\SWP_team4\web\images\emzai.jpg" alt="User" class="user-avatar"> <!-- Hình ảnh đại diện -->
                                                </a>
                                            </li>
                                            <li class="d-block d-lg-none">
                                                <div class="search-bar">
                                                    <input type="text" placeholder="Tìm kiếm..." aria-label="Search" class="form-control">
                                                </div>
                                            </li>
                                            <li><a href="index.html">home</a></li>
                                            <li><a href="About.html">About</a></li>
                                            <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="blog.jsp">blog</a></li>
                                                    <li><a href="single-blog.jsp">single-blog</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="elements.html">elements</a></li>
                                                    <li><a href="Cause.html">Cause</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="contact.jsp">Contact</a></li>
                                            <!-- Ô nhập tìm kiếm cho di động -->

                                            <!-- Biểu tượng thông báo cho di động -->

                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 d-none d-lg-flex justify-content-end align-items-center">
                                <!-- Ô nhập tìm kiếm cho desktop -->
                                <div class="search-bar me-3">
                                    <input type="text" placeholder="Search campaign name" aria-label="Search" class="form-control">
                                </div>
                                <!-- Biểu tượng thông báo và người dùng cho desktop -->
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

                                    <!-- Biểu tượng user -->
                                    <a href="#" class="user-icon" id="user-toggle">

                                        <img src="${requestScope.user.image}" alt="User" class="user-avatar"> <!-- Hình ảnh đại diện -->

                                    </a>
                                    <!-- Dropdown user -->
                                    <div class="user-dropdown">
                                        <ul>
                                            <li><a href="#">User Profile</a></li>
                                            <li><a href="login.jsp">Log Out</a></li>
                                        </ul>
                                    </div>
                                </div>


                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <form>
            <div id="cv" class="instaFade">
                <div class="mainDetails">
                    <div id="headshot" class="quickFade">
                        <img src="${user.image}" alt="${user.username}" />
                    </div>

                    <div id="name">
                        <h1 class="quickFade delayTwo">${user.username}</h1>
                        <h2 class="quickFade delayThree">Volunteer</h2>
                    </div>

                    <div id="contactDetails" class="quickFade delayFour">
                        <ul>
                            <li>
                                email:
                                <a >${user.email}</a>
                            </li>

                            <li>phone: ${user.phone}</li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>

                <div id="mainArea" class="quickFade delayFive">
                    <section>
                        <article>
                            <div class="sectionTitle">
                                <h1>Personal Profile</h1>
                            </div>

                            <div id="personal" class="sectionContent">
                                <p>
                                <div>
                                    <textarea class="custom-textarea" name="myTextarea" rows="6" placeholder="Nhập nội dung..."></textarea>
                                </div>
                                </p>
                            </div>
                        </article>
                        <div class="clear"></div>
                    </section>

                    <section>
                        <div class="sectionTitle">
                            <h1>Work Experience</h1>
                        </div>

                        <div class="sectionContent">
                            <article>
                                <h2>Job Title at Company</h2>
                                <p class="subDetails">April 2011 - Present</p>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
                                    ultricies massa et erat luctus hendrerit. Curabitur non
                                    consequat enim. Vestibulum bibendum mattis dignissim. Proin id
                                    sapien quis libero interdum porttitor.
                                </p>
                            </article>

                            <article>
                                <h2>Job Title at Company</h2>
                                <p class="subDetails">Janruary 2007 - March 2011</p>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
                                    ultricies massa et erat luctus hendrerit. Curabitur non
                                    consequat enim. Vestibulum bibendum mattis dignissim. Proin id
                                    sapien quis libero interdum porttitor.
                                </p>
                            </article>

                            <article>
                                <h2>Job Title at Company</h2>
                                <p class="subDetails">October 2004 - December 2006</p>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
                                    ultricies massa et erat luctus hendrerit. Curabitur non
                                    consequat enim. Vestibulum bibendum mattis dignissim. Proin id
                                    sapien quis libero interdum porttitor.
                                </p>
                            </article>
                        </div>
                        <div class="clear"></div>
                    </section>

                    <section>
                        <div class="sectionTitle">
                            <h1>Key Skills</h1>
                        </div>

                        <div id="skills" class="sectionContent">
                            <div>
                                <textarea class="custom-textarea" name="myTextarea" rows="4" placeholder="Nhập nội dung..."></textarea>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </section>

                    <section>
                        <div class="sectionTitle">
                            <h1>Education</h1>
                        </div>

                        <div class="sectionContent">
                            <article>
                                <h2>College/University</h2>
                                <p class="subDetails">Qualification</p>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
                                    ultricies massa et erat luctus hendrerit. Curabitur non
                                    consequat enim.
                                </p>
                            </article>

                            <article>
                                <h2>College/University</h2>
                                <p class="subDetails">Qualification</p>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec
                                    ultricies massa et erat luctus hendrerit. Curabitur non
                                    consequat enim.
                                </p>
                            </article>
                        </div>
                        <div class="clear"></div>
                    </section>
                </div>
            </div>
        </form>
        <script type="text/javascript">
            var gaJsHost =
                    "https:" == document.location.protocol ? "https://ssl." : "http://www.";
            document.write(
                    unescape(
                            "%3Cscript src='" +
                            gaJsHost +
                            "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"
                            )
                    );
        </script>
        <script type="text/javascript">
            var pageTracker = _gat._getTracker("UA-3753241-1");
            pageTracker._initData();
            pageTracker._trackPageview();
        </script>
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
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>

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

                                    // Hàm để thiết lập thuộc tính max cho ô input date
                                    function setMaxDate() {
                                        const today = new Date();
                                        // Chuyển đổi ngày hiện tại thành định dạng YYYY-MM-DD
                                        const dd = String(today.getDate()).padStart(2, '0'); // Thêm số 0 cho ngày < 10
                                        const mm = String(today.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0
                                        const yyyy = today.getFullYear();

                                        // Tạo chuỗi định dạng ngày
                                        const currentDate = `${yyyy}-${mm}-${dd}`;

                                                // Gán giá trị ngày hiện tại cho thuộc tính max
                                                const dateInput = document.getElementById("created_at");
                                                dateInput.setAttribute("max", currentDate);

                                                // Lắng nghe sự kiện change để xử lý trực tiếp
                                                dateInput.addEventListener("change", (event) => {
                                                    const selectedDate = new Date(event.target.value); // Lấy giá trị từ ô nhập liệu

                                                    // So sánh ngày được chọn với ngày hiện tại
                                                    if (selectedDate > today) {
                                                        alert("Ngày đã chọn không hợp lệ (phải là ngày hôm nay hoặc trước đó).");
                                                        dateInput.value = ""; // Xóa ô nhập liệu nếu ngày không hợp lệ
                                                    } else {
                                                        console.log("Ngày hợp lệ:", event.target.value);
                                                    }
                                                });
                                            }

                                            // Gọi hàm khi trang được tải
                                            window.onload = setMaxDate;




                                            document.getElementById('registerForm').addEventListener('submit', function (event) {
                                                event.preventDefault(); // Ngăn trang tự động gửi form
                                                function isEmpty(value) {
                                                    return value.trim() === ''; // Kiểm tra sau khi loại bỏ khoảng trắng
                                                }
                                                // Lấy giá trị các trường nhập
//                                                const orgName = document.getElementById('orgName').value;
//                                                const createdAt = document.getElementById('created_at').value;
//                                                const website = document.getElementById('website').value;
                                                const description = document.getElementById('description').value;
                                                const descriptionskill = document.getElementById('descriptionskill').value;

//                                                const representativePhone = document.getElementById('representative_phone').value;
//                                                const representativeEmail = document.getElementById('representative_email').value;
//                                                const image = document.getElementById('image').files[0];
//                                                const regex_phone = /^(03|05|07|08|09)[0-9]{8}$/;
//                                                // Reset thông báo lỗi
                                                let isValid = true;
//                                                document.getElementById('errName').textContent = '';
                                                document.getElementById('errDescription').textContent = '';
                                                document.getElementById('errDescriptionSkill').textContent = '';
//                                                document.getElementById('errRepPhone').textContent = '';
//                                                document.getElementById('errRepEmail').textContent = '';

                                                // Kiểm tra tên tổ chức (ít nhất 3 ký tự)
//                                                if (isEmpty(orgName)) {
//                                                    document.getElementById('errName').textContent = 'Tên tổ chức không được để trống';
//                                                    isValid = false;
//                                                }
//
//                                                // Kiểm tra website (URL hợp lệ)
//                                                try {
//                                                    new URL(website);
//                                                } catch (e) {
//                                                    document.getElementById('errName').textContent = 'URL không hợp lệ';
//                                                    isValid = false;
//                                                }
//
//                                                // Kiểm tra ngày thành lập (không vượt quá ngày hiện tại)
//                                                const today = new Date().toISOString().split('T')[0];
//                                                if (createdAt > today) {
//                                                    document.getElementById('errName').textContent = 'Ngày thành lập không hợp lệ';
//                                                    isValid = false;
//                                                }

                                                // Kiểm tra mô tả (ít nhất 10 ký tự)
                                                if (isEmpty(description)) {
                                                    document.getElementById('errDescription').textContent = 'Mô tả không được để trống';
                                                    isValid = false;
                                                }
                                                if (isEmpty(descriptionskill)) {
                                                    document.getElementById('errDescriptionSkill').textContent = 'Mô tả không được để trống';
                                                    isValid = false;
                                                }
//
//
//                                                // Kiểm tra số điện thoại người đại diện (ít nhất 10 ký tự)
//                                                if (!regex_phone.test(representativePhone)) {
//                                                    document.getElementById('errRepPhone').textContent = 'Số điện thoại không hợp lệ';
//                                                    isValid = false;
//                                                }
//
//                                                // Kiểm tra email người đại diện (định dạng email hợp lệ)
//                                                const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
//                                                if (!emailPattern.test(representativeEmail)) {
//                                                    document.getElementById('errRepEmail').textContent = 'Email không hợp lệ';
//                                                    isValid = false;
//                                                }
//
//                                                // Kiểm tra file ảnh (định dạng hình ảnh và kích thước < 5MB)
//                                                if (image && image.size > 5 * 1024 * 1024) {
//                                                    alert('Kích thước ảnh phải nhỏ hơn 5MB');
//                                                    isValid = false;
//                                                }

                                                // Nếu tất cả đều hợp lệ, gửi form
                                                if (!isValid) {
                                                    window.scrollTo({top: 0, behavior: 'smooth'});
                                                } else {
                                                    this.submit(); // Gửi form về server nếu hợp lệ
                                                }
                                            });




    </script>
    <script>
        function addField(sectionId, placeholder) {
            const section = document.getElementById(sectionId);
            const textarea = document.createElement("textarea");
            textarea.name = sectionId + "[]";
            textarea.placeholder = placeholder;
            textarea.rows = 6;
            textarea.cols = 50;

            // Thêm CSS trực tiếp trong JavaScript
            textarea.style.marginBottom = "10px";
            textarea.style.width = "100%";
            textarea.style.padding = "10px";
            textarea.style.border = "1px solid #ccc";
            textarea.style.borderRadius = "5px";
            textarea.style.fontSize = "1em";

            section.appendChild(textarea);
        }
    </script>
    <style>
        /* CSS cho textarea */
        .custom-textarea {
            width: 100%; /* Chiều rộng 100% */
            padding: 10px; /* Khoảng cách bên trong */
            border: 1px solid #ccc; /* Viền */
            border-radius: 5px; /* Bo góc */
            font-size: 1em; /* Kích thước chữ */
            margin-bottom: 10px; /* Khoảng cách dưới */
            resize: vertical; /* Chỉ cho phép thay đổi chiều cao */
            font-family: 'Arial', sans-serif; /* Font chữ */
            color: #333; /* Màu chữ */
        }

        /* Placeholder style */
        .custom-textarea::placeholder {
            color: #aaa; /* Màu chữ cho placeholder */
        }
    </style>


</html>
