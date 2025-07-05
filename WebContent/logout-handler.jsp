<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = request.getParameter("action");

    if ("yes".equals(action)) {
        // Perform logout operations such as invalidating session
        session.invalidate();
        response.sendRedirect("index.jsp");
    } else {
        // Redirect to the previous page if action is not "yes"
        response.sendRedirect("student-results.jsp");
    }
%>
