package com.quizportal.filter;
 
import com.quizportal.model.User;
 
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
 
/**
* Ensures only logged-in user can access /user/* URLs.
*/
@WebFilter("/user/*")
public class UserAuthFilter implements Filter {
 
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // no init needed
    }
 
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
 
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;
 
        HttpSession session = httpReq.getSession(false);
        User user = (session != null)
                ? (User) session.getAttribute("loggedInUser")
                : null;
 
        if (user == null) {
            // not logged in → redirect to user login
            httpResp.sendRedirect(httpReq.getContextPath() + "/login");
            return;
        }
 
        chain.doFilter(request, response);
    }
 
    @Override
    public void destroy() {
        // nothing to destroy
    }
}