<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Charifit - Campaign List</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS here -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gijgo.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
        <!-- Bootstrap CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
            .toggle-button {
                display: inline-flex;
                align-items: center;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-decoration: none;
                color: white;
                font-size: 14px;
            }

            .toggle-button.on {
                background-color: #28a745; /* Màu xanh cho trạng thái 'on' */
            }

            .toggle-button.off {
                background-color: #dc3545; /* Màu đỏ cho trạng thái 'off' */
            }

            .toggle-button:hover {
                opacity: 0.9; /* Hiệu ứng khi di chuột */
            }

            .icon {
                margin-right: 5px; /* Khoảng cách giữa biểu tượng và chữ */
            }
        </style>
    </head>

    <body>
        <!-- [Header section remains the same] -->

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

        <div class="popular_causes_area section_padding">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb-55">
                            <h3><span>Quản lý hoạt động thực tế</span></h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-right add-event-btn">
                            <!-- Nút mở modal -->
                            <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCampaignModal">
                                <i class="fa-solid fa-plus"></i> Hoạt động mới
                            </a>
                        </div>

                        <!-- Modal để thêm mới chiến dịch -->
                        <div class="modal fade" id="addCampaignModal" tabindex="-1" aria-labelledby="addCampaignModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addCampaignModalLabel">Thêm hoạt động</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form action="AddCampaign" method="post">
                                        <div class="modal-body">

                                            <!-- Tên hoạt động với ít nhất 10 ký tự -->

                                            <div class="mb-3">
                                                <label for="campaignName" class="form-label">Tên hoạt động</label>
                                                <input type="text" class="form-control" id="campaignName" name="campaignName" required placeholder="Ít nhất 10 ký tự">
                                                <small style="font-style: italic; color: red;">Tên hoạt động phải có ít nhất 10 ký tự.</small>
                                            </div>

                                            <!-- Địa điểm cần có từ khóa xã, phường, thành phố hoặc tỉnh -->
                                            <div class="mb-3">
                                                <label for="campaignLocation" class="form-label">Địa điểm</label>
                                                <input type="text" class="form-control" id="campaignLocation" name="campaignLocation" required placeholder="Bao gồm xã, phường, thành phố hoặc tỉnh">
                                                <small style="font-style: italic; color: red;">Địa điểm phải chứa từ khóa: xã, phường, thành phố, tỉnh.</small>
                                            </div>

                                            <!-- Chi tiết với ít nhất 100 ký tự -->
                                            <div class="mb-3">
                                                <label for="description" class="form-label">Chi tiết</label>
                                                <textarea class="form-control" id="description" name="description" rows="3" required placeholder="Ít nhất 100 ký tự"></textarea>
                                                <small style="font-style: italic; color: red;">Chi tiết phải có ít nhất 100 ký tự.</small>
                                            </div>

                                            <!-- Công việc chung với ít nhất 100 ký tự -->
                                            <div class="mb-3">
                                                <label for="job" class="form-label">Công việc chung</label>
                                                <textarea class="form-control" id="job" name="job" rows="3" required placeholder="Ít nhất 100 ký tự"></textarea>
                                                <small style="font-style: italic; color: red;">Công việc chung phải có ít nhất 100 ký tự.</small>
                                            </div>
                                            <div class="mb-3">
                                                <label for="PID">Dự án</label>
                                                <select name="PID" class="form-select" id="PID" required>
                                                    <option value="" disabled selected>Chọn dự án</option>
                                                    <c:forEach items="${listp}" var="o">
                                                        <option value="${o.projectId}">${o.projectName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                        </div>
                                    </form>

                                    <script>
                                        // Kiểm tra độ dài tối thiểu cho campaignName
                                        document.getElementById("campaignName").addEventListener("input", function () {
                                            const name = this.value;
                                            if (name.length < 10) {
                                                this.setCustomValidity("Tên hoạt động phải có ít nhất 10 ký tự.");
                                            } else {
                                                this.setCustomValidity("");
                                            }
                                        });

                                        // Kiểm tra định dạng cho campaignLocation
                                        document.getElementById("campaignLocation").addEventListener("input", function () {
                                            const location = this.value.toLowerCase();
                                            const keywords = ["xã", "phường", "thành phố", "tỉnh"];
                                            const isValid = keywords.some(keyword => location.includes(keyword));
                                            if (!isValid) {
                                                this.setCustomValidity("Địa điểm phải bao gồm xã, phường, thành phố hoặc tỉnh.");
                                            } else {
                                                this.setCustomValidity("");
                                            }
                                        });

                                        // Kiểm tra độ dài tối thiểu cho description
                                        document.getElementById("description").addEventListener("input", function () {
                                            const description = this.value;
                                            if (description.length < 100) {
                                                this.setCustomValidity("Chi tiết phải có ít nhất 100 ký tự.");
                                            } else {
                                                this.setCustomValidity("");
                                            }
                                        });

                                        // Kiểm tra độ dài tối thiểu cho job
                                        document.getElementById("job").addEventListener("input", function () {
                                            const job = this.value;
                                            if (job.length < 100) {
                                                this.setCustomValidity("Công việc chung phải có ít nhất 100 ký tự.");
                                            } else {
                                                this.setCustomValidity("");
                                            }
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>


                        <div class="event-table-container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width:3%">ID</th>
                                        <th style="width:20%">Tiêu đề</th>
                                        <th style="width:15%">Thời gian</th>
                                        <th style="width:25%">Dự án</th>
                                        <th style="width:25%">Địa điểm</th>
                                        <th style="width:3%">Trạng thái</th> 
                                        <th style="width:14%">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="o" items="${list}">
                                        <tr>
                                            <td>${o.campaignID}</td>
                                            <td>${o.campaignName}</td>
                                            <td>${o.createDate}</td>
                                            <td>${o.projectName}</td>
                                            <td>
                                                ${o.campaignLocation}
                                            </td>
                                            <td><a href="ChangeStatusCampaign?campaignId=${o.campaignID}&status=${o.status == 'on' ? 'off' : 'on'}" 
                                                   class="toggle-button ${o.status == 'on' ? 'on' : 'off'}">
                                                    <i class="icon ${o.status == 'on' ? 'fa fa-toggle-on' : 'fa fa-toggle-off'}"></i>
                                                    ${o.status == 'on' ? 'Tắt' : 'Bật'}
                                                </a>

                                            <td class="action-buttons">
                                                <!-- Updated URLs for actions -->
                                                <form action="CampaignDetail" method="post" style="display: inline-block; margin: 0;">
                                                    <input type="hidden" name="campaignId" value="${o.campaignID}">
                                                    <input type="hidden" name="actionType" value="edit">
                                                    <button
                                                        type="submit" 
                                                        data-bs-toggle="tooltip"
                                                        title="Sửa chiến dịch" 
                                                        class="btn btn-sm btn-info"
                                                        data-original-title="Edit Campaign"
                                                        >   
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </button>
                                                </form>
                                                <form action="CampaignDetail" method="post" style="display: inline-block; margin: 0;">
                                                    <input type="hidden" name="campaignId" value="${o.campaignID}">
                                                    <input type="hidden" name="actionType" value="view">
                                                    <button
                                                        type="submit" 
                                                        data-bs-toggle="tooltip"
                                                        title="Xem chiến dịch" 
                                                        class="btn btn-sm btn-info"
                                                        data-original-title="View Campaign"
                                                        >
                                                        <i class="fa-solid fa-eye"></i>
                                                    </button>
                                                </form>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!-- Phân trang -->
<!--                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="?index=${tag > 1 ? tag - 1 : 1}" class="page-link" aria-label="Previous">
                                            <i class="fa-solid fa-angles-left"></i>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${endP}" var="i">
                                        <li class="${tag == i ? 'act' : ''}">
                                            <a href="?index=${i}" class="page-link">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a href="?index=${tag < endP ? tag + 1 : endP}" class="page-link" aria-label="Next">
                                            <i class="fa-solid fa-angles-right"></i>
                                        </a>
                                    </li>
                                </ul>
                            </nav>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- [Footer section remains the same] -->
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

        <!-- JS here -->
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/ajax-form.js"></script>
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scrollIt.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.slicknav.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/js/gijgo.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>


    </body>
</html>