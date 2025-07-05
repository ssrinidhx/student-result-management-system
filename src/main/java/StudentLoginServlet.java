import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import DB.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String registerNumber = request.getParameter("registerNumber");

        if (registerNumber == null || registerNumber.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter your Register Number.");
            request.getRequestDispatcher("error2.jsp").forward(request, response);
            return;
        }

        try {
            Connection conn = DBUtil.getConnection();

            // Step 1: Check if register number exists in 'students' table
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE register_number = ?");
            ps.setString(1, registerNumber);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                request.setAttribute("errorMessage", "Register number not found in student records.");
                request.getRequestDispatcher("error2.jsp").forward(request, response);
                return;
            }

            // Step 2: Check each semester result table
            boolean resultFound = false;
            Statement stmt = conn.createStatement();

            for (int i = 1; i <= 10; i++) {
                String tableName = "semester" + i + "_result";
                String sql = "SELECT * FROM " + tableName + " WHERE register_number = '" + registerNumber + "'";

                try (ResultSet resultSet = stmt.executeQuery(sql)) {
                    if (resultSet.next()) {
                        resultFound = true;
                        break;
                    }
                } catch (Exception e) {
                    // Skip if table doesn't exist or has issues
                    continue;
                }
            }

            if (!resultFound) {
                request.setAttribute("errorMessage", "No results found for this student.");
                request.getRequestDispatcher("error2.jsp").forward(request, response);
                return;
            }

            // Step 3: Login success — forward to results page
            request.setAttribute("registerNumber", registerNumber);
            request.getRequestDispatcher("student-results.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("error2.jsp").forward(request, response);
        }
    }
}
