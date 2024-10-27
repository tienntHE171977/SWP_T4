
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
                            <li class="nav-item active">
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
                                <a href="event.jsp">
                                    <i class="fas fa-calendar-alt"></i> <!-- Icon cho Event -->
                                    <p>Event</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="campaign.jsp">
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
                                <a href="staffcontact">
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
                                <h6 class="op-7 mb-2">Staff Dashboard</h6>
                            </div>

                        </div>
                        <<div class="container">
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
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="card">
                                            <div class="card-header">
                                                <div class="card-title">Pie Chart</div>
                                            </div>
                                            <div class="card-body">
                                                <div class="chart-container">
                                                    <canvas id="pieChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Row for Transaction History -->
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card card-round">
                                            <div class="card-header">
                                                <div class="card-head-row card-tools-still-right">
                                                    <div class="card-title">Transaction History</div>
                                                </div>
                                            </div>
                                            <div class="card-body p-0">
                                                <div class="table-responsive">
                                                    <table class="table align-items-center mb-0">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th scope="col">Payment Number</th>
                                                                <th scope="col" class="text-end">Date & Time</th>
                                                                <th scope="col" class="text-end">Amount</th>
                                                                <th scope="col" class="text-end">Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row">
                                                                    <button class="btn btn-icon btn-round btn-success btn-sm me-2">
                                                                        <i class="fa fa-check"></i>
                                                                    </button>
                                                                    Payment from #10231
                                                                </th>
                                                                <td class="text-end">Mar 19, 2020, 2.45pm</td>
                                                                <td class="text-end">$250.00</td>
                                                                <td class="text-end">
                                                                    <span class="badge badge-success">Completed</span>
                                                                </td>
                                                            </tr>
                                                            <!-- Add more rows as needed -->
                                                        </tbody>
                                                    </table>
                                                </div>
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


</body>
</html>
