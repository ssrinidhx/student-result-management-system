<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .form-box {
            width: 300px;
            margin: 50px auto;
            padding: 20px;
            background: #fff; 
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-box input[type="text"],
        .form-box select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; 
        }
        .form-box input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            background: #28a745;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <form action="AddStudentServlet" method="post">
            <input type="text" name="courseName" placeholder="Course Name" required>
            <input type="text" name="branchName" placeholder="Branch Name" required>
            <input type="text" name="registerNumber" placeholder="Register Number" required>
            <input type="text" name="studentName" placeholder="Student Name" required>
            <select name="year" required>
                <option value="">Select Year</option>
                <option value="1">1st Year</option>
                <option value="2">2nd Year</option>
                <option value="3">3rd Year</option>
                <option value="4">4th Year</option>
                <option value="5">5th Year</option>
            </select>
            <select name="semester" required>
                <option value="">Select Semester</option>
                <option value="1">1st Semester</option>
                <option value="2">2nd Semester</option>
                <option value="3">3rd Semester</option>
                <option value="4">4th Semester</option>
                <option value="5">5th Semester</option>
                <option value="6">6th Semester</option>
                <option value="7">7th Semester</option>
                <option value="8">8th Semester</option>
                <option value="9">9th Semester</option>
                <option value="10">10th Semester</option>
            </select>
            <select name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
            <input type="submit" value="Save">
        </form>
    </div>
</body>
</html>
