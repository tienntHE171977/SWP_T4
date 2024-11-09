<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Staff Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />


        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            .chart-container {
                position: relative;
                width: 50%;
                height: 50%;
            }
        </style>
        <style>
            body, html {
                height: 100%;
                margin: 0;
                font-family: Arial, sans-serif;
            }

            .container {
                padding: 20px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 20px;
            }

            .col-sm-6, .col-md-3, .col-md-9 {
                padding: 15px;
                box-sizing: border-box;
            }

            .col-md-3 {
                flex: 1;
                min-width: 200px;
            }

            .col-md-9 {
                flex: 1 0 100%;
            }

            .card {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                padding: 20px;
                margin-bottom: 20px;
            }

            .card-header {
                font-size: 1.25em;
                margin-bottom: 15px;
            }

            .chart-container {
                width: 100%;
                height: 400px;
            }

            .card-title {
                font-weight: bold;
            }
            .file-export_box {
                border-radius: 5px;
                background-color: green;
                color: white;
                cursor: pointer;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>



        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />

        <!-- Font Awesome -->



        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <link rel="stylesheet" href="assets/css/fonts.min.css" />
        <link rel="stylesheet" href="assets/css/fonts.css" />
        <link rel="stylesheet" href="assets/css/plugins.css" />
    </head>
    <body >
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar" data-background-color="dark">
                <div class="sidebar-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="index.html" class="logo">
                            <img
                                src="img/logo.png"
                                alt="navbar brand"
                                class="navbar-brand"
                                height="20"
                                />
                        </a>
                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="gg-menu-right"></i>
                            </button>
                            <button class="btn btn-toggle sidenav-toggler">
                                <i class="gg-menu-left"></i>
                            </button>
                        </div>
                        <button class="topbar-toggler more">
                            <i class="gg-more-vertical-alt"></i>
                        </button>
                    </div>
                    <!-- End Logo Header -->
                </div>
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-secondary">
                            <li class="nav-item active">
                                <a href="staff">
                                    <i class="fas fa-tachometer-alt"></i> <!-- Icon cho Dashboard -->
                                    <p>Bảng điều kiển </p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="project">
                                    <i class="fas fa-folder"></i> <!-- Icon cho Project -->
                                    <p>Dự án</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="userList">
                                    <i class="fa-solid fa-user"></i> <!-- Icon cho Project -->
                                    <p>Người dùng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="event-manage">
                                    <i class="fa-solid fa-calendar-days"></i> <!-- Icon cho Event -->
                                    <p>Sự kiện</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="CampaignList">
                                    <i class="fa-solid fa-campground"></i> <!-- Icon cho Campaign -->
                                    <p>Chiến dịch</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="organization-manage">
                                    <i class="fa-solid fa-sitemap"></i> <!-- Icon cho Campaign -->
                                    <p>Tổ chức</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="staffcontact">
                                    <i class="fa-solid fa-address-book"></i> <!-- Icon cho Contact -->
                                    <p>Liên hệ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="BlogList">
                                    <i class="fa-solid fa-address-book"></i> <!-- Icon cho Contact -->
                                    <p>Tin tức</p>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="index.html" class="logo">
                                <img
                                    src="img/logo.png"
                                    alt="navbar brand"
                                    class="navbar-brand"
                                    height="20"
                                    />
                            </a>
                            <div class="nav-toggle">
                                <button class="btn btn-toggle toggle-sidebar">
                                    <i class="gg-menu-right"></i>
                                </button>
                                <button class="btn btn-toggle sidenav-toggler">
                                    <i class="gg-menu-left"></i>
                                </button>
                            </div>
                            <button class="topbar-toggler more">
                                <i class="gg-more-vertical-alt"></i>
                            </button>
                        </div>
                        <!-- End Logo Header -->
                    </div>
                    <!-- Navbar Header -->
                    <nav
                        class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
                        >
                        <div class="container-fluid">


                            <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                                <li
                                    class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                                    >
                                    <a
                                        class="nav-link dropdown-toggle"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        role="button"
                                        aria-expanded="false"
                                        aria-haspopup="true"
                                        >
                                        <i class="fa fa-search"></i>
                                    </a>
                                    
                                </li>

                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-bell"></i>
                                        <span class="notification">${notifications.size()}</span>
                                    </a>
                                    <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                                        <li>
                                            <div class="dropdown-title">
                                                You have ${notifications.size()} new notifications
                                            </div>
                                        </li>
                                        <li>
                                            <div class="notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <c:forEach var="notification" items="${notifications}">
                                                        <a href="#">
                                                            <div class="notif-icon notif-primary">
                                                                <i class="fa fa-info-circle"></i>
                                                            </div>
                                                            <div class="notif-content">
                                                                <span class="block">${notification.message}</span>
                                                                <span class="time">${notification.createdAt}</span>
                                                            </div>
                                                        </a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);">See all notifications<i class="fa fa-angle-right"></i></a>
                                        </li>
                                    </ul>
                                </li>


                                <li class="nav-item topbar-user dropdown hidden-caret">
                                    <a
                                        class="dropdown-toggle profile-pic"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        aria-expanded="false"
                                        >
                                        <div class="avatar-sm">
                                            <img
                                                src="${acc.image}"
                                                alt="..."
                                                class="avatar-img rounded-circle"
                                                />
                                        </div>
                                        <span class="profile-username">
                                            <span class="op-7">Hi,</span>
                                            <span class="fw-bold">${staff.getUser().getFullname()}</span>
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                                        <div class="dropdown-user-scroll scrollbar-outer">
                                            <li>
                                                <div class="user-box">
                                                    <div class="avatar-lg">
                                                        <img
                                                            src="assets/img/profile.jpg"
                                                            alt="image profile"
                                                            class="avatar-img rounded"
                                                            />
                                                    </div>
                                                    <div class="u-text">
                                                        <h4>${staff.getUser().getFullname()}</h4>
                                                        <p class="text-muted"></p>
                                                        <a
                                                            href="staffProfile.jsp"
                                                            class="btn btn-xs btn-secondary btn-sm"
                                                            >View Profile</a
                                                        >
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown-divider"></div>

                                                <a class="dropdown-item" href="changepasswordstaff">Change PassWord</a>

                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="editStaff">Account Setting</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="logout">Logout</a>
                                            </li>
                                        </div>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <!-- End Navbar -->
                </div>

                <div class="container" >
                    <div class="page-inner">
                        <div
                            class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
                            >
                            <div>
                                <h3 class="fw-bold mb-3">Bảng điều khiển</h3>
                                <h6 class="op-7 mb-2">Bảng điều khiển nhân viên</h6>
                            </div>

                        </div>
                        <div class="container">
                            <div class="page-inner">
                                <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
                                    <div>
                                        <h3 class="fw-bold mb-3">Quản lý bài viết</h3>

                                    </div>
                                </div>



                                <!-- bradcam_area_start -->
                                <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="bradcam_text text-center">
                                                    <h3>Chỉnh sửa bài viết</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- bradcam_area_end -->
                                <div class="row justify-content-center">
                                    <div class="col-md-10">
                                        <div class="card p-4 shadow-sm">
                                            <form id="editBlogForm" action="EditBlog" method="post" enctype="multipart/form-data">
                                                <div class="row">
                                                    <!-- Left Column -->
                                                    <div class="col-lg-6 d-flex flex-column align-items-center">
                                                        <!-- News ID -->
                                                        <div class="form-group w-100 mb-3">
                                                            <label for="newsID">ID</label>
                                                            <input type="text" class="form-control" id="newsID" name="newsID" value="${detail.newsID}" readonly>
                                                        </div>

                                                        <!-- News Title -->
                                                        <div class="form-group w-100 mb-3">
                                                            <label for="newsTitle">Tiêu đề</label>
                                                            <input type="text" class="form-control" id="newsTitle" name="newsTitle" value="${detail.title}" required>
                                                            <small id="newsTitleError" style="font-style: italic; color: red; display: none;">*Tiêu đề phải có ít nhất 20 ký tự.</small>
                                                        </div>

                                                        <!-- News Date -->
                                                        <div class="form-group w-100 mb-3">
                                                            <label for="newsDate">Thời gian</label>
                                                            <input type="text" class="form-control" id="newsDate" value="${detail.updatedDate}" readonly>
                                                        </div>

                                                        <!-- Current News Image -->
                                                        <div class="form-group w-100 text-center mb-3">
                                                            <label>Hình ảnh</label>
                                                            <div class="my-2">
                                                                <img src="${detail.image}" alt="News Image" class="img-thumbnail" style="width: 200px; height: 150px;">
                                                            </div>
                                                            <p class="text-muted small">Hình ảnh cũ: ${detail.image}</p>
                                                        </div>

                                                        <!-- Input for new image URL -->
                                                        <div id="avatarContainer" class="form-group w-100 mb-3">
                                                            <img id="Img" src="path_to_default_avatar.jpg" alt="Image" style="width: 300px; height: 150px; object-fit: cover;">
                                                            <input type="file" id="Upload" name="avatar" accept="image/*" style="margin-top: 15px;" onchange="previewAvatar()">
                                                        </div>
                                                    </div>

                                                    <!-- Right Column -->
                                                    <div class="col-lg-6 d-flex flex-column align-items-center">
                                                        <!-- News Content -->
                                                        <div class="form-group w-100 mb-3">
                                                            <label for="newsContent">Chi tiết</label>
                                                            <textarea class="form-control" id="newsContent" name="newsContent" rows="7" style="resize: vertical;" required>${detail.content}</textarea>
                                                            <small id="newsContentError" style="font-style: italic; color: red; display: none;">*Nội dung phải có ít nhất 300 ký tự.</small>
                                                        </div>

                                                        <!-- News Message -->
                                                        <div class="form-group w-100 mb-3">
                                                            <label for="newsMessage">Lời nhắn</label>
                                                            <textarea class="form-control" id="newsMessage" name="newsMessage" rows="3" style="resize: vertical;" required>${detail.message}</textarea>
                                                            <small id="newsMessageError" style="font-style: italic; color: red; display: none;">*Lời nhắn phải có ít nhất 100 ký tự.</small>
                                                        </div>

                                                        <!-- News Category -->
                                                        <div class="form-group w-100 mb-3">
                                                            <label for="category">Danh mục</label>
                                                            <select name="category" id="category" class="form-select">
                                                                <c:forEach items="${listCC}" var="o">
                                                                    <option value="${o.ncategoriesID}" ${o.ncategoriesID == categoryID ? 'selected' : ''}>${o.ncategoryName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Submit Button -->
                                                <div class="text-center mt-4">
                                                    <button type="submit" class="btn btn-info px-5">Hoàn thành</button>
                                                </div>
                                            </form>
                                            <script>
                                                function previewAvatar() {
                                                    var fileInput = document.getElementById('Upload');
                                                    if (fileInput.files.length > 0) {
                                                        var reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            document.getElementById('Img').src = e.target.result; // Cập nhật ảnh đại diện
                                                        }
                                                        reader.readAsDataURL(fileInput.files[0]); // Chuyển đổi ảnh thành base64
                                                    }
                                                }
                                                // Kiểm tra tính hợp lệ của các trường nhập
                                                function validateForm() {
                                                    let isValid = true;

                                                    // Kiểm tra tiêu đề có ít nhất 20 ký tự
                                                    const newsTitle = document.getElementById("newsTitle").value;
                                                    const newsTitleError = document.getElementById("newsTitleError");
                                                    if (newsTitle.length < 20) {
                                                        newsTitleError.style.display = "inline";
                                                        isValid = false;
                                                    } else {
                                                        newsTitleError.style.display = "none";
                                                    }

                                                    // Kiểm tra nội dung có ít nhất 300 ký tự
                                                    const newsContent = document.getElementById("newsContent").value;
                                                    const newsContentError = document.getElementById("newsContentError");
                                                    if (newsContent.length < 300) {
                                                        newsContentError.style.display = "inline";
                                                        isValid = false;
                                                    } else {
                                                        newsContentError.style.display = "none";
                                                    }

                                                    // Kiểm tra lời nhắn có ít nhất 100 ký tự
                                                    const newsMessage = document.getElementById("newsMessage").value;
                                                    const newsMessageError = document.getElementById("newsMessageError");
                                                    if (newsMessage.length < 100) {
                                                        newsMessageError.style.display = "inline";
                                                        isValid = false;
                                                    } else {
                                                        newsMessageError.style.display = "none";
                                                    }

                                                    return isValid;
                                                }

                                                // Ngăn gửi form nếu không đạt yêu cầu
                                                document.getElementById("editBlogForm").addEventListener("submit", function (event) {
                                                    if (!validateForm()) {
                                                        event.preventDefault(); // Ngăn gửi form
                                                    }
                                                });

                                                // Cập nhật tính hợp lệ khi người dùng nhập
                                                document.getElementById("newsTitle").addEventListener("input", validateForm);
                                                document.getElementById("newsContent").addEventListener("input", validateForm);
                                                document.getElementById("newsMessage").addEventListener("input", validateForm);
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

        <!-- Chart JS -->
        <script src="assets/js/plugin/chart.js/chart.min.js"></script>

        <!-- jQuery Sparkline -->
        <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

        <!-- Chart Circle -->
        <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>

        <!-- Bootstrap Notify -->
        <script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

        <!-- jQuery Vector Maps -->
        <script src="assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
        <script src="assets/js/plugin/jsvectormap/world.js"></script>

        <!-- Sweet Alert -->
        <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <script>

        </script>


    </body>
</html>
