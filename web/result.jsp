<%-- 
    Document   : verify
    Created on : Oct 1, 2024, 12:39:59 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Xác Minh Email</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="vendorpr/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/fontspr/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="fonts/fontspr/iconic/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" type="text/css" href="vendorpr/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="vendorpr/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="vendorpr/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="vendorpr/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="vendorpr/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="css/csspr/util.css">
        <link rel="stylesheet" type="text/css" href="css/csspr/main.css">
        <style>
            .input-group {
                display: flex;
                align-items: center;
            }
            .input-group .input100 {
                flex: 1;
                margin-right: 5px; /* Khoảng cách giữa input và nút */
            }
            .input-group .btn {
                padding: 10px 15px;
            }

            .btn-back-to-login {
                background-color: #ff6f61;  /* Màu nền */
                color: white;  /* Màu chữ */
                border: none;  /* Loại bỏ viền */
                padding: 10px 20px;  /* Căn chỉnh kích thước */
                border-radius: 25px;  /* Góc bo tròn */
                font-size: 16px;  /* Kích thước chữ */
                font-weight: bold;
                cursor: pointer;  /* Con trỏ thành tay chỉ */
                transition: background-color 0.3s ease;  /* Hiệu ứng chuyển màu */
            }

            .btn-back-to-login:hover {
                background-color: #ff4f41;  /* Màu nền khi hover */
                color: #f1f1f1;  /* Màu chữ khi hover */
            }

            .btn-back-to-login:focus {
                outline: none;  /* Loại bỏ viền focus */
            }
        </style>

    </head>
    <body>

        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <div class="wrap-login100">
                    <form class="login100-form validate-form"  action="verify" method="post">

                        <span class="login100-form-title p-b-34 p-t-27">
                            <c:if test="${not empty message}">
                                <h3>${message}</h3>
                            </c:if>
                            <c:if test="${not empty error}">
                                <h3 style="color: red;">${error}</h3>
                            </c:if>
                        </span>


                    </form>
                    <button class="btn-back-to-login" onclick="backToLogin()" >Quay lại đăng nhập</button>

                </div>
            </div>
        </div>

        <div id="dropDownSelect1"></div>

        <script src="vendorpr/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendorpr/animsition/js/animsition.min.js"></script>
        <script src="vendorpr/bootstrap/js/popper.js"></script>
        <script src="vendorpr/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendorpr/select2/select2.min.js"></script>
        <script src="vendorpr/daterangepicker/moment.min.js"></script>
        <script src="vendorpr/daterangepicker/daterangepicker.js"></script>
        <script src="vendorpr/countdowntime/countdowntime.js"></script>
        <script src="js/jspr/main.js"></script>
        <script>function backToLogin() {
                                window.location.href = 'login.jsp';  // Thay 'login.jsp' bằng đường dẫn thực tế đến trang đăng nhập của bạn
                            }</script>


    </body>
</html>

