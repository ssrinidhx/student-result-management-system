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
        .confirmation-box h2 {
            font-size: 20px; 
            margin-bottom: 20px;
        }
        .confirmation-box a {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px; 
            border: none;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s; 
            text-align: center;
        }
        .confirm {
            background: #4CAF50;
        }
        .confirm:hover {
            background-color: #45a049; 
        }
        .cancel {
            background: #f44336;
        }
        .cancel:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="confirmation-box">
        <h2>Are you sure you want to logout?</h2>
        <a href="LogoutServlet" class="confirm">Yes</a>
        <a href="admin-dashboard.jsp" class="cancel">Cancel</a>
    </div>
</body>
</html>
