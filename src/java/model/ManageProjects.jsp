<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Project_1"%>
<%@page import="DAO.ProjectDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Charifit</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
       
        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="assets/css/demo.css" />
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


    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar" data-background-color="dark">

                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-secondary">
                            <li class="nav-item active">
                                <a
                                    data-bs-toggle="collapse"
                                    href="#dashboard"
                                    class="collapsed"
                                    aria-expanded="false"
                                    >
                                    <i class="fas fa-home"></i>
                                    <p>Dashboard</p>

                                </a>
                            </li>
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Components</h4>
                            </li>
                            <li class="nav-item">
                                <a  href="user">
                                    <i class="fas fa-layer-group"></i>
                                    <p>User</p>
                                </a>

                            </li>
                            <li class="nav-item">
                                <a href="project">
                                    <i class="fas fa-th-list"></i>
                                    <p>Project</p>

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
            <div class="content">
                <div class="container-fluid">
                    <!-- Project Table -->
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Project List</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Document</th>
                                        <th>Status</th>
                                        <th>Create by Org</th>
                                        <th>Create At</th>
<!--                                        <th>Action</th>-->
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="project" items="${project}">
                                        <tr>
                                            <td>${project.projectId}</td>
                                            <td>${project.title}</td>
                                            <td>${project.description}</td>
                                            <td>${project.startDate}</td>
                                            <td>${project.endDate}</td>
                                            <td>${project.document}</td>
                                            <td>${project.status}</td>
                                            <td>${project.createdByOrg}</td>
                                            <td>${project.createdAt}</td>
<!--                                            <td><button type="button" class="btn btn-danger" onclick="banProject(${project.projectId})">BAN</button></td>-->
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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

        <!-- Kaiadmin DEMO methods, don't include it in your project! -->
        <script src="assets/js/setting-demo.js"></script>
        <script src="assets/js/demo.js"></script>
        <script>
                                                $("#lineChart").sparkline([102, 109, 120, 99, 110, 105, 115], {
                                                    type: "line",
                                                    height: "70",
                                                    width: "100%",
                                                    lineWidth: "2",
                                                    lineColor: "#177dff",
                                                    fillColor: "rgba(23, 125, 255, 0.14)",
                                                });

                                                $("#lineChart2").sparkline([99, 125, 122, 105, 110, 124, 115], {
                                                    type: "line",
                                                    height: "70",
                                                    width: "100%",
                                                    lineWidth: "2",
                                                    lineColor: "#f3545d",
                                                    fillColor: "rgba(243, 84, 93, .14)",
                                                });

                                                $("#lineChart3").sparkline([105, 103, 123, 100, 95, 105, 115], {
                                                    type: "line",
                                                    height: "70",
                                                    width: "100%",
                                                    lineWidth: "2",
                                                    lineColor: "#ffa534",
                                                    fillColor: "rgba(255, 165, 52, .14)",
                                                });
        </script>
    </body>
</html>
