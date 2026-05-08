package com.exam.servlet;

import com.exam.dao.UserDAO;
import com.exam.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        UserDAO dao = new UserDAO();
        
        if (dao.isUsernameExists(username)) {
            res.sendRedirect("register.jsp?error=exists");
            return;
        }
        
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        
        boolean success = dao.register(user);
        
        if (success) {
            res.sendRedirect("login.jsp?success=registered");
        } else {
            res.sendRedirect("register.jsp?error=failed");
        }
    }
}