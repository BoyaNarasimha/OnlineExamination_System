package com.exam.servlet;

import com.exam.dao.ResultDAO;
import com.exam.model.Question;
import com.exam.model.Result;
import com.exam.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ResultServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect("login.jsp");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        List<Question> questions = (List<Question>) session.getAttribute("questions");
        String subject = (String) session.getAttribute("subject");
        
        int score = 0;
        int total = questions.size();
        
        for (Question q : questions) {
            String answered = req.getParameter("q" + q.getQuestionId());
            if (answered != null && answered.equals(q.getCorrectAnswer())) {
                score++;
            }
        }
        
        double percentage = ((double) score / total) * 100;
        
        Result result = new Result();
        result.setUserId(user.getUserId());
        result.setStudentName(user.getFullName());
        result.setSubject(subject);
        result.setScore(score);
        result.setTotalQuestions(total);
        result.setPercentage(percentage);
        
        ResultDAO dao = new ResultDAO();
        dao.saveResult(result);
        
        session.setAttribute("lastScore", score);
        session.setAttribute("lastTotal", total);
        session.setAttribute("lastPercentage", percentage);
        session.setAttribute("lastSubject", subject);
        
        res.sendRedirect("student/result.jsp");
    }
}