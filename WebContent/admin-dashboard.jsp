<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Calibri, sans-serif;
            margin: 0;
            padding: 0;
        }
        .main-background {
		    position: relative;
		    height: 100vh;
		    width: 100%;
		    overflow: hidden;
		}
		.main-background::before {
		    content: "";
		    position: absolute;
		    top: 0;
		    left: 0;
		    height: 100%;
		    width: 100%;
		    background: url('images/cit.jpg') no-repeat center center fixed;
		    background-size: cover;
		    filter: blur(5px); 
		    z-index: -1;
		}
        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            height: 100vh;
            width: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
        }
        .dashboard-content {
            position: relative;
            z-index: 2;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: white;
            text-align: center;
        }
        .dashboard-content h1 {
            font-size: 48px;
            margin-bottom: 20px;
        }
        .dashboard-buttons {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 20px;
        }
        .dashboard-buttons a {
            font-size: 16px;
            color: white;
            background-color: #4CAF50;
            padding: 12px 25px;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .dashboard-buttons a:hover {
            background-color: #45a049;
        }
        nav {
            z-index: 3;
        }
        .navbar-nav .nav-link {
		    color: white !important;
		}
        .option-container {
            display: none;
            padding: 30px;
            border-radius: 8px;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-top: 100px;
            max-width: 95%;
            margin-left: auto;
            margin-right: auto;
        }
        .option-container.active {
            display: block;
        }
        .translucent-line {
            height: 4px;
            background: rgba(255, 255, 255, 0.3);
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top shadow-sm">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <img src="images/Coimbatore_Institute_of_Technology_logo.png" alt="CIT Logo" style="height: 40px; width: auto; margin-right: 10px;">
                <span class="navbar-brand mb-0 h5">Coimbatore Institute of Technology</span>
            </div>
            <div>
                <ul class="navbar-nav flex-row" style="font-family: Calibri, sans-serif; line-height: 1.8;">
               		<li class="nav-item me-3"><a class="nav-link" href="#" onclick="showOption('add-course')">Add Course</a></li>
               		<li class="nav-item me-3"><a class="nav-link" href="#" onclick="showOption('course-details')">Course Details</a></li>
                    <li class="nav-item me-3"><a class="nav-link" href="#" onclick="showOption('add-student')">Add New Student</a></li>
                    <li class="nav-item me-3"><a class="nav-link" href="#" onclick="showOption('insert-result')">Insert New Result</a></li>
                    <li class="nav-item me-3"><a class="nav-link" href="#" onclick="showOption('registered-students')">Registered Students</a></li>
                    <li class="nav-item me-3"><a class="nav-link" href="#" onclick="showOption('all-student-results')">All Student Results</a></li>
                    <li class="nav-item me-3"><a class="nav-link" href="#" onclick="showOption('rank')">Rank</a></li>
                    <li class="nav-item me-3"><a class="nav-link text-danger" href="#" onclick="confirmLogout()">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="main-section" class="main-background">
        <div class="overlay"></div>
        <div class="dashboard-content">
            <h1>Welcome to Admin Dashboard</h1>
        </div>
    </div>
    <div id="add-course" class="option-container">
        <jsp:include page="add-course.jsp" />
    </div>
    <div id="course-details" class="option-container">
        <jsp:include page="course-details.jsp" />
    </div>
    <div id="add-student" class="option-container">
        <jsp:include page="add-student.jsp" />
    </div>
    <div id="insert-result" class="option-container">
        <jsp:include page="insert-result.jsp" />
    </div>
    <div id="registered-students" class="option-container">
        <jsp:include page="registered-students.jsp" />
    </div>
    <div id="all-student-results" class="option-container">
        <jsp:include page="all-student-results.jsp" />
    </div>
    <div id="rank" class="option-container">
        <jsp:include page="rank.jsp" />
    </div>
    <script>
        function showOption(optionId) {
            document.getElementById("main-section").style.display = "none";
            document.querySelectorAll('.option-container').forEach(section => {
                section.classList.remove('active');
            });
            const selectedSection = document.getElementById(optionId);
            if (selectedSection) {
                selectedSection.classList.add('active');
                window.scrollTo(0, 0); 
            }
        }
        function confirmLogout() {
            window.location.href = "logout-confirmation.jsp";
        }
    </script>
</body>
</html>
