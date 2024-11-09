<%-- 
    Document   : staffProfile
    Created on : Oct 23, 2024, 8:20:36 AM
    Author     : FPT
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hồ sơ nhân viên</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
            }

            .container {
                max-width: 900px;
                margin: 30px auto;
                padding: 20px;
            }

            .profile-card {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                overflow: hidden;
            }

            .profile-header {
                background: linear-gradient(135deg, #3CC78F, #1565c0);
                color: white;
                padding: 30px 20px;
                text-align: center;
            }

            .profile-avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                margin: 0 auto 15px;
                border: 5px solid rgba(255,255,255,0.5);
                overflow: hidden;
            }

            .profile-avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .profile-info {
                padding: 30px;
            }

            .info-group {
                margin-bottom: 20px;
            }

            .info-label {
                font-size: 14px;
                color: #666;
                margin-bottom: 5px;
            }

            .info-value input {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            .edit-profile {
                text-align: right;
                padding: 20px;
            }

            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                transition: all 0.3s;
            }

            .btn-edit {
                background: #1e88e5;
                color: white;
            }

            .btn-edit:hover {
                background: #1565c0;
            }

            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
            }

            .modal-content {
                background: white;
                width: 90%;
                max-width: 500px;
                margin: 50px auto;
                padding: 20px;
                border-radius: 8px;
                position: relative;
            }

            .close-btn {
                position: absolute;
                right: 20px;
                top: 15px;
                font-size: 24px;
                cursor: pointer;
            }

            @media (max-width: 768px) {
                .container {
                    padding: 10px;
                }

                .profile-card {
                    margin: 10px;
                }
            }
            .file-export_box {
                border-radius: 5px;
                background-color: green;
                color: white;
                cursor: pointer;
            }
        </style>

    </head>
    <body>
        <div class="container">

            <form action="staffProfile" method="post">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar">
                            <img src="${staff.getUser().getImage()}" alt="Staff Avatar" id="avatarImg">
                        </div>
                        <h2 id="staffName">${staff.getUser().getFullname()}</h2>
                        <p id="staffRole">${staff.role_staff}</p>
                    </div>

                    <div class="info-group">
                        <div class="info-label">Email</div>
                        <div class="info-value">
                            <input type="email" id="staffEmail" value="${staff.getUser().getEmail()}" readonly>
                        </div>
                    </div>

                    <div class="info-group">
                        <div class="info-label">Số điện thoại</div>
                        <div class="info-value">
                            <input type="tel" id="staffPhone" value="${staff.getUser().getPhone()}" readonly>
                        </div>
                    </div>
                    <div class="info-group">
                        <div class="info-label">Địa chỉ</div>
                        <div class="info-value">
                            <input type="tel" id="staffPhone" value="${staff.getUser().getAdrees()}" readonly>
                        </div>
                    </div>
                    <div class="info-group">
                        <div class="info-label">Chức vụ</div>
                        <div class="info-value">
                            <input type="text" id="staffDepartment" value="${staff.role_staff}" readonly>
                        </div>
                    </div>
                    <div class="info-group">
                        <div class="info-label">Ngày tham gia</div>
                        <div class="info-value">
                            <input type="text" id="staffJoinDate" value="${staff.created_at}" readonly>
                        </div>
                    </div>
                    <div class="file-export_box ms-4">
                        <a href="staffcontact" class="d-flex justify-content-center align-items-center px-3 py-2 fs-4 text-white">
                            <span>Quay lại bảng điều khiển</span>
                        </a>
                    </div>
                </div>


            </form>
        </div>
    </div>



    <script>


        function openEditModal() {
            document.getElementById('editModal').style.display = 'block';
            // Populate form with current values
            document.getElementById('editName').value = document.getElementById('staffName').innerText;
            document.getElementById('editEmail').value = document.getElementById('staffEmail').value;
            document.getElementById('editPhone').value = document.getElementById('staffPhone').value;
            document.getElementById('editDepartment').value = document.getElementById('staffDepartment').value;
        }

        // Close edit modal
        function closeEditModal() {
            document.getElementById('editModal').style.display = 'none';
        }

        // Update profile
        function updateProfile(event) {
            event.preventDefault();

            // Update values
            document.getElementById('staffName').innerText = document.getElementById('editName').value;
            document.getElementById('staffEmail').value = document.getElementById('editEmail').value;
            document.getElementById('staffPhone').value = document.getElementById('editPhone').value;
            document.getElementById('staffDepartment').value = document.getElementById('editDepartment').value;

            // Close modal
            closeEditModal();

            // You would typically make an AJAX call here to update the server
            alert('Profile updated successfully!');
        }


    </script>
</body>
</html>
