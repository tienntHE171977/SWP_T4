<%-- 
    Document   : blog
    Created on : Sep 18, 2024, 8:46:15 AM
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
                            <h3>Tin tức</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end  -->


        <!--================Blog Area =================-->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <!-- Danh sách các news -->

                            <article class="blog_item">
                                <c:if test="${not empty listP}">
                                    <c:forEach items="${listP}" var="o">
                                        <div class="blog_item_img">
                                            <img class="card-img rounded-0" src="${o.image}" alt="">
                                            <a href="#" class="blog_item_date">
                                                <p>${o.updatedDate}</p>
                                            </a>
                                        </div>

                                        <div class="blog_details">
                                            <a class="d-inline-block" href="SingleBlog?postID=${o.newsID}">
                                                <h2>${o.title}</h2>
                                            </a>
                                            <p>${o.message}</p>
                                            <ul class="blog-info-link mt-3 mb-4">
                                                <li><a><i class="fa fa-user"></i> </a></li>
                                                <li><a><i class="fa fa-comments"></i> Bình luận</a></li>
                                            </ul>
                                        </div>

                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty listP}">
                                    <tr>
                                        <td colspan="6" class="text-center">Không có bài viết nào.</td>
                                    </tr>
                                </c:if>
                            </article>

                            <!-- Phân trang -->
                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="?index=${tag > 1 ? tag - 1 : 1}&txt=${txtS}&categoryID=${categoryID}&sortby=${sortby}" class="page-link" aria-label="Previous">
                                            <i class="fa-solid fa-angles-left"></i>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${endP}" var="i">
                                        <li class="${tag == i ? 'act' : ''}">
                                            <a href="?index=${i}&txt=${txtS}&categoryID=${categoryID}&sortby=${sortby}" class="page-link">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a href="?index=${tag < endP ? tag + 1 : endP}&txt=${txtS}&categoryID=${categoryID}&sortby=${sortby}" class="page-link" aria-label="Next">
                                            <i class="fa-solid fa-angles-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav>



                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <jsp:include page="right.jsp"></jsp:include>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================Blog Area =================-->

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
            $('.datepicker').datepicker({
                iconsLibrary: 'fontawesome',
                icons: {
                    rightIcon: '<span class="fa fa-calendar"></span>'
                }
            });

            $('.timepicker').timepicker({
                iconsLibrary: 'fontawesome',
                icons: {
                    rightIcon: '<span class="fa fa-clock-o"></span>'
                }
            });
            $(document).ready(function () {
                $('.js-example-basic-multiple').select2();
            });
        </script>
    </body>
</html>
