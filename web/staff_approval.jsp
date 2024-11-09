<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Staff Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <!--        <link
                    rel="icon"
                    href="assets/img/kaiadmin/favicon.ico"
                    type="image/x-icon"
                    />-->

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
        <style>
            /* Container cho các item */
            #organizationItems {
                display: flex;
                flex-direction: column; /* Sắp xếp theo cột */
                gap: 15px;
            }



            .pagination {
                margin-top: 15px;
                display: flex;
                justify-content: flex-end;
                /* Căn giữa hai nút Previous và Next */
            }

            .pagination button {
                display: inline-block;
                margin: 2px;
                padding: 5px 10px;
                border: 1px solid #ccc;
                background-color: #f9f9f9;
                cursor: pointer;
                border-radius: 20px;
            }
            .pagination button.active {
                background-color: #ccc;
                font-weight: bold;
            }
            .pagination button:hover {
                background-color: #0056b3; /* Màu nút khi hover */
            }
            .floating-tab {
                display: none; /* Hidden by default */
                position: fixed;
                top: 10%;
                left: 10%;
                width: 70%;
                height: 80%;
                background-color: white;
                padding: 20px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                overflow-y: auto;
                border-radius: 8px;
                margin-left: 200px;
            }
            /* Style cho hình ảnh */


            /* Modal content styling */
            .floating-tab .tab-content {
                position: relative;
                display: flex;
            }

            .floating-tab .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 24px;
                cursor: pointer;
            }

            /* Overlay for dark background */
            .overlay {
                display: none; /* Hidden by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5); /* Dark background */
                z-index: 999;
            }

            .profile-card {
                display: flex;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding-left: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 350px;
                height: 100px;
                margin-left: -10px;
                margin-bottom: 20px;
                background-color: lavender;
            }

            .profile-image {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                margin-top:  50px;
                margin-left: 30px;
            }

            .profile-info {
                flex: 1;
                margin-left: 30px;
                margin-top: 50px;
            }

            .profile-info h2 {
                margin: 0;
                font-size: 1.5em;
                color: #0045a5;
                background-color: #e5f2ff;
                padding: 5px;
                border-radius: 5px;
            }

            .profile-info p {
                margin: 5px 0;
                color: #555;
            }



            .social-icons {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            .social-icons a {
                text-decoration: none;
                font-size: 1.5em;
                color: #555;
            }

            .social-icons a:hover {
                color: #0045a5;
            }
            .action-buttons {
                margin-top: 20px;
                display: flex;

                justify-content: flex-end;
            }

            .approve-btn, .reject-btn {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 20px;
                cursor: pointer;
            }

            .approve-btn {
                background-color: darkviolet;
                color: white;
                margin-right: 10px;
            }

            .reject-btn {
                background-color: #555;
                color: white;
            }

            .approve-btn:hover, .reject-btn:hover {
                opacity: 0.8;
            }



        </style>
        <style>
            /* Container cho các item */
            #organizationItemsi {
                display: flex;
                flex-direction: column; /* Sắp xếp theo cột */
                gap: 15px;
            }



            .paginationi {
                margin-top: 15px;
                display: flex;
                justify-content: flex-end;
                /* Căn giữa hai nút Previous và Next */
            }

            .paginationi button {
                display: inline-block;
                margin: 2px;
                padding: 5px 10px;
                border: 1px solid #ccc;
                background-color: #f9f9f9;
                cursor: pointer;
                border-radius: 20px;
            }
            .paginationi button.active {
                background-color: #ccc;
                font-weight: bold;
            }
            .paginationi button:hover {
                background-color: #0056b3; /* Màu nút khi hover */
            }
            .floating-tab {
                display: none; /* Hidden by default */
                position: fixed;
                top: 10%;
                left: 10%;
                width: 70%;
                height: 80%;
                background-color: white;
                padding: 20px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                overflow-y: auto;
                border-radius: 8px;
                margin-left: 200px;
            }
            /* Style cho hình ảnh */


            /* Modal content styling */
            .floating-tab .tab-content {
                position: relative;
                display: flex;
            }

            .floating-tab .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 24px;
                cursor: pointer;
            }

            /* Overlay for dark background */
            .overlay {
                display: none; /* Hidden by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5); /* Dark background */
                z-index: 999;
            }

            .profile-card {
                display: flex;
                border: 1px solid #ddd;
                border-radius: 10px;
                padding-left: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 350px;
                height: 100px;
                margin-left: -10px;
                margin-bottom: 20px;
                background-color: lavender;
            }

            .profile-image {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                margin-top:  50px;
                margin-left: 30px;
            }

            .profile-info {
                flex: 1;
                margin-left: 30px;
                margin-top: 50px;
            }

            .profile-info h2 {
                margin: 0;
                font-size: 1.5em;
                color: #0045a5;
                background-color: #e5f2ff;
                padding: 5px;
                border-radius: 5px;
            }

            .profile-info p {
                margin: 5px 0;
                color: #555;
            }



            .social-icons {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            .social-icons a {
                text-decoration: none;
                font-size: 1.5em;
                color: #555;
            }

            .social-icons a:hover {
                color: #0045a5;
            }
            .action-buttons {
                margin-top: 20px;
                display: flex;

                justify-content: flex-end;
            }

            .approve-btn, .reject-btn {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 20px;
                cursor: pointer;
            }

            .approve-btn {
                background-color: darkviolet;
                color: white;
                margin-right: 10px;
            }

            .reject-btn {
                background-color: #555;
                color: white;
            }

            .approve-btn:hover, .reject-btn:hover {
                opacity: 0.8;
            }



        </style>
        <style>
            /* Container cho các item */
            #projectItems {
                display: flex;
                flex-direction: column; /* Sắp xếp theo cột */
                gap: 15px;
            }
            #tabtitle {
                width: 600px;          /* Đặt chiều rộng là 100% */
                display: block;      /* Đảm bảo tiêu đề chiếm toàn bộ dòng */
                text-align: left    ;  /* Căn giữa nếu muốn */
                margin: 0;           /* Loại bỏ margin */
                padding: 10px 0;     /* Có thể thêm padding trên và dưới */
                font-size: 18px;    /* Kích thước chữ */
                font-weight: bold;   /* Đậm nếu cần */
            }
            .orgname{
                margin-top: 36px;
                margin-left: 10px;
                font-size: 18px;
                color: purple;
                /*display: -webkit-box;*/
                /*-webkit-line-clamp: 0;  Số dòng tối đa muốn hiển thị*/
                /*-webkit-box-orient: vertical;*/
                overflow: hidden;
                text-overflow: ellipsis;
                width: 250px;
                white-space: nowrap;
            }



            .paginationp {
                margin-top: 15px;
                display: flex;
                justify-content: flex-end;
                /* Căn giữa hai nút Previous và Next */
            }

            .paginationp button {
                display: inline-block;
                margin: 2px;
                padding: 5px 10px;
                border: 1px solid #ccc;
                background-color: #f9f9f9;
                cursor: pointer;
                border-radius: 20px;
            }
            .paginationp button .activep {
                background-color: #ccc;
                font-weight: bold;
            }
            .paginationp button:hover {
                background-color: #0056b3; /* Màu nút khi hover */
            }
            .floatingp-tab {
                display: none; /* Hidden by default */
                position: fixed;
                top: 10%;
                left: 10%;
                width: 70%;
                height: 80%;
                background-color: white;
                padding: 20px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                z-index: 1000;
                overflow-y: auto;
                border-radius: 8px;
                margin-left: 200px;
            }


            /* Modal content styling */
            .floatingp-tab .tabp-content {
                position: relative;
                display: flex;
            }

            .floatingp-tab .closep-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 24px;
                cursor: pointer;
            }

            /* Overlay for dark background */
            .overlayp {
                display: none; /* Hidden by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5); /* Dark background */
                z-index: 999;
            }

            .profilep-card {
                display: flex;
                align-items: center;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                margin: auto;
                background-color: #666;
            }
            .crtbyo-image {
                width: 60px;
                height: 60px;
                border-radius: 50%;
                object-fit: cover;
                margin-top: 20px;

            }
            .profilep-image {
                width: 600px;
                height: 400px;
                border: 1px solid #ddd;
                border-radius: 10px;
                object-fit: cover;
                box-shadow: 4px 4px 4px 4px rgba(0, 0, 0, 0.1);
                margin-top:  70px;
                margin-left: -590px;
            }

            .profilep-info {
                flex: 1;
                margin-left: 30px;
                margin-top: 50px;
            }

            .profilep-info h2 {
                margin: 0;
                font-size: 1.5em;
                color: #0045a5;
                background-color: #e5f2ff;
                padding: 5px;
                border-radius: 5px;
            }

            .profilep-info p {
                margin: 5px 0;
                color: #555;
            }



            .socialp-icons {
                display: flex;
                gap: 10px;
                margin-top: 10px;
            }

            .socialp-icons a {
                text-decoration: none;
                font-size: 1.5em;
                color: #555;
            }

            .socialp-icons a:hover {
                color: #0045a5;
            }
            .actionp-buttons {
                margin-top: 20px;
                display: flex;

                justify-content: flex-end;
            }

            .approvep-btn, .rejectp-btn {
                padding: 10px 20px;
                font-size: 16px;
                border: none;
                border-radius: 20px;
                cursor: pointer;
            }

            .approvep-btn {
                background-color: darkviolet;
                color: white;
                margin-right: 10px;
            }

            .rejectp-btn {
                background-color: #555;
                color: white;
            }

            .approvep-btn:hover, .rejectp-btn:hover {
                opacity: 0.8;
            }


        </style>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />

        <!-- Font Awesome -->

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <!--        <link rel="stylesheet" href="assets/css/fonts.min.css" />-->
        <!--        <link rel="stylesheet" href="assets/css/fonts.css" />-->
        <link rel="stylesheet" href="assets/css/plugins.css" />
    </head>
    <body>
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
                            <li class="nav-item  active">
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
                                <a href="event-manage">
                                    <i class="fa-solid fa-calendar-days"></i> <!-- Icon cho Event -->
                                    <p>Event</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="campaign.jsp">
                                    <i class="fa-solid fa-campground"></i> <!-- Icon cho Campaign -->
                                    <p>Campaign</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="organization-manage">
                                    <i class="fa-solid fa-sitemap"></i> <!-- Icon cho Campaign -->
                                    <p>Organizations</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="volunteerapproval">
                                    <i class="fa-solid fa-handshake-angle"></i>
                                    <p>Volunteers</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="staffcontact">
                                    <i class="fa-solid fa-address-book"></i> <!-- Icon cho Contact -->
                                    <p>Contact</p>
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
                            <nav
                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button type="submit" class="btn btn-search pe-1">
                                            <i class="fa-solid fa-magnifying-glass search-icon"></i>
                                        </button>
                                    </div>
                                    <input
                                        type="text"
                                        placeholder="Search ..."
                                        class="form-control"
                                        />
                                </div>

                            </nav>

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
                                                src="${staff.getUser().getImage()}" alt="Staff Avatar"
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

                <div class="container">
                    <div class="page-inner">
                        <div
                            class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
                            >
                            <div>
                                <h3 class="fw-bold mb-3">Dashboard</h3>
                                <h6 class="op-7 mb-2">Staff Approval Request Dashboard</h6>

                            </div>

                        </div>
                        <div class="container">
                            <div class="page-inner">
                                <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">
                                    <div>
                                        <h3 class="fw-bold mb-3">Dashboard</h3>
                                        <h6 class="op-7 mb-2">Staff Dashboard</h6>
                                    </div>
                                </div>

                                <!-- Row for Project, Event, Campaign -->
                                <div class="row">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card card-stats card-round">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-icon">
                                                        <div class="icon-big text-center icon-primary bubble-shadow-small">
                                                            <i class="fas fa-project-diagram"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Project</p>
                                                            <h4 class="card-title">${totalProjects}</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-6 col-md-3">
                                        <div class="card card-stats card-round">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-icon">
                                                        <div class="icon-big text-center icon-info bubble-shadow-small">
                                                            <i class="fa-solid fa-calendar-days"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Event</p>
                                                            <h4 class="card-title">${totalEvents}</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card card-stats card-round">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-icon">
                                                        <div class="icon-big text-center icon-success bubble-shadow-small">
                                                            <i class="fa-solid fa-campground"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Campaign</p>
                                                            <h4 class="card-title">${totalCampaigns}</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card card-stats card-round">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-icon">
                                                        <div class="icon-big text-center icon-primary bubble-shadow-small">
                                                            <i class="fa-solid fa-sitemap"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Organization</p>
                                                            <h4 class="card-title">${totalOrganization}</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-md-3">
                                        <div class="card card-stats card-round">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-icon">
                                                        <div class="icon-big text-center icon-warning bubble-shadow-small">
                                                            <i class="fa-solid fa-handshake-angle"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Volunteer</p>
                                                            <h4 class="card-title"></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>





                                <!-- Row for Transaction History -->
                                <div class="row" style="padding-top: 80px">
                                    <div class="col-lg-12">
                                        <ul class="nav nav-tabs" id="organTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active" id="active-tab" data-toggle="tab" href="#active" role="tab">
                                                    Project
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="prjtab" data-toggle="tab" href="#pending" role="tab">
                                                    Projects request
                                                </a>
                                            </li>
                                        </ul>

                                        <div class="tab-content" id="organTabContent">
                                            <!-- Active/Inactive Organizations Tab -->
                                            
                                            <c:set var="totalItems" value="${fn:length(projectactive)}" />
                                            <c:set var="itemsPerPage" value="5" />
                                            <c:set var="totalPages" value="${(totalItems / itemsPerPage) + (totalItems % itemsPerPage > 0 ? 1 : 0)}" />
                                            <c:set var="currentPage" value="1" />
                                            <div  class="tab-pane fade show active" id="active" role="tabpanel">
                                                <h2 style="margin-top: -130px; padding-bottom: 75px;">Dự án đang hoạt động</h2  >
                                                <div style="margin-top: -80px; padding-bottom: 55px;" style="display: flex" class="card-header">
                                                    <!--                                            <h4 class="card-title">Organizations Register Request</h4>-->
                                                    <input style="border-radius: 5px; width: 150px; font-size: 15px ;  " type="text" id="searchInput" placeholder="nhập tên tổ chức..." onkeyup="" />
                                                    <input style="border-radius: 5px; width: 150px; font-size: 15px; margin-left: 10px " type="text" id="searchTitle" placeholder="nhập tên dự án..." onkeyup="" />
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Title</th>
                                                                <th>Role</th>
                                                                <th>Created By</th>
                                                                <th>Started Date</th>
                                                                <th>End Date</th>
                                                                <th>Status</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="o" items="${projectactive}" varStatus="status">
                                                                <tr class="article-item" id="${o.projectId}" tilteprj="${o.title}" data-name="${o.getCreatedByOrg().getName()}">
                                                                    <td>${o.projectId}</td>
                                                                    <td style="white-space: nowrap;       /* Giữ văn bản trên 1 dòng */
                                                                        overflow: hidden;          /* Ẩn phần văn bản vượt quá */
                                                                        text-overflow: ellipsis;
                                                                        max-width: 220px">${o.title}</td>
                                                                    <td>${o.roleProject}</td>
                                                                    <td>${o.getCreatedByOrg().organizationId}</td>
                                                                    <td>${o.startDate}</td>
                                                                    <td>${o.endDate}</td>
                                                                    <td>${o.status}</td>
                                                                    <td >
                                                                        <a href="#"class="btn btn-sm btn-info">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                        <div style="display: inline">
                                                                            <button  class="btn btn-sm btn-success" onclick="confirmAction(${o.projectId})">
                                                                                <i class="fa-solid fa-delete-left"></i>Delete
                                                                            </button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="pagination">
                                                    <button id="prevBtn" onclick="prevPage()">Previous</button>
                                                    <div id="pageNumbers"></div>
                                                    <button id="nextBtn" onclick="nextPage()">Next</button>
                                                </div>



                                                <c:set var="totalItemsi" value="${fn:length(inactive)}" />
                                                <c:set var="itemsPerPagei" value="5" />
                                                <c:set var="totalPagesi" value="${(totalItemsi / itemsPerPagei) + (totalItemsi % itemsPerPagei > 0 ? 1 : 0)}" />
                                                <c:set var="currentPagei" value="1" />
                                                <div style="margin-bottom: 10px;" style="display: flex" class="card-header">
                                                    <h2 style="margin-top: 70px; ">Dự án đã kết thúc</h2>
                                                    <input style="border-radius: 5px; width: 150px; font-size: 15px ;  " type="text" id="searchInputi" placeholder="nhập tên tổ chức..." onkeyup="" />
                                                    <input style="border-radius: 5px; width: 150px; font-size: 15px; margin-left: 10px ;" type="text" id="searchTitlei" placeholder="nhập tên dự án..." onkeyup="" />
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Title</th>
                                                                <th>Role</th>
                                                                <th>Created By</th>
                                                                <th>Started Date</th>
                                                                <th>End Date</th>
                                                                <th>Status</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="o" items="${inactive}" varStatus="statusi">
                                                                <tr class="article-itemi" id="${o.projectId}" tilteprji="${o.title}" data-namei="${o.getCreatedByOrg().getName()}">
                                                                    <td>${o.projectId}</td>
                                                                    <td style="white-space: nowrap;       /* Giữ văn bản trên 1 dòng */
                                                                        overflow: hidden;          /* Ẩn phần văn bản vượt quá */
                                                                        text-overflow: ellipsis;
                                                                        max-width: 220px">${o.title}</td>
                                                                    <td>${o.roleProject}</td>
                                                                    <td>${o.getCreatedByOrg().organizationId}</td>
                                                                    <td>${o.startDate}</td>
                                                                    <td>${o.endDate}</td>
                                                                    <td>đã kết thúc</td>
                                                                    <td >
                                                                        <a href="#"class="btn btn-sm btn-info">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                        <div style="display: inline">
                                                                            <button  class="btn btn-sm btn-success" onclick="confirmAction(${o.projectId})">
                                                                                <i class="fa-solid fa-delete-left"></i>Delete
                                                                            </button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="paginationi">
                                                    <button id="prevBtni" onclick="prevPagei()">Previous</button>
                                                    <div id="pageNumbersi"></div>
                                                    <button id="nextBtni" onclick="nextPagei()">Next</button>
                                                </div>
                                            </div>
                                            <!-- Pending Organizations Tab -->
                                            <div class="tab-pane fade" id="pending" role="tabpanel">
                                                <div style="display: flex;margin-top: -80px; padding-bottom: 55px;" class="card-header">

                                                    <input style="border-radius: 5px; width: 150px; font-size: 15px " type="text" id="searchInputp" placeholder="by user name..." onkeyup="" />
                                                    
                                                </div>
                                                <c:set var="totalItemsp" value="${fn:length(pwait)}" />
                                                <c:set var="itemsPerPagep" value="5" />
                                                <c:set var="totalPagesp" value="${(totalItemsp / itemsPerPagep) + (totalItemsp % itemsPerPagep > 0 ? 1 : 0)}" />
                                                <c:set var="currentPagep" value="1" />
                                                <div class="table-responsive">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Name</th>
                                                                <th>Email</th>
                                                                <th>Phone</th>
                                                                <th>Send Request Date</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="o" items="${pwait}" varStatus="statusp">
                                                                <tr class="articlep-item"  data-namep="${o.getCreatedByOrg().getName()}" id="${o.getProjectId()}">
                                                                    <td>${o.getCreatedByOrg().getOrganizationId()}</td>
                                                                    <td>${o.getCreatedByOrg().getName()}</td>
                                                                    <td>${o.getCreatedByOrg().getEmail()}</td>
                                                                    <td>${o.getCreatedByOrg().getPhone()}</td>
                                                                    <td>${o.getCreatedAt()}</td>
                                                                    <td>
                                                                        <a id="${o.getProjectId()}" onclick="showFloatingTabp('${o.projectId}', '${o.title}', '${o.image}', '${o.description}',
                                                                                    '${o.startDate}', '${o.endDate}', '${o.document}',
                                                                                    '${o.roleProject}', '${o.status}', '${o.createdByOrg.name}', '${o.createdByOrg.image}',
                                                                                    '${o.createdAt}')" class="btn btn-sm btn-info">
                                                                            <i class="fa fa-eye"></i>
                                                                        </a>
                                                                        <form  style="display: inline;">

                                                                            <button type="button" class="btn btn-sm btn-success" onclick="confirmActionpfast('approve',${o.getProjectId()})">
                                                                                <i class="fa fa-check"></i> Approve
                                                                            </button>
                                                                            <button type="button" class="btn btn-sm btn-success" onclick="confirmActionpfast('reject',${o.getProjectId()})">
                                                                                <i class="fa-solid fa-delete-left"></i>Reject
                                                                            </button>
                                                                        </form>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="paginationp">
                                                    <button id="prevBtnp" onclick="prevPagep()">Previous</button>
                                                    <div id="pageNumbersp"></div>
                                                    <button id="nextBtnp" onclick="nextPagep()">Next</button>
                                                </div>
                                                <!-- --> 
                                                <div class="floatingp-tab" id="floatingTabp" style="display:none;">
                                                    <div class="tabp-content">
                                                        <div style="display: flex">
                                                            <div style=" justify-content: space-between; align-items: center;">
                                                                <div style="display: flex; justify-content: space-between; align-items: center;">
                                                                    <div>
                                                                        <span class="closep-btn" onclick="closeFloatingTabp()">&times;</span>
                                                                    </div>
                                                                    <div style="flex-grow: 1; text-align: center;">
                                                                        <h1 id="tabtitle">Detail content here...</h1>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div style="display: flex">
                                                                <img src="https://via.placeholder.com/100" alt="Profile Picture" id="tabimagep" class="profilep-image">
                                                                <div class="profilep-info">
                                                                    <input type="hidden" id="projectid" value=""/>
                                                                    <input type="hidden" id="pStatus" value=""/>
                                                                    <div class="profile-card">
                                                                        <img class="crtbyo-image" id="createdbyimg" alt="Profile Picture" src="https://via.placeholder.com/100">
                                                                        <h4 class="orgname" id="tabcreatedbyp"><a href="#" target="_blank"></a></h4>
                                                                    </div>
                                                                    <p id="tabdoc">Document: <a href="#" download="document.jpg" target="_blank"><i class="fa fa-download"></i></a></p>
                                                                    <p id="tabrolep">role: <span></span></p>
                                                                    <p id="tabstartdate">Start Date: <span></span></p>
                                                                    <p id="tabenddate">End Date: <span></span></p>
                                                                    <p id="tabcrtat"><span></span></p>

                                                                    <hr/>
                                                                    <br/>

                                                                </div>
                                                            </div>


                                                            <!--Thêm nút Duyệt và Từ chối--> 
                                                        </div>
                                                    </div>
                                                    <hr/>
                                                    <!--<br/>-->
                                                    <p id="tabdescrip">Detail content here...</p>
                                                    <hr/>
                                                    <div class="actionp-buttons">
                                                        <button class="approvep-btn" onclick="confirmActionp('approve')">Approve</button>
                                                        <button class="rejectp-btn" onclick="confirmActionp('reject')">Reject</button>
                                                    </div>
                                                </div>

                                                <!--Overlay--> 
                                                <div class="overlayp" id="overlayp" style="display:none;" onclick="closeFloatingTabp()"></div>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <footer class="footer">
                <div class="container-fluid d-flex justify-content-between">
                    <nav class="pull-left">
                        <ul class="nav">
                            <li class="nav-item">

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"> Help </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"> Licenses </a>
                            </li>
                        </ul>
                    </nav>
                    <div class="copyright">

                    </div>
                    <div>

                    </div>
                </div>
            </footer>
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

                                                    function showFloating(id, image, createdBy, name, description, website, phone, email, staffId, approvalDate, establishmentTime, organizationStatus) {
                                                    // Ghi log ID ra console
                                                    console.log("Organization ID:", id);
                                                    // Cập nhật tiêu đề và nội dung chi tiết
                                                    document.getElementById('tabimage').src = image;
                                                    document.getElementById('tabName').innerText = name;
                                                    document.getElementById('tabcreatedby').querySelector('a').innerText = createdBy;
                                                    document.getElementById('tabDetail').innerText = description;
                                                    document.getElementById('tabWebsite').querySelector('a').innerText = website;
                                                    document.getElementById('tabWebsite').querySelector('a').href = website;
                                                    document.getElementById('tabPhone').querySelector('span').innerText = phone;
                                                    document.getElementById('tabEmail').querySelector('span').innerText = email;
//                document.getElementById('tabStaffId').querySelector('span').innerText = staffId;
                                                    document.getElementById('tabApprovalDate').querySelector('span').innerText = approvalDate;
                                                    document.getElementById('tabEstablishmentTime').querySelector('span').innerText = establishmentTime;
//                document.getElementById('tabStatus').querySelector('span').innerText = organizationStatus;
                                                    document.getElementById("organizationId").value = id;
                                                    document.getElementById("organizationStatus").value = organizationStatus;
                                                    // Hiển thị Floating Tab và Overlay
                                                    document.getElementById('floatingTab').style.display = 'block';
                                                    document.getElementById('overlay').style.display = 'block';
                                                    }

                                                    function closeFloatingTab() {
                                                    document.getElementById('tabimage').src = "";
                                                    document.getElementById('tabName').innerText = "";
                                                    document.getElementById('tabcreatedby').querySelector('a').innerText = "";
                                                    document.getElementById('tabDetail').innerText = "";
                                                    document.getElementById('tabWebsite').querySelector('a').innerText = "";
                                                    document.getElementById('tabWebsite').querySelector('a').href = "";
                                                    document.getElementById('tabPhone').querySelector('span').innerText = "";
                                                    document.getElementById('tabEmail').querySelector('span').innerText = "";
//                document.getElementById('tabStaffId').querySelector('span').innerText = staffId;
                                                    document.getElementById('tabApprovalDate').querySelector('span').innerText = "";
                                                    document.getElementById('tabEstablishmentTime').querySelector('span').innerText = "";
//                document.getElementById('tabStatus').querySelector('span').innerText = organizationStatus;
                                                    document.getElementById("organizationId").value = "";
                                                    document.getElementById("organizationStatus").value = "";
                                                    // Ẩn Floating Tab và Overlay
                                                    document.getElementById('floatingTab').style.display = 'none';
                                                    document.getElementById('overlay').style.display = 'none';
                                                    }
    </script>
    <script>
        let currentPage = 0;
        const itemsPerPage = 5; // Số lượng item mỗi trang
        const items = Array.from(document.querySelectorAll('.article-item'));
        let itemresults = items; // Danh sách các item hiện tại để phân trang

