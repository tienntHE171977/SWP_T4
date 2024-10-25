<%-- 
    Document   : test
    Created on : Sep 24, 2024, 11:53:14 PM
    Author     : admin
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <article class="blog_item">
                                <c:if test="${not empty listP}">
                                    <c:forEach items="${listP}" var="o">
                                        <div class="blog_item_img">
                                            <img class="card-img rounded-0" src="${o.image}" alt="">
                                            <a href="#" class="blog_item_date">
                                                <p>${o.updatedDate}</p>
                                            </a>
                                        </div>

                                        <div class="blog_details">
                                            <a class="d-inline-block" href="single-blog.html">
                                                <h2>${o.title}</h2>
                                            </a>
                                            <p>${o.message}</p>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </article>
        <c:forEach items="${listCC}" var="o">
                    <li>
                        <a href="" class="d-flex">
                            <p>${o.ncategoryName}</p>
                        </a>
                    </li>
                </c:forEach>
    </body>
</html>
