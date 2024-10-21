<%-- 
    Document   : User_Detail
    Created on : Sep 20, 2024, 8:04:49 AM
    Author     : pc
--%>
<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" rel="stylesheet"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
        <style>
            body {
                background-color: #f8f9fa;
            }
            .profile-card {
                background-color: white;
                border-radius: 10px;
                padding: 20px;
                max-width: 500px;
                margin: 50px auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .profile-header {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }
            .profile-header img {
                border-radius: 50%;
                width: 60px;
                height: 60px;
                margin-right: 15px;
            }
            .profile-header .profile-info {
                flex-grow: 1;
            }
            .profile-header .profile-info h5 {
                margin: 0;
                font-size: 1.25rem;
            }
            .profile-header .profile-info p {
                margin: 0;
                color: #6c757d;
            }
            .profile-header .profile-actions {
                display: flex;
                gap: 10px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                font-weight: 500;
            }
            .form-group input {
                border-radius: 5px;
            }
            .form-group .input-group-text {
                background-color: #e9ecef;
            }
            .form-actions {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .form-actions .btn {
                border-radius: 5px;
            }
            .form-actions .btn-danger {
                background-color: #ff4d4f;
                border-color: #ff4d4f;
            }
        </style>
    </head>
    <body>
        <div class="profile-card">
            <div class="profile-header">
                <img alt="Profile photo of Amélie Laurent" src="https://placehold.co/60x60"/>
                <div class="profile-info">
                    <h5>
                        Amélie Laurent
                        <i class="fas fa-check-circle text-primary">
                        </i>
                    </h5>
                    <p>
                        amelie@untitledui.com
                    </p>
                </div>
                
            </div>
            <form>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label" for="firstName">
                        Name
                    </label>
                    <div class="col-sm-5">
                        <input class="form-control" id="firstName" type="text" value="${user.getFullName()}" readonly/>
                    </div>
                    
                </div>
                <div class="form-group">
                    <label for="emailAddress">
                        Email address
                    </label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-envelope">
                                </i>
                            </span>
                        </div>
                        <input class="form-control" id="emailAddress" type="email" value="${user.getEmail()}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="username">
                        Username
                    </label>
                    <div class="input-group">
                       
                        <input class="form-control" id="username" type="text" value="${user.getUserName()}"/>
                        <div class="input-group-append">
                            <span class="input-group-text">
                                <i class="fas fa-check-circle text-primary">
                                </i>
                            </span>
                        </div>
                    </div>
                </div>
                   
                <div class="form-group">
                    <label for="profilePhoto">
                        Profile photo
                    </label>
                    <div>
                        <img alt="Profile photo of Amélie Laurent" class="img-thumbnail" style="width: 60px; height: 60px;"/>
                    </div>
                </div>
                <div class="form-actions">
                    <div>
                        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/user">
                            Back
                        </a>
                       
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
