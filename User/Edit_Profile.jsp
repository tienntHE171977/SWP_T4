<%-- 
    Document   : Edit_Profile
    Created on : Oct 3, 2024, 8:11:03 PM
    Author     : pc
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Profile</title>
        <style>
            /* Add some basic styling to make the form look decent */
            body {
                font-family: Arial, sans-serif;
                background-image: linear-gradient(to bottom, #ff69b4, #ffe6cc, #ffffcc, #ccffcc);
                height: 100vh;
                margin: 0;
            }
            form {
                width: 50%;
                margin: 40px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-bottom: 10px;
            }
            input[type="text"], input[type="email"], input[type="tel"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 10px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #3e8e41;
            }
            .back-button {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 10px;
                cursor: pointer;
                margin-left: 10px;
            }

            .back-button:hover {
                background-color: #3e8e41;
            }
        </style>
    </head>
    <body>
        <form action="edit-profile" method="post">
            <h2>Edit Profile</h2>
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" value="${fullName}" maxlength="255">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${email}"maxlength="50">

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" value="${phone}" maxlength="10">

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" value="${address}" maxlength="255">

            <input type="submit" value="Save Changes">
            <a href="User_Profile.jsp">Back</a>
        </form>
    </body>
</html>