<%-- 
    Document   : project-campaigns
    Created on : Oct 18, 2024, 7:45:16 AM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />

        <!-- <link rel="stylesheet" href="css/responsive.css"> -->
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1200px;
                margin: auto;
                background-color: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .tab {
                overflow: hidden;
                background-color: #f1f1f1;
                display: flex;
            }

            .tab button {
                background-color: inherit;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: background-color 0.3s ease;
                font-size: 16px;
                flex: 1;
            }

            .tab button:hover {
                background-color: #ddd;
            }

            .tab button.active {
                background-color: #ccc;
            }

            .tabcontent {
                display: none;
                padding: 20px;

                border-top: none;
            }

            .tabcontent h4 {
                margin-top: 0;
            }
            .tabcontent p {
                font-weight: 300; /* Giảm độ đậm xuống nhẹ hơn */
            }


            .info-list {
                list-style-type: none; /* Bỏ dấu đầu dòng */
                padding: 0;
            }

            .info-list li {
                margin-bottom: 10px; /* Khoảng cách giữa các mục */
            }

            .item {
                cursor: pointer; /* Hiển thị con trỏ chuột khi di chuột qua */
                background-color: #f0f0f0; /* Nền cho mục danh sách */
                padding: 10px; /* Đệm cho mục danh sách */
                border-radius: 4px; /* Bo góc */
                display: flex; /* Sử dụng flexbox */
                justify-content: space-between; /* Căn giữa */
            }

            .details {
                display: none; /* Ẩn thông tin chi tiết ban đầu */
                padding: 10px;
                background-color: #e7f3fe; /* Nền cho thông tin chi tiết */
                border: 1px solid #b3d7ff; /* Viền cho thông tin chi tiết */
                border-radius: 4px; /* Bo góc */
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
                                        <!--                                            <li><a href="#"> <i class="fa fa-phone"></i>0999999999</a></li>
                                                                                    <li><a href="#"> <i class="fa fa-envelope"></i>team4charifit@gmail.com</a></li>-->
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
                                            <li><a href="Blog">Tin tức </a></li>
                                            <li><a href="project-list">Dự án <i class="fa-solid fa-chevron-down"></i></a>
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

        <!-- bradcam_area_end  -->

        <!-- popular_causes_area_start  -->
        <div class="popular_causes_area pt-120 cause_details">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="single_cause">
                            <!-- Project Image -->
                            <div class="thumb">
                                <img src="img/causes/large_img.png" alt="Project Image" class="img-fluid">
                            </div>

                            <div class="causes_content">
                                <!-- Progress Bar -->

                                <!-- Project Details Section -->
                                <div class="project-details p-4 bg-white rounded shadow-sm">
                                    <!-- Management Buttons -->
                                    <div class="management-buttons d-flex gap-3 mb-4">
                                        <a href="${pageContext.request.contextPath}/CampaignManage?PID=${project.projectId}" 
                                           class="btn btn-primary btn-lg">

                                            Quản lý chiến dịch
                                        </a>
                                        <a href="${pageContext.request.contextPath}/project-event-manage?projectId=${project.projectId}" 
                                           class="btn btn-warning btn-lg">

                                            Quản lý sự kiện
                                        </a>
                                    </div>

                                    <!-- Details Content -->
                                    <div class="details-content">
                                        <h4 class="border-bottom pb-2 mb-4">Chi tiết dự án</h4>
                                        <div class="project-info">
                                            <p class="lead mb-4">${project.description}</p>

                                            <div class="row g-3">
                                                <div class="table-responsive" style="padding: 15px;">
                                                    <p style="font-size: 18px; line-height: 1.6;">${project.description}</p>
                                                    <h4 style="font-size: 22px; font-weight: bold; color: #444;">Project Details</h4>
                                                    <ul style="font-size: 18px; line-height: 1.8;">
                                                        <li>Tên dự án: ${project.title}</li>
                                                        <li>Ngày bắt đầu:  ${project.startDate} </li>
                                                        <li>Ngày kết thúc:  ${project.endDate} </li>
                                                        <li>Trạng thái: ${project.status}</li>
                                                        <li>Tài liệu: ${project.document}</li>
                                                        <li>Tạo lúc: ${project.createdAt}</li>




                                                    </ul>
                                                </div>
                                                <div class="col-md-6">
                                                    <p class="mb-3">
                                                        <strong>Trạng thái:</strong>
                                                        <c:choose>
                                                            <c:when test="${project.status == 'approved'}">
                                                                <span class="badge bg-success">${project.status}</span>
                                                            </c:when>
                                                            <c:when test="${project.status == 'pending'}">
                                                                <span class="badge bg-warning">${project.status}</span>
                                                            </c:when>
                                                            <c:when test="${project.status == 'rejected'}">
                                                                <span class="badge bg-danger">${project.status}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-secondary">${project.status}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
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

                <!-- link that opens popup -->
                <script>
                    function toggleDetails(event) {
                        const details = event.target.nextElementSibling; // Lấy phần tử kế tiếp
                        if (details.style.display === "block") {
                            details.style.display = "none"; // Ẩn nếu đang hiển thị
                        } else {
                            details.style.display = "block"; // Hiện nếu đang ẩn
                        }
                    }

                </script>


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

                </html>

