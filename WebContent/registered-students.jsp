<%@ page import="java.sql.*" %>
<%@ page import="DB.DBUtil"%>

<!DOCTYPE html>
<html>
<head>
    <title>Registered Students</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .table-container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
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
        .edit-btn, .delete-btn {
            cursor: pointer;
            color: blue;
            text-decoration: underline;
        }
        .action-btn {
            cursor: pointer;
            color: blue;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h1>Registered Students</h1>
        <table>
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Branch Name</th>
                    <th>Register Number</th>
                    <th>Student Name</th>
                    <th>Year</th>
                    <th>Semester</th>
                    <th>Gender</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    Connection con = DBUtil.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM students");
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    <td><%= rs.getString(7) %></td>
                    <td><%= rs.getString(8) %></td>
                    <td><%= rs.getString(6) %></td>
                    <td>
                        <a href="edit-student.jsp?registerNumber=<%= rs.getString(4) %>"class="action-btn">Edit</a>
                        <a href="delete-student.jsp?registerNumber=<%= rs.getString(4) %>"class="action-btn">Delete</a>
                    </td>
                </tr>
                <%
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                %>
            </tbody>
        </table>
	</div>        
	<script>
        // JavaScript to handle navigation
        window.addEventListener('load', function() {
            if (window.location.hash === '#registered-students') {
                // Logic to show the registered students section
                document.getElementById('registered-students').scrollIntoView();
            }
        });
    </script>
</body>
</html>