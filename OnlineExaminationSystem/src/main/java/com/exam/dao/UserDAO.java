package com.exam.dao;

import com.exam.model.User;
import com.exam.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    
	public int getLastInsertedUserId() {
	    String sql = "SELECT MAX(user_id) FROM users";
	    try (Connection con = DBConnection.getConnection();
	         Statement st = con.createStatement();
	         ResultSet rs = st.executeQuery(sql)) {
	        if (rs.next()) return rs.getInt(1);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return -1;
	}
    public User login(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setUsername(rs.getString("username"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean register(User user) {
        String sql = "INSERT INTO users(full_name,email,username,password,role) VALUES(?,?,?,?,'student')";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getUsername());
            ps.setString(4, user.getPassword());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean isUsernameExists(String username) {
        String sql = "SELECT * FROM users WHERE username=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<User> getAllStudents() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role='student'";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                User u = new User();
                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}