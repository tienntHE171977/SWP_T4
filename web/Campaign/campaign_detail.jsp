<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <!-- [Previous head content remains the same] -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Charifit - Event List</title>
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
        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

        <style>
            /*            .event-grid {
                            display: grid;
                            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
                            gap: 20px;
                            padding: 20px;
                        }
                        .event-card {
                            background-color: #fff;
                            border-radius: 8px;
                            overflow: hidden;
                            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                        }
                        .event-info {
                            padding: 15px;
                        }
                        .event-title {
                            font-size: 18px;
                            font-weight: bold;
                            margin: 0 0 10px;
                        }
                        .event-stats {
                            display: flex;
                            justify-content: space-between;
                            margin-bottom: 10px;
                            color: #666;
                            font-size: 14px;
                        }
                        .progress {
                            height: 5px;
                            margin-bottom: 10px;
                        }
                        .progress-bar {
                            background-color: #4CAF50;
                        }*/

            .campaign-detail {
                background-color: #f9f9f9; /* Màu nền nhẹ */
                padding: 20px; /* Đệm xung quanh nội dung */
                border-radius: 5px; /* Bo góc */
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
                margin: 20px 0; /* Khoảng cách trên dưới */
            }

            .campaign-title {
                font-size: 24px; /* Kích thước chữ lớn hơn */
                color: #333; /* Màu chữ */
                margin-bottom: 10px; /* Khoảng cách dưới tiêu đề */
            }

            .campaign-info {
                line-height: 1.6; /* Khoảng cách giữa các dòng */
            }

            .campaign-description {
                margin-top: 10px; /* Khoảng cách trên mô tả */
                font-style: italic; /* Đậm nghiêng */
                color: #555; /* Màu chữ nhẹ hơn cho mô tả */
            }

            .campaign-list {
                margin-top: 20px; /* Khoảng cách giữa phần thông tin chi tiết và bảng */
            }

            .table {
                width: 100%; /* Đảm bảo bảng chiếm toàn bộ chiều rộng */
                border-collapse: collapse; /* Kết hợp các viền */
            }

            .table th, .table td {
                padding: 10px; /* Đệm cho ô */
                border: 1px solid #ddd; /* Viền cho ô */
                text-align: left; /* Căn trái cho văn bản */
            }

            .table th {
                background-color: #f2f2f2; /* Màu nền cho tiêu đề */
                color: #333; /* Màu chữ cho tiêu đề */
            }
            .table td {
                font-family: Arial, sans-serif;
            }

            .table tr:hover {
                background-color: #f5f5f5; /* Hiệu ứng khi di chuột qua hàng */
            }
            .close-comment {
                color: #d9534f; /* Màu đỏ cho dấu "X" */
                text-decoration: none; /* Bỏ gạch chân */
                font-size: 18px; /* Kích thước cho dấu "X" */
                float: right; /* Đẩy dấu "X" về bên phải */
            }
            .status-label {
                border-radius: 12px; /* Độ bo tròn của góc */
                background-color: #28a745; /* Màu nền xanh lá cây đậm */
                padding: 5px 10px; /* Khoảng cách bên trong */
                color: white; /* Màu chữ */
                display: inline-block; /* Hiển thị như một khối để áp dụng bo tròn */
            }

        </style>
    </head>

    <body>
        <!-- [Previous header and bradcam sections remain the same] -->

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

        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Project Campaign</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="popular_causes_area section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb-55">
                            <h3><span>Campaign Detail</span></h3>
                        </div>
                    </div>
                </div>
                <!-- Modal for Updating Member Details -->
                <div class="modal fade" id="updateMemberModal" tabindex="-1" aria-labelledby="updateMemberModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="updateMemberModalLabel">Update Member Details</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="UpdateMemberCampaign" method="POST">
                                <div class="modal-body">
                                    <input type="hidden" id="memberId" name="memberId">
                                    <div class="mb-3">
                                        <label for="job" class="form-label">Job</label>
                                        <input type="text" class="form-control" id="job" name="job" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="">Select Status</option> <!-- Placeholder option -->
                                            <option value="Interested">Interested</option>
                                            <option value="Joined">Joined</option>
                                        </select>
                                    </div>
                                    <div class="btn-container text-center">
                                        <button type="submit" class="btn btn-primary">Update Member</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="form-container">
                            <!-- View form action to match servlet mapping -->
                            <div class="campaign-detail">
                                <h2 class="campaign-title">${detail.campaignName}
                                    <a href="CampaignManage" class="close-comment" title="Close" onclick="closeCommentDetail()">
                                        <i class="fa fa-times" aria-hidden="true"></i>
                                    </a>
                                </h2>

                                <div class="campaign-info">
                                    <p><strong>Project Name:</strong> ${detail.projectName}</p>
                                    <p><strong>Created Date:</strong> ${detail.createDate}</p>
                                    <p><strong>Location:</strong> ${detail.campaignLocation}</p>
                                    <p><strong>Description:</strong></p>
                                    <p class="campaign-description">${detail.description}</p>
                                    <p><strong>Job:</strong> ${detail.campaignJob}</p>
                                </div>
                            </div>
                            <!-- Bảng danh sách -->
                            <div class="campaign-list">
                                <h3>Participants List</h3>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="width:5%">ID</th>
                                            <th style="width:25%">Name</th>
                                            <th style="width:35%">Job</th>
                                            <th style="width:15%">Participation Date</th>
                                            <th style="width:8%">Status</th>
                                            <th style="width:7%">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="o" items="${listM}">
                                            <tr>
                                                <td>${o.memberID}</td>
                                                <td>${o.memberName}</td>
                                                <td>${o.memberJob}</td>
                                                <td>${o.joinedDate}</td>
                                                <td> 
                                                    <span class="status-label">${o.status}</span>
                                                </td>

                                                <td>
                                                    <a href="#" 
                                                       class="btn btn-sm btn-info" 
                                                       onclick="showUpdateMemberModal('${o.memberID}', '${o.memberJob}', '${o.status}')">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Bảng danh sách -->
                            <div class="campaign-list">
                                <h3>Comment List</h3>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="width:5%">ID</th>
                                            <th style="width:25%">User Name</th>
                                            <th style="width:45%">Comment</th>
                                            <th style="width:25%">Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>                    
                                        <c:forEach var="comment" items="${listCC}">
                                            <tr>
                                                <td>${comment.ccommentID}</td>
                                                <td>${comment.userName}</td>
                                                <td>${comment.comment}</td>
                                                <td>${comment.date}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- [Previous footer and JS sections remain the same] -->

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
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
    <script src="js/main.js"></script>
    <script>// Function to populate the modal with member data and show it
                                function showUpdateMemberModal(memberId, job, status) {
                                    // Set values in the modal
                                    document.getElementById('memberId').value = memberId;
                                    document.getElementById('job').value = job;
                                    document.getElementById('status').value = status;

                                    // Show the modal
                                    const modal = new bootstrap.Modal(document.getElementById('updateMemberModal'));
                                    modal.show();
                                }
    </script>

</body>
</html>