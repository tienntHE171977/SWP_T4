<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Project Event</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3>Update Project Event</h3>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/event-update" method="POST">
                            <input type="hidden" name="eventId" value="${event.eventId}">
                            <input type="hidden" name="projectId" value="${event.projectId}">
                            
                            <div class="form-group">
                                <label>Item Name</label>
                                <input type="text" class="form-control" name="itemName" 
                                       value="${event.itemName}" required>
                            </div>
                            
                            <div class="form-group">
                                <label>Quantity Needed</label>
                                <input type="number" class="form-control" name="quantityNeeded" 
                                       value="${event.quantityNeeded}" required min="1">
                            </div>
                            
                            <div class="form-group">
                                <label>Quantity Provided</label>
                                <input type="number" class="form-control" name="quantityProvided" 
                                       value="${event.quantityProvided}" required min="0">
                            </div>
                            
                            <div class="form-group">
                                <label>Unit</label>
                                <input type="text" class="form-control" name="unit" 
                                       value="${event.unit}" required>
                            </div>
                            
                            <div class="form-group text-center mt-4">
                                <button type="submit" class="btn btn-primary">Update Event</button>
                                <a href="${pageContext.request.contextPath}/project-event-manage?projectId=${event.projectId}" 
                                   class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
