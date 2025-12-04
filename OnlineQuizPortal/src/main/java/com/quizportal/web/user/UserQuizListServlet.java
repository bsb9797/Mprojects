package com.quizportal.web.user;
 
import com.quizportal.service.QuizService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/user/quiz/list")
public class UserQuizListServlet extends HttpServlet {
 
    private final QuizService quizService = new QuizService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.setAttribute("quizzes", quizService.getPublishedQuizzes());
        req.getRequestDispatcher("/user/quiz-list.jsp").forward(req, resp);
    }
}