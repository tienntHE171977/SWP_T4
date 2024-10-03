<%-- 
    Document   : Page
    Created on : Oct 3, 2024, 10:24:11 PM
    Author     : pc
--%>
<!-- admin.jsp -->

<!DOCTYPE html>
<html>
<head>
    <title>Admin Page</title>
    <link href="https://cdn.tailwindcss.com" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto p-4">
        <h1 class="text-3xl font-bold mb-4">Admin Page</h1>
        <jsp:include page="User_Profile.jsp"></jsp:include>
        <jsp:include page="User_Detail.jsp"></jsp:include>
        <!-- Thêm các trang con khác vào ?ây -->
    </div>
</body>
</html>