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

            .media-list {
                padding: 0;
                list-style: none;
            }
            .media {
                padding: 15px 10px;
                border-bottom: 1px solid #ddd;
                display: flex;
                align-items: flex-start;
            }
            .media .pull-left img {
                border-radius: 50%;
                margin-right: 15px;
            }
            .media-body {
                width: 100%;
            }
            .media-body .text-muted.pull-right a {
                color: #999;
                text-decoration: none;
                font-size: 12px;
            }
            .media-body a.strong {
                font-weight: bold;
                font-size: 14px;
                color: #333;
            }
            .media-body p {
                margin: 8px 0 0;
                font-size: 14px;
            }
            .media-body .text-danger {
                color: #dc3545;
                font-weight: bold;
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
                            <li class="nav-item ">
                                <a href="staff">
                                    <i class="fas fa-tachometer-alt"></i> <!-- Icon cho Dashboard -->
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="project.jsp">
                                    <i class="fas fa-folder"></i> <!-- Icon cho Project -->
                                    <p>Project</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="event.jsp">
                                    <i class="fas fa-calendar-alt"></i> <!-- Icon cho Event -->
                                    <p>Event</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="CampaignList">
                                    <i class="fas fa-bullhorn"></i> <!-- Icon cho Campaign -->
                                    <p>Campaign</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="organization-manage">
                                    <i class="fas fa-bullhorn"></i> <!-- Icon cho Campaign -->
                                    <p>Organizations</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="staffcontact">
                                    <i class="fas fa-address-book"></i> <!-- Icon cho Contact -->
                                    <p>Contact</p>
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a href="BlogList">
                                    <i class="fa-solid fa-address-book"></i> <!-- Icon cho Contact -->
                                    <p>News</p>
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
                                    <ul class="dropdown-menu dropdown-search animated fadeIn">
                                        <form class="navbar-left navbar-form nav-search">
                                            <div class="input-group">
                                                <input
                                                    type="text"
                                                    placeholder="Search ..."
                                                    class="form-control"
                                                    />
                                            </div>
                                        </form>
                                    </ul>
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
                                <h3 class="fw-bold mb-3">Dashboard</h3>
                                <h6 class="op-7 mb-2">Staff Dashboard</h6>
                            </div>

                        </div>
                        <div class="container">
                            <div class="page-inner">
                                <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
                                    <div>
                                        <h3 class="fw-bold mb-3">Staff Blog</h3>

                                    </div>
                                </div>



                                <!-- bradcam_area_start -->
                                <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xl-12">
                                                <div class="bradcam_text text-center">
                                                    <h3>Blog Management</h3>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- bradcam_area_end -->
                                <div class="row justify-content-center">
                                    <div class="col-md-9">
                                        <div class="card">
                                            <form role="form">
                                                <div class="form-group">
                                                    <!-- News ID -->
                                                    <div class="mb-3">
                                                        <label for="newsID">News ID</label>
                                                        <input type="text" class="form-control" id="newsID" value="${detail.newsID}" readonly>
                                                    </div>

                                                    <!-- News Title -->
                                                    <div class="mb-3">
                                                        <label for="newsTitle">News Title</label>
                                                        <input type="text" class="form-control" id="newsTitle" value="${detail.title}" readonly>
                                                    </div>

                                                    <!-- News Date -->
                                                    <div class="mb-3">
                                                        <label for="newsDate">News Date</label>
                                                        <input type="text" class="form-control" id="newsDate" value="${detail.updatedDate}" readonly>
                                                    </div>

                                                    <!-- News Image -->
                                                    <div class="mb-3">
                                                        <label for="newsImage">News Image</label>
                                                        <div>
                                                            <img id="newsImage" src="${detail.image}" alt="News Image" class="img-fluid">
                                                        </div>
                                                    </div>

                                                    <!-- News Content -->
                                                    <div class="mb-3">
                                                        <label for="newsContent">News Content</label>
                                                        <textarea class="form-control" id="newsContent" rows="3" readonly>${detail.content}</textarea>
                                                    </div>

                                                    <!-- News Message -->
                                                    <div class="mb-3">
                                                        <label for="newsMessage">News Message</label>
                                                        <textarea class="form-control" id="newsMessage" rows="3" readonly>${detail.message}</textarea>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-center">
                                    <div class="col-md-9">
                                        <div class="card">
                                            <div class="col-lg-6">
                                                <section class="panel">
                                                    <header class="panel-heading">
                                                        ${total} Comment
                                                    </header>
                                                    <ul class="media-list">
                                                        <c:forEach items="${comments}" var="o">
                                                            <li class="media">
                                                                <a href="#" class="pull-left">
                                                                    <img src="img/26115.jpg" alt="Avatar" class="img-circle" width="64" height="64">
                                                                </a>
                                                                <div class="media-body">
                                                                    <!-- Status Toggle Link -->
                                                                    <span class="text-muted pull-right">
                                                                        <a href="ChangeStatusComment?ID=${o.ncommentID}&status=${o.status == 'on' ? 'off' : 'on'}">
                                                                            ${o.status == 'on' ? 'Turn Off' : 'Turn On'}
                                                                        </a> 
                                                                    </span>

                                                                    <!-- User Profile Link -->
                                                                    <a href="page_ready_user_profile.php" class="strong">${o.userName}</a>

                                                                    <!-- Comment Text -->
                                                                    <p>${o.comment}</p>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </section>
                                            </div>

                                        </div>
                                        <div class="file-export_box ms-4">
                                            <a href="BlogList" class="d-flex justify-content-center align-items-center px-3 py-2 fs-4 text-white">
                                                <span>Back to Home</span>
                                            </a>
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
