<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật sự kiện</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Charifit</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- <link rel="manifest" href="site.webmanifest"> -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!--        <link rel="stylesheet" href="css/themify-icons.css">-->
        <link rel="stylesheet" href="css/nice-select.css">
        <!--        <link rel="stylesheet" href="css/flaticon.css">-->
        <link rel="stylesheet" href="css/gijgo.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
            />
    </head>
    <style>
        .user_notification {
            display: flex; /* Sử dụng flexbox để căn chỉnh theo hàng */
            align-items: center; /* Căn giữa theo chiều dọc */
            margin-left: 15px; /* Khoảng cách bên trái giữa các biểu tượng */
        }

        .notification-icon {
            display: flex; /* Căn giữa biểu tượng thông báo */
            align-items: center; /* Căn giữa theo chiều dọc */
            margin-right: 10px; /* Khoảng cách giữa biểu tượng thông báo và hình đại diện */
            font-size: 28px; /* Kích thước lớn cho biểu tượng thông báo */
            margin-right: 20px;
            color: white
        }

        .user-icon {
            display: flex; /* Căn giữa hình ảnh */
            align-items: center; /* Căn giữa theo chiều dọc */
        }

        .user-avatar {
            width: 40px; /* Chiều rộng hình ảnh */
            height: 40px; /* Chiều cao hình ảnh */
            border-radius: 50%; /* Bo góc thành hình tròn */
            object-fit: cover; /* Đảm bảo hình ảnh không bị méo */
        }

        /* Đảm bảo không có thuộc tính display: none; cho phần tử khi ở chế độ di động */
        .d-lg-none {
            display: none; /* Chỉ ẩn cho màn hình lớn */
        }

        @media (max-width: 767px) {
            .user_notification {
                display: flex; /* Đảm bảo hiển thị khi ở chế độ di động */
            }
        }
        /* Ẩn dropdown mặc định */
        /* Ẩn dropdown mặc định */
        .notification-dropdown {
            display: none;
            position: absolute;
            top: 40px; /* Điều chỉnh theo vị trí của biểu tượng */
            right: 0;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 400px;
        }
        .user-dropdown {
            display: none;
            position: absolute;
            top: 40px; /* Điều chỉnh theo vị trí của biểu tượng */
            right: 0;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 200px;
        }

        /* Danh sách dropdown */
        .notification-dropdown ul,
        .user-dropdown ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .notification-dropdown ul li,
        .user-dropdown ul li {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        .notification-dropdown ul li:last-child,
        .user-dropdown ul li:last-child {
            border-bottom: none;
        }

        .notification-dropdown ul li a,
        .user-dropdown ul li a {
            text-decoration: none;
            color: #333;
            display: block;
        }

        .notification-dropdown ul li a:hover,
        .user-dropdown ul li a:hover {
            background-color: #f1f1f1;
        }

        /* Hiển thị dropdown */
        .show-dropdown {
            display: block;
        }
        .campaign-container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }
        .campaign-header {
            text-align: center;
            margin-bottom: 50px;
            color: black;
            font-size: 24px;
            font-weight: normal;
            text-decoration: underline;
        }
        .campaign-section {
            text-align: center;
            width: 30%;
        }
        .campaign-section i {
            margin-top: 50px;
            font-size: 80px;
            color: #3cc78f;
            margin-bottom: 20px;
        }
        .campaign-section h3 {
            color: #333;
            font-size: 20px;
            margin-bottom: 15px;
        }
        .campaign-section p {
            color: #666;
            line-height: 1.5;
        }
        .campaign-btn {
            background-color: #3cc78f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 50px;
        }
        /*        .campaign-btn:hover {
                    background-color: #666;
                }*/
        .search-bar {
            display: flex;
        }

        .btn-search {
            background-color: transparent; /* Nền trong suốt */
            border: none; /* Không có đường viền */
            outline: none; /* Không có viền khi nhấn */
            cursor: pointer; /* Con trỏ khi di chuột qua */
        }

        .btn-search i {
            color: #000; /* Màu sắc của biểu tượng */
            font-size: 18px; /* Kích thước biểu tượng */
        }
        .custom_causes_active {
            display: flex; /* Sử dụng flexbox để căn giữa */
            justify-content: flex-start; /* Căn trái cho các thẻ */
            overflow: hidden; /* Ẩn phần thừa ra ngoài */
        }

        .single_cause {
            width: 90%; /* Mỗi thẻ chiếm 1/3 chiều rộng của hàng */
            box-sizing: border-box; /* Để tính toán chiều rộng chính xác */
            transition: transform 0.3s ease; /* Thêm hiệu ứng chuyển động */
        }

        /* Căn chỉnh cho màn hình nhỏ */
        @media (max-width: 768px) {
            .single_cause {
                width: 100%; /* Hiển thị 1 thẻ cho màn hình nhỏ */
            }
        }

        @media (min-width: 769px) and (max-width: 1024px) {
            .single_cause {
                width: 50%; /* Hiển thị 2 thẻ cho màn hình trung bình */
            }
        }
        .filter-bar {
            justify-content: flex-start;
            display: flex;
            gap: 10px;
            margin-top: 50px;
            margin-bottom: -30px;

            padding: 10px;
            background-color: #f3fcf8;
            border-radius: 20px;
            overflow-x: auto;
        }

        .filter-select {
            padding: 5px 15px;
            margin-left: 200px;
            border: none;
            background-color: #fff;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .crtprj-btn {
            padding: 5px 15px;
            margin-left: 50px;
            border: none;
            background-color: #3cc78f;
            border-radius: 20px;
            color: black;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .filter-button.active {
            background-color: #3cc78f;
            color: #000;
        }

        .filter-button:hover {
            background-color: #f0f0f0;
        }

        .single-line-limit {
            width: 250px; /* Độ rộng tối đa của dòng */
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .Content-news {
            overflow: hidden;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 7; /* Số dòng bạn muốn giới hạn */
            line-clamp: 7; /* Số dòng bạn muốn giới hạn, cho các trình duyệt hỗ trợ */
            height: calc(1.2em * 8); /* Chiều cao tương ứng với số dòng giới hạn */

        }
        .image-new {
            width: 264px; /* Set the desired width */
            height: 424px; /* Set the desired height */
            /*border-radius: 8px;  Rounded corners if desired */
            /*box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);  Optional shadow */
            overflow: hidden; /* Ensures content stays within the rounded corners */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .thum img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the image covers the container, cropping as necessary */
            object-position: center; /* Center the cropped image */
            display: block;
        }
        #chat-bubble {
            position: fixed;
            bottom: 100px;
            right: 30px;
            width: 300px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: none;
            flex-direction: column;
            z-index: 1000;
        }

        .chat-header {
            background-color: #3cc78f;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 10px 10px 0 0;
        }

        .chat-body {
            padding: 10px;
            height: 200px;
            overflow-y: auto;
        }

        .chat-footer {
            padding: 10px;
            border-top: 1px solid #ddd;
        }

        #chat-toggle {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background-color: #3cc78f;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 16px;
            cursor: pointer;
            z-index: 1000;
        }

    </style>

<body>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>Cập nhật sự kiện</h3>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/event-update" method="POST">
                            <input type="hidden" name="eventId" value="${event.eventId}">
                            <input type="hidden" name="projectId" value="${event.projectId}">
                            
                            <div class="form-group">
                                <label>Tên vật phẩm</label>
                                <input type="text" class="form-control" name="itemName" 
                                       value="${event.itemName}" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Số lượng cần</label>
                                <input type="number" class="form-control" name="quantityNeeded" 
                                       value="${event.quantityNeeded}" required min="1">
                            </div>
                            
                            <div class="form-group">
                                <label>Được tài trợ</label>
                                <input type="number" class="form-control" name="quantityProvided" 
                                       value="${event.quantityProvided}" required min="0">
                            </div>
                            
                            <div class="form-group">
                                <label>Đơn vị</label>
                                <input type="text" class="form-control" name="unit" 
                                       value="${event.unit}" required>
                            </div>
                            
                            <div class="form-group text-center mt-4">
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                <a href="${pageContext.request.contextPath}/project-event-manage?projectId=${event.projectId}" 
                                   class="btn btn-secondary">Đóng</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>