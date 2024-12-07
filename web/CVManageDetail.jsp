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

            .org-stats {
                display: flex;
                justify-content: space-around;
                background: #ffffff;
                padding: 20px;
                border-radius: 8px;
                margin-bottom: 30px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            .stat-item {
                text-align: center;
                flex: 1;
                padding: 15px;
                transition: transform 0.3s;
            }

            .stat-item:hover {
                transform: scale(1.05);
                background-color: #f8f9fa;
                border-radius: 5px;
            }

            .stat-number {
                font-size: 28px;
                font-weight: bold;
                color: #FF5F13;
            }

            .stat-label {
                color: #666;
                margin-top: 5px;
                font-size: 14px;
            }

        </style>
        <link href='http://fonts.googleapis.com/css?family=Rokkitt:400,700|Lato:400,300' rel='stylesheet' type='text/css'>
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
                            <li class="nav-item">
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
                            <li class="nav-item  active">
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
                                        type="text" placeholder="Search ..."
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
                                <h6 class="op-7 mb-2">Staff Volunteers Dashboard</h6>

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
                                <div id="cv" class="instaFade">
                                    <div class="mainDetails">
                                        <div id="headshot" class="quickFade">
                                            <img src="${cv.cvImage}" alt="Alan Smith" />
                                        </div>

                                        <div id="name">
                                            <h1 class="quickFade delayTwo">${user.fullname}</h1>
                                            <h2 class="quickFade delayThree">${user.gender}</h2>
                                        </div>

                                        <div id="contactDetails" class="quickFade delayFour">
                                            <ul>
                                                <li>email: <a href="mailto:joe@bloggs.com" target="_blank">${user.email}</a></li>
                                                <li>phone: ${user.phone}</li>
                                                <li>address: ${user.adrees}</li>
                                            </ul>
                                        </div>
                                        <div class="clear"></div>
                                    </div>

                                    <div id="mainArea" class="quickFade delayFive">
                                        <section>
                                            <article>
                                                <div class="sectionTitle">
                                                    <h1>Personal Profile</h1>
                                                </div>

                                                <div class="sectionContent">
                                                    <p>${cv.description}</p>
                                                </div>
                                            </article>
                                            <div class="clear"></div>
                                        </section>


                                        <section>
                                            <div class="sectionTitle">
                                                <h1>Work Experience</h1>
                                            </div>

                                            <div class="sectionContent" id="experience">
                                                


                                            </div>
                                            <p id="expe" style="display: none">${cv.experience}</p>
                                            <div class="clear"></div>
                                        </section>


                                        <section>
                                            <div class="sectionTitle">
                                                <h1>Key Skills</h1>
                                            </div>

                                            <div class="sectionContent">
                                                <ul class="keySkills" id="keySkillsListshow">

                                                </ul>


                                            </div>
                                            <p id="skill" style="display: none">${cv.skillDescription}</p>
                                            <div class="clear"></div>
                                        </section>


                                        <section>
                                            <div class="sectionTitle">
                                                <h1>Education</h1>
                                            </div>

                                            <div class="sectionContent" id="education">
                                                <article>


                                                </article>

                                            </div>
                                            <p id="edu" style="display: none">${cv.education}</p>
                                            <div class="clear"></div>
                                        </section>

                                    </div>
                                </div>
                                <script type="text/javascript">
                                    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
                                    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
                                </script>
                                <script type="text/javascript">
                                    var pageTracker = _gat._getTracker("UA-3753241-1");
                                    pageTracker._initData();
                                    pageTracker._trackPageview();
                                </script>

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




</body>
<style>
    html,body,div,span,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,abbr,address,cite,code,del,dfn,em,img,ins,kbd,q,samp,small,strong,sub,sup,var,b,i,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,figcaption,figure,footer,header,hgroup,menu,nav,section,summary,time,mark,audio,video {
        border:0;
        font:inherit;
        font-size:100%;
        margin:0;
        padding:0;
        vertical-align:baseline;
    }

    html, body {
        background-color: transparent;
        font-family: 'Lato', helvetica, arial, sans-serif;
        font-size: 16px;
        /*color: #222;*/
    }

    article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section {
        display:block;
    }



    .clear {
        clear: both;
    }

    p {
        font-size: 1em;
        line-height: 1.4em;
        margin-bottom: 20px;
        color: #444;
    }

    #cv {
        width: 90%;
        max-width: 800px;
        background: #f3f3f3;
        margin: 30px auto;
    }

    .mainDetails {
        padding: 25px 35px;
        border-bottom: 2px solid #cf8a05;
        background: #ededed;
    }

    #name h1 {
        font-size: 2.5em;
        font-weight: 700;
        font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
        margin-bottom: -6px;
    }

    #name h2 {
        font-size: 2em;
        margin-left: 2px;
        font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
    }

    #mainArea {
        padding: 0 40px;
    }

    #headshot {
        width: 12.5%;
        float: left;
        margin-right: 30px;
    }

    #headshot img {
        width: 100%;
        height: auto;
        -webkit-border-radius: 50px;
        border-radius: 50px;
    }

    #name {
        float: left;
    }

    #contactDetails {
        float: right;
    }

    #contactDetails ul {
        list-style-type: none;
        font-size: 0.9em;
        margin-top: 2px;
    }

    #contactDetails ul li {
        margin-bottom: 3px;
        color: #444;
    }

    #contactDetails ul li a, a[href^=tel] {
        color: #444;
        text-decoration: none;
        -webkit-transition: all .3s ease-in;
        -moz-transition: all .3s ease-in;
        -o-transition: all .3s ease-in;
        -ms-transition: all .3s ease-in;
        transition: all .3s ease-in;
    }

    #contactDetails ul li a:hover {
        color: #cf8a05;
    }


    section {
        border-top: 1px solid #dedede;
        padding: 20px 0 0;
    }

    section:first-child {
        border-top: 0;
    }

    section:last-child {
        padding: 20px 0 10px;
    }

    .sectionTitle {
        float: left;
        width: 25%;
    }

    .sectionContent {
        float: right;
        width: 72.5%;
    }

    .sectionTitle h1 {
        font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
        font-style: italic;
        font-size: 1.5em;
        color: #cf8a05;
    }

    .sectionContent h2 {
        font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
        font-size: 1.5em;
        margin-bottom: -2px;
    }

    .subDetails {
        font-size: 0.8em;
        font-style: italic;
        margin-bottom: 3px;
    }

    .keySkills {
        list-style-type: none;
        -moz-column-count:3;
        -webkit-column-count:3;
        column-count:3;
        margin-bottom: 20px;
        font-size: 1em;
        color: #444;
    }

    .keySkills ul li {
        margin-bottom: 3px;
    }

    @media all and (min-width: 602px) and (max-width: 800px) {
        #headshot {
            display: none;
        }

        .keySkills {
            -moz-column-count:2;
            -webkit-column-count:2;
            column-count:2;
        }
    }

    @media all and (max-width: 601px) {
        #cv {
            width: 95%;
            margin: 10px auto;
            min-width: 280px;
        }

        #headshot {
            display: none;
        }

        #name, #contactDetails {
            float: none;
            width: 100%;
            text-align: center;
        }

        .sectionTitle, .sectionContent {
            float: none;
            width: 100%;
        }

        .sectionTitle {
            margin-left: -2px;
            font-size: 1.25em;
        }

        .keySkills {
            -moz-column-count:2;
            -webkit-column-count:2;
            column-count:2;
        }
    }

    @media all and (max-width: 480px) {
        .mainDetails {
            padding: 15px 15px;
        }

        section {
            padding: 15px 0 0;
        }

        #mainArea {
            padding: 0 25px;
        }


        .keySkills {
            -moz-column-count:1;
            -webkit-column-count:1;
            column-count:1;
        }

        #name h1 {
            line-height: .8em;
            margin-bottom: 4px;
        }
    }

    @media print {
        #cv {
            width: 100%;
        }
    }

    @-webkit-keyframes reset {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 0;
        }
    }

    @-webkit-keyframes fade-in {
        0% {
            opacity: 0;
        }
        40% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }

    @-moz-keyframes reset {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 0;
        }
    }

    @-moz-keyframes fade-in {
        0% {
            opacity: 0;
        }
        40% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }

    @keyframes reset {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 0;
        }
    }

    @keyframes fade-in {
        0% {
            opacity: 0;
        }
        40% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }

    .instaFade {
        -webkit-animation-name: reset, fade-in;
        -webkit-animation-duration: 1.5s;
        -webkit-animation-timing-function: ease-in;

        -moz-animation-name: reset, fade-in;
        -moz-animation-duration: 1.5s;
        -moz-animation-timing-function: ease-in;

        animation-name: reset, fade-in;
        animation-duration: 1.5s;
        animation-timing-function: ease-in;
    }

    .quickFade {
        -webkit-animation-name: reset, fade-in;
        -webkit-animation-duration: 2.5s;
        -webkit-animation-timing-function: ease-in;

        -moz-animation-name: reset, fade-in;
        -moz-animation-duration: 2.5s;
        -moz-animation-timing-function: ease-in;

        animation-name: reset, fade-in;
        animation-duration: 2.5s;
        animation-timing-function: ease-in;
    }

    .delayOne {
        -webkit-animation-delay: 0, .5s;
        -moz-animation-delay: 0, .5s;
        animation-delay: 0, .5s;
    }

    .delayTwo {
        -webkit-animation-delay: 0, 1s;
        -moz-animation-delay: 0, 1s;
        animation-delay: 0, 1s;
    }

    .delayThree {
        -webkit-animation-delay: 0, 1.5s;
        -moz-animation-delay: 0, 1.5s;
        animation-delay: 0, 1.5s;
    }

    .delayFour {
        -webkit-animation-delay: 0, 2s;
        -moz-animation-delay: 0, 2s;
        animation-delay: 0, 2s;
    }

    .delayFive {
        -webkit-animation-delay: 0, 2.5s;
        -moz-animation-delay: 0, 2.5s;
        animation-delay: 0, 2.5s;
    }
