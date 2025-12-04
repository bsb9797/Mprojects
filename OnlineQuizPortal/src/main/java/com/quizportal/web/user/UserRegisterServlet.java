package com.quizportal.web.user;
 
import com.quizportal.service.UserService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
 
    private final UserService userService = new UserService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
 
        boolean success = userService.register(fullName, email, password);
 
        if (success) {
            req.setAttribute("message", "Account created successfully. Please log in.");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Email already exists.");
            req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
        }
    }
}