// Lấy thẻ input và thêm sự kiện 'input'
        const searchInput = document.getElementById('searchInput');
        const searchTitle = document.getElementById('searchTitle');
        
        
        
        searchInput.addEventListener('input', () => {
        // Lấy giá trị tìm kiếm từ input và chuyển về chữ thường, loại bỏ khoảng trắng thừa
        const query = searchInput.value.toLowerCase().trim();
        // Lọc các item có chứa giá trị tìm kiếm
        itemresults = items.filter(item =>
                item.getAttribute('data-name').toLowerCase().includes(query)
                );
        // Hiển thị lại các item theo trang
        currentPage = 0; // Reset lại trang hiện tại về 0 khi tìm kiếm
        showPage(currentPage);
        });
        
        searchTitle.addEventListener('input', () => {
        // Lấy giá trị tìm kiếm từ input và chuyển về chữ thường, loại bỏ khoảng trắng thừa
        const query = searchTitle.value.toLowerCase().trim();
        // Lọc các item có chứa giá trị tìm kiếm
        itemresults = items.filter(item =>
                item.getAttribute('tilteprj').toLowerCase().includes(query)
                );
        // Hiển thị lại các item theo trang
        currentPage = 0; // Reset lại trang hiện tại về 0 khi tìm kiếm
        showPage(currentPage);
        });
        
        function showPage(page) {
        const start = page * itemsPerPage;
        const end = start + itemsPerPage;
        // Ẩn tất cả các item trước khi hiển thị các item mới
        items.forEach(item => item.style.display = 'none');
        // Hiển thị các item trong khoảng start và end từ itemresults
        itemresults.forEach((item, index) => {
        if (index >= start && index < end) {
        item.style.display = '';
        }
        });
        // Cập nhật lại phân trang dựa trên itemresults
        updatePagination(page, itemresults.length);
        }

        function updatePagination(current, totalItems) {
        const pagination = document.getElementById('pageNumbers');
        pagination.innerHTML = '';
        const totalPages = Math.ceil(totalItems / itemsPerPage);
        const startPage = Math.max(0, current - 2);
        const endPage = Math.min(totalPages, current + 3);
        // Nút đầu tiên
        if (startPage > 0) {
        const btnFirst = document.createElement('button');
        btnFirst.textContent = 1;
        btnFirst.onclick = () => showPage(0);
        pagination.appendChild(btnFirst);
        if (startPage > 1) {
        const dots = document.createElement('button');
        dots.textContent = '...';
        dots.className = 'disabled';
        pagination.appendChild(dots);
        }
        }

        // Các nút số trang
        for (let i = startPage; i < endPage; i++) {
        const btn = document.createElement('button');
        btn.textContent = i + 1;
        btn.className = i === current ? 'active' : '';
        btn.onclick = () => showPage(i);
        pagination.appendChild(btn);
        }

        // Nút cuối cùng
        if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
        const dots = document.createElement('button');
        dots.textContent = '...';
        dots.className = 'disabled';
        pagination.appendChild(dots);
        }
        const btnLast = document.createElement('button');
        btnLast.textContent = totalPages;
        btnLast.onclick = () => showPage(totalPages - 1);
        pagination.appendChild(btnLast);
        }

        // Cập nhật trạng thái của nút Previous và Next
        document.getElementById('prevBtn').style.display = (current > 0) ? 'inline-block' : 'none';
        document.getElementById('nextBtn').style.display = (current < totalPages - 1) ? 'inline-block' : 'none';
        }

        function nextPage() {
        if ((currentPage + 1) * itemsPerPage < itemresults.length) {
        currentPage++;
        showPage(currentPage);
        }
        }

        function prevPage() {
        if (currentPage > 0) {
        currentPage--;
        showPage(currentPage);
        }
        }

