<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    if(session.getAttribute("role") == null || 
       !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Question - ExamPortal</title>
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
    <li><a href="adminDashboard.jsp" >🏠 Dashboard</a></li>
    <li><a href="addQuestion.jsp" class="active">➕ Add Question</a></li>
    <li><a href="viewResults.jsp">📊 View Results</a></li>
    <li><a href="manageStudents.jsp">👥 Students</a></li>
</ul>
    </aside>

    <main class="admin-main">
        <h2>➕ Add New Question</h2>

        <% if("true".equals(request.getParameter("success"))) { %>
            <div class="alert alert-success">✅ Question added successfully!</div>
        <% } %>
        <% if("true".equals(request.getParameter("error"))) { %>
            <div class="alert alert-error">❌ Failed to add question!</div>
        <% } %>

        <div class="form-card">
            <form action="../AdminServlet" method="post">
                <input type="hidden" name="action" value="addQuestion" />
                
                <div class="form-group">
                    <label>Subject</label>
                    <select name="subject" required>
    <option value="">-- Select Subject --</option>
    <option value="Java">Java</option>
    <option value="SQL">SQL</option>
    <option value="Web">Web Technology</option>
    <option value="JavaScript">JavaScript</option>
    <option value="J2EE">J2EE</option>
    <option value="Spring Core">Spring Core</option>
    <option value="Spring Boot">Spring Boot</option>
    <option value="Spring Data JPA">Spring Data JPA</option>
    <option value="React">React Basics</option>
</select>
                </div>
                <div class="form-group">
                    <label>Question</label>
                    <textarea name="questionText" rows="3" 
                              placeholder="Enter question here..." 
                              required></textarea>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Option A</label>
                        <input type="text" name="optionA" 
                               placeholder="Option A" required />
                    </div>
                    <div class="form-group">
                        <label>Option B</label>
                        <input type="text" name="optionB" 
                               placeholder="Option B" required />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Option C</label>
                        <input type="text" name="optionC" 
                               placeholder="Option C" required />
                    </div>
                    <div class="form-group">
                        <label>Option D</label>
                        <input type="text" name="optionD" 
                               placeholder="Option D" required />
                    </div>
                </div>
                <div class="form-group">
                    <label>Correct Answer</label>
                    <select name="correctAnswer" required>
                        <option value="">-- Select Answer --</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">
                    Add Question ➕
                </button>
            </form>
        </div>
    </main>
</div>

</body>
</html>