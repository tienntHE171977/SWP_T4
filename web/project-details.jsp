<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="comments-area">
    <h4> Comments</h4>
    <c:forEach items="" var="o">
        <div class="comment-list">
            <div class="single-comment justify-content-between d-flex">
                <div class="user justify-content-between d-flex">
                    <div class="thumb">
                        <img src="img/comment/comment_1.png" alt="">
                    </div>
                    <div class="desc">
                        <p class="comment">
                            comment
                        </p>
                        <div class="d-flex justify-content-between">
                            <div class="d-flex align-items-center">
                                <h5>
                                    <a href="#"> name</a>
                                </h5>
                                <!--                                                    <p class="date">December 4, 2017 at 3:12 pm </p>-->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <div class="comment-form">
        <h4>Leave a Reply</h4>
        <form class="form-contact comment_form" action="AddCommentBlog" method="post" id="commentForm">
            <div class="row">
                <div class="col-12">
                    <div class="form-group">
                        <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="9" placeholder="Write Comment" required></textarea>
                    </div>
                </div>
            </div>

            <input type="hidden" name="news_id" value=" ">

            <div class="form-group">
                <button type="submit" class="button button-contactForm btn_1 boxed-btn">Send Message</button>
            </div>
        </form>
    </div>
</div>
