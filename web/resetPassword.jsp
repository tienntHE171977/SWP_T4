<%-- 
    Document   : resetPassword
    Created on : Oct 1, 2024, 8:10:09 PM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lấy lại mật khẩu</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                background-color: #f0f0f0;
            }
            form {
                background-color: white;
                padding: 40px;  /* Tăng padding */
                border-radius: 12px;  /* Tăng border-radius cho góc tròn hơn */
                box-shadow: 0 0 20px rgba(0,0,0,0.1);  /* Tăng shadow */
                width: 450px;  /* Tăng width */
                max-width: 90%;  /* Đảm bảo responsive */
            }
            h2 {
                text-align: center;
                margin-bottom: 30px;  /* Thêm khoảng cách dưới tiêu đề */
                color: #333;  /* Màu tối hơn cho tiêu đề */
            }
            input {
                display: block;
                margin: 15px 0;  /* Tăng margin */
                padding: 12px;  /* Tăng padding */
                width: 100%;
                box-sizing: border-box;
                border: 1px solid #ddd;
                border-radius: 6px;  /* Tăng border-radius */
            }
            button {
                padding: 12px 24px;  /* Tăng padding */
                border: none;
                border-radius: 6px;  /* Tăng border-radius */
                cursor: pointer;
                font-size: 16px;  /* Tăng font-size */
                transition: background-color 0.3s;
            }
            button:hover {
                background-color: #45a049;
            }
            .error {
                color: red;
            }
            .success {
                color: green;
            }
            .otp-container {
                display: flex;
                align-items: center;
            }
            .otp-input {
                flex-grow: 1;
                margin-right: 10px;
            }
            .send-button {
                background-color: #008CBA;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .send-button:hover {
                background-color: #007B9A;
            }
            .button-container {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .reset-button {
                background-color: #4CAF50;
            }

            .back-button {
                background-color: #f44336;
            }

            .back-button:hover {
                background-color: #d32f2f;
            }
            .error-message {
                color: red;
                font-size: 0.8em;
                display: none;
            }

            input:invalid {
                border-color: red;
            }
        </style>
    </head>
    <body>
        <form action="resetPassword" method="post" onsubmit="return validateForm()">
            <h2>Đặt Lại Mật Khẩu</h2>
            <input type="hidden" name="action" value="resetPassword">
            <input type="email" name="email" required placeholder="Xác nhận email của bạn">
            <span id="email-error" class="error-message"></span>
            <div class="otp-container">
                <input type="text" name="otp" required placeholder="Nhập mã OTP" class="otp-input" maxlength="6">
                <button type="button" class="send-button" onclick="sendOTP()" >Gửi</button>
            </div>
            <input type="password" name="newPassword" id="newPassword" required placeholder="Nhập mật khẩu mới">
            <input type="password" name="newPassword_confirm" id="newPassword_confirm" required placeholder="Xác nhận mật khẩu mới">
            <div style=" text-align: center;  justify-content: center; align-items: center;"><button type="submit" >Đặt Lại Mật Khẩu</button>
            <button onclick="backToLogin()" style=" margin-top: 20px;">Quay lại Đăng Nhập</button></div>

            <div id="message">

                <% if(request.getAttribute("error") != null) { %>
                <p class="error"><%= request.getAttribute("error") %></p>
                <% } %>
                <% if(request.getAttribute("success") != null) { %>
                <p class="success"><%= request.getAttribute("success") %></p>
                <% } %>
            </div>
            
        </form>


    <body>

        <script>
            function sendOTP() {
                var email = document.getElementsByName("email")[0].value;
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "resetPassword", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        alert(this.responseText);
                    }
                };
                xhr.send("action=sendOTP&email=" + email);
            }
            function backToLogin() {
                window.location.href = 'login.jsp';  // Thay 'login.jsp' bằng đường dẫn thực tế đến trang đăng nhập của bạn
            }
            document.addEventListener('DOMContentLoaded', function () {
                const emailInput = document.getElementById('email');
                const emailError = document.getElementById('email-error');

                emailInput.addEventListener('input', function () {
                    if (emailInput.validity.valid) {
                        emailError.style.display = 'none';
                        emailInput.style.borderColor = 'green';
                    } else {
                        showError();
                    }
                });

                emailInput.addEventListener('invalid', function (event) {
                    event.preventDefault();
                    showError();
                });

                function showError() {
                    if (emailInput.validity.valueMissing) {
                        emailError.textContent = 'Bạn cần nhập địa chỉ email.';
                    } else if (emailInput.validity.typeMismatch) {
                        emailError.textContent = 'Giá trị nhập vào cần là một địa chỉ email.';
                    }
                    emailError.style.display = 'block';
                    emailInput.style.borderColor = 'red';
                }
            });

        </script>
</html>


