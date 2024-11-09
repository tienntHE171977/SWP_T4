<%-- 
    Document   : right
    Created on : Sep 20, 2024, 8:26:12 AM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
<style>


    /* Tùy chỉnh thẻ select */
    form .form-select {
        border: 1px solid rgba(0, 0, 0, 0.1); /* Viền mờ màu xám nhạt */
        border-radius: 4px;
    }

    /* Nút Sort với màu trắng và viền xanh */
    form .btn-info {
        background-color: white;
        border: 1px solid #3CC78F; /* Viền màu xanh */
        color: #3CC78F; /* Màu chữ xanh */
        transition: all 0.3s ease; /* Hiệu ứng mượt khi di chuột vào */
    }

    /* Hiệu ứng khi di chuột vào nút */
    form .btn-info:hover {
        background-color: #3CC78F; /* Màu nền xanh khi di chuột */
        color: white; /* Màu chữ trắng khi di chuột */
    }
    select.form-select option {
        color: rgba(0, 0, 0, 0.6); /* Màu đen với độ trong suốt 0.6 để làm mờ */
    }

</style> 
<aside class="single_sidebar_widget newsletter_widget">
    <h4 class="widget_title">Sắp xếp Tin tức</h4>

    <form action="BlogSort" method="post" class="d-flex align-items-center">
        <label for="sortby" class="mb-0 me-2"></label>
        <select id="sortby" name="sortby" class="form-select me-2">
            <option value="">-- Sắp xếp --</option>
            <option value="Title">Tiêu đề</option>
            <option value="Date">Thời gian</option>
        </select>
        <button type="submit" class="btn btn-info">Đi</button>
    </form>
</aside>

<aside class="single_sidebar_widget search_widget">
    <form action="SearchBlog" method="post">
        <div class="form-group">
            <div class="input-group mb-3">
                <input value="${txtS}" name="txt" type="text" class="form-control" placeholder='Nhập từ khóa'
                       onfocus="this.placeholder = ''"
                       onblur="this.placeholder = 'Search Keyword'">
                <div class="input-group-append">
                    <button class="btn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
            </div>
        </div>
        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                type="submit">Tìm kiếm</button>
    </form>
</aside>

<aside class="single_sidebar_widget post_category_widget">
    <h4 class="widget_title">Danh mục</h4>
    <ul class="list cat-list">

        <c:forEach items="${listCC}" var="o">
            <li>
                <a href="BlogCategories?categoryID=${o.ncategoriesID}" class="d-flex">
                    <p>${o.ncategoryName}</p>
                </a>
            </li>
        </c:forEach>
        <!-- Option to show "All" categories -->
        <li>
            <a href="Blog" class="d-flex">
                <p>Tổng</p>
            </a>
        </li>   
    </ul>
</aside>

<aside class="single_sidebar_widget popular_post_widget">
    <h3 class="widget_title">Bài viết mới</h3>
    <c:if test="${not empty listPP}">
        <c:forEach items="${listPP}" var="o">
            <div class="media post_item">
                <img src="${o.image}" alt="post" style="width: 100px; height: 70px;">
                <div class="media-body">
                    <a href="SingleBlog?postID=${o.newsID}">
                        <h3>${o.title}</h3>
                    </a>
                    <p>${o.updatedDate}</p>
                </div>
            </div>
        </c:forEach>
    </c:if>
    <c:if test="${empty listPP}">
        <p>Không có dữ liệu để hiển thị.</p>
    </c:if>  
</aside>

