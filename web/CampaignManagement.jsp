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
        <link
            rel="icon"
            href="assets/img/kaiadmin/favicon.ico"
            type="image/x-icon"
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

            /* Đặt viền trắng cho từng ô */
            #add-row th,
            #add-row td {
                border: 2px solid white;
            }

            /* Đặt màu nền cho bảng và các hàng */
            #add-row {
                border-collapse: collapse;
            }

            #add-row tbody tr:hover {
                background-color: #00ffffff; /* Màu nền khi hover */
            }
        </style>
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
                            <li class="nav-item ">
                                <a href="staff.jsp">
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
                                <a href="CampaignList">
                                    <i class="fas fa-calendar-alt"></i> <!-- Icon cho Event -->
                                    <p>Event</p>
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a href="CampaignList">
                                    <i class="fas fa-bullhorn"></i> <!-- Icon cho Campaign -->
                                    <p>Campaign</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="organization.jsp">
                                    <i class="fas fa-bullhorn"></i> <!-- Icon cho Campaign -->
                                    <p>Organizations</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="contact.jsp">
                                    <i class="fas fa-address-book"></i> <!-- Icon cho Contact -->
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
                                                            <div class="avatar-item bg-info rounded-circle">
                                                                <i class="fas fa-file-excel"></i>
                                                            </div>
                                                            <span class="text">Reports</span>
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
                                                src="assets/img/profile.jpg"
                                                alt="..."
                                                class="avatar-img rounded-circle"
                                                />
                                        </div>
                                        <span class="profile-username">
                                            <span class="op-7">Hi,</span>
                                            <span class="fw-bold">Hizrian</span>
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
                                                        <h4>Hizrian</h4>
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
                        <div
                            class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
                            >
                            <div>
                                <h3 class="fw-bold mb-3">Dashboard</h3>
                                <h6 class="op-7 mb-2">Staff Dashboard</h6>
                            </div>

                        </div>
                        <<div class="container">
                            <div class="page-inner">


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
                                                            <h4 class="card-title">1,294</h4>
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
                                                            <i class="fas fa-donate"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Event</p>
                                                            <h4 class="card-title">1,303</h4>
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
                                                            <i class="fas fa-luggage-cart"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Campaign</p>
                                                            <h4 class="card-title">$1,345</h4>
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
                                                            <i class="fas fa-project-diagram"></i>
                                                        </div>
                                                    </div>
                                                    <div class="col col-stats ms-3 ms-sm-0">
                                                        <div class="numbers">
                                                            <p class="card-category">Organization</p>
                                                            <h4 class="card-title">1,294</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                                <!-- Row for Pie Chart -->
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <div class="d-flex align-items-center">
                                                <h4 class="card-title">Add Row</h4>

                                                <!-- Search by name or description -->
                                                <form action="SearchCampaign" method="post" class="d-flex ms-auto">
                                                    <nav class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex ms-auto">
                                                        <div class="input-group" style="width:500px; height:30px">
                                                            <div class="input-group-prepend">
                                                                <button type="submit" class="btn btn-search pe-1">
                                                                    <i class="fa-solid fa-magnifying-glass search-icon"></i>
                                                                </button>
                                                            </div>
                                                            <input value="" name="txt" type="text" placeholder="Search ..." class="form-control" />
                                                        </div>
                                                    </nav>
                                                </form>
                                            </div>

                                            <!-- Search by project -->
                                            <form action="CampaignList" method="post" class="d-flex align-items-center">
                                                <label for="ID" class="me-2">Project</label>
                                                <select class="form-select form-control-sm" id="ID" name="ID" style="width:300px">
                                                    <option value="">-- Project --</option>
                                                    <c:forEach var="o" items="${listPC}">
                                                        <option value="${o.projectId}">${o.projectName}</option>
                                                    </c:forEach>
                                                </select>
                                                <div class="input-group-btn" style="margin-left: 10px;">
                                                    <button type="submit" class="btn btn-sm btn-default" style="height: 35px;">
                                                        <i class="fa fa-search"></i>
                                                    </button>
                                                </div>
                                            </form>

                                        </div>

                                        <div class="card-body">
                                            <!-- Modal -->


                                            <div class="table-responsive">
                                                <table
                                                    id="add-row"
                                                    class="display table table-striped table-hover"
                                                    >
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th style="width:400px">Name</th>
                                                            <th style="width:400px">Project</th>
                                                            <th style="width:150px">Date</th>
                                                            <th style="width: 5%">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Name</th>
                                                            <th>Project</th>
                                                            <th>Date</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <c:forEach var="o" items="${list}">
                                                            <tr>
                                                                <td>${o.campaignID}</td>
                                                                <td>${o.campaignName}</td>
                                                                <td>${o.projectName}</td>
                                                                <td>${o.createDate}</td>
                                                                <td>
                                                                    <div class="form-button-action d-flex align-items-center gap-2">
                                                                        <!-- Form xem chiến dịch -->
                                                                        <form action="ViewCampaign" method="post" style="display: inline-block; margin: 0;">
                                                                            <input type="hidden" name="campaignId" value="${o.campaignID}">
                                                                            <input type="hidden" name="actionType" value="view">
                                                                            <button
                                                                                type="submit" 
                                                                                data-bs-toggle="tooltip"
                                                                                title="Xem chiến dịch" 
                                                                                class="btn btn-link btn-primary btn-lg"
                                                                                data-original-title="View Campaign"
                                                                                >
                                                                                <i class="fas fa-eye"></i>
                                                                            </button>
                                                                        </form>

                                                                        <!-- Form xóa chiến dịch -->
                                                                        <form style="display: inline-block; margin: 0;" onsubmit="deleteCampaign('${o.campaignID}');">
                                                                            <button
                                                                                type="button"
                                                                                onclick="deleteCampaign('${o.campaignID}');" 
                                                                                data-bs-toggle="tooltip"
                                                                                title="Xóa chiến dịch"
                                                                                class="btn btn-link btn-danger"
                                                                                data-original-title="Remove"
                                                                                >
                                                                                <i class="fa fa-times"></i>
                                                                            </button>
                                                                        </form>

                                                                    </div>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>

                                                </table>
                                                <div class="col-md-12">
                                                    <div class="card">
                                                        <div class="card-body">
                                                            <div class="demo">
                                                                <ul class="pagination pg-primary justify-content-end">
                                                                    <li class="page-item">
                                                                        <a class="page-link" href="?index=${tag > 1 ? tag - 1 : 1}&ID=${ID}&txt=${txtS}" aria-label="Previous">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                            <span class="sr-only">Previous</span>
                                                                        </a>
                                                                    </li>

                                                                    <c:forEach begin="1" end="${endP}" var="i">
                                                                        <li class="${tag == i ? 'active' : ''}">
                                                                            <a href="?index=${i}&ID=${ID}&txt=${txtS}" class="page-link">${i}</a>
                                                                        </li>
                                                                    </c:forEach>

                                                                    <li class="page-item">
                                                                        <a class="page-link" href="?index=${tag < endP ? tag + 1 : endP}&ID=${ID}&txt=${txtS}" aria-label="Next">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                            <span class="sr-only">Next</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!-- Row for Transaction History -->


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
                                                                                    const ctx = document.getElementById('pieChart').getContext('2d');
                                                                                    const pieChart = new Chart(ctx, {
                                                                                        type: 'pie',
                                                                                        data: {
                                                                                            labels: ['Red', 'Blue', 'Yellow'],
                                                                                            datasets: [{
                                                                                                    label: 'My First Dataset',
                                                                                                    data: [300, 50, 100],
                                                                                                    backgroundColor: [
                                                                                                        'rgb(255, 99, 132)',
                                                                                                        'rgb(54, 162, 235)',
                                                                                                        'rgb(255, 205, 86)'
                                                                                                    ],
                                                                                                    hoverOffset: 4
                                                                                                }]
                                                                                        },
                                                                                        options: {
                                                                                            responsive: true,
                                                                                            plugins: {
                                                                                                legend: {
                                                                                                    position: 'top',
                                                                                                },
                                                                                                title: {
                                                                                                    display: true,
                                                                                                    text: 'Sample Pie Chart'
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    });
    </script>
    <script>
        function deleteCampaign(campaignID) {
            if (!confirm("Are you sure you want to delete this campaign?")) {
                return; // Nếu người dùng chọn "Cancel" thì không thực hiện xóa
            }

            const xhr = new XMLHttpRequest();
            xhr.open("POST", "ViewCampaign", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        alert("Chiến dịch đã được xóa thành công.");
                        // Xóa phần tử khỏi giao diện hoặc cập nhật lại danh sách nếu cần
                        location.reload();
                    } else {
                        alert("Không thể xóa chiến dịch. Hãy thử lại.");
                    }
                }
            };

            xhr.send("campaignId=" + campaignID + "&actionType=delete");
        }

    </script>

</body>
</html>
