package com.quizportal.dao;
 
import com.quizportal.model.Question;
 
import java.util.List;
 
public interface QuestionDao {
    boolean create(Question question, int adminId);
    List<Question> findAll();
    Question findById(int id);
    int countAll();
}