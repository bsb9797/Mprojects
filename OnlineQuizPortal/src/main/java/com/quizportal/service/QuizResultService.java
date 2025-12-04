package com.quizportal.service;
 
import com.quizportal.dao.QuizResultDao;
import com.quizportal.dao.QuizResultDaoImpl;
import com.quizportal.model.QuizResult;
 
import java.util.List;
 
public class QuizResultService {
 
    private final QuizResultDao quizResultDao = new QuizResultDaoImpl();
 
    public boolean saveResult(QuizResult result) {
        return quizResultDao.save(result);
    }
 
    public List<QuizResult> getLeaderboard(int quizId) {
        return quizResultDao.findByQuiz(quizId);
    }
}