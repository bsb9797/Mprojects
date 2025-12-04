package com.quizportal.dao;
 
import com.quizportal.config.DbConnectionUtil;
import com.quizportal.model.Question;
import com.quizportal.model.Quiz;
 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
 
public class QuizDaoImpl implements QuizDao {
 
    private static final String INSERT_QUIZ =
            "INSERT INTO quiz (title, category, is_published, created_by) VALUES (?, ?, ?, ?)";
 
    private static final String INSERT_QUIZ_QUESTION =
            "INSERT INTO quiz_question (quiz_id, question_id) VALUES (?, ?)";
 
    private static final String SELECT_PUBLISHED =
            "SELECT * FROM quiz WHERE is_published = 1";
 
    private static final String SELECT_ALL =
            "SELECT * FROM quiz";
 
    private static final String SELECT_BY_ID =
            "SELECT * FROM quiz WHERE id=?";
 
    private static final String SELECT_QUESTIONS =
            "SELECT q.* FROM question q JOIN quiz_question qq ON q.id = qq.question_id WHERE qq.quiz_id=?";
 
    private static final String COUNT_SQL =
            "SELECT COUNT(*) FROM quiz";
 
    @Override
    public boolean create(Quiz quiz, List<Integer> questionIds, int adminId) {
 
        Connection conn = null;
 
        try {
            conn = DbConnectionUtil.getConnection();
            conn.setAutoCommit(false);
 
            int quizId;
 
            // Insert quiz
            try (PreparedStatement ps = conn.prepareStatement(INSERT_QUIZ, Statement.RETURN_GENERATED_KEYS)) {
 
                ps.setString(1, quiz.getTitle());
                ps.setString(2, quiz.getCategory());
                ps.setBoolean(3, quiz.isPublished());
                ps.setInt(4, adminId);
 
                ps.executeUpdate();
 
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    keys.next();
                    quizId = keys.getInt(1);
                }
            }
 
            // Insert Quiz → Questions mapping
            try (PreparedStatement ps = conn.prepareStatement(INSERT_QUIZ_QUESTION)) {
                for (Integer qid : questionIds) {
                    ps.setInt(1, quizId);
                    ps.setInt(2, qid);
                    ps.addBatch();
                }
                ps.executeBatch();
            }
 
            conn.commit();
            quiz.setId(quizId);
            return true;
 
        } catch (SQLException e) {
            e.printStackTrace();
            if (conn != null) try { conn.rollback(); } catch (SQLException ignored) {}
        } finally {
            if (conn != null) try { conn.setAutoCommit(true); conn.close(); } catch (SQLException ignored) {}
        }
 
        return false;
    }
 
    @Override
    public List<Quiz> findPublished() {
        List<Quiz> list = new ArrayList<>();
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_PUBLISHED);
             ResultSet rs = ps.executeQuery()) {
 
            while (rs.next()) list.add(mapQuiz(rs));
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
 
    @Override
    public List<Quiz> findAll() {
        List<Quiz> list = new ArrayList<>();
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
 
            while (rs.next()) list.add(mapQuiz(rs));
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
 
    @Override
    public Quiz findById(int id) {
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {
 
            ps.setInt(1, id);
 
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapQuiz(rs);
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
 
    @Override
    public List<Question> findQuestionsForQuiz(int quizId) {
        List<Question> list = new ArrayList<>();
 
        try (Connection conn = DbConnectionUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_QUESTIONS)) {
 
            ps.setInt(1, quizId);
 
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(mapQuestion(rs));
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return list;
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
 
    private Quiz mapQuiz(ResultSet rs) throws SQLException {
        Quiz q = new Quiz();
        q.setId(rs.getInt("id"));
        q.setTitle(rs.getString("title"));
        q.setCategory(rs.getString("category"));
        q.setPublished(rs.getBoolean("is_published"));
        return q;
    }
 
    private Question mapQuestion(ResultSet rs) throws SQLException {
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

 