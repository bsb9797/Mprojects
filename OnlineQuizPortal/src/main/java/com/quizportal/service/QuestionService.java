package com.quizportal.service;
 
import com.quizportal.dao.QuestionDao;
import com.quizportal.dao.QuestionDaoImpl;
import com.quizportal.model.Question;
 
import java.util.List;
 
public class QuestionService {
 
    private final QuestionDao questionDao = new QuestionDaoImpl();
 
    public boolean createQuestion(Question question, int adminId) {
        return questionDao.create(question, adminId);
    }
 
    public List<Question> findAll() {
        return questionDao.findAll();
    }
 
    public Question findById(int id) {
        return questionDao.findById(id);
    }
 
    public int countQuestions() {
        return questionDao.countAll();
    }
}