import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DB.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditStudentServlet")
public class EditStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String registerNumber = request.getParameter("registerNumber"); 
        String courseName = request.getParameter("courseName");
        String branchName = request.getParameter("branchName");
        String studentName = request.getParameter("studentName");
        String gender = request.getParameter("gender");
        String year = request.getParameter("year");  // Retrieve the year from the request
        String semester = request.getParameter("semester");

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE students SET course_name = ?, branch_name = ?, student_name = ?, gender = ?, year = ?, semester = ? WHERE register_number = ?")) {
            statement.setString(1, courseName);
            statement.setString(2, branchName);
            statement.setString(3, studentName);
            statement.setString(4, gender);
            statement.setString(5, year);  // Set the year in the query
            statement.setString(6, semester);
            statement.setString(7, registerNumber);  // Move this to position 6
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin-dashboard.jsp#registered-students");
    }
}
