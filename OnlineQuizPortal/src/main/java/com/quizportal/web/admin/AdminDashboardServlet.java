package com.quizportal.web.admin;
 
import com.quizportal.service.QuestionService;
import com.quizportal.service.QuizService;
import com.quizportal.service.UserService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
 
    private final QuizService quizService = new QuizService();
    private final QuestionService questionService = new QuestionService();
    private final UserService userService = new UserService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.setAttribute("totalQuizzes", quizService.countQuizzes());
        req.setAttribute("totalQuestions", questionService.countQuestions());
        req.setAttribute("totalUsers", userService.countUsers());
 
        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }
}