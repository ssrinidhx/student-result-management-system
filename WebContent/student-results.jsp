<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String registerNumber = (String) request.getAttribute("registerNumber");
    Connection con = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Results</title>
    <style>
        body {
            font-family: Calibri, sans-serif;
            color: black;
            background-color: white;
            margin: 0;
            padding: 20px;
            font-size: 16px;
        }
        .container {
            width: 80%;
            margin: auto;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header img {
            width: auto;
            height: 100px;
        }
        .logout {
            position: relative;
            top: 10px;
            right: 10px;
        }
        .logout a {
            padding: 10px 20px;
            background: #ff5722;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .logout a:hover {
            background: #e64a19;
        }
        .student-details, .results {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .student-details h2 {
            margin-top: 10px;
        }
        .student-details div {
            margin-bottom: 10px;
        }
        .results th, .results td {
            margin: 10px 0;
        }
        .student-details p span, .results th {
            font-weight: bold;
        }
        .results table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .results th, .results td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        .pass {
            color: green;
            font-weight: bold;
        }
        .fail {
            color: red;
            font-weight: bold;
        }
        .gpa-row {
            text-align: center !important;
            font-size: 18px;
            margin-top: 15px;
        }
        .gpa-row span {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="images/cit-logo.png" alt="Logo">
        <div class="logout">
            <a href="index.jsp" onclick="return confirm('Are you sure you want to logout?')">Logout</a>
        </div>
    </div>

    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DB.DBUtil.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE register_number = ?");
            ps.setString(1, registerNumber);
            ResultSet rs = ps.executeQuery();

            int semester = 0;

            if (rs.next()) {
                semester = rs.getInt("semester");
    %>
    <div class="student-details">
        <h2>Student Details</h2>
        <div><b>Register Number:</b> <%= rs.getString("register_number") %></div>
        <div><b>Student Name:</b> <%= rs.getString("student_name") %></div>
        <div><b>Course:</b> <%= rs.getString("course_name") %></div>
        <div><b>Branch:</b> <%= rs.getString("branch_name") %></div>
        <div><b>Year:</b> <%= rs.getString("year") %></div>
        <div><b>Semester:</b> <%= semester %></div>
    </div>
    <%
            }

            if (semester >= 1 && semester <= 10) {
                String subjectTable = "semester" + semester + "_subjects";
                PreparedStatement psSubjects = con.prepareStatement(
                    "SELECT course_code, subject_name, subject_type, credits FROM " + subjectTable);
                ResultSet rsSubjects = psSubjects.executeQuery();

                List<String[]> subjects = new ArrayList<>();
                List<String> subjectColumnNames = new ArrayList<>();
                Map<String, Integer> creditMap = new HashMap<>();

                while (rsSubjects.next()) {
                    String code = rsSubjects.getString("course_code");
                    String name = rsSubjects.getString("subject_name");
                    String type = rsSubjects.getString("subject_type");
                    int credits = rsSubjects.getInt("credits");

                    subjects.add(new String[]{code, name, type});
                    subjectColumnNames.add(name.replace(" ", "_"));
                    creditMap.put(name.replace(" ", "_"), credits);
                }

                StringBuilder query = new StringBuilder("SELECT ");
                for (int i = 0; i < subjectColumnNames.size(); i++) {
                    query.append("`").append(subjectColumnNames.get(i)).append("`");
                    if (i < subjectColumnNames.size() - 1) query.append(", ");
                }
                query.append(" FROM semester").append(semester).append("_result WHERE register_number = ?");

                PreparedStatement psMarks = con.prepareStatement(query.toString());
                psMarks.setString(1, registerNumber);
                ResultSet rsMarks = psMarks.executeQuery();

                Map<String, Integer> marksMap = new HashMap<>();
                if (rsMarks.next()) {
                    for (String col : subjectColumnNames) {
                        marksMap.put(col, rsMarks.getInt(col));
                    }
                }

                int totalCredits = 0;
                int totalWeightedPoints = 0;
                boolean hasFail = false;
    %>
    <div class="results">
        <h2>Semester <%= semester %> Results</h2>
        <table>
            <tr>
                <th>Course Code</th>
                <th>Course Name</th>
                <th>Course Type</th>
                <th>Grade</th>
                <th>Result</th>
            </tr>
            <%
                for (String[] subject : subjects) {
                    String code = subject[0];
                    String name = subject[1];
                    String type = subject[2];
                    String column = name.replace(" ", "_");

                    Integer mark = marksMap.get(column);
                    String grade = "N/A";
                    String result = "";
                    String resultClass = "";

                    if (mark != null) {
                        if (mark >= 91) grade = "O";
                        else if (mark >= 81) grade = "A+";
                        else if (mark >= 71) grade = "A";
                        else if (mark >= 61) grade = "B+";
                        else if (mark >= 56) grade = "B";
                        else if (mark >= 51) grade = "C";
                        else grade = "U";

                        if (mark >= 51) {
                            result = "P";
                            resultClass = "pass";
                        } else {
                            result = "F";
                            resultClass = "fail";
                            hasFail = true;
                        }

                        int gradePoint = 0;
                        if (mark >= 91) gradePoint = 10;
                        else if (mark >= 81) gradePoint = 9;
                        else if (mark >= 71) gradePoint = 8;
                        else if (mark >= 61) gradePoint = 7;
                        else if (mark >= 56) gradePoint = 6;
                        else if (mark >= 51) gradePoint = 5;

                        int credit = creditMap.getOrDefault(column, 0);
                        totalCredits += credit;
                        totalWeightedPoints += credit * gradePoint;
                    }
            %>
            <tr>
                <td><%= code %></td>
                <td><%= name %></td>
                <td><%= type %></td>
                <td><%= grade %></td>
                <td class="<%= resultClass %>"><%= result %></td>
            </tr>
            <%
                }

                String gpaDisplay = (hasFail || totalCredits == 0) ? "-" :
                    String.format("%.2f", (double) totalWeightedPoints / totalCredits);
                if (!gpaDisplay.equals("-")) {
                    double gpa = (double) totalWeightedPoints / totalCredits;
                    double percentage = gpa * 9.5;

                    // Check if GPA already inserted
                    PreparedStatement psCheck = con.prepareStatement("SELECT * FROM gpa_results WHERE register_number = ? AND semester = ?");
                    psCheck.setString(1, registerNumber);
                    psCheck.setInt(2, semester);
                    ResultSet rsCheck = psCheck.executeQuery();

                    if (!rsCheck.next()) {
                        String insertQuery = "INSERT INTO gpa_results (register_number, student_name, semester, percentage) VALUES (?, ?, ?, ?)";
                        PreparedStatement psInsert = con.prepareStatement(insertQuery);
                        psInsert.setString(1, registerNumber);
                        psInsert.setString(2, rs.getString("student_name"));
                        psInsert.setInt(3, semester);
                        psInsert.setDouble(4, percentage);
                        psInsert.executeUpdate();
                    }
                }
            %>
        </table>
        <div class="gpa-row">
            GPA for the semester => <span><%= gpaDisplay %></span>
        </div>
    </div>
    <%
            } else {
    %>
    <p style="color: red;">Invalid semester information for the student.</p>
    <%
            }
        } catch (Exception e) {
    %>
    <p style="color: red;">Error: <%= e.getMessage() %></p>
    <%
        } finally {
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    %>
</div>
</body>
</html>