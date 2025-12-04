package com.quizportal.web.user;
 
import com.quizportal.model.User;
import com.quizportal.service.UserService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
 
    private final UserService userService = new UserService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String email = req.getParameter("email");
        String password = req.getParameter("password");
 
        User user = userService.login(email, password);
 
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedInUser", user);
            resp.sendRedirect(req.getContextPath() + "/user/quiz/list");
        } else {
            req.setAttribute("error", "Invalid email or password.");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
        }
    }
}