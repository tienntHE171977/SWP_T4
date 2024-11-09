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
                                        <li><a href="#"> <i class="fa fa-phone"></i>0999999999</a></li>
                                        <li><a href="#"> <i class="fa fa-envelope"></i>team4charifit@gmail.com</a></li>
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
                            <!--                                    -->

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
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center" style=" background: #00a65a; color: #e7f3fe; margin: 0px">
                            <h3>Dự án</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- bradcam_area_end  -->

        <!-- popular_causes_area_start  -->
        <div class="popular_causes_area pt-120 cause_details ">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="single_cause">
                            <div class="thumb">
                                <img src="img/causes/large_img.png" alt="">
                            </div>
                            <div class="causes_content">

                                <div class="tab-container">
                                    <div class="tab">
                                        <button class="tablinks" onclick="openTab(event, 'Description')" id="defaultOpen">Mô tả</button>
                                        <button class="tablinks" onclick="openTab(event, 'Campaigns')">Chiến dịch</button>
                                        <button class="tablinks" onclick="openTab(event, 'ProjectEvents')">Sự kiện</button>

                                    </div>

                                    <div id="Description" class="tabcontent" style="height: 300px">
                                        <div class="card-body p-0">
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
                                        </div>
                                    </div>

                                    <jsp:include page="campaign-details.jsp"></jsp:include>

                                        <div id="ProjectEvents" class="tabcontent" style="height: auto;">
                                            <h4>Sự kiện</h4>
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID sự kiện</th>
                                                        <th>Tên hàng hóa</th>
                                                        <th>Số lượng cần</th>
                                                        <th>Đã được tài trợ</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="event" items="${projectEvents}">
                                                    <tr>
                                                        <td>${event.eventId}</td>
                                                        <td>${event.itemName}</td>
                                                        <td>${event.quantityNeeded} ${event.unit}</td>
                                                        <td>${event.quantityProvided} ${event.unit}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="make_donation_area section_padding">
                                            <div class="container">
                                                <div class="row justify-content-center">
                                                    <div class="col-lg-6">
                                                        <div class="section_title text-center mb-55">
                                                            <h3><span>Quyên góp</span></h3>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row justify-content-center">
                                                    <div class="col-lg-6">
                                                        <form action="POST" class="donation_form">
                                                            <div class="row align-items-center">
                                                                <div class="col-md-4">
                                                                    <div class="single_amount">
                                                                        <div class="input_field">
                                                                            <label for="itemSelect">Chọn hàng hóa:</label>
                                                                            <select id="itemSelect" class="form-control">
                                                                                <c:forEach var="event" items="${projectEvents}">
                                                                                    <option value="${event.itemName}">${event.itemName}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <div class="single_amount">
                                                                        <div class="fixed_donat d-flex align-items-center justify-content-between">
                                                                            <div class="select_prise">
                                                                                <h4>Chọn số lượng:</h4>
                                                                            </div>
                                                                            <div class="single_doonate"> 
                                                                                <input type="radio" id="amount_10" name="radio-group" value="10" checked>
                                                                                <label for="amount_10">10</label>
                                                                            </div>
                                                                            <div class="single_doonate"> 
                                                                                <input type="radio" id="amount_20" name="radio-group" value="20">
                                                                                <label for="amount_20">20</label>
                                                                            </div>
                                                                            <div class="single_doonate"> 
                                                                                <input type="radio" id="amount_30" name="radio-group" value="30">
                                                                                <label for="amount_30">30</label>
                                                                            </div>
                                                                            <div class="single_doonate"> 
                                                                                <input type="radio" id="amount_40" name="radio-group" value="40">
                                                                                <label for="amount_40">40</label>
                                                                            </div>
                                                                            <div class="single_doonate"> 
                                                                                <input type="radio" id="amount_50" name="radio-group" value="50">
                                                                                <label for="amount_50">50</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="donate_now_btn text-center">
                                                            <form action="${pageContext.request.contextPath}/event-donate" method="post">
                                                                <input type="hidden" id="hiddenItemName" name="itemName" value="">
                                                                <input type="hidden" id="hiddenQuantity" name="quantity" value="">
                                                                <input type="hidden" name="projectId" value="${project.getProjectId()}">
                                                                <button type="submit" class="boxed-btn4">Quyên góp ngay</button>
                                                            </form>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!--                            <div class="balance d-flex justify-content-between align-items-center">
                                                                <span>Raised: $5000.00 </span>
                                                                <span>Goal: $9000.00 </span>
                                                            </div>
                                                            <h4>Clothes For Everyone</h4>
                                                            <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain</p>
                                                            <p>These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims </p>
                                                            <p>These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided.</p>-->

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

        <script>
            function openTab(evt, tabName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(tabName).style.display = "block";
                evt.currentTarget.className += " active";
            }

            document.getElementById("defaultOpen").click();


        </script>
        <script>
            document.querySelector('.donate_now_btn button').addEventListener('click', function (event) {
                const selectedItem = document.querySelector('#itemSelect').value;
                const selectedQuantity = document.querySelector('input[name="radio-group"]:checked').value;

                // Tạo hidden input để gán giá trị trước khi submit
                const itemNameInput = document.getElementById('hiddenItemName');
                const quantityInput = document.getElementById('hiddenQuantity');

                itemNameInput.value = selectedItem;
                quantityInput.value = selectedQuantity;
            });
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

