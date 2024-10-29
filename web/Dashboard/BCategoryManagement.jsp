<%-- 
    Document   : BCategoryManagement
    Created on : Oct 25, 2024, 7:22:54 AM
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
                   
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li>
                            <a href="AddBlog">
                                <i class="fa fa-dashboard"></i> <span>Add Blog</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="BlogCategories_1">
                                <i class="fa fa-gavel"></i> <span>Category Management</span>
                            </a>
                        </li>

                        <li>
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
                                    List Categories
                                </header>
                                <div class="panel-body">

                                    <c:forEach var="o" items="${listCC}">
                                        <form action="EditCategories" method="post" style="display: flex; align-items: center;">
                                            <div class="form-group" style="display: flex; align-items: center;">
                                                <label for="category_${o.ncategoriesID}" style="margin-right: 20px;">Category</label>

                                                <!-- Input tên của category -->
                                                <input type="text" class="form-control" id="category_${o.ncategoriesID}" 
                                                       name="Name" value="${o.ncategoryName}" style="flex: 1; width: 650px">

                                                <!-- Truyền ID của category -->
                                                <input type="hidden" name="ID" value="${o.ncategoriesID}">

                                                <button type="submit" class="btn btn-info" style="margin-left: 10px;">Edit</button>
                                            </div>
                                        </form>
                                    </c:forEach>

                                </div>
                            </section>
                        </div>
                        <div class="col-lg-6">
                            <section class="panel">
                                <header class="panel-heading">
                                    Add Category
                                </header>
                                <div class="panel-body">
                                    
                                    <form action="AddCategory" method="post">
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">Category Name</label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" name="Name" placeholder="Name" required>
                                                <p class="help-block">Nhập tên Category cần thêm</p>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-lg-offset-2 col-lg-10">
                                                <button type="submit" class="btn btn-danger">Add</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </section>                         
                        </div> 
                    </div>
                    <div class="text-center">
                        <a href="BlogList" class="btn btn-default" style="display: inline-block;">Back</a>
                    </div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
            
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