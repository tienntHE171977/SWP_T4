<%-- 
    Document   : ViewBlog
    Created on : Oct 4, 2024, 7:52:08 AM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="Dashboard/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="Dashboard/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="Dashboard/css/ionicons.min.css" rel="stylesheet" type="text/css" />

        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="Dashboard/css/style.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                Director
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hello, Jane</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="AddBlog">
                                <i class="fa fa-dashboard"></i> <span>Add Blog</span>
                            </a>
                        </li>
                        <li>
                            <a href="BlogCategories_1">
                                <i class="fa fa-gavel"></i> <span>Category Management</span>
                            </a>
                        </li>

                        <li class="active">
                            <a href="BlogList">
                                <i class="fa fa-glass"></i> <span>BlogManagement</span>
                            </a>
                        </li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-lg-6">
                            <section class="panel">
                                <header class="panel-heading">
                                    Basic Forms
                                </header>
                                <div class="panel-body">
                                    <form role="form">
                                        <div class="form-group">
                                            <!-- News ID -->
                                            <div style="margin-bottom: 15px;">
                                                <label for="newsID">News ID</label>
                                                <input type="text" class="form-control" id="newsID" value="${detail.newsID}" readonly style="display: block; width: 300px;">
                                            </div>

                                            <!-- News Title -->
                                            <div style="margin-bottom: 15px;">
                                                <label for="newsTitle">News Title</label>
                                                <input type="text" class="form-control" id="newsTitle" value="${detail.title}" readonly style="display: block; width: 300px;">
                                            </div>

                                            <!-- News Date -->
                                            <div style="margin-bottom: 15px;">
                                                <label for="newsDate">News Date</label>
                                                <input type="text" class="form-control" id="newsDate" value="${detail.updatedDate}" readonly style="display: block; width: 300px;">
                                            </div>

                                            <!-- News Image -->
                                            <div style="margin-bottom: 15px;">
                                                <label for="newsImage">News Image</label>
                                                <div>
                                                    <img id="newsImage" src="${detail.image}" alt="News Image" style="width: 200px; height: 150px; display: block;">
                                                </div>
                                            </div>

                                            <!-- News Content -->
                                            <div style="margin-bottom: 15px;">
                                                <label for="newsContent">News Content</label>
                                                <textarea class="form-control" id="newsContent" style="display: block; width: 300px; height: 100px; resize: vertical;" readonly>
                                                    ${detail.content}
                                                </textarea>
                                            </div>

                                            <!-- News Message -->
                                            <div style="margin-bottom: 15px;">
                                                <label for="newsMessage">News Message</label>
                                                <textarea class="form-control" id="newsMessage" style="display: block; width: 300px; height: 100px; resize: vertical;" readonly>
                                                    ${detail.message}
                                                </textarea>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </section>
                            <!--                                        <div class="form-group">
                                                                        <label for="exampleInputFile">File input</label>
                                                                        <input type="file" id="exampleInputFile">
                                                                        <p class="help-block">Example block-level help text here.</p>
                                                                    </div>-->
                        </div>


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
                                                <span class="text-muted pull-right">
                                                    <a href="ChangeStatusComment?ID=${o.ncommentID}&status=${o.status == 'on' ? 'off' : 'on'}">
                                                        ${o.status == 'on' ? 'turn off' : 'turn on'}
                                                    </a> 
                                                </span>
                                                <!--                                                <span class="text-muted pull-right">
                                                                                                    <small><em>30 min ago</em></small>
                                                                                                </span>-->
                                                <a href="page_ready_user_profile.php">
                                                    <strong>${o.userName}</strong>
                                                </a>
                                                <p>
                                                    <a href="#"></a> ${o.comment}
                                                    <a href="#" class="text-danger">
                                                        <strong></strong>
                                                    </a>
                                                </p>

                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </section>
                        </div>

                    </div>
                    <div class="text-center">
                        <a href="BlogList" class="btn btn-default" style="display: inline-block;">Back</a>
                    </div>

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
            <div class="footer-main">
                Copyright &copy Director, 2014
            </div>
        </div><!-- ./wrapper -->
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="Dashboard/js/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="Dashboard/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="Dashboard/js/Director/app.js" type="text/javascript"></script>
    </body>
</html>

