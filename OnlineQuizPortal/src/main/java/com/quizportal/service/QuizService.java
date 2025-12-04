package com.quizportal.service;
 
import com.quizportal.dao.QuizDao;
import com.quizportal.dao.QuizDaoImpl;
import com.quizportal.model.Question;
import com.quizportal.model.Quiz;
 
import java.util.List;
 
public class QuizService {
 
    private final QuizDao quizDao = new QuizDaoImpl();
 
    public boolean createQuiz(Quiz quiz, List<Integer> questionIds, int adminId) {
        return quizDao.create(quiz, questionIds, adminId);
    }
 
    public List<Quiz> getPublishedQuizzes() {
        return quizDao.findPublished();
    }
 
    public List<Quiz> getAllQuizzes() {
        return quizDao.findAll();
    }
 
    public Quiz findById(int id) {
        return quizDao.findById(id);
    }
 
    public List<Question> getQuestionsForQuiz(int quizId) {
        return quizDao.findQuestionsForQuiz(quizId);
    }
 
    public int countQuizzes() {
        return quizDao.countAll();
    }
}