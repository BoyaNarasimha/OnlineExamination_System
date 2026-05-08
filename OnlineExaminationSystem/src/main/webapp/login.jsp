<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExamPortal - Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="
    background-image: 
        linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
        url('images/examportal.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
">

<div class="auth-container">
    <div class="auth-card">
        <div class="auth-header">
            <div class="logo">📝</div>
            <h1>ExamPortal</h1>
            <p>Online Examination System</p>
        </div>

        <% if("invalid".equals(request.getParameter("error"))) { %>
            <div class="alert alert-error"> Invalid username or password!</div>
        <% } %>
        <% if("registered".equals(request.getParameter("success"))) { %>
            <div class="alert alert-success"> Registered successfully! Please login.</div>
        <% } %>
        <% if("true".equals(request.getParameter("logout"))) { %>
            <div class="alert alert-info"> Logged out successfully!</div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" 
                       placeholder="Enter username" required />
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" 
                       placeholder="Enter password" required />
            </div>
            <button type="submit" class="btn btn-primary btn-full">
                Login →
            </button>
        </form>

        <div class="auth-footer">
            <p>New student? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
</div>

</body>
</html>