package com.quizportal.dao;
 
import com.quizportal.model.Question;
import com.quizportal.model.Quiz;
 
import java.util.List;
 
public interface QuizDao {
    boolean create(Quiz quiz, List<Integer> questionIds, int adminId);
    List<Quiz> findPublished();
    List<Quiz> findAll();
    Quiz findById(int id);
    List<Question> findQuestionsForQuiz(int quizId);
    int countAll();
}