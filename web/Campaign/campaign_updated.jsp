<!-- event-update.jsp -->
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
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
        
        <style>
            .event-grid {
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
<!--                                        <li><a href="#"> <i class="fa fa-phone"></i> +1 (454) 556-5656</a></li>
                                        <li><a href="#"> <i class="fa fa-envelope"></i>Yourmail@gmail.com</a></li>-->
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-lg-4">
<!--                                <div class="social_media_links d-none d-lg-block">
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
                                </div>-->
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
        
        <div class="popular_causes_area section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb-55">
                            <h3><span>Cập nhập hoạt động</span></h3>
                        </div>
                    </div>
                </div>
                
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="form-container">
                            <!-- Updated form action to match servlet mapping -->
                            <form id="editCampaignForm" action="EditCampaign" method="POST">
                                <div class="form-group">
                                    <label for="campaignId">ID Hoạt động</label>
                                    <input type="text" class="form-control" id="campaignId" name="campaignId" 
                                           value="${detail.campaignID}" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="PID">ID Dự án</label>
                                    <input type="text" class="form-control" id="PID" name="PID" 
                                           value="${detail.projectID}" readonly>
                                </div>

                                <!-- Tiêu đề với ít nhất 10 ký tự -->
                                <div class="form-group">
                                    <label for="campaignName">Tiêu đề</label>
                                    <input type="text" class="form-control" id="campaignName" name="campaignName" 
                                           value="${detail.campaignName}" required placeholder="Ít nhất 10 ký tự">
                                    <small style="font-style: italic; color: red;" id="campaignNameError">Tiêu đề phải có ít nhất 10 ký tự.</small>
                                </div>

                                <!-- Địa điểm cần có từ khóa xã, phường, thành phố hoặc tỉnh -->
                                <div class="form-group">
                                    <label for="address">Địa điểm</label>
                                    <input type="text" class="form-control" id="address" name="address" 
                                           value="${detail.campaignLocation}" required placeholder="Bao gồm xã, phường, thành phố hoặc tỉnh">
                                    <small style="font-style: italic; color: red;" id="addressError">Địa điểm phải chứa từ khóa: xã, phường, thành phố, tỉnh.</small>
                                </div>

                                <!-- Chi tiết với ít nhất 100 ký tự -->
                                <div class="form-group">
                                    <label for="description">Chi tiết</label>
                                    <textarea class="form-control" id="description" name="description" style="height: 250px; resize: vertical;" placeholder="Ít nhất 100 ký tự">${detail.description}</textarea>
                                    <small style="font-style: italic; color: red;" id="descriptionError">Chi tiết phải có ít nhất 100 ký tự.</small>
                                </div>

                                <!-- Công việc với ít nhất 100 ký tự -->
                                <div class="form-group">
                                    <label for="job">Công việc</label>
                                    <textarea class="form-control" id="job" name="job" style="height: 250px; resize: vertical;" placeholder="Ít nhất 100 ký tự">${detail.campaignJob}</textarea>
                                    <small style="font-style: italic; color: red;" id="jobError">Công việc phải có ít nhất 100 ký tự.</small>
                                </div>

                                <div class="btn-container text-center">
                                    <button type="submit" class="btn btn-primary">Cập nhập</button>
                                    <a href="CampaignManage?PID=${detail.projectID}" class="btn btn-secondary">Đóng</a>
                                </div>
                            </form>

                            <script>
                                // Hàm kiểm tra tính hợp lệ của các trường
                                function validateForm() {
                                    let isValid = true; // Biến kiểm tra tính hợp lệ

                                    // Kiểm tra độ dài tối thiểu cho campaignName
                                    const campaignName = document.getElementById("campaignName").value;
                                    const campaignNameError = document.getElementById("campaignNameError");
                                    if (campaignName.length < 10) {
                                        campaignNameError.style.display = "inline";
                                        isValid = false;
                                    } else {
                                        campaignNameError.style.display = "none";
                                    }

                                    // Kiểm tra định dạng cho address
                                    const address = document.getElementById("address").value.toLowerCase();
                                    const addressError = document.getElementById("addressError");
                                    const keywords = ["xã", "phường", "thành phố", "tỉnh"];
                                    const isAddressValid = keywords.some(keyword => address.includes(keyword));
                                    if (!isAddressValid) {
                                        addressError.style.display = "inline";
                                        isValid = false;
                                    } else {
                                        addressError.style.display = "none";
                                    }

                                    // Kiểm tra độ dài tối thiểu cho description
                                    const description = document.getElementById("description").value;
                                    const descriptionError = document.getElementById("descriptionError");
                                    if (description.length < 100) {
                                        descriptionError.style.display = "inline";
                                        isValid = false;
                                    } else {
                                        descriptionError.style.display = "none";
                                    }

                                    // Kiểm tra độ dài tối thiểu cho job
                                    const job = document.getElementById("job").value;
                                    const jobError = document.getElementById("jobError");
                                    if (job.length < 100) {
                                        jobError.style.display = "inline";
                                        isValid = false;
                                    } else {
                                        jobError.style.display = "none";
                                    }

                                    return isValid;
                                }

                                // Ngăn gửi form nếu không đạt yêu cầu
                                document.getElementById("editCampaignForm").addEventListener("submit", function (event) {
                                    if (!validateForm()) {
                                        event.preventDefault(); // Ngăn gửi form
                                    }
                                });

                                // Đảm bảo cập nhật tính hợp lệ khi người dùng nhập
                                document.getElementById("campaignName").addEventListener("input", validateForm);
                                document.getElementById("address").addEventListener("input", validateForm);
                                document.getElementById("description").addEventListener("input", validateForm);
                                document.getElementById("job").addEventListener("input", validateForm);
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- [Previous footer and JS sections remain the same] -->
        
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
    </body>
</html>