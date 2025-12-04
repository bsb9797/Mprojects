package com.quizportal.dao;
 
import com.quizportal.config.DbConnectionUtil;
import com.quizportal.model.User;
 
import java.sql.*;
 
public class UserDaoImpl implements UserDao {
 
    private static final String INSERT_SQL =
            "INSERT INTO app_user (email, password_hash, full_name) VALUES (?, ?, ?)";
 
    private static final String SELECT_BY_EMAIL =
            "SELECT id, email, password_hash, full_name FROM app_user WHERE email=?";
 
    private static final String SELECT_BY_ID =
            "SELECT id, email, password_hash, full_name FROM app_user WHERE id=?";
 
    private static final String COUNT_SQL =
            "SELECT COUNT(*) FROM app_user";
 
    @Override
    public User findByEmail(String email) {
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_EMAIL)) {
 
            ps.setString(1, email);
 
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
 
    @Override
    public User findById(int id) {
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {
 
            ps.setInt(1, id);
 
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
 
    @Override
    public boolean create(User user) {
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {
 
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPasswordHash());
            ps.setString(3, user.getFullName());
 
            int rows = ps.executeUpdate();
            if (rows == 0) return false;
 
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    user.setId(keys.getInt(1));
                }
            }
 
            return true;
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return false;
    }
 
    @Override
    public int countAll() {
        try (Connection conn = DbConnectionUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(COUNT_SQL)) {
 
            if (rs.next()) return rs.getInt(1);
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
 
    private User map(ResultSet rs) throws SQLException {
        User u = new User();
        u.setId(rs.getInt("id"));
        u.setEmail(rs.getString("email"));
        u.setPasswordHash(rs.getString("password_hash"));
        u.setFullName(rs.getString("full_name"));
        return u;
    }
}
 