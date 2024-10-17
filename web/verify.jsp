<%-- 
    Document   : verify
    Created on : Oct 1, 2024, 12:39:59 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Verify Email</title>
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
    </style>
</head>
<body>

    <div class="limiter">
        <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
            <div class="wrap-login100">
                <form class="login100-form validate-form"  action="verify" method="post">

                    <span class="login100-form-title p-b-34 p-t-27">
                        Verify Email
                    </span>

                    <div class="wrap-input100 validate-input" data-validate="Enter email">
                        <input class="input100" type="email" name="email" id="email" placeholder="Email" required value="${email}">
                        <span class="focus-input100" data-placeholder="&#xf207;"></span>
                    </div>

                   

                    <div class="container-login100-form-btn">
                        <button type="submit" class="login100-form-btn">
                            Send Verification Email
                        </button>
                    </div>
                </form>
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
    
  

</body>
</html>

