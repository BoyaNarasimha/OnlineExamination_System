<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    int score = (Integer) session.getAttribute("lastScore");
    int total = (Integer) session.getAttribute("lastTotal");
    double percentage = (Double) session.getAttribute("lastPercentage");
    String subject = (String) session.getAttribute("lastSubject");
    boolean passed = percentage >= 60;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Result - ExamPortal</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">📝 ExamPortal</div>
    <div class="nav-right">
        <a href="../LogoutServlet" class="btn btn-logout">Logout</a>
    </div>
</nav>

<div class="result-container">
    <div class="result-card <%= passed ? "result-pass" : "result-fail" %>">
        
        <div class="result-icon">
            <%= passed ? "🎉" : "😔" %>
        </div>
        
        <h1><%= passed ? "Congratulations!" : "Better Luck Next Time!" %></h1>
        <p class="subject-label"><%= subject %> Examination</p>

        <div class="score-circle">
            <div class="score-number"><%= score %>/<%= total %></div>
            <div class="score-label">Score</div>
        </div>

        <div class="percentage-bar">
            <div class="percentage-fill" 
                 style="width:<%= percentage %>%;
                        background:<%= passed ? "#22c55e" : "#ef4444" %>">
            </div>
        </div>
        <p class="percentage-text">
            <%= String.format("%.1f", percentage) %>% 
            | <%= passed ? "PASSED ✅" : "FAILED ❌" %>
        </p>

        <div class="result-stats">
            <div class="stat">
                <div class="stat-value"><%= score %></div>
                <div class="stat-label">Correct</div>
            </div>
            <div class="stat">
                <div class="stat-value"><%= total - score %></div>
                <div class="stat-label">Wrong</div>
            </div>
            <div class="stat">
                <div class="stat-value"><%= total %></div>
                <div class="stat-label">Total</div>
            </div>
        </div>

        <div class="result-actions">
            <a href="studentDashboard.jsp" class="btn btn-primary">
                Back to Dashboard
            </a>
            <a href="../ExamServlet?subject=<%= subject %>" 
               class="btn btn-secondary">
                Retake Exam
            </a>
        </div>
    </div>
</div>

</body>
</html>