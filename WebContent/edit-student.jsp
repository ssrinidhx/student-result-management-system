<%@ page import="java.sql.*, DB.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .form-container {
            width: 40%;
            margin: 50px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.35);
        }
        form {
            margin-top: 20px;
            padding: 10px;
            background: #ffffff;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.35);
        }
        input[type="text"], select {
            width: 90%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 40%;
            padding: 10px;
            border: none;
            background: #28a745;
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
    <div class="form-container">
        <h1>Edit Student</h1>
        <form action="EditStudentServlet" method="post">
            <%-- Fetch student details from database based on registerNumber --%>
            <%
            try {
                String registerNumber = request.getParameter("registerNumber");
                Connection con = DBUtil.getConnection();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE register_number = ?");
                ps.setString(1, registerNumber);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
            %>
            <input type="hidden" name="registerNumber" value="<%= rs.getString("register_number") %>">
            <input type="text" name="courseName" value="<%= rs.getString("course_name") %>" placeholder="Course Name" required>
            <input type="text" name="branchName" value="<%= rs.getString("branch_name") %>" placeholder="Branch Name" required>
            <input type="text" name="studentName" value="<%= rs.getString("student_name") %>" placeholder="Student Name" required>
            <select name="year" required>
                <option value="">Select Year</option>
                <option value="1" <%= rs.getString("year").equals("1") ? "selected" : "" %>>1</option>
                <option value="2" <%= rs.getString("year").equals("2") ? "selected" : "" %>>2</option>
                <option value="3" <%= rs.getString("year").equals("3") ? "selected" : "" %>>3</option>
                <option value="4" <%= rs.getString("year").equals("4") ? "selected" : "" %>>4</option>
                <option value="5" <%= rs.getString("year").equals("5") ? "selected" : "" %>>5</option>
            </select>
            <select name="semester" required>
                <option value="">Select Semester</option>
                <option value="1" <%= rs.getString("semester").equals("1") ? "selected" : "" %>>1</option>
                <option value="2" <%= rs.getString("semester").equals("2") ? "selected" : "" %>>2</option>
                <option value="3" <%= rs.getString("semester").equals("3") ? "selected" : "" %>>3</option>
                <option value="4" <%= rs.getString("semester").equals("4") ? "selected" : "" %>>4</option>
                <option value="5" <%= rs.getString("semester").equals("5") ? "selected" : "" %>>5</option>
                <option value="6" <%= rs.getString("semester").equals("6") ? "selected" : "" %>>6</option>
                <option value="7" <%= rs.getString("semester").equals("7") ? "selected" : "" %>>7</option>
                <option value="8" <%= rs.getString("semester").equals("8") ? "selected" : "" %>>8</option>
                <option value="9" <%= rs.getString("semester").equals("9") ? "selected" : "" %>>9</option>
                <option value="10" <%= rs.getString("semester").equals("10") ? "selected" : "" %>>10</option>
            </select>
            <select name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male" <%= rs.getString("gender").equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= rs.getString("gender").equals("Female") ? "selected" : "" %>>Female</option>
                <option value="Other" <%= rs.getString("gender").equals("Other") ? "selected" : "" %>>Other</option>
            </select>
            <input type="submit" value="Save">
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </form>
    </div>
</body>
</html>
