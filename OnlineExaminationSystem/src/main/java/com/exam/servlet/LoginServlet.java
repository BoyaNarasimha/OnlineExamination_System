package com.exam.servlet;

import com.exam.dao.UserDAO;
import com.exam.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        UserDAO dao = new UserDAO();
        User user = dao.login(username, password);
        
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("role", user.getRole());
            
            if (user.getRole().equals("admin")) {
                res.sendRedirect("admin/adminDashboard.jsp");
            } else {
                res.sendRedirect("student/studentDashboard.jsp");
            }
        } else {
            res.sendRedirect("login.jsp?error=invalid");
        }
    }
}