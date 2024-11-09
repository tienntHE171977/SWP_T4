<%-- 
    Document   : manageUser
    Created on : Nov 8, 2024, 9:18:20 AM
    Author     : FPT
--%>


<%@ page import="model.User" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hồ Sơ người dùng</title>
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
                cursor: pointer;
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
                justify-content: center;
                align-items: center;
            }

            .modal-content {
                background: white;
                width: 90%;
                max-width: 500px;
                margin: auto;
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
            .inline-radio {
                display: flex;
                align-items: center;
            }

            .inline-radio label {
                margin-right: 15px; /* Khoảng cách giữa các nhãn */
                margin-left: 5px; /* Khoảng cách giữa radio và nhãn */
            }

            @media (max-width: 768px) {
                .container {
                    padding: 10px;
                }

                .profile-card {
                    margin: 10px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>${id}</h1>
            <h1>${error}</h1>
            <h1>${me}</h1>
            <h1>${mee}</h1>
            <form action="editProfileUser" method="post" enctype="multipart/form-data">
                <input type="text" name="id" value="${user.userId}">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar" id="avatarContainer">
                            <img src="${user.image}" alt="Staff Avatar" id="avatarImg">
                            <input type="file" id="avatarUpload" name="avatar" accept="image/*" style="display: none;">
                        </div>

                        <h2 id="staffName">${user.fullname}</h2>
                        <p id="staffRole">${user.role}</p>
                    </div>
                </div>


                <div class="profile-card">
                    <div class="profile-info">
                        
                        <div class="info-group">
                            <div class="info-label">Email</div>
                            <div class="info-value">
                                <input type="email" id="staffEmail" value="${user.email}" readonly>
                            </div>
                        </div>

                        <div class="info-group">
                            <div class="info-label">Điện thoại</div>
                            <div class="info-value">
                                <input type="tel" id="userPhone" name="phone" value="${user.phone}" maxlength="10">
                            </div>
                        </div>

                        <div class="info-group">
                            <div class="info-label">Địa chỉ</div>
                            <div class="info-value">
                                <input type="text" id="staffAddress" name="address" value="${user.adrees}">
                            </div>
                        </div>

                        <div class="info-group">
                            <div class="info-label">Chức vụ</div>
                            <div class="info-value">
                                <select id="staffDepartment" name="role">
                                    <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                                    <option value="donor" ${user.role == 'donor' ? 'selected' : ''}>Người ủng hộ</option>
                                    <option value="volunteer" ${user.role == 'volunteer' ? 'selected' : ''}>Tình nguyện viên</option>
                                    <option value="staff" ${user.role == 'staff' ? 'selected' : ''}>Nhân viên</option>
                                    <option value="ban" ${user.role == 'ban' ? 'selected' : ''}>Chặn</option>
                                </select>
                            </div>
                        </div>

                        <div class="info-group">
                            <div class="info-label">Giới tính</div>
                            <div class="info-value inline-radio">
                                <input type="radio" id="genderMale" name="gender" value="Male" ${user.gender == 'Male' ? 'checked' : ''}>
                                <label for="genderMale">Nam</label>

                                <input type="radio" id="genderFemale" name="gender" value="Female" ${user.gender == 'Female' ? 'checked' : ''}>
                                <label for="genderFemale">Nữ</label>
                            </div>
                        </div>



                        <div class="edit-profile">
                            <button type="submit" class="btn btn-edit">Lưu thay đổi</button>
                        </div>
                        <div class="edit-profile">
                            <button class="btn btn-home" onclick="event.preventDefault(); window.location.href = 'staff';">Quay về trong chủ</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Modal for viewing and changing avatar -->
        <div id="avatarModal" class="modal">
            <div class="modal-content">
                <span class="close-btn" onclick="closeModal()">&times;</span>
                <img id="modalAvatarImg" src="" alt="Avatar" style="width: 100%; height: auto; margin-bottom: 20px;">
                <input type="file" id="modalAvatarUpload" accept="image/*">
                <button class="btn btn-edit" onclick="changeAvatar()">thay ảnh</button>
            </div>
        </div>

        <script>
            // Open modal when avatar is clicked
            document.getElementById('avatarContainer').onclick = function () {
                var modal = document.getElementById('avatarModal');
                var modalImg = document.getElementById('modalAvatarImg');
                modal.style.display = "flex";
                modalImg.src = document.getElementById('avatarImg').src;
            }

            // Close modal
            function closeModal() {
                document.getElementById('avatarModal').style.display = "none";
            }

            // Change avatar
            function changeAvatar() {
                var fileInput = document.getElementById('modalAvatarUpload');
                if (fileInput.files.length > 0) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('avatarImg').src = e.target.result;
                        document.getElementById('avatarUpload').files = fileInput.files;
                    }
                    reader.readAsDataURL(fileInput.files[0]);
                }
                closeModal();
            }
        </script>
    </body>
</html>
