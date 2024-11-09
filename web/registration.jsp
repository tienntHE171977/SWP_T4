<%-- 
    Document   : registration
    Created on : Sep 23, 2024, 11:44:28 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Đăng Ký </title>

        <!-- Font Icon -->
        <link rel="stylesheet"
              href="fonts/fontslr/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <!-- Main css -->
        <link rel="stylesheet" href="css/csslr/style.css">
    </head>
    <body>

        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Đăng ký</h2>

                            <form method="post" action="register" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="username" placeholder="Tên người dùng" />
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Email của bạn" value="${sessionScope.tempUser.getEmail()}" />
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="pass" id="pass" placeholder="Mật khẩu" />
                                </div>
                                <div class="form-group">
                                    <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Nhập lại mật khẩu" />
                                </div>
                                <div class="form-group">
                                    <label for="fullname"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="fullname" id="fullname" placeholder="Họ và tên của bạn" />
                                </div>
                                <div class="form-group">
                                    <label for="address"><i class="fas fa-home"></i></label>
                                    <input type="text" name="address" id="address" placeholder="Địa chỉ của bạn" />
                                </div>
                                <div class="form-group">
                                    <table border="0">
                                        <thead>
                                            <tr>
                                                <th><label for="gender" class="label-with-icon">
                                                        <i class="fas fa-venus-mars"></i>
                                                    </label></th>
                                                <th></th>
                                                <th></th>
                                                <th></th>
                                                <th>
                                                    <select style="border-radius: 4px; padding: 4px; padding-right: 15px; border: 1px solid #ccc; font-size: 16px; appearance: none; background-color: #fff; outline: none; width: 100%; max-width: 200px; box-sizing: border-box;" name="gender" id="gender">
                                                        <option value="Male">Nam</option>
                                                        <option value="Female">Nữ</option>
                                                        <option value="Other">Khác</option>
                                                    </select>
                                                </th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                                <div class="form-group">
                                    <label for="phone"><i class="fas fa-phone"></i></label>
                                    <input type="text" name="phone" id="phone" placeholder="Số điện thoại của bạn" maxlength="10" />
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term">
                                        <span><span></span></span>
                                        Tôi đồng ý với tất cả điều khoản trong <a href="terms.jsp" class="term-service" target="_blank">Điều khoản dịch vụ</a>
                                    </label>
                                </div>
                                <div>
                                    <h3 style="color: red">${messError}</h3>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Đăng ký" />
                                </div>
                            </form>

                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="images/logolacay.jpg" alt="sing up image">
                            </figure>
                            <a href="login" class="signup-image-link">Đã có tài khoản</a>
                        </div>
                    </div>
                </div>
            </section>


        </div>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/jslr/main.js"></script>

        <script>
            document.getElementById('register-form').addEventListener('submit', function (e) {
                var agreeTerms = document.getElementById('agree-term');
                if (!agreeTerms.checked) {
                    e.preventDefault(); // Ngăn form được submit
                    alert('Bạn cần đồng ý với điều khoản của website.');
                }
            });
        </script>


    </body>
    <!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>