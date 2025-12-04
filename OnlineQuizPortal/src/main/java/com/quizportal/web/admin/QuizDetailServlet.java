package com.quizportal.web.admin;
 
import com.quizportal.service.QuizService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/admin/quiz/detail")
public class QuizDetailServlet extends HttpServlet {
 
    private final QuizService quizService = new QuizService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String idStr = req.getParameter("id");
        int quizId = Integer.parseInt(idStr);
 
        req.setAttribute("quiz", quizService.findById(quizId));
        req.setAttribute("questions", quizService.getQuestionsForQuiz(quizId));
 
        req.getRequestDispatcher("/admin/quiz-detail.jsp").forward(req, resp);
    }
}