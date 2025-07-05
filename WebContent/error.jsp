<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
        .error-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            background-color: #f8d7da;
            color: #721c24;
        }
        h2 {
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h2>Oops! An error occurred.</h2>
        <p>Incorrect Username or Password</p>
        <a href="admin-login.jsp">Go back to login</a>
    </div>
</body>
</html>
