package com.quizportal.web.admin;
 
import com.quizportal.service.QuestionService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/admin/question/list")
public class QuestionListServlet extends HttpServlet {
 
    private final QuestionService questionService = new QuestionService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.setAttribute("questions", questionService.findAll());
        req.getRequestDispatcher("/admin/question-list.jsp").forward(req, resp);
    }
}