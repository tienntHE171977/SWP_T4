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
                                        <li><a href="#"> <i class="fa fa-phone"></i> +1 (454) 556-5656</a></li>
                                        <li><a href="#"> <i class="fa fa-envelope"></i>Yourmail@gmail.com</a></li>
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
                            <div class="col-xl-9 col-lg-9">
                                <div class="main-menu">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="index.html">home</a></li>
                                            <li><a href="About.html">About</a></li>
                                            <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">blog</a></li>
                                                    <li><a href="single-blog.html">single-blog</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="elements.html">elements</a></li>
                                                    <li><a href="Cause.html">Cause</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="contact.html">Contact</a></li>
                                        </ul>
                                    </nav>
                                    <div class="Appointment">
                                        <div class="book_btn d-none d-lg-block">
                                            <a data-scroll-nav='1' href="#">Make a Donate</a>
                                        </div>
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

        <!-- bradcam_area_start  -->
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Single Blog</h3>
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
                                <img class="img-fluid" src="${detail.image}" alt="">
                            </div>
                            <div class="blog_details">
                                <h2>${detail.title}
                                </h2>
                                <ul class="blog-info-link mt-3 mb-4">
                                    <li><a ><i class="fa fa-user"></i> ${detail.updatedDate}</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i>${total} Comments</a></li>
                                </ul>
                                <p class="excert">
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
                            <!--                            <div class="d-sm-flex justify-content-between text-center">
                                                            <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
                                                                people like this</p>
                                                            <div class="col-sm-4 text-center my-2 my-sm-0">
                                                                 <p class="comment-count"><span class="align-middle"><i class="fa fa-comment"></i></span> 06 Comments</p> 
                                                            </div>
                                                            <ul class="social-icons">
                                                                <li><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                                            </ul>
                                                        </div>-->

                            <div class="navigation-area">
                                <div class="row">
                                    <!-- Prev Post -->
                                    <c:if test="${not empty prevPost}">
                                        <div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                            <div class="thumb">
                                                <a href="SingleBlog?postID=${prevPost.newsID}">
                                                    <img src="${prevPost.image}" alt="" style="width: 70px; height: 70px;">
                                                </a>
                                            </div>
                                            <div class="arrow">
                                                <a href="SingleBlog?postID=${prevPost.newsID}">
                                                    <span class="lnr text-white ti-arrow-left"></span>
                                                </a>
                                            </div>
                                            <div class="detials">
                                                <p>Prev Post</p>
                                                <a href="SingleBlog?postID=${prevPost.newsID}">
                                                    <h4>${prevPost.title}</h4>
                                                </a>
                                            </div>
                                        </div>
                                    </c:if>

                                    <!-- Next Post -->
                                    <c:if test="${not empty nextPost}">
                                        <div class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                                            <div class="detials">
                                                <p>Next Post</p>
                                                <a href="SingleBlog?postID=${nextPost.newsID}">
                                                    <h4>${nextPost.title}</h4>
                                                </a>
                                            </div>
                                            <div class="arrow">
                                                <a href="SingleBlog?postID=${nextPost.newsID}">
                                                    <span class="lnr text-white ti-arrow-right"></span>
                                                </a>
                                            </div>
                                            <div class="thumb">
                                                <a href="SingleBlog?postID=${nextPost.newsID}">
                                                    <img src="${nextPost.image}" alt="" style="width: 70px; height: 70px;">
                                                </a>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <div class="comments-area">
                            <h4>${total} Comments</h4>
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
                                <h4>Leave a Reply</h4>
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
                                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">Send Message</button>
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