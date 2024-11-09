<%-- 
    Document   : campaign_members
    Created on : Oct 27, 2024, 5:19:48 PM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Bảng danh sách -->
<div class="campaign-list">
    <h3>Danh sách thành viên</h3>
    <c:if test="${not empty listM}">
        <table class="table">
            <thead>
                <tr>
                    <th style="width:25%">Tên</th>
                    <th style="width:60%">Công việc</th>
                    <th style="width:15%">Ngày tham gia</th>

                </tr>
            </thead>
            <tbody>

                <c:forEach var="o" items="${listM}">
                    <tr>
                        <td>${o.memberName}</td>
                        <td>${o.memberJob}</td>
                        <td>${o.joinedDate}</td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </c:if>
    <c:if test="${empty listM}">
        <p>Không có thành viên nào.</p>
    </c:if>
</div>
