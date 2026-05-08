<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.exam.dao.ResultDAO, com.exam.model.Result, java.util.List" %>
<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    String fullName = (String) session.getAttribute("fullName");
    int userId = (Integer) session.getAttribute("userId");
    ResultDAO rdao = new ResultDAO();
    List<Result> myResults = rdao.getResultsByUser(userId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - ExamPortal</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">📝 ExamPortal</div>
    <div class="nav-right">
        <span>👤 <%= fullName %></span>
        <a href="../LogoutServlet" class="btn btn-logout">Logout</a>
    </div>
</nav>

<div class="dashboard-container">
    
    <div class="welcome-banner">
        <h2>Welcome, <%= fullName %>! 👋</h2>
        <p>Ready to test your knowledge today?</p>
    </div>

   <div class="cards-grid">
    <div class="card">
        <div class="card-icon">☕</div>
        <h3>Java</h3>
        <p>10 Questions • 10 Minutes</p>
        <p style="font-size:12px;color:#94a3b8;">
            OOP, JVM, Collections
        </p>
        <a href="../ExamServlet?subject=Java"
           class="btn btn-primary">Start Exam</a>
    </div>
    <div class="card">
        <div class="card-icon">🗄️</div>
        <h3>SQL</h3>
        <p>10 Questions • 10 Minutes</p>
        <p style="font-size:12px;color:#94a3b8;">
            Queries, Joins, Keys
        </p>
        <a href="../ExamServlet?subject=SQL"
           class="btn btn-primary">Start Exam</a>
    </div>
    <div class="card">
        <div class="card-icon">🌐</div>
        <h3>Web Technology</h3>
        <p>10 Questions • 10 Minutes</p>
        <p style="font-size:12px;color:#94a3b8;">
            HTML, CSS, Bootstrap
        </p>
        <a href="../ExamServlet?subject=Web"
           class="btn btn-primary">Start Exam</a>
    </div>
    <div class="card">
        <div class="card-icon">📜</div>
        <h3>JavaScript</h3>
        <p>10 Questions • 10 Minutes</p>
        <p style="font-size:12px;color:#94a3b8;">
            DOM, Events, Functions
        </p>
        <a href="../ExamServlet?subject=JavaScript"
           class="btn btn-primary">Start Exam</a>
    </div>
    <div class="card">
        <div class="card-icon">🏢</div>
        <h3>J2EE</h3>
        <p>10 Questions • 10 Minutes</p>
        <p style="font-size:12px;color:#94a3b8;">
            Servlets, JSP, JDBC
        </p>
        <a href="../ExamServlet?subject=J2EE"
           class="btn btn-primary">Start Exam</a>
    </div>
    <div class="card">
    <div class="card-icon">🌱</div>
    <h3>Spring Core</h3>
    <p>10 Questions • 10 Minutes</p>
    <p style="font-size:12px;color:#94a3b8;">
        IOC, DI, Beans, AOP
    </p>
    <a href="../ExamServlet?subject=Spring Core"
       class="btn btn-primary">Start Exam</a>
</div>
<div class="card">
    <div class="card-icon">🚀</div>
    <h3>Spring Boot</h3>
    <p>10 Questions • 10 Minutes</p>
    <p style="font-size:12px;color:#94a3b8;">
        REST API, Annotations, MVC
    </p>
    <a href="../ExamServlet?subject=Spring Boot"
       class="btn btn-primary">Start Exam</a>
</div>
<div class="card">
    <div class="card-icon">📊</div>
    <h3>Spring Data JPA</h3>
    <p>10 Questions • 10 Minutes</p>
    <p style="font-size:12px;color:#94a3b8;">
        ORM, Entity, Repository
    </p>
    <a href="../ExamServlet?subject=Spring Data JPA"
       class="btn btn-primary">Start Exam</a>
</div>
<div class="card">
    <div class="card-icon">⚛️</div>
    <h3>React Basics</h3>
    <p>10 Questions • 10 Minutes</p>
    <p style="font-size:12px;color:#94a3b8;">
        Components, Hooks, JSX
    </p>
    <a href="../ExamServlet?subject=React"
       class="btn btn-primary">Start Exam</a>
</div>
</div>

    <div class="section-title">📊 My Recent Results</div>

    <% if(myResults.isEmpty()) { %>
        <div class="empty-state">
            No exams taken yet. Start your first exam above! 🚀
        </div>
    <% } else { %>
    <div class="table-container">
        <table class="data-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Subject</th>
                    <th>Score</th>
                    <th>Percentage</th>
                    <th>Status</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <% int i=1; for(Result r : myResults) { %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= r.getSubject() %></td>
                    <td><%= r.getScore() %>/<%= r.getTotalQuestions() %></td>
                    <td><%= String.format("%.1f", r.getPercentage()) %>%</td>
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
    <% } %>

</div>
</body>
</html>