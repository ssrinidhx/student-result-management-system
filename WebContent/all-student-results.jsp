<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="DB.DBUtil" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Students Results</title>
    <style>
        body {
            text-align: center;
            font-family: Calibri, sans-serif;
            background-color: #f9f9f9;
        }

        h2 {
            margin-top: 40px;
        }

        .table-container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
            word-wrap: break-word;
            white-space: normal;
            overflow-wrap: break-word;
            font-size: 16px;
        }

        th {
            background-color: #eaeaea;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .action-btn {
            color: blue;
            text-decoration: underline;
            cursor: pointer;
            margin: 0 5px;
        }

        /* Optional: scroll bar styling for table if needed */
        .table-container::-webkit-scrollbar {
            height: 8px;
        }

        .table-container::-webkit-scrollbar-thumb {
            background-color: #ccc;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<%
    int totalSemesters = 10; // Adjust if you have fewer/more semesters
    Connection con = null;

    try {
        con = DBUtil.getConnection();

        for (int sem = 1; sem <= totalSemesters; sem++) {
            String resultTable = "semester" + sem + "_result";
            String subjectsTable = "semester" + sem + "_subjects";

            // Check if result table exists
            DatabaseMetaData dbm = con.getMetaData();
            ResultSet tables = dbm.getTables(null, null, resultTable, null);
            if (!tables.next()) {
                continue; // Skip if the semester table doesn't exist
            }

            // Get subject columns
            List<String> subjectCols = new ArrayList<>();
            List<String> subjectNames = new ArrayList<>();

            String getSubjectsSql = "SELECT subject_name FROM " + subjectsTable;
            try (PreparedStatement ps = con.prepareStatement(getSubjectsSql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String subject = rs.getString("subject_name");
                    subjectNames.add(subject);
                    subjectCols.add(subject.replaceAll("\\s+", "_").toLowerCase());
                }
            }

            // Now fetch results
            StringBuilder query = new StringBuilder("SELECT r.register_number, s.year");
            for (String col : subjectCols) {
                query.append(", r.").append(col);
            }
            query.append(" FROM ").append(resultTable).append(" r ");
            query.append("JOIN students s ON r.register_number = s.register_number");

            try (PreparedStatement ps = con.prepareStatement(query.toString());
                 ResultSet rs = ps.executeQuery()) {
%>
<div class="table-container">
    <h2>Semester <%= sem %> Results</h2>
    <table>
        <thead>
            <tr>
                <th>Register Number</th>
                <th>Year</th>
                <% for (String subject : subjectNames) { %>
                    <th><%= subject %></th>
                <% } %>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("register_number") %></td>
                <td><%= rs.getString("year") %></td>
                <% for (String col : subjectCols) { %>
                    <td><%= rs.getString(col) %></td>
                <% } %>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<%
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
    <p style="color: red;">An error occurred while fetching results: <%= e.getMessage() %></p>
<%
    } finally {
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
