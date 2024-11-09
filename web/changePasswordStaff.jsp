<%-- 
    Document   : changePasswordStaff
    Created on : Oct 25, 2024, 1:21:27 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thay Đỏi Mật Khẩu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-container .password-wrapper {
            position: relative;
            margin-bottom: 15px;
        }

        .form-container input[type="password"],
        .form-container input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #3CC78F;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="form-container">
        <h2>Thay Đổi Mật Khẩu</h2>
        <h2>${me}</h2>
        <h2>${errorMessage}</h2>
        <h2>${successMessage}</h2>
        <form action="changepasswordstaff" method="post">
            <label for="currentPassword">Mật Khẩu Hiện Tại:</label>
            <div class="password-wrapper">
                <input type="password" id="currentPassword" name="currentPassword" required>
                <i class="fas fa-eye-slash toggle-password" onclick="togglePassword('currentPassword', this)"></i>
            </div>
            
            <label for="newPassword">Mật Khẩu Mới:</label>
            <div class="password-wrapper">
                <input type="password" id="newPassword" name="newPassword" required>
                <i class="fas fa-eye-slash toggle-password" onclick="togglePassword('newPassword', this)"></i>
            </div>
            
            <label for="confirmPassword">Xác Nhận Mật Khẩu:</label>
            <div class="password-wrapper">
                <input type="password" id="confirmPassword" name="confirmPassword" required>
                <i class="fas fa-eye-slash toggle-password" onclick="togglePassword('confirmPassword', this)"></i>
            </div>
            
            <button type="submit">Change Password</button>
            
        </form>
        <form style="margin-top: 10px"><button class="btn btn-home" onclick="event.preventDefault(); window.location.href='staff';">Back to Home</button></form>
    </div>

    <script>
        
        function togglePassword(inputId, icon) {
            const input = document.getElementById(inputId);
            if (input.type === "password") {
                input.type = "text";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            } else {
                input.type = "password";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            }
        }
    </script>
</body>
</html>



