package com.quizportal.filter;
 
import com.quizportal.model.AdminUser;
 
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
 
/**
 * Ensures only logged-in admin can access /admin/* URLs.
 */
@WebFilter("/admin/*")
public class AdminAuthFilter implements Filter {
 
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // no init params needed
    }
 
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
 
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;
 
        HttpSession session = httpReq.getSession(false);
        AdminUser admin = (session != null)
                ? (AdminUser) session.getAttribute("loggedInAdmin")
                : null;
 
        if (admin == null) {
            // not logged in → redirect to admin login
            httpResp.sendRedirect(httpReq.getContextPath() + "/admin-login");
            return;
        }
 
        // logged in → continue
        chain.doFilter(request, response);
    }
 
    @Override
    public void destroy() {
        // nothing to close
    }
}

 