<%-- 
    Document   : User_List
    Created on : Sep 20, 2024, 8:04:09 AM
    Author     : pc
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Charifit</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport"/>
        <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon"/>
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
                                <a href="user">
                                    <i class="fas fa-layer-group"></i>
                                    <p>User</p>
                                </a>

                            </li>
                            <li class="nav-item">
                                <a  href="project">
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
                            <table class="table table-striped table-hover align-middle">
                                <thead class="table-dark">
                                    <tr>
                                        <th class="py-2">Name</th>
                                        <th class="py-2">Role</th>
                                        <th class="py-2">Email</th>
                                        <th class="py-2">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td class="py-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="fw-semibold">${user.userName}</div>
                                                </div>
                                            </td>
                                            <td class="py-3">
                                                <span class="badge bg-primary text-white">${user.role}</span>
                                            </td>
                                            <td class="py-3">${user.email}</td>
                                            <td class="py-3">
                                                <button class="btn btn-warning btn-sm" onclick="location.href = 'userDetail?id=${user.id}'">View</button>
                                            </td>
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
