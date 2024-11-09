<%-- 
    Document   : ProductDetail
    Created on : Nov 1, 2024, 4:02:35 AM
    Author     : pc
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Detail</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            margin-bottom: 20px;
            font-weight: bold;
        }
        .project-image {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Project Detail</h1>

        <c:if test="${not empty project}">
            <img src="${project.image}" alt="Project Image" class="project-image">
            <p><strong>ID:</strong> ${project.projectId}</p>
            <p><strong>Title:</strong> ${project.title}</p>
            <p><strong>Description:</strong> ${project.description}</p>
            <p><strong>Start Date:</strong> ${project.startDate}</p>
            <p><strong>End Date:</strong> ${project.endDate}</p>
            <p><strong>Document:</strong> <a href="${project.document}" target="_blank">View Document</a></p>
            <p><strong>Status:</strong> ${project.status}</p>
            <p><strong>Created By:</strong> ${project.createdByOrg}</p>
            <p><strong>Created At:</strong> ${project.createdAt}</p>
        </c:if>

        <c:if test="${empty project}">
            <div class="alert alert-danger" role="alert">
                No project found with the specified ID.
            </div>
        </c:if>

        <a href="project" class="btn btn-primary btn-back">Back to Project List</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
