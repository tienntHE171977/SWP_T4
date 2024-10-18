<%-- 
    Document   : RegisterProject
    Created on : Oct 18, 2024, 8:36:33 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
        }
        input[type="text"],
        input[type="date"],
        input[type="datetime-local"],
        input[type="file"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
    </head>
    <body>
        <h1>Create a New Project</h1>
    <form action="/submit" method="post">
        <label for="title">Title:</label><br>
        <input type="text" id="title" name="title" maxlength="255" required><br><br>

        <label for="image">Image:</label><br>
        <input type="file" id="image" name="image" accept="image/*"><br><br>

        <label for="description">Description:</label><br>
        <textarea id="description" name="description" rows="4" maxlength="255" required></textarea><br><br>

        <label for="start_date">Start Date:</label><br>
        <input type="date" id="start_date" name="start_date" required><br><br>

        <label for="staff_id">Staff ID:</label><br>
        <input type="text" id="staff_id" name="staff_id" maxlength="6" required><br><br>

        <label for="end_date">End Date:</label><br>
        <input type="date" id="end_date" name="end_date" required><br><br>

        <label for="document">Document:</label><br>
        <input type="file" id="document" name="document" maxlength="255"><br><br>

        <label for="role_project">Role in Project:</label><br>
        <input type="text" id="role_project" name="role_project" maxlength="10" required><br><br>

        <label for="status">Status:</label><br>
        <select id="status" name="status" required>
            <option value="active">Active</option>
            <option value="completed">Completed</option>
            <option value="paused">Paused</option>
        </select><br><br>

        <label for="created_by_org">Created by Organization:</label><br>
        <input type="text" id="created_by_org" name="created_by_org" required><br><br>

        <label for="created_at">Created At:</label><br>
        <input type="datetime-local" id="created_at" name="created_at" required><br><br>

        <input type="submit" value="Submit">
        
        </form>
    </body>
</html>
