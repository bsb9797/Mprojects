package com.quizportal.web.user;
 
import com.quizportal.service.QuizResultService;
import com.quizportal.service.QuizService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/user/leaderboard")
public class LeaderboardServlet extends HttpServlet {
 
    private final QuizResultService quizResultService = new QuizResultService();
    private final QuizService quizService = new QuizService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        int quizId = Integer.parseInt(req.getParameter("quizId"));
 
        req.setAttribute("quiz", quizService.findById(quizId));
        req.setAttribute("results", quizResultService.getLeaderboard(quizId));
 
        req.getRequestDispatcher("/user/leaderboard.jsp").forward(req, resp);
    }
}