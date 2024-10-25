<%-- 
    Document   : staff-contact-view
    Created on : Oct 23, 2024, 12:11:18 AM
    Author     : FPT
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Contact Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Contact Details</h2>
            <c:if test="${not empty sessionScope.message}">
                <div class="alert alert-${sessionScope.messageType == 'error' ? 'danger' : 'success'} alert-dismissible fade show" role="alert">
                    ${sessionScope.message}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <% 
                session.removeAttribute("message");
                session.removeAttribute("messageType");
                %>
            </c:if>

            <c:if test="${not empty contact}">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Subject: ${contact.subject}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">From: ${contact.name} (${contact.email})</h6>
                        <p class="card-text"><strong>Message:</strong> ${contact.message}</p>
                        <p class="card-text"><strong>Status:</strong> ${contact.status}</p>
                        <p class="card-text"><strong>Created at:</strong> ${contact.created_at}</p>
                        <p class="card-text"><strong>Assigned Staff ID:</strong> 
                            <c:choose>
                                <c:when test="${contact.assigned_staff_id != sessionScope.staff.staff_id}">Not assigned</c:when>
                                <c:when test="${contact.assigned_staff_id == sessionScope.staff.staff_id}">Assigned to you</c:when>

                            </c:choose>
                        </p>

                        <c:if test="${contact.assigned_staff_id == sessionScope.staff.staff_id}">
                            <form action="staffcontact" method="post">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="id" value="${contact.contact_id}">
                                <div class="form-group">
                                    <label for="status">Update Status:</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="new" ${contact.status == 'new' ? 'selected' : ''}>New</option>
                                        <option value="in progress" ${contact.status == 'in progress' ? 'selected' : ''}>In Progress</option>
                                        <option value="resolved" ${contact.status == 'resolved' ? 'selected' : ''}>Resolved</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Update Status</button>
                            </form>

                        </c:if>



                        <c:if test="${contact.assigned_staff_id == sessionScope.staff.staff_id}">
                            <form action="staffcontact" method="post" class="mt-3">
                                <input type="hidden" name="action" value="sendReply">
                                <input type="hidden" name="id" value="${contact.contact_id}">
                                <input type="hidden" name="toEmail" value="${contact.email}">
                                <div class="form-group">
                                    <label for="replyMessage">Reply Message:</label>
                                    <textarea class="form-control" id="replyMessage" name="replyMessage" rows="4" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-info">Send Reply</button>
                            </form>
                        </c:if>

                        <a href="staffcontact?action=list" class="btn btn-secondary mt-3">Back to List</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty contact}">
                <p>No contact found with the given ID.</p>
                <a href="staffcontact?action=list" class="btn btn-secondary">Back to List</a>
            </c:if>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        body>
</html>


