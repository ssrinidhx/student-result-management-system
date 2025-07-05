<%@ page import="java.sql.*, DB.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Topper of Each Semester</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .table-container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h1>Topper of Each Semester</h1>
		<table>
		    <thead>
		        <tr>
		            <th>Register Number</th>
		            <th>Semester</th>
		            <th>Name</th>
		            <th>Percentage</th>
		        </tr>
		    </thead>
		    <tbody>
		        <%
		        try {
		            Connection con = DBUtil.getConnection();
		            String query = "WITH Topper_CTE AS (" +
		                           "    SELECT semester, MAX(percentage) AS max_percentage " +
		                           "    FROM gpa_results " +
		                           "    GROUP BY semester" +
		                           ") " +
		                           "SELECT g.register_number, g.semester, g.student_name, g.percentage " +
		                           "FROM gpa_results g " +
		                           "JOIN Topper_CTE t ON g.semester = t.semester AND g.percentage = t.max_percentage " +
		                           "ORDER BY g.semester";
		
		            PreparedStatement ps = con.prepareStatement(query);
		            ResultSet rs = ps.executeQuery();
		
		            while (rs.next()) {
		        %>
		        <tr>
		            <td><%= rs.getString("register_number") %></td>
		            <td><%= rs.getInt("semester") %></td>
		            <td><%= rs.getString("student_name") %></td>
		            <td><%= String.format("%.2f", rs.getDouble("percentage")) %></td>
		        </tr>
		        <%
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        %>
		    </tbody>
		</table>
    </div>
</body>
</html>
