<%@ page import="java.sql.*" %>
<%@ page import="DB.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
        }
        .form-box {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        input[type="text"], input[type="number"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"], button {
            width: 50%;
            padding: 10px;
            margin-top: 15px;
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
        <%
            String regNumber = request.getParameter("registerNumber");
            Integer semester = null;

            if (regNumber != null && !regNumber.trim().isEmpty()) {
                try (Connection con = DBUtil.getConnection()) {
                    PreparedStatement ps = con.prepareStatement("SELECT semester FROM students WHERE register_number = ?");
                    ps.setString(1, regNumber.trim());
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        semester = rs.getInt("semester");
                    } else {
                        out.println("<p style='color:red;'>No student found with Register Number: " + regNumber + "</p>");
                    }
                    rs.close();
                    ps.close();
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Database error occurred!</p>");
                    e.printStackTrace();
                }
            }

            if (semester == null) {
        %>
            <!-- Step 1: Input Register Number -->
            <form method="get" action="insert-result.jsp">
                <input type="text" name="registerNumber" placeholder="Enter Register Number" required>
                <input type="submit" value="Fetch Subjects">
            </form>
        <%
            } else {
                String tableName = "semester" + semester + "_subjects";
                try (Connection con = DBUtil.getConnection()) {
                    PreparedStatement ps = con.prepareStatement("SELECT id, subject_name FROM " + tableName);
                    ResultSet rs = ps.executeQuery();
        %>
            <!-- Step 2: Show Subject Fields -->
            <form action="InsertResultServlet" method="post">
                <input type="hidden" name="registerNumber" value="<%= regNumber %>">
                <input type="hidden" name="semester" value="<%= semester %>">

                <h3>Results for Register Number: <%= regNumber %> (Semester <%= semester %>)</h3>

                <%
                    while (rs.next()) {
                        int subjectId = rs.getInt("id");
                        String subjectName = rs.getString("subject_name");
                %>
                    <label for="subject_<%= subjectId %>"><%= subjectName %>:</label><br>
                    <input type="number" name="subject_<%= subjectId %>" min="0" max="100"
                        placeholder="Enter marks for <%= subjectName %>" required><br><br>
                <%
                    }
                    rs.close();
                    ps.close();
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error loading subjects for semester " + semester + ".</p>");
                    e.printStackTrace();
                }
                %>

                <input type="submit" value="Save Result">
            </form>
        <%
            }
        %>
    </div>
</body>
</html>
