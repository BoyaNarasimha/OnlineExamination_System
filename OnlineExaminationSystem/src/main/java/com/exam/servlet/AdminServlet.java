package com.exam.servlet;

import com.exam.dao.QuestionDAO;
import com.exam.model.Question;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        HttpSession session = req.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            res.sendRedirect("login.jsp");
            return;
        }
        
        String action = req.getParameter("action");
        
        if ("addQuestion".equals(action)) {
            Question q = new Question();
            q.setSubject(req.getParameter("subject"));
            q.setQuestionText(req.getParameter("questionText"));
            q.setOptionA(req.getParameter("optionA"));
            q.setOptionB(req.getParameter("optionB"));
            q.setOptionC(req.getParameter("optionC"));
            q.setOptionD(req.getParameter("optionD"));
            q.setCorrectAnswer(req.getParameter("correctAnswer"));
            
            QuestionDAO dao = new QuestionDAO();
            boolean success = dao.addQuestion(q);
            
            if (success) {
                res.sendRedirect("admin/addQuestion.jsp?success=true");
            } else {
                res.sendRedirect("admin/addQuestion.jsp?error=true");
            }
        }
        
        if ("deleteQuestion".equals(action)) {
            int qId = Integer.parseInt(req.getParameter("questionId"));
            QuestionDAO dao = new QuestionDAO();
            dao.deleteQuestion(qId);
            res.sendRedirect("admin/adminDashboard.jsp");
        }
    }
}