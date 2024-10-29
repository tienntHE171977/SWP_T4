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
            background-image: url('images/job297-ploy-03a-green-01.jpg');
            width: 95%; /* Chiều rộng của phần tử */
            height: 545px; /* Chiều cao của phần tử */
            margin: auto;
            margin-bottom: 30px;
            background-size: cover; /* Tự động điều chỉnh kích thước ảnh để bao phủ toàn bộ phần tử */
            background-position: center; /* Đặt vị trí trung tâm của ảnh */
            background-repeat: no-repeat; /* Không lặp lại ảnh */
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
        .RegFormGroup input[type="radio"] {
            margin-left: 200px;
            width: 100px;
            height: 100px;
            padding: 12px; /* Adjusted padding for better visibility */
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 5px;
            font-size: 16px;    /* Khoảng cách giữa nút radio và nhãn */
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
        .CustomFormGroup {
            margin-bottom: 20px;
            text-align: center;
        }

        .CustomFileInput {
            display: none;
        }

        .custom-image-preview {
            width: 200px;
            height: 200px;
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

        .custom-image-preview__image {
            display: none;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%; /* Tạo hình tròn */
        }

        .custom-image-preview__text {
            color: #ccc;
            font-size: 16px;
            text-align: center;
            pointer-events: none; /* Để chữ không cản trở việc nhấp chuột vào input */
        }
        .page {
            padding: 20px;
            display: block;
        }
    </style>

    <body style="background-color: #ccffcc">
        <!--[if lte IE 9]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->


        <!-- header-start -->
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
                                    <a href="index.html">
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
        <!-- header-end -->

        <!-- slider_area_start -->


        <div class="RegContainer">
            <div style="padding: 100px">
                <h1 style="text-align: center; color: #666; padding-top: 35px">Register to open a charity account</h1>
                <h4 style="text-align: center;font-size: 23px;
                    line-height: 1.6; color: #666; padding-top: 50px;">Charifit accepts your registration to open a charity account. In case you meet the required conditions, we will contact you by phone or email within 3 working days.</h4>
                <h4 style="text-align: center;font-size: 23px;
                    line-height: 1.6; color: #666; padding-top: 20px;"> Thank you for your interest and support in building a charity social network in Vietnam.</h4>
                <div style="display: flex; justify-content: center; padding-top: 70px">
                    <div class="logo">
                        <a href="index.html">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div style="padding-bottom: 11px; margin-top: -20px;display: flex;justify-content: center; ">

            <a href="home" style="
               color: white;
               /*display: flex;*/
               justify-content: center;
               padding:  8px 100px;
               border: none;
               border-radius: 5px;
               cursor: pointer;
               font-size: 16px;
               background-color: #009966">Back to home page</a>
               

        </div>



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


                                            window.scrollTo({top: 80, behavior: 'smooth'});
    </script>



</html>
