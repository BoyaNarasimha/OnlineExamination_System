<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ExamPortal - Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
 <body class="auth-body" style="
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
            <div class="logo"></div>
            <h1>Create Account</h1>
            <p>Register as a student</p>
        </div>

        <% if("exists".equals(request.getParameter("error"))) { %>
            <div class="alert alert-error"> Username already exists!</div>
        <% } %>
        <% if("failed".equals(request.getParameter("error"))) { %>
            <div class="alert alert-error"> Registration failed. Try again!</div>
        <% } %>

        <form action="RegisterServlet" method="post" 
              onsubmit="return validateForm()">
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="fullName" 
                       id="fullName" placeholder="Enter full name" required />
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" 
                       placeholder="Enter email" required />
            </div>
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" 
                       id="username" placeholder="Choose username" required />
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" 
                       id="password" placeholder="Choose password" required />
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" id="confirmPassword" 
                       placeholder="Confirm password" required />
            </div>
            <button type="submit" class="btn btn-primary btn-full">
                Register →
            </button>
        </form>

        <div class="auth-footer">
            <p>Already have account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</div>

<script src="js/validation.js"></script>
</body>
</html>