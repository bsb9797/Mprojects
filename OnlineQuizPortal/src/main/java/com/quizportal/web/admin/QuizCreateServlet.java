package com.quizportal.web.admin;
 
import com.quizportal.model.AdminUser;
import com.quizportal.model.Quiz;
import com.quizportal.service.QuestionService;
import com.quizportal.service.QuizService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
 
@WebServlet("/admin/quiz/create")
public class QuizCreateServlet extends HttpServlet {
 
    private final QuestionService questionService = new QuestionService();
    private final QuizService quizService = new QuizService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.setAttribute("questions", questionService.findAll());
        req.getRequestDispatcher("/admin/quiz-create.jsp").forward(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String title = req.getParameter("title");
        String category = req.getParameter("category");
        boolean published = "on".equals(req.getParameter("published"));
 
        String[] questionIds = req.getParameterValues("questionId");
        List<Integer> selectedQuestions = new ArrayList<>();
        if (questionIds != null) {
            for (String idStr : questionIds) {
                selectedQuestions.add(Integer.parseInt(idStr));
            }
        }
 
        Quiz quiz = new Quiz();
        quiz.setTitle(title);
        quiz.setCategory(category);
        quiz.setPublished(published);
 
        AdminUser admin = (AdminUser) req.getSession().getAttribute("loggedInAdmin");
 
        boolean success = quizService.createQuiz(quiz, selectedQuestions, admin.getId());
 
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/quiz/list");
        } else {
            req.setAttribute("error", "Failed to create quiz");
            req.setAttribute("questions", questionService.findAll());
            req.getRequestDispatcher("/admin/quiz-create.jsp").forward(req, resp);
        }
    }
}