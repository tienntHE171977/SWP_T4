
<%-- 
    Document   : RegisterProject
    Created on : Oct 19, 2024, 5:01:32 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Charifit</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            form {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: auto;
            }
            label {
                display: block;
                margin: 10px 0 5px;
                color: #555;
            }
            input[type="text"],
            input[type="date"],
            input[type="datetime-local"],
            input[type="file"],
            select,
            textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                background-color: #5cb85c;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            input[type="submit"]:hover {
                background-color: #4cae4c;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="header-area ">
                <div class="header-top_area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6 col-md-12 col-lg-8">
                                <div class="short_contact_list">
                                    <ul>
                                        <li><a href="#"> <i class="fa fa-phone"></i> +84989999999</a></li>
                                        <li><a href="#"> <i class="fa fa-envelope"></i>charifit@gmail.com</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sticky-header" class="main-header-area">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-3">
                                <div class="logo">
                                    <a href="index.html">
                                        <img src="img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-9">
                                <div class="main-menu">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="index.jsp">home</a></li>
                                            <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li>
                                                        <a href="project">Manage Project</a>
                                                        <a href="append.html">Append</a>
                                                        <a href="pending.html">Pending</a>
                                                    </li>
                                                    <li><a href="Projects/RegisterProject.jsp">Register Project</a></li>
                                                </ul>
                                            </li>


                                        </ul>
                                    </nav>
                                    <div class="Appointment">
                                        <div class="book_btn d-none d-lg-block">
                                            <a data-scroll-nav='1' href="#">Make a Donate</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="bradcam_area breadcam_bg overlay d-flex align-items-center justify-content-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text text-center">
                            <h3>Register Projects</h3>
                        </div>
                    </div>   
                </div>     

            </div>
        </div>
        <form action="/registerProject" method="post" style="margin-top: 20px">
            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" maxlength="255" required><br><br>

            <label for="image">Image:</label><br>
            <input type="file" id="image" name="image" accept="image/*"><br><br>

            <label for="description">Description:</label><br>
            <textarea id="description" name="description" rows="4" maxlength="255" required></textarea><br><br>

            <label for="start_date">Start Date:</label><br>
            <input type="date" id="start_date" name="start_date" required><br><br>

            <label for="staff_id">Staff ID:</label><br>
            <input type="text" id="staff_id" name="staff_id" maxlength="6" required><br><br>

            <label for="end_date">End Date:</label><br>
            <input type="date" id="end_date" name="end_date" required><br><br>

            <label for="document">Document:</label><br>
            <input type="file" id="document" name="document" maxlength="255"><br><br>

            <label for="role_project">Role in Project:</label><br>
            <input type="text" id="role_project" name="role_project" maxlength="10" required><br><br>


            <label for="created_by_org">Created by Organization:</label><br>
            <input type="text" id="created_by_org" name="created_by_org" required><br><br>

            <label for="created_at">Created At:</label><br>
            <input type="datetime-local" id="created_at" name="created_at" required><br><br>

            <input type="submit" value="Submit">
            <a href="project" class="btn btn-primary">Back </a>
        </form>
    </body>
</html>

