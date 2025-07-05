<%@ page import="java.sql.*, DB.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Student</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .confirmation-container {
            width: 40%;
            margin: 50px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
        }
        .confirmation-container h2 {
            color: red;
        }
        .confirmation-container form {
            margin-top: 20px;
            padding: 10px;
            background: #f2f2f2;
            border-radius: 5px;
        }
        input[type="submit"] {
            padding: 10px;
            border: none;
            background: #dc3545;
            color: white; 
            border-radius: 5px;
            cursor: pointer;
        }
        .action-btn {
            cursor: pointer;
            color: blue;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <h2>Confirm Deletion</h2>
        <form action="DeleteStudentServlet" method="post">
            <p>Are you sure you want to delete this student?</p>
            <input type="hidden" name="registerNumber" value="<%= request.getParameter("registerNumber") %>">
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>
