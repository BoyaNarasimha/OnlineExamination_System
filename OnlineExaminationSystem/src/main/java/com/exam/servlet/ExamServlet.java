package com.exam.servlet;

import com.exam.dao.QuestionDAO;
import com.exam.model.Question;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ExamServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        
        String subject = req.getParameter("subject");
        if (subject == null) subject = "Java";
        
        QuestionDAO dao = new QuestionDAO();
        List<Question> questions = dao.getQuestionsBySubject(subject);
        
        session.setAttribute("questions", questions);
        session.setAttribute("subject", subject);
        
        res.sendRedirect("student/exam.jsp");
    }
}