// Khởi động với trang đầu tiên
        showPage(currentPage);
    </script>
    <script>
        function confirmAction(orgId) {
        
        var status = 'delete';
        console.log(orgId);
     
        // Gọi hàm update trong DAO để thay đổi trạng thái tổ chức
        handleApprove(orgId, status);
        }


        function handleApprove(id, status) {
        // Gọi hàm Ajax để cập nhật thông tin
        fetch('/swp/approval', {
        method: 'POST',
                headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'orgid=' + encodeURIComponent(id) + '&sta=' + encodeURIComponent(status)
        })
                .then(response => {
                if (response.ok) {
                return response.text(); // Nhận dữ liệu trả về từ server
                } else {
                throw new Error('Cập nhật không thành công');
                }
                })
                .then(result => {
                swal({
                title: "Successfully!",
                        text: status+" project " + id + " success!",
                        icon: "success",
                }).then((willSubmit) => {
                if (willSubmit) {
                window.location.reload();
                }
                });
                })
                .catch(error => {
                console.error('Lỗi:', error);
                swal({
                title: "Action Failed!",
                        text: "An error occurred while updating. Please try again later.!",
                        icon: "warning",
                });
                });
        }

    </script>
    
    <script>
        let currentPagei = 0;
        const itemsPerPagei = 5; // Số lượng item mỗi trang
        const itemsi = Array.from(document.querySelectorAll('.article-itemi'));
        let itemresultsi = itemsi; // Danh sách các item hiện tại để phân trang

