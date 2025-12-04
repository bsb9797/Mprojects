package com.quizportal.web.user;
 
import com.quizportal.service.QuizService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/user/quiz/attempt")
public class QuizAttemptServlet extends HttpServlet {
 
    private final QuizService quizService = new QuizService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        int quizId = Integer.parseInt(req.getParameter("id"));
 
        req.setAttribute("quiz", quizService.findById(quizId));
        req.setAttribute("questions", quizService.getQuestionsForQuiz(quizId));
 
        req.getRequestDispatcher("/user/quiz-attempt.jsp").forward(req, resp);
    }
}