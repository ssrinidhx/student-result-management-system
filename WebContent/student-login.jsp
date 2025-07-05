<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <style>
        body {
            background-image: url('images/cit1.jpg');
            background-size: cover;
            text-align: center;
            color: white;
            font-family: Arial, sans-serif;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: inherit;
            background-size: inherit;
            filter: blur(8px);
            z-index: -1;
        }
        .login-box {
            position: relative;
            width: 400px; /* Increased width */
            margin: 100px auto;
            padding: 30px; /* Increased padding */
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }
        .login-box img {
            width: 100px;
            display: block;
            margin: 0 auto 20px;
        }
        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        .login-box input[type="password"] {
            margin-bottom: 20px;
        }
        .login-box input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            background: #ff5722;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <img src="images/Coimbatore_Institute_of_Technology_logo.png" alt="Admin">
        <form action="StudentLoginServlet" method="post">
            <input type="text" id="registerNumber" name="registerNumber" placeholder="Register Number" required>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
