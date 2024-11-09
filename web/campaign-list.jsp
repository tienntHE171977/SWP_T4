<%-- 
    Document   : campaign-list
    Created on : Sep 18, 2024, 8:46:43 AM
    Author     : FPT
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
        
        <!-- <link rel="stylesheet" href="css/responsive.css"> -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
        
        <style>
            .act {
                color: red;
                text-decoration: underline;
            }
            /* Căn chỉnh và tạo khoảng cách */
            .blog_item {
                padding: 20px;
                background-color: #f8f9fa; /* Màu nền nhẹ nhàng */
                border-radius: 10px; /* Bo tròn góc cho phần tử chính */
            }

            .single_cause {
                border-radius: 10px;
                overflow: hidden;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .single_cause:hover {
                transform: translateY(-5px); /* Hiệu ứng nổi khi hover */
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15); /* Hiệu ứng bóng đổ */
            }

            .causes_content {
                padding: 15px;
            }

            .campaign-title {
                font-size: 1.25rem;
                font-weight: bold;
                margin-bottom: 10px;
                color: #000;

            }

            .read_more {
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .read_more:hover {
                background-color: #007bff; /* Màu xanh khi hover */
                color: white;
            }
            /* Tùy chỉnh thẻ select */
            form .form-select {
                border: 1px solid rgba(0, 0, 0, 0.1); /* Viền mờ màu xám nhạt */
                border-radius: 4px;
            }

            /* Nút Sort với màu trắng và viền xanh */
            form .btn-info {
                background-color: white;
                border: 1px solid #3CC78F; /* Viền màu xanh */
                color: #3CC78F; /* Màu chữ xanh */
                transition: all 0.3s ease; /* Hiệu ứng mượt khi di chuột vào */
            }

            /* Hiệu ứng khi di chuột vào nút */
            form .btn-info:hover {
                background-color: #3CC78F; /* Màu nền xanh khi di chuột */
                color: white; /* Màu chữ trắng khi di chuột */
            }

        </style>
    </head>

    <body>
        <!--[if lte IE 9]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
            <![endif]-->


        <!-- header-start -->
        <header>
            <div class="header-area ">
                <div class="header-top_area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6 col-md-12 col-lg-8">
                                <div class="short_contact_list">
                                    <ul>
<!--                                        <li><a href="#"> <i class="fa fa-phone"></i> +1 (454) 556-5656</a></li>
                                        <li><a href="#"> <i class="fa fa-envelope"></i>Yourmail@gmail.com</a></li>-->
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-lg-4">
                                <div class="social_media_links d-none d-lg-block">
<!--                                    <a href="#">
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
                                    </a>-->
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
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
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
                            <h3>Hoạt động thực tế</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end  -->

        <!-- popular_causes_area_start  -->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <article class="blog_item">
                                <c:forEach var="o" items="${list}">
                                    <div class="col-lg-12 col-md-12 mb-4">
                                        <div class="single_cause card shadow-sm border-0">
                                            <div class="causes_content card-body">
                                                <div class="balance d-flex justify-content-between align-items-center mb-3">
                                                    <span class="text-muted">${o.createDate}</span>
                                                    <span class="font-weight-bold">${o.projectName}</span>
                                                </div>
                                                <a  class="text-decoration-none">
                                                    <h4 class="campaign-title ">${o.campaignName}</h4>
                                                </a>
                                                <p class="text-muted mb-3">${o.campaignLocation}</p>
                                                <a class="read_more" href="project-details?CID=${o.campaignID}">Đọc thêm</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </article>


                            <!-- popular_causes_area_end  -->
                            <!-- Phân trang -->
                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="?index=${tag > 1 ? tag - 1 : 1}&sortby=${sortby}&txt=${txtS}" class="page-link" aria-label="Previous">
                                            <i class="fa-solid fa-angles-left"></i>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${endP}" var="i">
                                        <li class="${tag == i ? 'act' : ''}">
                                            <a href="?index=${i}&sortby=${sortby}&txt=${txtS}" class="page-link">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a href="?index=${tag < endP ? tag + 1 : endP}&sortby=${sortby}&txt=${txtS}" class="page-link" aria-label="Next">
                                            <i class="fa-solid fa-angles-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget newsletter_widget">
                                <h4 class="widget_title">Sắp xếp</h4>

                                <form action="CampaignSort" method="post" class="d-flex align-items-center">
                                    <label for="sortby" class="mb-0 me-2"></label>
                                    <select id="sortby" name="sortby" class="form-select me-2">
                                        <option value="">-- Sắp xếp --</option>
                                        <option value="Title">Tiêu đề</option>
                                        <option value="Date">Thời gian</option>
                                        <option value="Project">Dự án</option>
                                    </select>
                                    <button type="submit" class="btn btn-info">Đi</button>
                                </form>
                            </aside>
                            <aside class="single_sidebar_widget search_widget">
                                <form action="CampaignSearch" method="post">
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <input value="${txtS}" name="txt" type="text" class="form-control" placeholder='Nhập từ khóa'
                                                   onfocus="this.placeholder = ''"
                                                   onblur="this.placeholder = 'Search Keyword'">
                                            <div class="input-group-append">
                                                <button class="btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                            type="submit">Tìm kiếm</button>
                                </form>
                            </aside>
                        </div>
                    </div>
                </div> 
            </div>
        </section>

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
