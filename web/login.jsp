<%-- 
    Document   : login
    Created on : Sep 23, 2024, 12:15:23 AM
    Author     : FPT
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Đăng Nhập</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <!-- Font Icon -->
        <link rel="stylesheet"
              href="fonts/fontslr/material-icon/css/material-design-iconic-font.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Main css -->
        <link rel="stylesheet" href="css/csslr/style.css">
    </head>
    <body>

        <div class="main">

            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure>
                                <img src="images/logolacay.jpg" alt="sing up image">
                            </figure>
                            <a href="registration.jsp" class="signup-image-link">Tạo tài Khoản</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Đăng nhập</h2>
                            <form method="post" action="login" class="register-form"
                                  id="login-form">
                                <div class="form-group">
                                    <label for="username"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="text" name="emailorusername" value="${username}"
                                        placeholder="Email hoặc Tên Đăng nhập" />
                                </div>
                                <div class="form-group">
                                    <label for="password"><i class="zmdi zmdi-lock"></i></label> <input
                                        type="password" name="password" id="password" value="${password}"
                                        placeholder="Mật khẩu"/>
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="remember-me" id="remember-me"
                                           class="agree-term" /> <label for="remember-me"
                                           class="label-agree-term"><span><span></span></span>Lưu Tài Khoản</label>
                                </div>
                                <div class="forget-password">
                                    <a href="resetPassword">Lấy lại mật khẩu?</a>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin"
                                           class="form-submit" value="Đăng nhập" />
                                </div>
                                <div >
                                    <p style="color: red;">${err}</p>
                                    <p style="color: red;">${err1}</p>
                                    <p style="color: red;">${err0}</p>
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Đăng nhập với</span>
                                <ul class="socials">
                                    
                                    <li><a href="https://accounts.google.com/o/oauth2/auth?client_id=696107190644-uun9t77kr1ohvrmcpufnhs9c69lmar2v.apps.googleusercontent.com&redirect_uri=http://localhost:8080/swp391/google&response_type=code&scope=email%20profile" class="field google">
                                            <i class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
<!--        <script src="vendor/jquery/jquery.min.js"></script>-->
        <script src="js/jslr/main.js"></script>
    </body>
    <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
