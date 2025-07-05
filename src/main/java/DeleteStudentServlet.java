import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DB.DBUtil; // Import your DBUtil class for database connection

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String registerNumber = request.getParameter("registerNumber");
        
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = DBUtil.getConnection(); 
            String sql = "DELETE FROM students WHERE register_number = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, registerNumber);
            
            int rowsDeleted = ps.executeUpdate();
            
            if (rowsDeleted > 0) {
                response.sendRedirect("admin-dashboard.jsp#registered-students");
            } else {
                response.getWriter().println("Failed to delete student.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
