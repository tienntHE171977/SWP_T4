<%-- 
    Document   : EditBlog
    Created on : Oct 4, 2024, 8:19:42 AM
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
                <section class="panel">
                    <header class="panel-heading">
                        Basic Forms
                    </header>
                    <div class="panel-body">
                        <form action="AddBlog" method="post">
                            <div class="form-group row">
                                <!-- Col 1 -->
                                <div class="col-lg-6" style="display: flex; flex-direction: column; align-items: center;">

                                    <!-- News Title -->
                                    <div style="margin-bottom: 15px; width: 100%;">
                                        <label for="newsTitle">News Title</label>
                                        <input type="text" class="form-control" id="newsTitle" name="newsTitle" placeholder="Nhập tiêu đề bài viết" required>
                                    </div>

                                    <!-- News Image URL -->
                                    <div style="margin-bottom: 15px; width: 100%;">
                                        <label for="newImageURL">New Image URL</label>
                                        <input type="text" class="form-control" id="newImageURL" name="newImageURL" placeholder="Nhập URL hình ảnh mới" required oninput="updateImagePreview()">
                                    </div>

                                    <!-- Image Preview -->
                                    <div style="margin-bottom: 15px; width: 100%;">
                                        <label>Image Preview</label>
                                        <div style="border: 1px solid #ddd; width: 400px; height: 280px; display: block; margin-top: 5px;">
                                            <img id="imagePreview" src="" alt="" style="max-width: 100%; height: 280px; display: block; margin: auto;">
                                        </div>
                                    </div>

                                </div>

                                <!-- Col 2 -->
                                <div class="col-lg-6" style="display: flex; flex-direction: column; align-items: center;">

                                    <!-- News Content -->
                                    <div style="margin-bottom: 15px; width: 100%;">
                                        <label for="newsContent">News Content</label>
                                        <textarea class="form-control" id="newsContent" name="newsContent" placeholder="Nhập nội dung bài viết" style="height: 250px; resize: vertical;" required></textarea>
                                    </div>

                                    <!-- News Message -->
                                    <div style="margin-bottom: 15px; width: 100%;">
                                        <label for="newsMessage">News Message</label>
                                        <textarea class="form-control" id="newsMessage" name="newsMessage" placeholder="Nhập thông điệp" style="height: 100px; resize: vertical;" required></textarea>
                                    </div>

                                    <!-- News Category -->
                                    <div style="margin-bottom: 15px; width: 100%;">
                                        <label for="category">Category</label>
                                        <select name="category" class="form-select" id="category" required>
                                            <option value="" disabled selected>Chọn danh mục</option>
                                            <c:forEach items="${listCC}" var="o">
                                                <option value="${o.ncategoriesID}">${o.ncategoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                </div>
                            </div>

                            <!-- Submit button -->
                            <div class="modal-footer" style="text-align: center;">
                                <button type="submit" class="btn btn-info">Submit</button>
                            </div>
                        </form>
                        <script>
                            function updateImagePreview() {
                                const imageUrl = document.getElementById('newImageURL').value;
                                const imagePreview = document.getElementById('imagePreview');

                                if (imageUrl) {
                                    imagePreview.src = imageUrl; // Cập nhật src của hình ảnh
                                    imagePreview.style.display = 'block'; // Hiển thị hình ảnh
                                } else {
                                    imagePreview.style.display = 'none'; // Ẩn hình ảnh nếu không có URL
                                }
                            }
                        </script>
                    </div>
                </section>
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


