package com.quizportal.dao;
 
import com.quizportal.model.QuizResult;
 
import java.util.List;
 
public interface QuizResultDao {
    boolean save(QuizResult result);
    List<QuizResult> findByQuiz(int quizId);
}