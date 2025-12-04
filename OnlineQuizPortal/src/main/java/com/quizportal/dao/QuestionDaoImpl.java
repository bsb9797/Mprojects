package com.quizportal.dao;
 
import com.quizportal.config.DbConnectionUtil;
import com.quizportal.model.Question;
 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
 
public class QuestionDaoImpl implements QuestionDao {
 
    private static final String INSERT_SQL =
            "INSERT INTO question (question_text, option_1, option_2, option_3, option_4, correct_option, category, created_by) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
 
    private static final String SELECT_ALL =
            "SELECT * FROM question";
 
    private static final String SELECT_BY_ID =
            "SELECT * FROM question WHERE id=?";
 
    private static final String COUNT_SQL =
            "SELECT COUNT(*) FROM question";
 
    @Override
    public boolean create(Question q, int adminId) {
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {
 
            ps.setString(1, q.getQuestionText());
            ps.setString(2, q.getOption1());
            ps.setString(3, q.getOption2());
            ps.setString(4, q.getOption3());
            ps.setString(5, q.getOption4());
            ps.setInt(6, q.getCorrectOption());
            ps.setString(7, q.getCategory());
            ps.setInt(8, adminId);
 
            return ps.executeUpdate() > 0;
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return false;
    }
 
    @Override
    public List<Question> findAll() {
        List<Question> list = new ArrayList<>();
        try (Connection conn = DbConnectionUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(SELECT_ALL)) {
 
            while (rs.next()) list.add(map(rs));
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
 
    @Override
    public Question findById(int id) {
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
 
    private Question map(ResultSet rs) throws SQLException {
        Question q = new Question();
        q.setId(rs.getInt("id"));
        q.setQuestionText(rs.getString("question_text"));
        q.setOption1(rs.getString("option_1"));
        q.setOption2(rs.getString("option_2"));
        q.setOption3(rs.getString("option_3"));
        q.setOption4(rs.getString("option_4"));
        q.setCorrectOption(rs.getInt("correct_option"));
        q.setCategory(rs.getString("category"));
        return q;
    }
}