package com.exam.dao;

import com.exam.model.Question;
import com.exam.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {
    
    public List<Question> getQuestionsBySubject(String subject) {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT * FROM questions WHERE subject=? ORDER BY RAND() LIMIT 10";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, subject);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt("question_id"));
                q.setSubject(rs.getString("subject"));
                q.setQuestionText(rs.getString("question_text"));
                q.setOptionA(rs.getString("option_a"));
                q.setOptionB(rs.getString("option_b"));
                q.setOptionC(rs.getString("option_c"));
                q.setOptionD(rs.getString("option_d"));
                q.setCorrectAnswer(rs.getString("correct_answer"));
                list.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean addQuestion(Question q) {
        String sql = "INSERT INTO questions(subject,question_text,option_a,option_b,option_c,option_d,correct_answer) VALUES(?,?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, q.getSubject());
            ps.setString(2, q.getQuestionText());
            ps.setString(3, q.getOptionA());
            ps.setString(4, q.getOptionB());
            ps.setString(5, q.getOptionC());
            ps.setString(6, q.getOptionD());
            ps.setString(7, q.getCorrectAnswer());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Question> getAllQuestions() {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT * FROM questions";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Question q = new Question();
                q.setQuestionId(rs.getInt("question_id"));
                q.setSubject(rs.getString("subject"));
                q.setQuestionText(rs.getString("question_text"));
                list.add(q);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean deleteQuestion(int questionId) {
        String sql = "DELETE FROM questions WHERE question_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, questionId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}