<%-- 
    Document   : UserHeader
    Created on : Nov 1, 2024, 3:01:34 AM
    Author     : FPT
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="idc" value="${requestScope.idc}"/>
        <form id="f2" action="home" method="get">
            <c:if test="${(!empty userOr) && (!empty user) &&(userOr.getOrganizationStatus()=='active')}" >
                <c:if test="${changerole == '0'}">
                    <input type="hidden" name="change" value="1">

                </c:if>
                <c:if test="${changerole == '1'}">
                    <input type="hidden" name="change" value="0">

                </c:if>
            </c:if>
        </form>
<header>
    <div class="header-area">
        <div class="header-top_area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 col-md-12 col-lg-8">
                        <div class="short_contact_list">
                            <ul>
                                <li><a href="#"> <i class="fa fa-phone"></i>0999999999</a></li>
                                <li><a href="#"> <i class="fa fa-envelope"></i>team4charifit@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-6 col-md-6 col-lg-4">
                        <div class="social_media_links d-none d-lg-block">
                            <a href="#">
                                <!--<i class="fa fa-facebook"></i>-->
                            </a>
                            <a href="#">
                                <!--<i class="fa fa-pinterest-p"></i>-->
                            </a>

                            <c:if test="${(!empty userOr) && (!empty user) &&(userOr.getOrganizationStatus()=='active')}" >
                                <c:if test="${changerole == '0'}">
                                    <a href="#">
                                        <i class="fa-solid fa-rotate-right"></i>
                                    </a>
                                    <button style="border: none">

                                        <input type="checkbox" onchange="changerole()">
                                        <img class="user-avatar" src="${userOr.getImage()}" alt="alt"/>
                                    </button>
                                </c:if>
                                <c:if test="${changerole == '1'}">
                                    <a href="#">
                                        <i class="fa-solid fa-rotate-right"></i>
                                    </a>
                                    <button style="border: none">
                                        <input type="checkbox" onchange="changerole()">
                                        <img class="user-avatar" src="${user.getImage()}" alt="alt"/>
                                    </button>
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="sticky-header" class="main-header-area">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-xl-3 col-lg-3">
                        <div class="logo">
                            <a href="home">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9">
                        <div class="main-menu">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="home">Home</a></li>
                                    <li><a href="About.html">About</a></li>
                                    <li><a href="Blog">Blog <i class="ti-angle-down"></i></a>

                                    </li>
                                    <li><a href="#">Project <i class="ti-angle-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="CampaignUser">Campaign</a></li>
                                            <li><a href="Cause.html">Event</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact">Contact</a></li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-3 d-none d-lg-flex justify-content-end align-items-center">
                    <!-- Ô nhập tìm kiếm cho desktop -->
                    <!--                                    -->

                    <div class="search-bar me-3 position-relative">
                        <div  class="d-flex align-items-center">

                            <input type="text" id="searchinput" name="searchTitle" placeholder="tìm kiếm các chiến dịch"  value="${requestScope.valuesearch}" aria-label="Search" class="form-control me-2" required="Chưa nhập dữ liệu để tìm kiếm">
                            <button type="submit" class="btn btn-search">
                                <i class="fa-solid fa-magnifying-glass"></i> <!-- Biểu tượng tìm kiếm -->
                            </button>
                        </div>
                    </div>


                    <!-- Biểu tượng thông báo và người dùng cho desktop -->
                    <c:if test="${requestScope.user != null}">
                        <div class="user_notification position-relative">
                            <!-- Thông báo -->
                            <a href="#" class="notification-icon me-3" id="notification-toggle">
                                <i class="fa fa-bell"></i> <!-- Biểu tượng thông báo -->
                            </a>
                            <!-- Dropdown thông báo -->
                            <div class="notification-dropdown">
                                <ul>
                                    <!-- Kiểm tra nếu danh sách thông báo trống -->
                                    <c:if test="${notic ==null || notic.isEmpty()}">
                                        <li>Không có thông báo</li>
                                        </c:if>

                                    <!-- Lặp qua danh sách thông báo nếu không trống -->
                                    <c:forEach var="notification" items="${notifications}">
                                        <li>
                                            <a href="notification/${notification.notificationId}">
                                                <span>${notification.message}</span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>

                            </div>

                            <!-- Biểu tượng user -->
                            <c:if test="${changerole == '0'}">
                                <a href="#" class="user-icon" id="user-toggle">
                                    <img src="${requestScope.user.getImage()}" alt="User" class="user-avatar"> <!-- Hình ảnh đại diện -->
                                </a>
                                <!-- Dropdown user -->
                                <div class="user-dropdown">
                                    <ul>
                                        <li><a href="#">User Profile</a></li>
                                        <li><a href="logout">Log Out</a></li>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test="${changerole == '1'}">
                                <a href="#" class="user-icon" id="user-toggle">
                                    <img src="${requestScope.userOr.getImage()}" alt="User" class="user-avatar"> <!-- Hình ảnh đại diện -->
                                </a>
                                <!-- Dropdown user -->
                                <div class="user-dropdown">
                                    <ul>
                                        <li><a href="#">Organization Profile</a></li>
                                        <li><a href="logout">Log Out</a></li>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${requestScope.user == null}">
                        <div></div>
                        <div style="margin-left: 20px; margin-right: 20px;"><h4> <a href="login.jsp">Login</a></h4></div>

                    </c:if>

                    <!--</form>-->
                </div>

                <div class="col-12">
                    <div class="mobile_menu d-block d-lg-none"></div>
                </div>
            </div>
        </div>
    </div>

</header>