</style>
<script>

                                    const exper = document.getElementById("expe").textContent;
                                    const skills = document.getElementById("skill").textContent;
                                    const edu = document.getElementById("edu").textContent;
                                    console.log(exper);
                                    console.log(skills);
                                    console.log(edu);
                                    const spitexpe = exper.split("+");
                                    const spitskill = skills.split("&");
                                    const spitedu = edu.split("+");

                                    spitexpe.forEach(expe => {

                                        const jobParts = expe.split("*");
                                        if (jobParts.length === 3) {
                                            const articleContainer = document.createElement("article");
                                            // Tạo các thẻ HTML cho từng phần của công việc


                                            const title = document.createElement("h2");
                                            title.textContent = jobParts[0];
                                            console.log(title);
                                            const date = document.createElement("p");
                                            date.textContent = jobParts[1];
                                            date.className = "subDetails";

                                            const description = document.createElement("p");
                                            description.textContent = jobParts[2];


                                            // Gắn các phần tử vào jobDiv
                                            articleContainer.appendChild(title);
                                            articleContainer.appendChild(date);
                                            articleContainer.appendChild(description);

                                            // Gắn jobDiv vào container
                                            document.getElementById("experience").appendChild(articleContainer);
                                        }
                                    });
                                    spitskill.forEach(skill => {
                                        const NewLi = document.createElement("li");
                                        NewLi.textContent = skill;
                                        document.getElementById("keySkillsListshow").appendChild(NewLi);
                                    });
                                    spitedu.forEach(edu => {
                                        const eduParts = edu.split("*");
                                        if (eduParts.length === 3) {
                                            const articleContainer = document.createElement("article");
                                            // Tạo các thẻ HTML cho từng phần của công việc


                                            const title = document.createElement("h2");
                                            title.textContent = eduParts[0];

                                            const date = document.createElement("p");
                                            date.textContent = eduParts[1];
                                            date.className = "subDetails";

                                            const description = document.createElement("p");
                                            description.textContent = eduParts[2];


                                            // Gắn các phần tử vào jobDiv
                                            articleContainer.appendChild(title);
                                            articleContainer.appendChild(date);
                                            articleContainer.appendChild(description);

                                            // Gắn jobDiv vào container
                                            document.getElementById("education").appendChild(articleContainer);
                                        }
                                    });





</script>

</html>
