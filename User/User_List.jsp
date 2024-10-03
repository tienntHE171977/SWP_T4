<%-- 
    Document   : User_List
    Created on : Sep 20, 2024, 8:04:09 AM
    Author     : pc
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Manage User</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    </head>
    <body class="bg-gray-100 font-sans antialiased">
        <div class="flex-1 p-6">
            <div class="flex justify-between items-center mb-6">
                <div>
                    <h1 class="text-2xl font-semibold"> User</h1>
                    <p class="text-gray-600">Find all platform customers here</p>
                </div>
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" onclick="location.href = 'index.jsp'">Home Page</button>
            </div>

            <div class="bg-white p-4 rounded shadow">
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-xl font-semibold">All customers</h2>
                    <div class="relative">
                        <input class="bg-gray-100 border rounded px-4 py-2" placeholder="Search" type="text"/>
                        <i class="fas fa-search absolute right-3 top-3 text-gray-500"></i>
                    </div>
                </div>
                <table class="w-full text-left">
                    <thead>
                        <tr>
                            <th class="py-2">Name</th>
                            <th class="py-2">Role</th>
                            <th class="py-2">Email</th>
                            <th class="py-2">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr class="border-t">
                                <td class="py-2 flex items-center">
                                    <div>
                                        <div class="font-semibold">${user.userName}</div>
                                                                         </div>
                                </td>
                                <td class="py-2">
                                    <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2 py-1 rounded">${user.role}</span>
                                </td>
                                <td class="py-2">${user.email}</td>
                                <td class="py-2">
                                    <div class="flex space-x-2">
                                        <button class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Edit</button>
                                        <button class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded" onclick="location.href = 'User/User_Detail.jsp?id=${user.id}'">View</button>
                                        <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">Delete</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>