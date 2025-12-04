package com.quizportal.web.user;
 
import com.quizportal.model.Question;
import com.quizportal.model.QuizResult;
import com.quizportal.model.User;
import com.quizportal.service.QuizResultService;
import com.quizportal.service.QuizService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
 
@WebServlet("/user/quiz/submit")
public class QuizSubmitServlet extends HttpServlet {
 
    private final QuizService quizService = new QuizService();
    private final QuizResultService quizResultService = new QuizResultService();
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        int quizId = Integer.parseInt(req.getParameter("quizId"));
 
        List<Question> questions = quizService.getQuestionsForQuiz(quizId);
 
        int score = 0;
        for (Question q : questions) {
            String answerStr = req.getParameter("q_" + q.getId());
            if (answerStr != null) {
                int answer = Integer.parseInt(answerStr);
                if (answer == q.getCorrectOption()) {
                    score++;
                }
            }
        }
 
        User user = (User) req.getSession().getAttribute("loggedInUser");
 
        QuizResult result = new QuizResult();
        result.setQuizId(quizId);
        result.setUserId(user.getId());
        result.setScore(score);
        result.setTotalQuestions(questions.size());
 
        quizResultService.saveResult(result);
 
        resp.sendRedirect(req.getContextPath() + "/user/leaderboard?quizId=" + quizId);
    }
}