<%@ page import="java.sql.*" %>
<%@ page import="DB.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Semester Course Details</title>
    <style>
        body {
            font-family: Calibri, sans-serif;
            text-align: center;
            background-color: #f9f9f9;
        }
        .semester-container {
            margin: 30px auto;
            width: 80%;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #eee;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f7f7f7;
        }
    </style>
</head>
<body>
    <h1>All Semester Course Details</h1>
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            for (int semester = 1; semester <= 10; semester++) {
                String tableName = "semester" + semester + "_subjects";
                DatabaseMetaData dbm = con.getMetaData();
                rs = dbm.getTables(null, null, tableName, null);
                if (rs.next()) {
    %>
    <div class="semester-container">
        <h2>Semester <%= semester %> Subjects</h2>
        <table>
            <thead>
                <tr>
                    <th>Year</th>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Course Type</th>
                    <th>Credits</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String sql = "SELECT year, course_code, subject_name, subject_type, credits FROM " + tableName + " ORDER BY year";
                    pstmt = con.prepareStatement(sql);
                    ResultSet subjectRs = pstmt.executeQuery();
                    while(subjectRs.next()) {
                %>
                <tr>
                    <td><%= subjectRs.getInt("year") %></td>
                    <td><%= subjectRs.getString("course_code") %></td>
                    <td><%= subjectRs.getString("subject_name") %></td>
                    <td><%= subjectRs.getString("subject_type") %></td>
                    <td><%= subjectRs.getString("credits") %></td>
                </tr>
                <%
                    }
                    subjectRs.close();
                %>
            </tbody>
        </table>
    </div>
    <%
                }
                rs.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
    %>
    <p style="color: red;">Error fetching course details: <%= e.getMessage() %></p>
    <%
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    %>
</body>
</html>
