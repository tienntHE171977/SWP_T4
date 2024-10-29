<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Campaign</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header">
                        <h3>Update Campaign</h3>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/campaign-update" method="POST">
                            <input type="hidden" name="campaignId" value="${campaign.campaignId}">
                            <input type="hidden" name="projectId" value="${campaign.projectId}">
                            
                            <div class="form-group">
                                <label for="locationId">Location ID:</label>
                                <input type="number" class="form-control" id="locationId" name="locationId" 
                                       value="${campaign.locationId}" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="description">Description:</label>
                                <textarea class="form-control" id="description" name="description" 
                                          rows="3" required>${campaign.description}</textarea>
                            </div>
                            
                            <div class="form-group">
                                <label for="job">Job:</label>
                                <input type="text" class="form-control" id="job" name="job" 
                                       value="${campaign.job}" required>
                            </div>
                            
                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" id="isActive" name="isActive" 
                                       ${campaign.active ? 'checked' : ''}>
                                <label class="form-check-label" for="isActive">Active</label>
                            </div>
                            
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary mr-2">Update Campaign</button>
                                <a href="${pageContext.request.contextPath}/project-campaign-manage?projectId=${campaign.projectId}" 
                                   class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>