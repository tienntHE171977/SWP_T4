<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Datatables - Kaiadmin Bootstrap 5 Admin Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="assets/img/kaiadmin/favicon.ico"
            type="image/x-icon"
            />

        <!-- Fonts and icons -->
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css" />
    </head>
    <style>
        /* Container cho các item */
        #organizationItems {
            display: flex;
            flex-direction: column; /* Sắp xếp theo cột */
            gap: 15px;
        }

        .article-item {
            display: flex;
            align-items: center;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            cursor: pointer;
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
        .article-item img {
            width: 100px;             /* Đặt chiều rộng hình ảnh cố định */
            height: auto;             /* Giữ tỉ lệ khung hình */
            border-radius: 5px;      /* Bo tròn các góc của hình ảnh */
            margin-right: 15px;       /* Khoảng cách bên phải giữa hình ảnh và nội dung */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ cho hình ảnh */
        }

        /* Đảm bảo các item căn chỉnh đồng đều */
        .article-item {
            display: flex;
            align-items: center;      /* Căn giữa hình ảnh và nội dung */
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            cursor: pointer;
            font-size: 18px;
        }
        .article-summary {
            font-size: 14px;
            color: #666;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* Số dòng tối đa muốn hiển thị */

            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            width: 650px; /* Đặt chiều rộng cố định */
        }

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

        .articlep-item {
            display: flex;
            align-items: center;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            cursor: pointer;
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
        /* Style cho hình ảnh */
        .articlep-item img {
            width: 100px;             /* Đặt chiều rộng hình ảnh cố định */
            height: auto;             /* Giữ tỉ lệ khung hình */
            border-radius: 5px;      /* Bo tròn các góc của hình ảnh */
            margin-right: 15px;       /* Khoảng cách bên phải giữa hình ảnh và nội dung */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ cho hình ảnh */
        }

        /* Đảm bảo các item căn chỉnh đồng đều */
        .articlep-item {
            display: flex;
            align-items: center;      /* Căn giữa hình ảnh và nội dung */
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            cursor: pointer;
            font-size: 18px;
        }
        .articlep-summary {
            font-size: 14px;
            color: #666;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* Số dòng tối đa muốn hiển thị */
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            width: 650px; /* Đặt chiều rộng cố định */
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
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar" data-background-color="dark">
                <div class="sidebar-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark">
                        <a href="index.html" class="logo">
                            <img
                                src="assets/img/kaiadmin/logo_light.svg"
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
                            <li class="nav-item">
                                <a
                                    data-bs-toggle="collapse"
                                    href="#dashboard"
                                    class="collapsed"
                                    aria-expanded="false"
                                    >
                                    <i class="fas fa-home"></i>
                                    <p>Dashboard</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="dashboard">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="demo1/index.html">
                                                <span class="sub-item">Dashboard 1</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Components</h4>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#base">
                                    <i class="fas fa-layer-group"></i>
                                    <p>Base</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="base">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="components/avatars.html">
                                                <span class="sub-item">Avatars</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/buttons.html">
                                                <span class="sub-item">Buttons</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/gridsystem.html">
                                                <span class="sub-item">Grid System</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/panels.html">
                                                <span class="sub-item">Panels</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/notifications.html">
                                                <span class="sub-item">Notifications</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/sweetalert.html">
                                                <span class="sub-item">Sweet Alert</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/font-awesome-icons.html">
                                                <span class="sub-item">Font Awesome Icons</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/simple-line-icons.html">
                                                <span class="sub-item">Simple Line Icons</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="components/typography.html">
                                                <span class="sub-item">Typography</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#sidebarLayouts">
                                    <i class="fas fa-th-list"></i>
                                    <p>Sidebar Layouts</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="sidebarLayouts">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="sidebar-style-2.html">
                                                <span class="sub-item">Sidebar Style 2</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="icon-menu.html">
                                                <span class="sub-item">Icon Menu</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#forms">
                                    <i class="fas fa-pen-square"></i>
                                    <p>Forms</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="forms">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="forms/forms.html">
                                                <span class="sub-item">Basic Form</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item active submenu">
                                <a data-bs-toggle="collapse" href="#tables">
                                    <i class="fas fa-table"></i>
                                    <p>Tables</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse show" id="tables">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="tables/tables.html">
                                                <span class="sub-item">Basic Table</span>
                                            </a>
                                        </li>
                                        <li class="active">
                                            <a href="tables/datatables.html">
                                                <span class="sub-item">Datatables</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#maps">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <p>Maps</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="maps">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="maps/googlemaps.html">
                                                <span class="sub-item">Google Maps</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="maps/jsvectormap.html">
                                                <span class="sub-item">Jsvectormap</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#charts">
                                    <i class="far fa-chart-bar"></i>
                                    <p>Charts</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="charts">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="charts/charts.html">
                                                <span class="sub-item">Chart Js</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="charts/sparkline.html">
                                                <span class="sub-item">Sparkline</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a href="widgets.html">
                                    <i class="fas fa-desktop"></i>
                                    <p>Widgets</p>
                                    <span class="badge badge-success">4</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="documentation/index.html">
                                    <i class="fas fa-file"></i>
                                    <p>Documentation</p>
                                    <span class="badge badge-secondary">1</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#submenu">
                                    <i class="fas fa-bars"></i>
                                    <p>Menu Levels</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="submenu">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a data-bs-toggle="collapse" href="#subnav1">
                                                <span class="sub-item">Level 1</span>
                                                <span class="caret"></span>
                                            </a>
                                            <div class="collapse" id="subnav1">
                                                <ul class="nav nav-collapse subnav">
                                                    <li>
                                                        <a href="#">
                                                            <span class="sub-item">Level 2</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span class="sub-item">Level 2</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <a data-bs-toggle="collapse" href="#subnav2">
                                                <span class="sub-item">Level 1</span>
                                                <span class="caret"></span>
                                            </a>
                                            <div class="collapse" id="subnav2">
                                                <ul class="nav nav-collapse subnav">
                                                    <li>
                                                        <a href="#">
                                                            <span class="sub-item">Level 2</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span class="sub-item">Level 1</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
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
                                    src="assets/img/kaiadmin/logo_light.svg"
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
                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                >
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button type="submit" class="btn btn-search pe-1">
                                            <i class="fa fa-search search-icon"></i>
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
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        id="messageDropdown"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                    <ul
                                        class="dropdown-menu messages-notif-box animated fadeIn"
                                        aria-labelledby="messageDropdown"
                                        >
                                        <li>
                                            <div
                                                class="dropdown-title d-flex justify-content-between align-items-center"
                                                >
                                                Messages
                                                <a href="#" class="small">Mark all as read</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="message-notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/jm_denis.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Jimmy Denis</span>
                                                            <span class="block"> How are you ? </span>
                                                            <span class="time">5 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/chadengle.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Chad</span>
                                                            <span class="block"> Ok, Thanks ! </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/mlane.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Jhon Doe</span>
                                                            <span class="block">
                                                                Ready for the meeting today...
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src=".assets/img/talha.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="subject">Talha</span>
                                                            <span class="block"> Hi, Apa Kabar ? </span>
                                                            <span class="time">17 minutes ago</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);"
                                               >See all messages<i class="fa fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        id="notifDropdown"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="fa fa-bell"></i>
                                        <span class="notification">4</span>
                                    </a>
                                    <ul
                                        class="dropdown-menu notif-box animated fadeIn"
                                        aria-labelledby="notifDropdown"
                                        >
                                        <li>
                                            <div class="dropdown-title">
                                                You have 4 new notification
                                            </div>
                                        </li>
                                        <li>
                                            <div class="notif-scroll scrollbar-outer">
                                                <div class="notif-center">
                                                    <a href="#">
                                                        <div class="notif-icon notif-primary">
                                                            <i class="fa fa-user-plus"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block"> New user registered </span>
                                                            <span class="time">5 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-icon notif-success">
                                                            <i class="fa fa-comment"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block">
                                                                Rahmad commented on Admin
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-img">
                                                            <img
                                                                src="assets/img/profile2.jpg"
                                                                alt="Img Profile"
                                                                />
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block">
                                                                Reza send messages to you
                                                            </span>
                                                            <span class="time">12 minutes ago</span>
                                                        </div>
                                                    </a>
                                                    <a href="#">
                                                        <div class="notif-icon notif-danger">
                                                            <i class="fa fa-heart"></i>
                                                        </div>
                                                        <div class="notif-content">
                                                            <span class="block"> Farrah liked Admin </span>
                                                            <span class="time">17 minutes ago</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="see-all" href="javascript:void(0);"
                                               >See all notifications<i class="fa fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        aria-expanded="false"
                                        >
                                        <i class="fas fa-layer-group"></i>
                                    </a>
                                    <div class="dropdown-menu quick-actions animated fadeIn">
                                        <div class="quick-actions-header">
                                            <span class="title mb-1">Quick Actions</span>
                                            <span class="subtitle op-7">Shortcuts</span>
                                        </div>
                                        <div class="quick-actions-scroll scrollbar-outer">
                                            <div class="quick-actions-items">
                                                <div class="row m-0">
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div class="avatar-item bg-danger rounded-circle">
                                                                <i class="far fa-calendar-alt"></i>
                                                            </div>
                                                            <span class="text">Calendar</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-warning rounded-circle"
                                                                >
                                                                <i class="fas fa-map"></i>
                                                            </div>
                                                            <span class="text">Maps</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div class="avatar-item bg-info rounded-circle">
                                                                <i class="fas fa-file-excel"></i>
                                                            </div>
                                                            <span class="text">Reports</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-success rounded-circle"
                                                                >
                                                                <i class="fas fa-envelope"></i>
                                                            </div>
                                                            <span class="text">Emails</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-primary rounded-circle"
                                                                >
                                                                <i class="fas fa-file-invoice-dollar"></i>
                                                            </div>
                                                            <span class="text">Invoice</span>
                                                        </div>
                                                    </a>
                                                    <a class="col-6 col-md-4 p-0" href="#">
                                                        <div class="quick-actions-item">
                                                            <div
                                                                class="avatar-item bg-secondary rounded-circle"
                                                                >
                                                                <i class="fas fa-credit-card"></i>
                                                            </div>
                                                            <span class="text">Payments</span>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                                src="${requestScope.uss.getImage()}"
                                                alt="..."
                                                class="avatar-img rounded-circle"
                                                />
                                        </div>
                                        <span class="profile-username">
                                            <span class="op-7">Hi,</span>
                                            <span class="fw-bold">${requestScope.uss.getFullname()}</span>
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-user animated fadeIn">
                                        <div class="dropdown-user-scroll scrollbar-outer">
                                            <li>
                                                <div class="user-box">
                                                    <div class="avatar-lg">
                                                        <img
                                                            src="${requestScope.uss.getImage()}"
                                                            alt="image profile"
                                                            class="avatar-img rounded"
                                                            />
                                                    </div>
                                                    <div class="u-text">
                                                        <h4>${requestScope.uss.getFullname()}</h4>
                                                        <p class="text-muted">hello@example.com</p>
                                                        <a
                                                            href="profile.html"
                                                            class="btn btn-xs btn-secondary btn-sm"
                                                            >View Profile</a
                                                        >
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">My Profile</a>
                                                <a class="dropdown-item" href="#">My Balance</a>
                                                <a class="dropdown-item" href="#">Inbox</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Account Setting</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Logout</a>
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
                        <div class="page-header">
                            <h3 class="fw-bold mb-3">DataTables.Net</h3>
                            <ul class="breadcrumbs mb-3">
                                <li class="nav-home">
                                    <a href="#">
                                        <i class="icon-home"></i>
                                    </a>
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Tables</a>
                                </li>
                                <li class="separator">
                                    <i class="icon-arrow-right"></i>
                                </li>
                                <li class="nav-item">
                                    <a href="#">Datatables</a>
                                </li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">

                                    <div style="display: flex" class="card-header">
                                        <h4 class="card-title">Organizations Register Request</h4>
                                        <input style="border-radius: 5px; margin-left: 540px; width: 300px " type="text" id="searchInput" placeholder="Search for Organizations Register Request..." onkeyup="" />
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table
                                                id="basic-datatables"
                                                class="display table table-striped table-hover">
                                                <c:if var="o" test="${organizations != null}">
                                                    <div>Không có yêu cầu mở Tổ Chức Từ Thiện nào</div>
                                                </c:if>
                                                <c:set var="totalItems" value="${fn:length(organizations)}" />
                                                <c:set var="itemsPerPage" value="5" />
                                                <c:set var="totalPages" value="${(totalItems / itemsPerPage) + (totalItems % itemsPerPage > 0 ? 1 : 0)}" />
                                                <c:set var="currentPage" value="1" />
                                                <div id="organizationItems">
                                                    <c:forEach var="o" items="${organiztions}" varStatus="status">
                                                        <div class="article-item" data-name="${o.name}" id="${o.getOrganizationId()}" onclick="showFloating('${o.organizationId}', '${o.image}', '${o.createdBy.username}', '${o.name}',
                                                                        '${o.description}', '${o.website}', '${o.phone}',
                                                                        '${o.email}', '${o.staffId}', '${o.approvalDate}',
                                                                        '${o.establishmentTime}', '${o.organizationStatus}')">
                                                            <img src="${o.image}" alt="Hình ảnh bài viết 1" />
                                                            <div>
                                                                <a class="article-title" href="javascript:void(0);">
                                                                    ${o.getCreatedBy().getUsername()} gửi yêu cầu tạo tổ chức ${o.name}
                                                                </a>
                                                                <p class="article-summary">
                                                                    ${o.description}
                                                                </p>
                                                            </div>
                                                        </div>

                                                    </c:forEach>

                                                </div>
                                                <!-- Nút phân trang, chỉ hiển thị một lần -->

                                                <div class="pagination">
                                                    <button id="prevBtn" onclick="prevPage()">Previous</button>
                                                    <div id="pageNumbers"></div>
                                                    <button id="nextBtn" onclick="nextPage()">Next</button>
                                                </div>
                                                <!-- Floating Tab -->
                                                <div class="floating-tab" id="floatingTab" style="display:none;">
                                                    <div class="tab-content">
                                                        <span class="close-btn" onclick="closeFloatingTab()">&times;</span>
                                                        <img src="https://via.placeholder.com/100" alt="Profile Picture" id="tabimage" class="profile-image">
                                                        <div class="profile-info">
                                                            <input type="hidden" id="organizationId" value=""/>
                                                            <input type="hidden" id="organizationStatus" value=""/>
                                                            <h2 id="tabName">Detail content here...</h2>
                                                            <p id="tabcreatedby">Tài khoản: <a href="#" target="_blank"></a></p>
                                                            <p id="tabWebsite">Page: <a href="#" target="_blank"></a></p>
                                                            <p id="tabPhone">Sđt: <span></span></p>
                                                            <p id="tabEmail">Email: <span></span></p>
                                                            <p id="tabEstablishmentTime">Ngày Thành Lập: <span></span></p>
                                                            <p id="tabApprovalDate">Ngày tạo yêu cầu: <span></span></p>
                                                            <hr/>
                                                            <br/>
                                                            <p id="tabDetail">Detail content here...</p>
                                                            <hr/>
                                                            <br/>
                                                            <div class="action-buttons">
                                                                <button class="approve-btn" onclick="confirmAction('approve')">Duyệt</button>
                                                                <button class="reject-btn" onclick="confirmAction('reject')">Từ chối</button>
                                                            </div>
                                                        </div>

                                                        <!-- Thêm nút Duyệt và Từ chối -->
                                                    </div>
                                                </div>

                                                <!-- Overlay -->
                                                <div class="overlay" id="overlay" style="display:none;" onclick="closeFloatingTab()"></div>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div style="display: flex" class="card-header">
                                        <h4 class="card-title">Projects Register Request</h4>
                                        <input style="border-radius: 5px; margin-left: 590px; width: 300px " type="text" id="searchInputp" placeholder="Search for Projects Register Request..." onkeyup="" />
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table
                                                id="basic-datatables"
                                                class="display table table-striped table-hover">
                                                <c:if var="o" test="${pwait == null}">
                                                    <div>Không có yêu cầu mở Tổ Chức Từ Thiện nào</div>
                                                </c:if>
                                                <c:set var="totalItemsp" value="${fn:length(pwait)}" />
                                                <c:set var="itemsPerPagep" value="5" />
                                                <c:set var="totalPagesp" value="${(totalItemsp / itemsPerPagep) + (totalItemsp % itemsPerPagep > 0 ? 1 : 0)}" />
                                                <c:set var="currentPagep" value="1" />
                                                <div id="projectItems">
                                                    <c:forEach var="o" items="${pwait}" varStatus="statusp">
                                                        <div class="articlep-item" data-namep="${o.title}" id="${o.getProjectId()}" onclick="showFloatingTabp('${o.projectId}', '${o.title}', '${o.image}', '${o.description}',
                                                                        '${o.startDate}', '${o.endDate}', '${o.document}',
                                                                        '${o.roleProject}', '${o.status}', '${o.createdByOrg.name}', '${o.createdByOrg.image}',
                                                                        '${o.createdAt}')">
                                                            <img src="${o.getImage()}" alt="Hình ảnh bài viết 1" />
                                                            <div>
                                                                <a class="articlep-title" href="javascript:void(0);">
                                                                    ${o.getCreatedByOrg().getName()} gửi yêu cầu tạo tổ chức ${o.getTitle()}
                                                                </a>
                                                                <p class="articlep-summary">
                                                                    ${o.getDescription()}
                                                                </p>
                                                            </div>
                                                        </div>

                                                    </c:forEach>

                                                </div>
                                                <!--                                                 Nút phân trang, chỉ hiển thị một lần 
                                                
                                                -->                                                <div class="paginationp">
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
                                                        <button class="approvep-btn" onclick="confirmActionp('approve')">Duyệt</button>
                                                        <button class="rejectp-btn" onclick="confirmActionp('reject')">Từ chối</button>
                                                    </div>
                                                </div>

                                                <!--Overlay--> 
                                                <div class="overlayp" id="overlayp" style="display:none;" onclick="closeFloatingTabp()"></div>

                                            </table>
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
                                    <a class="nav-link" href="http://www.themekita.com">
                                        ThemeKita
                                    </a>
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
                            2024, made with <i class="fa fa-heart heart text-danger"></i> by
                            <a href="http://www.themekita.com">ThemeKita</a>
                        </div>
                        <div>
                            Distributed by
                            <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
                        </div>
                    </div>
                </footer>
            </div>

            <!-- Custom template | don't include it in your project! -->
            <div class="custom-template">
                <div class="title">Settings</div>
                <div class="custom-content">
                    <div class="switcher">
                        <div class="switch-block">
                            <h4>Logo Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeLogoHeaderColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeLogoHeaderColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Navbar Header</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="white"
                                    ></button>
                                <br />
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="dark2"
                                    ></button>
                                <button
                                    type="button"
                                    class="selected changeTopBarColor"
                                    data-color="blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="purple2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="light-blue2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="green2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="orange2"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeTopBarColor"
                                    data-color="red2"
                                    ></button>
                            </div>
                        </div>
                        <div class="switch-block">
                            <h4>Sidebar</h4>
                            <div class="btnSwitch">
                                <button
                                    type="button"
                                    class="selected changeSideBarColor"
                                    data-color="white"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark"
                                    ></button>
                                <button
                                    type="button"
                                    class="changeSideBarColor"
                                    data-color="dark2"
                                    ></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="custom-toggle">
                    <i class="icon-settings"></i>
                </div>
            </div>
            <!-- End Custom template -->
        </div>
        <!--   Core JS Files   -->
        <script src="assets/js/core/jquery-3.7.1.min.js"></script>
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>

        <!-- jQuery Scrollbar -->
        <script src=".assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
        <!-- Datatables -->
        <script src="assets/js/plugin/datatables/datatables.min.js"></script>
        <!-- Kaiadmin JS -->
        <script src="assets/js/kaiadmin.min.js"></script>
        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo2.js"></script>

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

            function showPage(page) {
                const start = page * itemsPerPage;
                const end = start + itemsPerPage;

                // Ẩn tất cả các item trước khi hiển thị các item mới
                items.forEach(item => item.style.display = 'none');

                // Hiển thị các item trong khoảng start và end từ itemresults
                itemresults.forEach((item, index) => {
                    if (index >= start && index < end) {
                        item.style.display = 'flex';
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
            function confirmAction(action) {
                var orgId = document.getElementById("organizationId").value;
                var prjId = document.getElementById("projectid").value;
                var status = action === 'approve' ? 'active' : 'inactive';
                console.log(orgId);
                console.log(prjId);
                console.log(status);
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
                            // Hiển thị thông báo thành công
                            alert('Cập nhật thành công!');

                            // Reload lại trang hoặc tải lại dữ liệu
                            window.location.reload();  // Tải lại toàn bộ trang

                            // Nếu bạn muốn chỉ cập nhật một phần dữ liệu mà không tải lại toàn trang
                            // Bạn có thể dùng fetch để tải lại danh sách tổ chức và cập nhật DOM
                        })
                        .catch(error => {
                            console.error('Lỗi:', error);
                            alert('Có lỗi xảy ra khi cập nhật. Vui lòng thử lại sau.');
                        });
            }

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
                        item.style.display = 'flex';
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
                if (confirm("Bạn có chắc chắn muốn " + (actionp === 'approve' ? 'phê duyệt' : 'từ chối') + " dự án này không?")) {
                    var prjId = document.getElementById("projectid").value;
//                    var orjid = document.getElementById("organizationId").value;
                    var statusp = actionp === 'approve' ? 'approved' : 'rejected';
                    console.log(prjId);
                    console.log(statusp);
//                    console.log(orjid);
                    // Gọi hàm update trong DAO để thay đổi trạng thái tổ chức
                    handleApprovep(prjId, statusp);
                } else {
                    // Người dùng đã hủy hành động
                    console.log("Người dùng đã hủy hành động " + actionp);
                }
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
                            alert('Cập nhật thành công!');

                            // Reload lại trang hoặc tải lại dữ liệu
                            window.location.reload();  // Tải lại toàn bộ trang

                            // Nếu bạn muốn chỉ cập nhật một phần dữ liệu mà không tải lại toàn trang
                            // Bạn có thể dùng fetch để tải lại danh sách tổ chức và cập nhật DOM
                        })
                        .catch(error => {
                            console.error('Lỗi:', error);
                            alert('Có lỗi xảy ra khi cập nhật. Vui lòng thử lại sau.');
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

        </script>


    </body>
</html>
