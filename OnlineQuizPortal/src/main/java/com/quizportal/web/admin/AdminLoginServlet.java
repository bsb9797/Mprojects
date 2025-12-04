package com.quizportal.web.admin;
 
import com.quizportal.model.AdminUser;
import com.quizportal.service.AdminService;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
 
@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {
 
    private final AdminService adminService = new AdminService();
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
    }
 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
 
        String email = req.getParameter("email");
        String password = req.getParameter("password");
 
        AdminUser admin = adminService.login(email, password);
 
        if (admin != null) {
            HttpSession session = req.getSession();
            session.setAttribute("loggedInAdmin", admin);
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else {
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
        }
    }
}