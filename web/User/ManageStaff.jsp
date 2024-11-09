<%-- 
    Document   : ManageStaff
    Created on : Oct 29, 2024, 10:25:27 AM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Charifit</title>
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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
                <script>
                    // Hàm xử lý tìm kiếm
                    function handleSearch() {
                        var query = document.getElementById("searchInput").value;
                        if (query) {
                            console.log("Searching for:", query);
                            // Thực hiện tìm kiếm hoặc điều hướng
                            // Ví dụ: window.location.href = "/search?query=" + query;
                        } else {
                            alert("Please enter a search query");
                        }
                    }

                    // Xử lý khi nhấn vào nút search
                    document.getElementById("searchButton").addEventListener("click", handleSearch);

                    // Xử lý khi nhấn phím Enter
                    document.getElementById("searchInput").addEventListener("keydown", function (event) {
                        if (event.key === "Enter") {
                            handleSearch();
                        }
                    });
                </script>
                <table class="w-full text-left">
                    <thead>
                        <tr>
                            <th class="py-2">Name</th>
                            <th class="py-2">Approval Date</th>
                            <th class="py-2">Address</th>
                            <th class="py-2">Phone</th>
                            <th class="py-2">Email</th>
                            <th class="py-2">Role</th>
                            <th class="py-2">Actions</th>

                        </tr>
                    </thead>
                    <tbody>

                        <tr class="border-t">
                            <c:forEach var="item" items="${staffUserList}">
                                <td class="py-2 flex items-center">
                                    <div>
                                        <div class="font-semibold">${item.fullname}</div>
                                    </div>
                                </td>

                                <td class="py-2">${item.approvalDate}</td>
                                <td class="py-2">${item.address}</td>
                                <td class="py-2">${item.phone}</td>
                                <td class="py-2">${item.email}</td>
                                <td class="py-2">
                                    <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2 py-1 rounded">${item.role}</span>
                                </td>
                               
                                <td class="py-2">
                                    <div class="flex space-x-2">

<!--                                        <button class="bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 rounded" onclick="location.href = 'userDetail?id=${user.id}'">View</button>-->

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
