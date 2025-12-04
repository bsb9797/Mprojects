package com.quizportal.web.admin;
 
import com.quizportal.model.AdminUser;
import com.quizportal.model.Question;
import com.quizportal.service.QuestionService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/admin/question/add")
public class QuestionCreateServlet extends HttpServlet {
 
    private final QuestionService questionService = new QuestionService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.getRequestDispatcher("/admin/question-add.jsp").forward(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String questionText = req.getParameter("questionText");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");
        String correctOptionStr = req.getParameter("correctOption");
        String category = req.getParameter("category");
 
        int correctOption = Integer.parseInt(correctOptionStr);
 
        Question q = new Question();
        q.setQuestionText(questionText);
        q.setOption1(option1);
        q.setOption2(option2);
        q.setOption3(option3);
        q.setOption4(option4);
        q.setCorrectOption(correctOption);
        q.setCategory(category);
 
        AdminUser admin = (AdminUser) req.getSession().getAttribute("loggedInAdmin");
 
        boolean success = questionService.createQuestion(q, admin.getId());
 
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/admin/question/list");
        } else {
            req.setAttribute("error", "Failed to save question");
            req.getRequestDispatcher("/admin/question-add.jsp").forward(req, resp);
        }
    }
}