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
        <!-- Thêm vào phần <head> của file -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

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
            height: 100%;
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
        .CustomFormGroup {
            margin-top: -32px;
            margin-bottom: 20px;
            text-align: center;
        }

        .CustomFileInput {
            display: none;
        }

        .custom-image-preview {
            width: 92px;
            height: 92px;
            border: 2px solid #ddd;
            margin: 10px auto;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f0f0f0;
            overflow: hidden;
            border-radius: 50%; /* Tạo hình tròn */
            cursor: pointer;
            position: relative;
        }
        /*
        */        .custom-image-preview__image {
            display: none;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        .custom-image-preview__text {
            color: #ccc;
            font-size: 16px;
            text-align: center;
            pointer-events: none; /* Để chữ không cản trở việc nhấp chuột vào input */
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
        <div class="slider_area">
            <br/><!-- comment -->
            <br/>

            <div  class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="justify-content-center">

                            <h1 style="font-size: 40px; font-weight: bold;" class="text-center text-dark">Create Your CV</h1>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <form id="registerForm" action="volunteerregis" method="post" enctype="multipart/form-data">
            <div id="cv" class="instaFade">
                <div class="mainDetails">
                    <div id="headshot" class="quickFade">
                        <div class="CustomFormGroup">
                            <label for="customImageInput"></label>
                            <div class="custom-image-preview" id="customImagePreview">
                                <input class="CustomFileInput" type="file" id="customImageInput" name="image" accept="image/*" required />
                                <img src="" alt="Image Preview" class="custom-image-preview__image" />
                                <span class="custom-image-preview__text">Click to select photo</span>
                            </div>
                        </div>
                    </div>

                    <div id="name">
                        <h1 id="fullname" class="quickFade delayTwo">${user.getFullname()}</h1>
                        <h2 id="gender" class="quickFade delayThree">${user.getGender()}</h2>
                    </div>

                    <div id="contactDetails" class="quickFade delayFour">
                        <ul>
                            <li id="mail">
                                e:
                                <a href="mailto:${user.email}" target="_blank">${user.email}</a>
                            </li>

                            <li id="phone">m: ${user.phone}</li>
                            <li id="address">m: ${user.adrees}</li>


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

                                <textarea id="description" class="custom-textarea" name="description" rows="6" placeholder="Nhập nội dung..."></textarea>
                            </div>
                            <div style="display: none;  max-width: 600px; /* Giới hạn chiều rộng tối đa là 600px */
                                 margin: 0 auto; /* Căn giữa nếu phần tử là khối */
                                 word-wrap: break-word; /* Ngắt dòng khi gặp từ dài vượt quá giới hạn */
                                 overflow-wrap: break-word;" id="personaldisplay" class="sectionContent">

                                <p id="descriptiondisplay" ></p>
                            </div>

                        </article>
                        <div class="clear"></div>
                    </section>

                    <section>
                        <div class="sectionTitle">
                            <h1>Work Experience</h1>
                        </div>

                        <div class="sectionContent" id="experience">

                            <article>
                                <button onclick="addInputSection()">+</button>
                            </article>
                        </div>
                        <div style="display: none;  max-width: 600px; /* Giới hạn chiều rộng tối đa là 600px */
                             margin: 0 auto; /* Căn giữa nếu phần tử là khối */
                             word-wrap: break-word; /* Ngắt dòng khi gặp từ dài vượt quá giới hạn */
                             overflow-wrap: break-word; /* Ngắt dòng khi từ dài vượt quá khung */" class="sectionContent" id="experiencedisplay">

                        </div>
                        <input type="hidden" name="ex" id="ep" value="" />
                        <div class="clear"></div>
                    </section>


                    <section>
                        <div class="sectionTitle">
                            <h1>Key Skills</h1>
                        </div>

                        <div class="sectionContent">
                            <ul class="keySkills" id="keySkillsList">

                                <button onclick="addSkillField()">+</button>
                            </ul>
                            <ul style="display: none;" class="keySkills" id="keySkillsListshow">

                            </ul>

                        </div>
                        <input type="hidden" name="ski" id="ski" value="" />
                        <div class="clear"></div>
                    </section>


                    <section>
                        <div class="sectionTitle">
                            <h1>Education</h1>
                        </div>

                        <div class="sectionContent" id="education">
                            <article>
                                <button onclick="addEducation()()">+</button>
                            </article>
                        </div>
                        <div style="display: none;  max-width: 600px; /* Giới hạn chiều rộng tối đa là 600px */
                             margin: 0 auto; /* Căn giữa nếu phần tử là khối */
                             word-wrap: break-word; /* Ngắt dòng khi gặp từ dài vượt quá giới hạn */
                             overflow-wrap: break-word;" class="sectionContent" id="educationdisplay">

                        </div>
                        <input type="hidden" name="ed" id="ed" value="" />
                        <div class="clear"></div>
                    </section>



                </div>
            </div>
            <div style="align-items: center; margin-left: 150px; padding-bottom: 20px; max-width: 80%">
                <div  style=" display: flex;justify-content: space-evenly; padding-bottom: 20px;">
                    <button id="view" style="padding: 10px 15px; border-radius: 10px; background-color: moccasin; color: white; border: none;font-weight:  bold    " type="button" value="SEND CV" onclick="ViewCV()">View CV</button>
                    <button id="edit" style="padding: 10px 15px; border-radius: 10px; background-color: moccasin; color: white; border: none;font-weight:  bold; display: none    " type="button" value="SEND CV" onclick="EditCV()">Edit</button>
                    <button id="send" style="padding: 10px 15px; border-radius: 10px; background-color: moccasin; color: white; border: none;font-weight:  bold  ; display: none  " type="submit">send CV</button>
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


                                                const description = document.getElementById('description').value.trim();
                                                const exper = document.getElementById('ep').value.trim();
                                                const descriptionskill = document.getElementById('ski').value.trim();
                                                const edu = document.getElementById('ed').value.trim();

                                                const image = document.getElementById('customImageInput').files[0];

//                                                if (event.submitter && event.submitter.id !== 'send') {
//                                                    return; // Thoát nếu không phải submit từ nút "REGISTER"
//                                                }
                                                let isValid = true;
                                                if (event.submitter && event.submitter.id !== 'send') {
                                                    return; // Thoát nếu không phải submit từ nút "REGISTER"
                                                }
                                                // Kiểm tra mô tả (ít nhất 10 ký tự)
                                                if (description.length < 90) {

                                                    //                                                    document.getElementById('errDescription').textContent = 'Mô tả không được để trống';
                                                    isValid = false;
                                                }
                                                if (descriptionskill.length < 10) {

                                                    //                                                    document.getElementById('errDescriptionSkill').textContent = 'Mô tả không được để trống';
                                                    isValid = false;
                                                }
                                                if (exper.length < 10) {

                                                    //                                                    document.getElementById('errDescriptionSkill').textContent = 'Mô tả không được để trống';
                                                    isValid = false;
                                                }
                                                if (edu.length < 5) {

                                                    //                                                    document.getElementById('errDescriptionSkill').textContent = 'Mô tả không được để trống';
                                                    isValid = false;
                                                }
                                                if (!image) {

                                                    isValid = false;
                                                    window.scrollTo({top: 200, behavior: 'smooth'});

                                                } else if (image.size > 5 * 1024 * 1024) {

                                                    isValid = false;
                                                    window.scrollTo({top: 200, behavior: 'smooth'});
                                                }


                                                // Nếu tất cả đều hợp lệ, gửi form
                                                if (!isValid) {
                                                    swal("Information is not valid!", "Please fill in all information!", "warning");
                                                    window.scrollTo({top: 0, behavior: 'smooth'});
                                                } else {
                                                    swal({
                                                        title: "Your CV has been sent!",
                                                        text: "clicked the button to return to homepage!",
                                                        icon: "success",
                                                        
                                                    }).then((willSubmit) => {
                                                        if (willSubmit) {
                                                            this.submit(); // Gửi biểu mẫu khi người dùng nhấn OK
//                                                             alert("Gửi CV thành công!"); // Hiển thị alert sau khi gửi
//                                                             window.location.href = "home"; // Chuyển hướng đến trang mới
                                                        }
                                                    });
                                                }

                                                // Gửi form về server nếu hợp lệ

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
    <script>
        const imageInput = document.getElementById('customImageInput');
        const imagePreviewContainer = document.getElementById('customImagePreview');
        const imagePreviewImage = imagePreviewContainer.querySelector('.custom-image-preview__image');
        const imagePreviewText = imagePreviewContainer.querySelector('.custom-image-preview__text');
        imagePreviewContainer.addEventListener('click', function () {
            imageInput.click();
        });
        imageInput.addEventListener('change', function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                imagePreviewText.style.display = 'none';
                imagePreviewImage.style.display = 'block';
                reader.addEventListener('load', function () {
                    imagePreviewImage.setAttribute('src', this.result);
                });
                reader.readAsDataURL(file);
            } else {
                imagePreviewText.style.display = null;
                imagePreviewImage.style.display = null;
                imagePreviewImage.setAttribute('src', '');
            }
        });
    </script>
    <script>
        let sectionCount = 1;

        function addInputSection() {
            const articleContainer = document.createElement("article");
            articleContainer.classList.add("articleContainer");
            const articleContainerdisplay = document.createElement("article");

            const deleteButton = document.createElement("button");
            deleteButton.textContent = "X";
            deleteButton.classList.add("deleteButton");
            deleteButton.onclick = function () {
                articleContainer.remove();
                articleContainerdisplay.remove();
            };

            const titleLabel = document.createElement("label");
            titleLabel.textContent = 'Job Title for Section ' + sectionCount + ' :';
            const titleInput = document.createElement("input");
            titleInput.type = "text";
            titleInput.id = "title" + sectionCount;
            titleInput.name = 'jobTitle';
            titleInput.placeholder = `Enter job title`;


            const dateLabel = document.createElement("label");
            dateLabel.textContent = "Date Range:";
            const dateInput = document.createElement("input");
            dateInput.type = "text";
            dateInput.id = "date" + sectionCount;
            dateInput.name = 'dateRange ' + sectionCount;
            dateInput.placeholder = `Enter date range (e.g., Jan 2020 - Dec 2021)`;

            const descriptionLabel = document.createElement("label");
            descriptionLabel.textContent = "Description:";
            const descriptionInput = document.createElement("textarea");
            descriptionInput.name = 'description';
            descriptionInput.id = "des" + sectionCount;
            descriptionInput.placeholder = "Enter job description";


            const displayTitle = document.createElement("h2");
            const displayDate = document.createElement("p");
            displayDate.className = "subDetails";
            const displayDescrip = document.createElement("p");

            articleContainer.classList.add("articleContainer");
            articleContainer.appendChild(deleteButton);
            articleContainer.appendChild(titleLabel);
            articleContainer.appendChild(titleInput);
            articleContainer.appendChild(dateLabel);
            articleContainer.appendChild(dateInput);
            articleContainer.appendChild(descriptionLabel);
            articleContainer.appendChild(descriptionInput);

            articleContainerdisplay.classList.add("articleContainerdisplay");
            articleContainerdisplay.appendChild(displayTitle);
            articleContainerdisplay.appendChild(displayDate);
            articleContainerdisplay.appendChild(displayDescrip);

            document.getElementById("experience").appendChild(articleContainer);
            document.getElementById("experiencedisplay").appendChild(articleContainerdisplay);


            articleContainer.addEventListener('input', function () {
                const target = event.target;

                if (target.id === titleInput.id) {
                    displayTitle.textContent = target.value;
                } else if (target.id === dateInput.id) {
                    displayDate.textContent = target.value;
                } else if (target.id === descriptionInput.id) {
                    displayDescrip.textContent = target.value;
                }
            });
            sectionCount++;
        }

        function addSkillField() {
            // Tạo một thẻ <li> mới
            const newLi = document.createElement("li");

            const Lidisplay = document.createElement("li");
            newLi.classList.add("skilllist");
//            Lidisplay.style.display= "flex";

            const deleteButton = document.createElement("button");
            deleteButton.textContent = "X";
            deleteButton.classList.add("deleteButtonLi");
            deleteButton.onclick = function () {
                newLi.remove();
                Lidisplay.remove();
            };
            // Tạo thẻ <input> mới bên trong <li>
            const newInput = document.createElement("input");
            newInput.type = "text";
            newInput.placeholder = "Enter a new skill";
            newInput.className = "skillInput";
            newInput.id = "skill";// Thêm class nếu muốn CSS riêng

            // Thêm <input> vào <li>
            newLi.classList.add("skilllist");
            Lidisplay.classList.add("skilllistshow");
            newLi.appendChild(newInput);
            newLi.appendChild(deleteButton);

            // Thêm <li> mới vào danh sách <ul>
            document.getElementById("keySkillsList").appendChild(newLi);
            document.getElementById("keySkillsListshow").appendChild(Lidisplay);

            newInput.addEventListener("input", function () {

                Lidisplay.textContent = newInput.value;

            });
        }


        let EduCount = 1;
        function addEducation() {
            const articleContainer = document.createElement("article");
            articleContainer.classList.add("articleContainerE");
            const articleContainerdisplay = document.createElement("article");

            const deleteButton = document.createElement("button");
            deleteButton.textContent = "Delete";
            deleteButton.classList.add("deleteButton");
            deleteButton.onclick = function () {
                articleContainer.remove();
                articleContainerdisplay.remove();
            };

            const titleLabel = document.createElement("label");
            titleLabel.textContent = 'College/University ' + EduCount + ' :';
            const titleInput = document.createElement("input");
            titleInput.type = "text";
            titleInput.id = "CollegeName" + EduCount;
            titleInput.name = 'CollegeName';
            titleInput.placeholder = `College/University`;


            const dateLabel = document.createElement("label");
            dateLabel.textContent = "Qualification";
            const dateInput = document.createElement("input");
            dateInput.type = "text";
            dateInput.id = "Qualification" + EduCount;
            dateInput.name = 'Qualification ' + EduCount;
            dateInput.placeholder = `Enter Qualification`;

            const descriptionLabel = document.createElement("label");
            descriptionLabel.textContent = "Description:";
            const descriptionInput = document.createElement("textarea");
            descriptionInput.name = 'descriptionE';
            descriptionInput.id = "desE" + EduCount;
            descriptionInput.placeholder = "Enter Education description";


            const displayTitle = document.createElement("h2");
            const displayDate = document.createElement("p");
            displayDate.className = "subDetails";
            const displayDescrip = document.createElement("p");

            articleContainer.classList.add("articleContainerE");
            articleContainer.appendChild(deleteButton);
            articleContainer.appendChild(titleLabel);
            articleContainer.appendChild(titleInput);
            articleContainer.appendChild(dateLabel);
            articleContainer.appendChild(dateInput);
            articleContainer.appendChild(descriptionLabel);
            articleContainer.appendChild(descriptionInput);

            articleContainerdisplay.classList.add("articleContainerdisplayE");
            articleContainerdisplay.appendChild(displayTitle);
            articleContainerdisplay.appendChild(displayDate);
            articleContainerdisplay.appendChild(displayDescrip);

            document.getElementById("education").appendChild(articleContainer);
            document.getElementById("educationdisplay").appendChild(articleContainerdisplay);


            articleContainer.addEventListener('input', function () {
                const target = event.target;

                if (target.id === titleInput.id) {
                    displayTitle.textContent = target.value;
                } else if (target.id === dateInput.id) {
                    displayDate.textContent = target.value;
                } else if (target.id === descriptionInput.id) {
                    displayDescrip.textContent = target.value;
                }
            });
            EduCount++;
        }

        function ViewCV() {
            const inputP = document.getElementById("personal");
            const displayP = document.getElementById("personaldisplay");
            const inputE = document.getElementById("experience");
            const displayE = document.getElementById("experiencedisplay");
            const inputS = document.getElementById("keySkillsList");
            const displayS = document.getElementById("keySkillsListshow");
            const inputEdu = document.getElementById("education");
            const displayEdu = document.getElementById("educationdisplay");

            const view = document.getElementById("view");
            const edit = document.getElementById("edit");
            const send = document.getElementById("send");
            inputP.style.display = "none";
            displayP.style.display = "block";
            inputE.style.display = "none";
            displayE.style.display = "block";
            inputS.style.display = "none";
            displayS.style.display = "block";
            inputEdu.style.display = "none";
            displayEdu.style.display = "block";
            view.style.display = "none";
            edit.style.display = "block";
            send.style.display = "block";
            combineSections();
        }
        function EditCV() {
            const inputP = document.getElementById("personal");
            const displayP = document.getElementById("personaldisplay");
            const inputE = document.getElementById("experience");
            const displayE = document.getElementById("experiencedisplay");
            const inputS = document.getElementById("keySkillsList");
            const displayS = document.getElementById("keySkillsListshow");
            const inputEdu = document.getElementById("education");
            const displayEdu = document.getElementById("educationdisplay");

            const view = document.getElementById("view");
            const edit = document.getElementById("edit");
            const send = document.getElementById("send");
            inputP.style.display = "block";
            displayP.style.display = "none";
            inputE.style.display = "block";
            displayE.style.display = "none";
            inputS.style.display = "block";
            displayS.style.display = "none";
            inputEdu.style.display = "block";
            displayEdu.style.display = "none";
            view.style.display = "block";
            edit.style.display = "none";
            send.style.display = "none";
//                
        }

        const personal = document.getElementById("description");
        const personaldisplay = document.getElementById("descriptiondisplay");
        personal.addEventListener("input", function () {
            personaldisplay.textContent = personal.value;
        });

        function combineSections() {
            const articles = document.querySelectorAll(".articleContainer");
            const skilllist = document.querySelectorAll("#keySkillsList input");
            const articlesE = document.querySelectorAll(".articleContainerE");

            let exper = "";
            let skill = "";
            let edu = "";
            articlesE.forEach((article) => {
                const title = article.querySelector("input[name^='CollegeName']").value;
                const date = article.querySelector("input[name^='Qualification']").value;
                const description = article.querySelector("textarea[name^='descriptionE']").value;
                const edue = title + '*' + date + '*' + description;
                edu += '+' + edue;
            });

            skilllist.forEach((sk) => {
                skill += '&' + sk.value;

            });
            articles.forEach((articlee) => {
                const name = articlee.querySelector("input[name^='jobTitle']").value;
                const quan = articlee.querySelector("input[name^='dateRange']").value;
                const description = articlee.querySelector("textarea[name^='description']").value;
                const expe = name + '*' + quan + '*' + description;
                exper += '+' + expe;
            });

            exper = exper.startsWith('+') ? exper.slice(1) : exper;
            skill = skill.startsWith('&') ? skill.slice(1) : skill;
            edu = edu.startsWith('+') ? edu.slice(1) : edu;
            document.getElementById("ep").value = exper;
            document.getElementById("ski").value = skill;
            document.getElementById("ed").value = edu;
            console.log(exper);
            console.log(edu);
            console.log(skill);


        }


    </script>
    <style>
        /* Styling for each input section */
        .articleContainer {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 15px;
            position: relative;
        }
        .articleContainer label {
            font-weight: bold;
        }
        .articleContainer input, .articleContainer textarea {
            width: 100%;
            margin: 5px 0 10px;
        }
        .deleteButton {
            position: absolute;
            top: 10px;
            right: 10px;
            color: black;
            /*color: white;*/
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>
    <style>
        /* Styling for each input section */
        .articleContainerE {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 15px;
            position: relative;
        }
        .articleContainerE label {
            font-weight: bold;
        }
        .articleContainerE input, .articleContainerE textarea {
            width: 100%;
            margin: 5px 0 10px;
        }
        .skilllist{
            position: relative;

        }
        .skilllist input{
            width: 100px;
        }
        .deleteButtonLi {
            /*position: absolute;*/
            top: 10px;
            right: 10px;
            color: black;
            /*color: white;*/
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>






</html>
