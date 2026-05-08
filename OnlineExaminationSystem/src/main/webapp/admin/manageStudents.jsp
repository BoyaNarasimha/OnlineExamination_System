<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.exam.dao.UserDAO,com.exam.model.User,java.util.List" %>
<%
    if(!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("../login.jsp");
        return;
    }
    UserDAO dao = new UserDAO();
    List<User> students = dao.getAllStudents();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Students - ExamPortal</title>
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
            <li><a href="viewResults.jsp">📊 View Results</a></li>
            <li><a href="manageStudents.jsp" class="active">👥 Students</a></li>
        </ul>
    </aside>

    <main class="admin-main">
        <h2>👥 Registered Students</h2>
        <p>Total Students: <strong><%= students.size() %></strong></p>

        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Username</th>
                    </tr>
                </thead>
                <tbody>
                    <% int i=1; for(User u : students) { %>
                    <tr>
                        <td><%= i++ %></td>
                        <td><%= u.getUserId() %></td>
                        <td><%= u.getFullName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getUsername() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>
</div>
</body>
</html>