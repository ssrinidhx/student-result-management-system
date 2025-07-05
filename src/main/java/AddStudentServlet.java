import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseName = request.getParameter("courseName");
        String branchName = request.getParameter("branchName");
        String registerNumber = request.getParameter("registerNumber");
        String studentName = request.getParameter("studentName");
        String gender = request.getParameter("gender");
        String year = request.getParameter("year"); 
        String semester = request.getParameter("semester"); 
        try (Connection connection = DBUtil.getConnection()) {
            String checkSql = "SELECT COUNT(*) FROM students WHERE register_number = ?";
            PreparedStatement checkStatement = connection.prepareStatement(checkSql);
            checkStatement.setString(1, registerNumber);
            ResultSet resultSet = checkStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);
            if (count > 0) {
                request.setAttribute("errorMessage", "A student with the given register number already exists.");
                request.getRequestDispatcher("error1.jsp").forward(request, response);
                return;
            }
            String sql = "INSERT INTO students (course_name, branch_name, register_number, student_name, gender, year, semester) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, courseName);
            statement.setString(2, branchName);
            statement.setString(3, registerNumber);
            statement.setString(4, studentName);
            statement.setString(5, gender);
            statement.setString(6, year);
            statement.setString(7, semester);
            statement.executeUpdate();
            response.sendRedirect("admin-dashboard.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
