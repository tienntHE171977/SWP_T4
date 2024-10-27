<%-- 
    Document   : campaign_members
    Created on : Oct 27, 2024, 5:19:48 PM
    Author     : admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Bảng danh sách -->
<div class="campaign-list">
    <h3>Participants List</h3>
    <table class="table">
        <thead>
            <tr>
                <th style="width:25%">Name</th>
                <th style="width:60%">Job</th>
                <th style="width:15%">Participation Date</th>

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
</div>
