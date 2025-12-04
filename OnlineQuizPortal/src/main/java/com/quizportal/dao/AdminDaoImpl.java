package com.quizportal.dao;
 
import com.quizportal.config.DbConnectionUtil;
import com.quizportal.model.AdminUser;
 
import java.sql.*;
 
public class AdminDaoImpl implements AdminDao {
 
    private static final String SELECT_BY_EMAIL =
            "SELECT id, email, password_hash, full_name FROM admin_user WHERE email=?";
 
    @Override
    public AdminUser findByEmail(String email) {
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_EMAIL)) {
 
            ps.setString(1, email);
 
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    AdminUser admin = new AdminUser();
                    admin.setId(rs.getInt("id"));
                    admin.setEmail(rs.getString("email"));
                    admin.setPasswordHash(rs.getString("password_hash"));
                    admin.setFullName(rs.getString("full_name"));
                    return admin;
                }
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}