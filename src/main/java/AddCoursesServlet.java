import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DB.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddCoursesServlet")
public class AddCoursesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String year = request.getParameter("year");
        String semester = request.getParameter("semester");

        // Get subjects, credits, and course codes
        String[] theorySubjects = request.getParameterValues("theorySubjects");
        String[] theoryCredits = request.getParameterValues("theoryCredits");
        String[] theoryCourseCodes = request.getParameterValues("theoryCourseCodes");

        String[] labSubjects = request.getParameterValues("labSubjects");
        String[] labCredits = request.getParameterValues("labCredits");
        String[] labCourseCodes = request.getParameterValues("labCourseCodes");

        // Check for missing required fields
        if (year == null || semester == null || 
            theorySubjects == null || theoryCredits == null || theoryCourseCodes == null ||
            labSubjects == null || labCredits == null || labCourseCodes == null) {
            response.getWriter().println("Please fill all required fields!");
            return;
        }

        String subjectTable = "semester" + semester + "_subjects";
        String resultTable = "semester" + semester + "_result";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<String> allSubjects = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();

            // Check if subjects already exist for this year
            String checkSql = "SELECT COUNT(*) FROM " + subjectTable + " WHERE year = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setInt(1, Integer.parseInt(year));
            rs = pstmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                response.sendRedirect("course-error.jsp");
                return;
            }
            rs.close();
            pstmt.close();

            // Insert with course_code included
            String insertSql = "INSERT INTO " + subjectTable + " (year, course_code, subject_name, subject_type, credits) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(insertSql);

            // Insert theory subjects
            for (int i = 0; i < theorySubjects.length; i++) {
                String subject = theorySubjects[i].trim();
                String creditStr = theoryCredits[i].trim();
                String code = theoryCourseCodes[i].trim();

                if (!subject.isEmpty() && !creditStr.isEmpty() && !code.isEmpty() && !allSubjects.contains(subject)) {
                    pstmt.setInt(1, Integer.parseInt(year));
                    pstmt.setString(2, code);
                    pstmt.setString(3, subject);
                    pstmt.setString(4, "Theory");
                    pstmt.setInt(5, Integer.parseInt(creditStr));
                    pstmt.executeUpdate();
                    allSubjects.add(subject);
                }
            }

            // Insert lab subjects
            for (int i = 0; i < labSubjects.length; i++) {
                String subject = labSubjects[i].trim();
                String creditStr = labCredits[i].trim();
                String code = labCourseCodes[i].trim();

                if (!subject.isEmpty() && !creditStr.isEmpty() && !code.isEmpty() && !allSubjects.contains(subject)) {
                    pstmt.setInt(1, Integer.parseInt(year));
                    pstmt.setString(2, code);
                    pstmt.setString(3, subject);
                    pstmt.setString(4, "Lab");
                    pstmt.setInt(5, Integer.parseInt(creditStr));
                    pstmt.executeUpdate();
                    allSubjects.add(subject);
                }
            }

            pstmt.close();

            // Create result table dynamically
            StringBuilder createTableQuery = new StringBuilder("CREATE TABLE IF NOT EXISTS " + resultTable + " (");
            createTableQuery.append("register_number VARCHAR(25) PRIMARY KEY");

            for (String subject : allSubjects) {
                String cleanCol = subject.trim().replaceAll("[^a-zA-Z0-9_]", "_");
                createTableQuery.append(", ").append(cleanCol).append(" INT");
            }

            createTableQuery.append(")");

            Statement stmt = conn.createStatement();
            stmt.executeUpdate(createTableQuery.toString());
            stmt.close();

            response.sendRedirect("admin-dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}

