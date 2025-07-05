import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DB.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/InsertResultServlet")
public class InsertResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String registerNumber = request.getParameter("registerNumber");
        int semester = Integer.parseInt(request.getParameter("semester"));

        String subjectsTable = "semester" + semester + "_subjects";
        String resultsTable = "semester" + semester + "_result";

        try (Connection con = DBUtil.getConnection()) {

            // ✅ 1. Check if student exists
            String checkStudentSql = "SELECT COUNT(*) FROM students WHERE register_number = ?";
            try (PreparedStatement ps = con.prepareStatement(checkStudentSql)) {
                ps.setString(1, registerNumber);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next() && rs.getInt(1) == 0) {
                        request.setAttribute("errorMessage", "No student found with Register Number: " + registerNumber);
                        request.getRequestDispatcher("error1.jsp").forward(request, response);
                        return;
                    }
                }
            }

            // ✅ 2. Check if result already exists
            String checkResultSql = "SELECT COUNT(*) FROM " + resultsTable + " WHERE register_number = ?";
            try (PreparedStatement ps = con.prepareStatement(checkResultSql)) {
                ps.setString(1, registerNumber);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        request.setAttribute("errorMessage", "Results already exist for this Register Number in semester " + semester);
                        request.getRequestDispatcher("error1.jsp").forward(request, response);
                        return;
                    }
                }
            }

            // ✅ 3. Get subject IDs and column names from semesterX_subjects
            List<Integer> subjectIds = new ArrayList<>();
            List<String> subjectColumns = new ArrayList<>();

            String getSubjectsSql = "SELECT id, subject_name FROM " + subjectsTable;
            try (PreparedStatement ps = con.prepareStatement(getSubjectsSql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int subjectId = rs.getInt("id");
                    String subjectName = rs.getString("subject_name");
                    subjectIds.add(subjectId);
                    subjectColumns.add(subjectName.replaceAll("\\s+", "_").toLowerCase()); // Column names in DB
                }
            }

            // ✅ 4. Build insert query
            StringBuilder columns = new StringBuilder("register_number");
            StringBuilder placeholders = new StringBuilder("?");
            for (String col : subjectColumns) {
                columns.append(", ").append(col);
                placeholders.append(", ?");
            }

            String insertSql = "INSERT INTO " + resultsTable + " (" + columns + ") VALUES (" + placeholders + ")";

            // ✅ 5. Insert data
            try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                ps.setString(1, registerNumber);

                int index = 2;
                for (Integer subjectId : subjectIds) {
                    String paramName = "subject_" + subjectId;
                    String marksStr = request.getParameter(paramName);

                    int marks = 0;
                    try {
                        marks = Integer.parseInt(marksStr);
                    } catch (Exception e) {
                        marks = 0; // If marks are empty or invalid
                    }

                    System.out.println("Inserting marks for " + paramName + ": " + marks); // Debugging line
                    ps.setInt(index++, marks);
                }

                ps.executeUpdate();
            }

            // ✅ 6. Redirect to dashboard
            response.sendRedirect("admin-dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error saving results: " + e.getMessage());
            request.getRequestDispatcher("error1.jsp").forward(request, response);
        }
    }
}
