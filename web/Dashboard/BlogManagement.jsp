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
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 4 messages</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar3.png" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Support Team
                                                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li><!-- end message -->
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar2.png" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Director Design Team
                                                    <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar.png" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Developers
                                                    <small><i class="fa fa-clock-o"></i> Today</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar2.png" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Sales Department
                                                    <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar.png" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Reviewers
                                                    <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">See All Messages</a></li>
                            </ul>
                        </li>
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <span class="label label-danger">9</span>
                            </a>
                            <ul class="dropdown-menu">

                                <li class="header">You have 9 tasks</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-success" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Create a nice theme
                                                    <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-danger" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Some task I need to do
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-info" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Make beautiful transitions
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-warning" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>

                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">

                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span>Jane Doe <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>

                                <li>
                                    <a href="#">
                                        <i class="fa fa-clock-o fa-fw pull-right"></i>
                                        <span class="badge badge-success pull-right">10</span> Updates</a>
                                    <a href="#">
                                        <i class="fa fa-envelope-o fa-fw pull-right"></i>
                                        <span class="badge badge-danger pull-right">5</span> Messages</a>
                                    <a href="#"><i class="fa fa-magnet fa-fw pull-right"></i>
                                        <span class="badge badge-info pull-right">3</span> Subscriptions</a>
                                    <a href="#"><i class="fa fa-question fa-fw pull-right"></i> <span class=
                                                                                                      "badge pull-right">11</span> FAQ</a>
                                </li>

                                <li class="divider"></li>

                                <li>
                                    <a href="#">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                        Profile
                                    </a>
                                    <a data-toggle="modal" href="#modal-user-settings">
                                        <i class="fa fa-cog fa-fw pull-right"></i>
                                        Settings
                                    </a>
                                </li>

                                <li class="divider"></li>

                                <li>
                                    <a href="#"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </div>
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
                    <!-- search form -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <ul class="sidebar-menu">
                        <li>
                            <a href="index.html">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="general.html">
                                <i class="fa fa-gavel"></i> <span>General</span>
                            </a>
                        </li>

                        <li>
                            <a href="basic_form.html">
                                <i class="fa fa-globe"></i> <span>Basic Elements</span>
                            </a>
                        </li>

                        <li class="active">
                            <a href="simple.html">
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
                                            <form action="EditCategories" method="get" ">
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
