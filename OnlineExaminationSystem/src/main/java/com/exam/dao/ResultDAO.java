package com.exam.dao;

import com.exam.model.Result;
import com.exam.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResultDAO {
    
    public boolean saveResult(Result result) {
        String sql = "INSERT INTO results(user_id,student_name,subject,score,total_questions,percentage) VALUES(?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, result.getUserId());
            ps.setString(2, result.getStudentName());
            ps.setString(3, result.getSubject());
            ps.setInt(4, result.getScore());
            ps.setInt(5, result.getTotalQuestions());
            ps.setDouble(6, result.getPercentage());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Result> getAllResults() {
        List<Result> list = new ArrayList<>();
        String sql = "SELECT * FROM results ORDER BY exam_date DESC";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Result r = new Result();
                r.setResultId(rs.getInt("result_id"));
                r.setStudentName(rs.getString("student_name"));
                r.setSubject(rs.getString("subject"));
                r.setScore(rs.getInt("score"));
                r.setTotalQuestions(rs.getInt("total_questions"));
                r.setPercentage(rs.getDouble("percentage"));
                r.setExamDate(rs.getString("exam_date"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Result> getResultsByUser(int userId) {
        List<Result> list = new ArrayList<>();
        String sql = "SELECT * FROM results WHERE user_id=? ORDER BY exam_date DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setResultId(rs.getInt("result_id"));
                r.setSubject(rs.getString("subject"));
                r.setScore(rs.getInt("score"));
                r.setTotalQuestions(rs.getInt("total_questions"));
                r.setPercentage(rs.getDouble("percentage"));
                r.setExamDate(rs.getString("exam_date"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}