// Lấy thẻ input và thêm sự kiện 'input'
        const searchInputi = document.getElementById('searchInputi');
        const searchTitlei = document.getElementById('searchTitlei');
        
        
        
        searchInputi.addEventListener('input', () => {
        // Lấy giá trị tìm kiếm từ input và chuyển về chữ thường, loại bỏ khoảng trắng thừa
        const queryi = searchInputi.value.toLowerCase().trim();
        // Lọc các item có chứa giá trị tìm kiếm
        itemresultsi = itemsi.filter(item =>
                item.getAttribute('data-namei').toLowerCase().includes(queryi)
                );
        // Hiển thị lại các item theo trang
        currentPagei = 0; // Reset lại trang hiện tại về 0 khi tìm kiếm
        showPagei(currentPagei);
        });
        
        searchTitlei.addEventListener('input', () => {
        // Lấy giá trị tìm kiếm từ input và chuyển về chữ thường, loại bỏ khoảng trắng thừa
        const queryi = searchTitlei.value.toLowerCase().trim();
        // Lọc các item có chứa giá trị tìm kiếm
        itemresultsi = itemsi.filter(item =>
                item.getAttribute('tilteprji').toLowerCase().includes(queryi)
                );
        // Hiển thị lại các item theo trang
        currentPagei = 0; // Reset lại trang hiện tại về 0 khi tìm kiếm
        showPagei(currentPagei);
        });
        
        function showPagei(page) {
        const start = page * itemsPerPagei;
        const end = start + itemsPerPagei;
        // Ẩn tất cả các item trước khi hiển thị các item mới
        itemsi.forEach(item => item.style.display = 'none');
        // Hiển thị các item trong khoảng start và end từ itemresults
        itemresultsi.forEach((item, index) => {
        if (index >= start && index < end) {
        item.style.display = '';
        }
        });
        // Cập nhật lại phân trang dựa trên itemresults
        updatePaginationi(page, itemresultsi.length);
        }

        function updatePaginationi(current, totalItems) {
        const pagination = document.getElementById('pageNumbersi');
        pagination.innerHTML = '';
        const totalPages = Math.ceil(totalItems / itemsPerPagei);
        const startPage = Math.max(0, current - 2);
        const endPage = Math.min(totalPages, current + 3);
        // Nút đầu tiên
        if (startPage > 0) {
        const btnFirst = document.createElement('button');
        btnFirst.textContent = 1;
        btnFirst.onclick = () => showPage(0);
        pagination.appendChild(btnFirst);
        if (startPage > 1) {
        const dots = document.createElement('button');
        dots.textContent = '...';
        dots.className = 'disabled';
        pagination.appendChild(dots);
        }
        }

        // Các nút số trang
        for (let i = startPage; i < endPage; i++) {
        const btn = document.createElement('button');
        btn.textContent = i + 1;
        btn.className = i === current ? 'active' : '';
        btn.onclick = () => showPagei(i);
        pagination.appendChild(btn);
        }

        // Nút cuối cùng
        if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
        const dots = document.createElement('button');
        dots.textContent = '...';
        dots.className = 'disabled';
        pagination.appendChild(dots);
        }
        const btnLast = document.createElement('button');
        btnLast.textContent = totalPages;
        btnLast.onclick = () => showPagei(totalPages - 1);
        pagination.appendChild(btnLast);
        }

        // Cập nhật trạng thái của nút Previous và Next
        document.getElementById('prevBtni').style.display = (current > 0) ? 'inline-block' : 'none';
        document.getElementById('nextBtni').style.display = (current < totalPages - 1) ? 'inline-block' : 'none';
        }

        function nextPagei() {
        if ((currentPage + 1) * itemsPerPagei < itemresultsi.length) {
        currentPage++;
        showPagei(currentPage);
        }
        }

        function prevPagei() {
        if (currentPage > 0) {
        currentPage--;
        showPagei(currentPage);
        }
        }

