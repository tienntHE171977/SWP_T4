<%-- 
    Document   : contactList
    Created on : Oct 4, 2024, 5:48:55 AM
    Author     : FPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 30px;
            margin-top: 50px;
        }
        h1 {
            color: #007bff;
            margin-bottom: 30px;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .badge {
            font-size: 0.9em;
        }
        .btn-action {
            margin-right: 5px;
        }
        .pagination {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center"><i class="fas fa-envelope"></i> Contact Management</h1>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Status</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="contact" items="${contacts}">
                        <tr>
                            <td>${contact.contact_id}</td>
                            <td>${contact.name}</td>
                            <td>${contact.email}</td>
                            <td>${contact.subject}</td>
                            <td>
                                <span class="badge badge-${contact.status == 'new' ? 'warning' : contact.status == 'in progress' ? 'info' : 'success'}">
                                    ${contact.status}
                                </span>
                            </td>
                            <td>formatDate value="${contact.created_at}" pattern="yyyy-MM-dd HH:mm"/></td>
                            <td>
                                <a href="contact?action=view&id=${contact.contact_id}" class="btn btn-sm btn-primary btn-action"><i class="fas fa-eye"></i> View</a>
                                <button class="btn btn-sm btn-danger btn-action" onclick="deleteContact(${contact.contact_id})"><i class="fas fa-trash"></i> Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty contacts}">
            <p class="text-center">No contacts found.</p>
        </c:if>

        <!-- Pagination -->
        <c:if test="${totalPages > 1}">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="contact?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        function deleteContact(id) {
            if (confirm('Are you sure you want to delete this contact?')) {
                $.ajax({
                    url: 'contact?action=delete&id=' + id,
                    type: 'POST',
                    success: function(result) {
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        alert('An error occurred while deleting the contact.');
                    }
                });
            }
        }
    </script>
</body>
</html>


