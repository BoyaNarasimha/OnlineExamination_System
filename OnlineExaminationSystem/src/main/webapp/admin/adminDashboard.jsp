<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.exam.dao.*,com.exam.model.*,java.util.List" %>
<%
    if(session.getAttribute("user") == null || 
       !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
    ResultDAO rdao = new ResultDAO();
    UserDAO udao = new UserDAO();
    List<Result> results = rdao.getAllResults();
    List<User> students = udao.getAllStudents();
    QuestionDAO qdao = new QuestionDAO();
    List<Question> questions = qdao.getAllQuestions();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - ExamPortal</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">📝 ExamPortal Admin</div>
    <div class="nav-right">
        <span>🔑 Admin</span>
        <a href="../LogoutServlet" class="btn btn-logout">Logout</a>
    </div>
</nav>

<div class="admin-layout">
    
    <aside class="sidebar">
        <ul>
            <li><a href="adminDashboard.jsp" class="active">🏠 Dashboard</a></li>
            <li><a href="addQuestion.jsp">➕ Add Question</a></li>
            <li><a href="viewResults.jsp">📊 View Results</a></li>
            <li><a href="manageStudents.jsp">👥 Students</a></li>
        </ul>
    </aside>

    <main class="admin-main">
        
        <h2>Dashboard Overview</h2>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <div class="stat-info">
                    <div class="stat-number"><%= students.size() %></div>
                    <div class="stat-title">Total Students</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">📊</div>
                <div class="stat-info">
                    <div class="stat-number"><%= results.size() %></div>
                    <div class="stat-title">Exams Taken</div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">❓</div>
                <div class="stat-info">
                    <div class="stat-number"><%= questions.size() %></div>
                    <div class="stat-title">Questions</div>
                </div>
            </div>
        </div>

        <div class="section-title">📋 Recent Exam Results</div>
        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Student</th>
                        <th>Subject</th>
                        <th>Score</th>
                        <th>Percentage</th>
                        <th>Status</th>
                        <th>Date</th>
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
                                  "badge-pass" : "badge-fail" %>">
                                <%= r.getPercentage() >= 60 ? "PASS" : "FAIL" %>
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