// Khởi động với trang đầu tiên
        showPagei(currentPage);
    </script>
    

    <script>
        let currentPagep = 0;
        const itemsPerPagep = 5; // Số lượng item mỗi trang
        const itemsp = Array.from(document.querySelectorAll('.articlep-item'));
        let itemresultsp = itemsp; // Danh sách các item hiện tại để phân trang

// Lấy thẻ input và thêm sự kiện 'input'
        const searchInputp = document.getElementById('searchInputp');
        
        searchInputp.addEventListener('input', () => {
        // Lấy giá trị tìm kiếm từ input và chuyển về chữ thường, loại bỏ khoảng trắng thừa
        const queryp = searchInputp.value.toLowerCase().trim();
        // Lọc các item có chứa giá trị tìm kiếm
        itemresultsp = itemsp.filter(item =>
                item.getAttribute('data-namep').toLowerCase().includes(queryp)
                );
        // Hiển thị lại các item theo trang
        currentPagep = 0; // Reset lại trang hiện tại về 0 khi tìm kiếm
        showPagep(currentPagep);
        });
        
        
        function showPagep(page) {
        const start = page * itemsPerPagep;
        const end = start + itemsPerPagep;
        // Ẩn tất cả các item trước khi hiển thị các item mới
        itemsp.forEach(item => item.style.display = 'none');
        // Hiển thị các item trong khoảng start và end từ itemresults
        itemresultsp.forEach((item, index) => {
        if (index >= start && index < end) {
        item.style.display = '';
        }
        });
        // Cập nhật lại phân trang dựa trên itemresults
        updatePaginationp(page, itemresultsp.length);
        }

        function updatePaginationp(current, totalItems) {
        const pagination = document.getElementById('pageNumbersp');
        pagination.innerHTML = '';
        const totalPages = Math.ceil(totalItems / itemsPerPagep);
        const startPage = Math.max(0, current - 2);
        const endPage = Math.min(totalPages, current + 3);
        // Nút đầu tiên
        if (startPage > 0) {
        const btnFirst = document.createElement('button');
        btnFirst.textContent = 1;
        btnFirst.onclick = () => showPagep(0);
        pagination.appendChild(btnFirst);
        if (startPage > 1) {
        const dots = document.createElement('button');
        dots.textContent = '...';
        dots.className = 'disabled';
        pagination.appendChild(dots);
        }
        }

        // Các nút số trang
        for (let i = startPage; i < endPage; i++) {
        const btn = document.createElement('button');
        btn.textContent = i + 1;
        btn.className = i === current ? 'activep' : '';
        btn.onclick = () => showPagep(i);
        pagination.appendChild(btn);
        }

        // Nút cuối cùng
        if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
        const dots = document.createElement('button');
        dots.textContent = '...';
        dots.className = 'disabled';
        pagination.appendChild(dots);
        }
        const btnLast = document.createElement('button');
        btnLast.textContent = totalPages;
        btnLast.onclick = () => showPagep(totalPages - 1);
        pagination.appendChild(btnLast);
        }

        // Cập nhật trạng thái của nút Previous và Next
        document.getElementById('prevBtnp').style.display = (current > 0) ? 'inline-block' : 'none';
        document.getElementById('nextBtnp').style.display = (current < totalPages - 1) ? 'inline-block' : 'none';
        }

        function nextPagep() {
        if ((currentPagep + 1) * itemsPerPagep < itemresultsp.length) {
        currentPagep++;
        showPagep(currentPagep);
        }
        }

        function prevPagep() {
        if (currentPagep > 0) {
        currentPagep--;
        showPagep(currentPagep);
        }
        }

