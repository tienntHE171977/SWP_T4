<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Event Details - Charifit</title>
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
            .event-details-section {
                padding: 60px 0;
            }
            .event-header {
                margin-bottom: 30px;
            }
            .event-stats {
                background: #f8f9fa;
                padding: 20px;
                border-radius: 5px;
                margin-bottom: 30px;
            }
            .stat-item {
                margin-bottom: 15px;
            }
            .progress {
                height: 25px;
                margin-bottom: 20px;
            }
            .progress-bar {
                position: relative;
            }
            .progress-text {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: white;
                font-weight: bold;
            }
            .donate-section {
                background: #fff;
                padding: 30px;
                border-radius: 5px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            .quantity-input {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .donation-button {
                width: 100%;
                padding: 15px;
                background: #FF5F13;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background 0.3s ease;
            }
            .donation-button:hover {
                background: #e54d0a;
            }
            .table {
                margin-top: 15px;
            }
            .table th, .table td {
                padding: 12px;
                vertical-align: middle;
            }
            .text-right {
                text-align: right;
            }
        </style>
    </head>

    <body>
        <!-- Header include here -->
        <header>
           
        </header>

        <!-- bradcam_area_start -->
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Chi tiết sự kiện</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end -->

        <!-- Event Details Start -->
        <div class="event-details-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="event-header">
                            <h2>${event.itemName}</h2>
                            <p>ID dự án: ${event.projectId}</p>
                        </div>

                        <div class="event-stats">
                            <div class="stat-item">
                                <h4>Tiến trình</h4>
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" 
                                         style="width: ${progressPercentage}%;" 
                                         aria-valuenow="${progressPercentage}" 
                                         aria-valuemin="0" 
                                         aria-valuemax="100">
                                        <span class="progress-text">${progressPercentage}%</span>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <div class="stat-item">
                                        <h5>Thông tin chi tiết</h5>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Giới thiệu</th>
                                                    <th>Số lượng (${event.unit})</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Số lượng cần</td>
                                                    <td class="text-right">${event.quantityNeeded}</td>
                                                </tr>
                                                <tr>
                                                    <td>Đã được tài trợ</td>
                                                    <td class="text-right">${event.quantityProvided}</td>
                                                </tr>
                                                <tr class="table-info">
                                                    <td><strong>Cần thêm:</strong></td>
                                                    <td class="text-right"><strong>${event.quantityNeeded - event.quantityProvided}</strong></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <div class="donate-section">
                            <h4>Make a Contribution</h4>
                            <form action="donate-to-event" method="POST">
                                <input type="hidden" name="eventId" value="${event.eventId}">
                                <div class="form-group">
                                    <label for="quantity">Quantity (${event.unit})</label>
                                    <input type="number" class="quantity-input" id="quantity" name="quantity" 
                                           min="1" max="${event.quantityNeeded - event.quantityProvided}">
                                </div>
                                <button type="submit" class="donation-button">Contribute Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Event Details End -->

        <!-- Footer include here -->
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
    </body>
</html>