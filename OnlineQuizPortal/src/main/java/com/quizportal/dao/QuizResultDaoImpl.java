package com.quizportal.dao;
 
import com.quizportal.config.DbConnectionUtil;
import com.quizportal.model.QuizResult;
 
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
 
public class QuizResultDaoImpl implements QuizResultDao {
 
    private static final String INSERT_SQL =
            "INSERT INTO user_quiz_result (user_id, quiz_id, score, total_questions) VALUES (?, ?, ?, ?)";
 
    private static final String SELECT_BY_QUIZ =
            "SELECT * FROM user_quiz_result WHERE quiz_id=? ORDER BY score DESC";
 
    @Override
    public boolean save(QuizResult r) {
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {
 
            ps.setInt(1, r.getUserId());
            ps.setInt(2, r.getQuizId());
            ps.setInt(3, r.getScore());
            ps.setInt(4, r.getTotalQuestions());
 
            int rows = ps.executeUpdate();
            if (rows == 0) return false;
 
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) r.setId(keys.getInt(1));
            }
 
            return true;
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return false;
    }
 
    @Override
    public List<QuizResult> findByQuiz(int quizId) {
        List<QuizResult> list = new ArrayList<>();
 
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_QUIZ)) {
 
            ps.setInt(1, quizId);
 
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    QuizResult r = new QuizResult();
                    r.setId(rs.getInt("id"));
                    r.setUserId(rs.getInt("user_id"));
                    r.setQuizId(rs.getInt("quiz_id"));
                    r.setScore(rs.getInt("score"));
                    r.setTotalQuestions(rs.getInt("total_questions"));
 
                    Timestamp t = rs.getTimestamp("attempted_at");
                    if (t != null) r.setAttemptedAt(t.toLocalDateTime());
 
                    list.add(r);
                }
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return list;
    }
}
 