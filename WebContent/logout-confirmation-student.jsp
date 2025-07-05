<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout Confirmation</title>
    <style>
        body {
            font-family: Calibri, sans-serif;
            color: black;
            background-color: white;
            margin: 0;
            padding: 0;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .confirmation-box {
            background: white;
            padding: 30px; 
            border-radius: 15px; 
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); 
            text-align: center;
            width: 400px;
            max-width: 90%; 
        }
        .confirmation-box h3 {
            font-size: 20px; 
        }
        .confirmation-box button {
            padding: 12px 25px; 
            margin: 10px; 
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 16px; 
            transition: background-color 0.3s; 
        }
        .confirm {
            background: #4CAF50;
        }
        .cancel {
            background: #f44336;
        }
        .confirm:hover {
            background-color: #45a049; 
        }
        .cancel:hover {
            background-color: #c82333; 
        }
    </style>
</head>
<body>
    <div class="confirmation-box">
        <h3>Are you sure you want to log out?</h3>
        <form action="logout-handler.jsp" method="post">
            <button type="submit" class="confirm" name="action" value="yes">Yes</button>
            <button type="button" class="cancel" onclick="window.history.back();">Cancel</button>
        </form>
    </div>
</body>
</html>
