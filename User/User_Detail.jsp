<%-- 
    Document   : User_Detail
    Created on : Sep 20, 2024, 8:04:49 AM
    Author     : pc
--%>
<%@page import="Model.User"%>
<%@page import="DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserDetail(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>User Detail</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    </head>
    <body class="bg-gray-100 font-sans antialiased">
        <div class="flex-1 p-6">
            <div class="flex justify-between items-center mb-6">
                <div>
                    <h1 class="text-2xl font-semibold">User  Detail</h1>
                    <p class="text-gray-600">View user detail</p>
                </div>
               <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="location.href = '../user'">Back</button>
            </div>

            <div class="bg-white p-4 rounded shadow">
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-xl font-semibold">User  Information</h2>
                </div>
                <table class="w-full text-left">
                    <tbody>
                        <tr>
                            <td class="py-2">Name:</td>
                            <td class="py-2">${user.userName}</td>
                        </tr>
                        <tr>
                            <td class="py-2">Email:</td>
                            <td class="py-2">${user.email}</td>
                        </tr>
                        <tr>
                            <td class="py-2">Role:</td>
                            <td class="py-2">${user.role}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>