// Khởi động với trang đầu tiên
        showPagep(currentPagep);
    </script>
    <script>
        function confirmActionp(actionp) {
        // Hiển thị hộp thoại xác nhận trước khi tiếp tục

        var prjId = document.getElementById("projectid").value;
//                    var orjid = document.getElementById("organizationId").value;
        var statusp = actionp === 'approve' ? 'approved' : 'rejected';
        console.log(prjId);
        console.log(statusp);
//                    console.log(orjid);
        // Gọi hàm update trong DAO để thay đổi trạng thái tổ chức
        handleApprovep(prjId, statusp);
        }
        function confirmActionpfast(actionp, prjId) {

        var statusp = actionp === 'approve' ? 'approved' : 'rejected';
        console.log(prjId);
        console.log(statusp);
//                    console.log(orjid);
        // Gọi hàm update trong DAO để thay đổi trạng thái tổ chức
        handleApprovep(prjId, statusp);
        }

        function handleApprovep(idp, statusp) {
        // Gọi hàm Ajax để cập nhật thông tin
        fetch('/swp/approval', {
        method: 'POST',
                headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'prjid=' + encodeURIComponent(idp) + '&statusp=' + encodeURIComponent(statusp)
        })
                .then(response => {
                if (response.ok) {
                return response.text(); // Nhận dữ liệu trả về từ server
                } else {
                throw new Error('Cập nhật không thành công');
                }
                })
                .then(result => {
                // Hiển thị thông báo thành công
                swal({
                title: "Successfully!",
                        text: statusp + "  project " + idp + " Successful",
                        icon: "success",
                }).then((willSubmit) => {
                if (willSubmit) {
                window.location.reload();
                }
                });
                })
                .catch(error => {
                console.error('Lỗi:', error);
                swal({
                title: "Action Failed!",
                        text: "An error occurred while updating. Please try again later.!",
                        icon: "warning",
                });
                });
        }


    </script>  

    <script>

        function showFloatingTabp(projectId, title, image, description, startDate, endDate, documenttt, roleProject, status, createdByOrg, orgimage, createdAt) {
        // Ẩn Floating Tab và Overlay
        document.getElementById('tabimagep').src = image;
        document.getElementById('createdbyimg').src = orgimage;
        document.getElementById('tabtitle').innerText = title;
        document.getElementById('tabcreatedbyp').querySelector('a').innerText = createdByOrg;
        document.getElementById('tabdescrip').innerText = description;
//                document.getElementById('tabdoc').querySelector('a').innerText = documenttt;
        document.getElementById('tabdoc').querySelector('a').href = documenttt;
        document.getElementById('tabrolep').querySelector('span').innerText = roleProject;
        document.getElementById('tabcrtat').querySelector('span').innerText = createdAt;
//                document.getElementById('tabStaffId').querySelector('span').innerText = staffId;
        document.getElementById('tabstartdate').querySelector('span').innerText = startDate;
        document.getElementById('tabenddate').querySelector('span').innerText = endDate;
        document.getElementById("projectid").value = projectId;
        document.getElementById("pStatus").value = status;
        document.getElementById('floatingTabp').style.display = 'block';
        document.getElementById('overlayp').style.display = 'block';
        }
        function closeFloatingTabp() {
        // Ẩn Floating Tab và Overlay
        document.getElementById('tabimagep').src = "";
        document.getElementById('tabtitle').innerText = "";
        document.getElementById('tabcreatedbyp').querySelector('a').innerText = "";
        document.getElementById('tabdescrip').innerText = "";
        document.getElementById('tabdoc').querySelector('a').href = "";
//                document.getElementById('tabWebsite').querySelector('a').href = ;
        document.getElementById('tabrolep').querySelector('span').innerText = "";
        document.getElementById('tabcrtat').querySelector('span').innerText = "";
//                document.getElementById('tabStaffId').querySelector('span').innerText = staffId;
        document.getElementById('tabstartdate').querySelector('span').innerText = "";
        document.getElementById('tabenddate').querySelector('span').innerText = "";
        document.getElementById("projectid").value = "";
        document.getElementById("pStatus").value = "";
        document.getElementById('floatingTabp').style.display = 'none';
        document.getElementById('overlayp').style.display = 'none';
        }
    </script>

    <script>
        $(document).ready(function () {
        // Initialize Bootstrap tabs
        $('#organTab a').on('click', function (e) {
        e.preventDefault();
        $(this).tab('show');
        });
        });
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</body>
</html>
