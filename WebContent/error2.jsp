<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .error-container {
            margin: 50px auto;
            padding: 20px;
            width: 60%;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f8d7da;
            color: #721c24;
        }
        h1 {
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h2>Oops! An error occurred.</h2>
        <p><%= request.getAttribute("errorMessage") %></p>
        <a href="student-login.jsp">Go back to login</a>
    </div>
</body>
</html>
