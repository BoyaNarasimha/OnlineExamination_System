<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.exam.model.Question, java.util.List" %>
<%
    if(session.getAttribute("user") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
    List<Question> questions = (List<Question>) session.getAttribute("questions");
    String subject = (String) session.getAttribute("subject");
    if(questions == null || questions.isEmpty()) {
        response.sendRedirect("studentDashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Exam - <%= subject %></title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/exam.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">📝 ExamPortal</div>
    <div class="nav-right">
        <div class="timer-box">
            ⏱️ Time Left: <span id="timer">10:00</span>
        </div>
    </div>
</nav>

<div class="exam-container">
    <div class="exam-header">
        <h2>📚 <%= subject %> Examination</h2>
        <p>Total Questions: <%= questions.size() %> | 
           Answer all questions before time runs out!</p>
    </div>

    <form action="../ResultServlet" method="post" id="examForm">
        <% int qNum = 1; for(Question q : questions) { %>
        <div class="question-card" id="qCard<%= qNum %>">
            <div class="question-number">Question <%= qNum %></div>
            <div class="question-text"><%= q.getQuestionText() %></div>
            <div class="options-grid">
                <label class="option-label">
                    <input type="radio" name="q<%= q.getQuestionId() %>" 
                           value="A" required />
                    <span class="option-text">
                        <span class="option-key">A</span> <%= q.getOptionA() %>
                    </span>
                </label>
                <label class="option-label">
                    <input type="radio" name="q<%= q.getQuestionId() %>" 
                           value="B" />
                    <span class="option-text">
                        <span class="option-key">B</span> <%= q.getOptionB() %>
                    </span>
                </label>
                <label class="option-label">
                    <input type="radio" name="q<%= q.getQuestionId() %>" 
                           value="C" />
                    <span class="option-text">
                        <span class="option-key">C</span> <%= q.getOptionC() %>
                    </span>
                </label>
                <label class="option-label">
                    <input type="radio" name="q<%= q.getQuestionId() %>" 
                           value="D" />
                    <span class="option-text">
                        <span class="option-key">D</span> <%= q.getOptionD() %>
                    </span>
                </label>
            </div>
        </div>
        <% qNum++; } %>

        <div class="submit-section">
            <button type="submit" class="btn btn-submit" 
                    onclick="return confirmSubmit()">
                Submit Exam ✅
            </button>
        </div>
    </form>
</div>

<script src="../js/timer.js"></script>
</body>
</html>