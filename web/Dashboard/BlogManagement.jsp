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

                                <div class="popular_causes_area section_padding">
                                    <div class="container">


                                        <!-- Row for Pie Chart -->
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <div class="panel-body table-responsive">
                                                        <div class="row">
                                                            <!-- Search, Category, and New Blog Buttons -->
                                                            <div class="col-sm-12 d-flex align-items-center gap-2 pb-3">
                                                                <!-- Search Box -->
                                                                <form action="SearchBlogs" method="post" class="d-flex align-items-center">
                                                                    <input name="txt" type="text" class="form-control input-sm" style="width: 200px;" placeholder="Search" />
                                                                    <select id="cateID" name="cateID" class="form-select mx-2">
                                                                        <option value="">-- Category --</option>
                                                                        <c:forEach var="o" items="${listCC}">
                                                                            <option value="${o.ncategoriesID}">${o.ncategoryName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                    <button class="btn btn-sm btn-default" type="submit">
                                                                        <i class="fa fa-search"></i>
                                                                    </button>
                                                                </form>

                                                                <!-- New Blog Button -->
                                                                <form action="AddBlog" method="get" class="ms-auto">
                                                                    <button type="submit" class="btn btn-success">New Blog</button>
                                                                </form>

                                                                <!-- Category Button -->
                                                                <form action="BlogCategories_1" method="get" class="ms-2">
                                                                    <button type="submit" class="btn btn-success">Category</button>
                                                                </form>
                                                            </div>

                                                            <!-- Sort and Total Post -->
                                                            <div class="col-sm-12 d-flex align-items-center gap-2">
                                                                <!-- Sort Form -->
                                                                <form action="SortBlog" method="post" class="d-flex align-items-center">
                                                                    <label for="sortby" class="mb-0 me-2">Sort by:</label>
                                                                    <select id="sortby" name="sortby" class="form-select me-2">
                                                                        <option value="">-- Sort --</option>
                                                                        <option value="Title">PName</option>
                                                                        <option value="Date">Date</option>
                                                                    </select>
                                                                    <button type="submit" class="btn btn-info">Sort</button>
                                                                </form>

                                                                <!-- Total Post Display -->
                                                                <div class="post-quantity d-flex align-items-center ms-auto">
                                                                    <label class="mb-0 me-2">Total Post:</label>
                                                                    <input value="${totalPage}" name="total" type="text" class="form-control" style="width: 60px;" readonly required />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="card-body">
                                                    <!-- Modal -->


                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th style="width: 5%;">ID</th>
                                                                    <th style="width: 30%;">Title</th>
                                                                    <th style="width: 15%;">Date</th>
                                                                    <th style="width: 30%;">Image</th>
                                                                    <th style="width: 10%;">Status</th>
                                                                    <th style="width: 10%;">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:if test="${not empty listP}">
                                                                    <c:forEach items="${listP}" var="o">
                                                                        <tr>
                                                                            <td>${o.newsID}</td>
                                                                            <td>${o.title}</td>
                                                                            <td>${o.updatedDate}</td>
                                                                            <td>
                                                                                <img src="${o.image}" alt="Blog Image" style="width: 150px; height: auto; border-radius: 5px;"/>
                                                                            </td>
                                                                            <td>
                                                                                <span class="btn btn-light">
                                                                                    <a href="ChangeStatus?ID=${o.newsID}&status=${o.status == 'on' ? 'off' : 'on'}" class="text-decoration-none">
                                                                                        ${o.status == 'on' ? 'Turn Off' : 'Turn On'}
                                                                                    </a>
                                                                                </span>
                                                                            </td>
                                                                            <td class="d-flex justify-content-center gap-2">
                                                                                <!-- View Button -->
                                                                                <form action="ViewBlog" method="post" class="m-0">
                                                                                    <input type="hidden" name="postID" value="${o.newsID}">
                                                                                    <button type="submit" class="btn btn-link btn-primary" title="View">
                                                                                        <i class="fas fa-eye"></i>
                                                                                    </button>
                                                                                </form>

                                                                                <!-- Edit Button -->
                                                                                <form action="LoadBlog" method="post" class="m-0">
                                                                                    <input type="hidden" name="postID" value="${o.newsID}">
                                                                                    <button type="submit" class="btn btn-link btn-secondary" title="Edit">
                                                                                        <i class="fas fa-edit"></i>
                                                                                    </button>
                                                                                </form>

                                                                                <!-- Delete Button -->
                                                                                <form action="DeleteBlog" method="post" onsubmit="return confirm('Are you sure you want to delete this blog?');" class="m-0">
                                                                                    <input type="hidden" name="ID" value="${o.newsID}">
                                                                                    <button type="submit" class="btn btn-link btn-danger" title="Delete">
                                                                                        <i class="fa fa-times"></i>
                                                                                    </button>
                                                                                </form>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                                <c:if test="${empty listP}">
                                                                    <tr>
                                                                        <td colspan="6" class="text-center">Không có bài viết nào.</td>
                                                                    </tr>
                                                                </c:if>
                                                            </tbody>
                                                        </table>


                                                        <div class="col-md-12">
                                                            <div class="card">
                                                                <div class="card-body">
                                                                    <div class="demo">
                                                                        <ul class="pagination pg-primary justify-content-end">
                                                                            <li class="page-item">
                                                                                <a class="page-link" href="?index=${tag > 1 ? tag - 1 : 1}&txt=${txtS}&cateID=${categoryID}&sortby=${sortby}"" aria-label="Previous">
                                                                                    <span aria-hidden="true">&laquo;</span>
                                                                                    <span class="sr-only">Previous</span>
                                                                                </a>
                                                                            </li>

                                                                            <c:forEach begin="1" end="${endP}" var="i">
                                                                                <li class="${tag == i ? 'active' : ''}">
                                                                                    <a href="?index=${i}&txt=${txtS}&cateID=${categoryID}&sortby=${sortby}" class="page-link">${i}</a>
                                                                                </li>
                                                                            </c:forEach>

                                                                            <li class="page-item">
                                                                                <a class="page-link" href="?index=${tag < endP ? tag + 1 : endP}&txt=${txtS}&cateID=${categoryID}&sortby=${sortby}" aria-label="Next">
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

    </script>


</body>
</html>
