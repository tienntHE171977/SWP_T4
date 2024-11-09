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
            <h2>Liên hệ chi tiết</h2>
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
                        <h5 class="card-title">Chủ đề: ${contact.subject}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Từ: ${contact.name} (${contact.email})</h6>
                        <p class="card-text"><strong>Nội dung:</strong> ${contact.message}</p>
                        <p class="card-text"><strong>Trạng thái:</strong> ${contact.status}</p>
                        <p class="card-text"><strong>Tạo ngày:</strong> ${contact.created_at}</p>
                        <p class="card-text"><strong>ID người trả lời:</strong> 
                            <c:choose>
                                <c:when test="${contact.assigned_staff_id != sessionScope.staff.staff_id}">Không nhận</c:when>
                                <c:when test="${contact.assigned_staff_id == sessionScope.staff.staff_id}">Nhận</c:when>

                            </c:choose>
                        </p>

                        <c:if test="${contact.assigned_staff_id == sessionScope.staff.staff_id}">
                            <form action="staffcontact" method="post">
                                <input type="hidden" name="action" value="updateStatus">
                                <input type="hidden" name="id" value="${contact.contact_id}">
                                <div class="form-group">
                                    <label for="status">Thay đổi trạng thái:</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="new" ${contact.status == 'new' ? 'selected' : ''}>Mới</option>
                                        <option value="in progress" ${contact.status == 'in progress' ? 'selected' : ''}>Đang chờ</option>
                                        <option value="resolved" ${contact.status == 'resolved' ? 'selected' : ''}>Từ chối</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Thay dổi</button>
                            </form>

                        </c:if>



                        <c:if test="${contact.assigned_staff_id == sessionScope.staff.staff_id}">
                            <form action="staffcontact" method="post" class="mt-3">
                                <input type="hidden" name="action" value="sendReply">
                                <input type="hidden" name="id" value="${contact.contact_id}">
                                <input type="hidden" name="toEmail" value="${contact.email}">
                                <div class="form-group">
                                    <label for="replyMessage">Nội dung:</label>
                                    <textarea class="form-control" id="replyMessage" name="replyMessage" rows="4" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-info">Gửi</button>
                            </form>
                        </c:if>

                        <a href="staffcontact?action=list" class="btn btn-secondary mt-3">quay lại bảng điều khiển</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty contact}">
                <p>Không tìm thấy liên hệ nào có ID đã cho.</p>
                <a href="staffcontact?action=list" class="btn btn-secondary">quay lại bảng điều khiển</a>
            </c:if>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        body>
</html>


