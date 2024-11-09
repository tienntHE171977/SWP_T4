<%-- 
    Document   : Edit_Profile
    Created on : Oct 3, 2024, 8:11:03 PM
    Author     : pc
--%>

<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Charifit</title>
        <link rel="shortcut icon" type="${pageContext.request.contextPath}/image/x-icon" href="img/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/gijgo.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

        <style>
            
            /* Add some basic styling to make the form look decent */
            body {
                font-family: Arial, sans-serif;

                height: 100vh;
                margin: 0;
            }
            form {
                width: 50%;
                margin: 40px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 10px;
            }
            input[type="text"], input[type="email"], input[type="tel"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 10px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #3e8e41;
            }
            .back-button {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                margin-left: 10px;
            }

            .back-button:hover {
                background-color: #3e8e41;
            }
        </style>
    </head>
    <body>
        <header >
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
                <div id="sticky-header" class="main-header-area" style="margin-bottom: 20px">
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
                                                    <li><a href="elements.html">Manage Project</a></li>
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
                                    <h3>Profile</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        <form action="${pageContext.request.contextPath}/editProfile" method="post">
            <h2>Edit Profile</h2>
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" placeholder="${profile.getFullName()}"  maxlength="255">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${profile.getEmail()}" maxlength="50" readonly>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" placeholder="${profile.getPhone()}" maxlength="10">

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" placeholder="${profile.getAddress()}" maxlength="255">
            
            <input type="submit" value="Save Changes">
            <a href="${pageContext.request.contextPath}/profile">Back</a>
        </form>
    </body>
</html>