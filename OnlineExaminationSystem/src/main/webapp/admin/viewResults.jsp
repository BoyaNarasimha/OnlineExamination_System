<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.exam.dao.ResultDAO,com.exam.model.Result,java.util.List" %>
<%
    if(!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
    ResultDAO dao = new ResultDAO();
    List<Result> results = dao.getAllResults();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Results - ExamPortal</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">📝 ExamPortal Admin</div>
    <div class="nav-right">
        <a href="../LogoutServlet" class="btn btn-logout">Logout</a>
    </div>
</nav>

<div class="admin-layout">
    <aside class="sidebar">
        <ul>
            <li><a href="adminDashboard.jsp">🏠 Dashboard</a></li>
            <li><a href="addQuestion.jsp">➕ Add Question</a></li>
            <li><a href="viewResults.jsp" class="active">📊 View Results</a></li>
            <li><a href="manageStudents.jsp">👥 Students</a></li>
        </ul>
    </aside>

    <main class="admin-main">
        <h2>📊 All Exam Results</h2>
        <p>Total Records: <strong><%= results.size() %></strong></p>

        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Student Name</th>
                        <th>Subject</th>
                        <th>Score</th>
                        <th>Percentage</th>
                        <th>Status</th>
                        <th>Exam Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% int i=1; for(Result r : results) { %>
                    <tr>
                        <td><%= i++ %></td>
                        <td><%= r.getStudentName() %></td>
                        <td><%= r.getSubject() %></td>
                        <td><%= r.getScore() %>/<%= r.getTotalQuestions() %></td>
                        <td><%= String.format("%.1f",r.getPercentage()) %>%</td>
                        <td>
                            <span class="badge <%= r.getPercentage() >= 60 ? 
                                  "badge-pass":"badge-fail" %>">
                                <%= r.getPercentage() >= 60 ? "PASS":"FAIL" %>
                            </span>
                        </td>
                        <td><%= r.getExamDate() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>