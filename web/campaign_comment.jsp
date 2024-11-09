<%-- 
    Document   : campaign_comment
    Created on : Oct 27, 2024, 4:02:43 PM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${not empty comments}">
    <div class="comment-list">
        <c:forEach items="${comments}" var="comment">
            <div class="single-comment justify-content-between d-flex">
                <div class="user justify-content-between d-flex">
                    <div class="thumb">
                        <img src="img/comment/comment_1.png" alt="User Image">
                    </div>
                    <div class="desc">
                        <p class="comment">${comment.comment}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <h5><a href="#">${comment.userName}</a></h5>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</c:if>
<c:if test="${empty comments}">
    <p>Không có bình luận nào.</p>
</c:if>





