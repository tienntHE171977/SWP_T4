<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>BlogManagement</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="Dashboard/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="Dashboard/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="Dashboard/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- google font -->
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

                <!-- Main content -->
                <section class="content">

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Responsive Hover Table

                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->

                                <div class="panel-body table-responsive">
                                    <div class ="col-sm-10">
                                        <div class="box-tools m-b-15">
                                            <div class="input-group-wrapper" style="display: flex; align-items: center;">
                                                <!-- Search Input and Form -->
                                                <div class="input-group" style="display: flex;">
                                                    <form action="SearchBlogs" method="post" style="display: flex;">
                                                        <!-- Search Input -->
                                                        <label for="searchName"></label>
                                                        <input value="" name="txt" type="text" class="form-control input-sm" style="width: 150px; height: 35px;"" placeholder="Search"/>

                                                        <!-- Category Dropdown -->
                                                        <label for="cateID"></label>
                                                        <select id="cateID" name="cateID" class="form-control" style="height: 35px;">
                                                            <option value="">-- Category --</option>
                                                            <c:forEach var="o" items="${listCC}">
                                                                <option value="${o.ncategoriesID}">${o.ncategoryName}</option>
                                                            </c:forEach>
                                                        </select>

                                                        <!-- Search Button -->
                                                        <div class="input-group-btn" style="margin-left: 10px;">
                                                            <button class="btn btn-sm btn-default" style="height: 35px;"><i class="fa fa-search"></i></button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class ="col-sm-1">
                                        <div class="box-tools m-b-15">
                                            <form action="AddBlog" method="get" ">
                                                <button  style=" width: 100%; height: 35px;" type="submit" class="btn btn-success">New Blog</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class ="col-sm-1">
                                        <div class="box-tools m-b-15">
                                            <form action="BlogCategories_1" method="get" ">
                                                <button  style=" width: 100%; height: 35px;" type="submit" class="btn btn-success">Category</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-sm-10">
                                        <form action="SortBlog" method="post" style="padding: 10px;">
                                            <label for="sortby">Sort by:</label>
                                            <select id="sortby" name="sortby" style="box-shadow: 0 0 8px rgba(0, 0, 0, 0.2); border: none; padding: 5px;">
                                                <option value="">-- Sort --</option>
                                                <option value="Title">PName</option>
                                                <option value="Date">Date</option>
                                            </select>
                                            <button type="submit" style="box-shadow: 0 0 8px rgba(0, 0, 0, 0.2); border: none; padding: 5px;">Sort</button>
                                        </form>
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="post-quantity" id="postQuantity">
                                            <label>TotalPost:</label>
                                            <input value="${totalPage}" name="total" type="text" style="width:50%; box-shadow: 0 0 8px rgba(0, 0, 0, 0.2); border: none; padding: 5px;" readonly required>
                                        </div>
                                    </div>


                                </div>
                                <table class="table table-hover">
                                    <tr>
                                        <th style=" width: 5px;">ID</th>
                                        <th style=" width: 200px;">Title</th>
                                        <th style=" width: 80px;">Date</th>
                                        <th style=" width: 200px;">Image</th>
                                        <th style=" width: 10px;">Status</th>
                                        <th style=" width: 100px;">Action</th>
                                    </tr>
                                    <c:if test="${not empty listP}">
                                        <c:forEach items="${listP}" var="o">
                                            <tr>
                                                <td>${o.newsID}</td>
                                                <td>${o.title}</td>
                                                <td>${o.updatedDate}</td>
                                                <td><img style="width: 300px; height: 200px" src="${o.image}"></td>
                                                <td ><span class="btn btn-default"><a href="ChangeStatus?ID=${o.newsID}&status=${o.status == 'on' ? 'off' : 'on'}">
                                                            ${o.status == 'on' ? 'Turn Off' : 'Turn On'}
                                                        </a> </span>
                                                </td>
                                                <td>
                                                    <!-- View Button -->
                                                    <form action="ViewBlog" method="post" style="display: inline-block; margin: 0;">
                                                        <input type="hidden" name="postID" value="${o.newsID}">
                                                        <button type="submit" class="btn btn-default">View</button>
                                                    </form>

                                                    <!-- Edit Button -->
                                                    <form action="LoadBlog" method="post" style="display: inline-block; margin: 0;">
                                                        <input type="hidden" name="postID" value="${o.newsID}">
                                                        <button type="submit" class="btn btn-default">Edit</button>
                                                    </form>

                                                    <!-- Delete Button -->
                                                    <form action="DeleteBlog" method="post" onsubmit="return confirm('Are you sure you want to delete this blog?');" style="display: inline-block; margin: 0;">
                                                        <input type="hidden" name="ID" value="${o.newsID}">
                                                        <button type="submit" class="btn btn-default">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty listP}">
                                        <p>Không có bài viết nào.</p>
                                    </c:if>
                                </table>
                                <div class="text-right">
                                    <ul class="pagination">
                                        <li><a href="?index=${tag > 1 ? tag - 1 : 1}&txt=${txtS}&cateID=${categoryID}&sortby=${sortby}">&laquo;</a></li>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="${tag == i ? 'act' : ''}">
                                                <a href="?index=${i}&txt=${txtS}&cateID=${categoryID}&sortby=${sortby}" class="page-link">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li><a href="?index=${tag < endP ? tag + 1 : endP}&txt=${txtS}&cateID=${categoryID}&sortby=${sortby}">&raquo;</a></li>
                                    </ul>
                                </div>


                            </div><!-- /.box-body -->
                        </div><!-- /.box -->
                    </div>
                    </div>
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Director, 2014
                </div>
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
