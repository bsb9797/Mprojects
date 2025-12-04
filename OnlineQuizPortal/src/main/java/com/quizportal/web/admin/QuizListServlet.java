package com.quizportal.web.admin;
 
import com.quizportal.service.QuizService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/admin/quiz/list")
public class QuizListServlet extends HttpServlet {
 
    private final QuizService quizService = new QuizService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.setAttribute("quizzes", quizService.getAllQuizzes());
        req.getRequestDispatcher("/admin/quiz-list.jsp").forward(req, resp);
    }
}