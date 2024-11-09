<%-- 
    Document   : single-blog
    Created on : Sep 18, 2024, 8:50:55 AM
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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
        <style>
            .invisible {
                visibility: hidden;
            }
            .nav-container {
                display: flex;
                justify-content: space-between; /* Đặt khoảng cách đều giữa "Tin tức Trước" và "Tin tức Sau" */
                align-items: center;
                padding: 15px 0; /* Khoảng cách trên và dưới */
            }

            .nav-left, .nav-right {
                display: flex;
                align-items: center;
            }

            .truncate {
                max-width: 240px; /* Giới hạn độ rộng cho tiêu đề */
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis; /* Thêm dấu ba chấm khi tiêu đề quá dài */
            }

            .details {
                display: flex;
                flex-direction: column;
            }

            .mr-2 {
                margin-right: 8px;
            }

            .mr-3 {
                margin-right: 16px;
            }

            .text-right {
                text-align: right;
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
                            <h3>Chi tiết Tin tức</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end  -->

        <!--================Blog Area =================-->
        <section class="blog_area single-post-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 posts-list">
                        <div class="single-post">
                            <div class="feature-img">
                                <img class="img-fluid" src="${detail.image}" style="width: 710px; height: 450px" alt="">
                            </div>
                            <div class="blog_details">
                                <h2>${detail.title}
                                </h2>
                                <ul class="blog-info-link mt-3 mb-4">
                                    <li><a ><i class="fa fa-user"></i> ${detail.updatedDate}</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i>${total} Bình luận</a></li>
                                </ul>
                                <p class="excert" style="white-space: pre-line;">
                                    ${detail.content}
                                </p>


                                <div class="quote-wrapper">
                                    <div class="quotes">
                                        ${detail.message}
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="navigation-top">
                            <div class="navigation-area">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="nav-container d-flex justify-content-between align-items-center">

                                            <!-- Previous Post -->
                                            <div class="nav-left d-flex align-items-center ${empty prevPost ? 'invisible' : ''}">
                                                <div class="thumb mr-3">
                                                    <a href="SingleBlog?postID=${prevPost.newsID}">
                                                        <img src="${prevPost.image}" alt="Previous Post Image" style="width: 70px; height: 70px;">
                                                    </a>
                                                </div>
                                                <div class="arrow mr-2">
                                                    <a href="SingleBlog?postID=${prevPost.newsID}">
                                                        <span class="fa-solid fa-arrow-left"></span>
                                                    </a>
                                                </div>
                                                <div class="details">
                                                    <p>Tin tức Trước</p>
                                                    <a href="SingleBlog?postID=${prevPost.newsID}">
                                                        <h4 class="truncate">${prevPost.title}</h4>
                                                    </a>
                                                </div>
                                            </div>

                                            <!-- Next Post -->
                                            <div class="nav-right d-flex align-items-center ${empty nextPost ? 'invisible' : ''}">
                                                <div class="details text-right mr-2">
                                                    <p>Tin tức Sau</p>
                                                    <a href="SingleBlog?postID=${nextPost.newsID}">
                                                        <h4 class="truncate">${nextPost.title}</h4>
                                                    </a>
                                                </div>
                                                <div class="arrow mr-3">
                                                    <a href="SingleBlog?postID=${nextPost.newsID}">
                                                        <span class="fa-solid fa-arrow-right"></span>
                                                    </a>
                                                </div>
                                                <div class="thumb">
                                                    <a href="SingleBlog?postID=${nextPost.newsID}">
                                                        <img src="${nextPost.image}" alt="Next Post Image" style="width: 70px; height: 70px;">
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="comments-area">
                            <h4>${total} Bình luận</h4>
                            <c:forEach items="${comments}" var="o">
                                <div class="comment-list">
                                    <div class="single-comment justify-content-between d-flex">
                                        <div class="user justify-content-between d-flex">
                                            <div class="thumb">
                                                <img src="img/comment/comment_1.png" alt="">
                                            </div>
                                            <div class="desc">
                                                <p class="comment">
                                                    ${o.comment}
                                                </p>
                                                <div class="d-flex justify-content-between">
                                                    <div class="d-flex align-items-center">
                                                        <h5>
                                                            <a href="#">${o.userName}</a>
                                                        </h5>
                                                        <!--                                                    <p class="date">December 4, 2017 at 3:12 pm </p>-->
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="comment-form">
                                <h4>Nhập bình luận</h4>
                                <form class="form-contact comment_form" action="AddCommentBlog" method="post" id="commentForm">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9" placeholder="Write Comment" required></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="hidden" name="news_id" value="${detail.newsID}">

                                    <div class="form-group">
                                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">Gửi bình luận</button>
                                    </div>
                                </form>
                            </div>
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
        <!--================ Blog Area end =================-->

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
        </script>
    </body>

</html>