<%-- 
    Document   : right
    Created on : Sep 20, 2024, 8:26:12 AM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<aside class="single_sidebar_widget search_widget">
    <form action="SearchBlog" method="post">
        <div class="form-group">
            <div class="input-group mb-3">
                <input value="${txtS}" name="txt" type="text" class="form-control" placeholder='Search Keyword'
                       onfocus="this.placeholder = ''"
                       onblur="this.placeholder = 'Search Keyword'">
                <div class="input-group-append">
                    <button class="btn" type="submit"><i class="ti-search"></i></button>
                </div>
            </div>
        </div>
        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                type="submit">Search</button>
    </form>
</aside>

<aside class="single_sidebar_widget post_category_widget">
    <h4 class="widget_title">Category</h4>
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
                <p>All</p>
            </a>
        </li>   
    </ul>
</aside>

<aside class="single_sidebar_widget popular_post_widget">
    <h3 class="widget_title">Recent Post</h3>
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
<!--                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">Tag Clouds</h4>
                            <ul class="list">
                                <li>
                                    <a href="#">project</a>
                                </li>
                                <li>
                                    <a href="#">love</a>
                                </li>
                                <li>
                                    <a href="#">technology</a>
                                </li>
                                <li>
                                    <a href="#">travel</a>
                                </li>
                                <li>
                                    <a href="#">restaurant</a>
                                </li>
                                <li>
                                    <a href="#">life style</a>
                                </li>
                                <li>
                                    <a href="#">design</a>
                                </li>
                                <li>
                                    <a href="#">illustration</a>
                                </li>
                            </ul>
                        </aside>


                        <aside class="single_sidebar_widget instagram_feeds">
                            <h4 class="widget_title">Instagram Feeds</h4>
                            <ul class="instagram_row flex-wrap">
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_5.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_6.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_7.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_8.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_9.png" alt="">
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img class="img-fluid" src="img/post/post_10.png" alt="">
                                    </a>
                                </li>
                            </ul>
                        </aside>-->


<aside class="single_sidebar_widget newsletter_widget">
    <h4 class="widget_title">Newsletter</h4>

    <form action="#">
        <div class="form-group">
            <input type="email" class="form-control" onfocus="this.placeholder = ''"
                   onblur="this.placeholder = 'Enter email'" placeholder='Enter email' required>
        </div>
        <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                type="submit">Subscribe</button>
    </form>
</aside>

