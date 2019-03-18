package com.niit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/Welcome.jsp","/CustomerCart.jsp","/AccountDetails.jsp","/ChangePassword.jsp","/OrderSummary.jsp","/PlaceYourOrder.jsp"})
public class LoginFilter implements Filter // Filter is an Interfce
{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException 
    {
       
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
    {
             // Downcasting
             HttpServletRequest req= (HttpServletRequest) request;
             HttpServletResponse resp=(HttpServletResponse) response;
            
             resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
             resp.setHeader("Pragma", "no-cache");
        
             HttpSession hs=req.getSession();
             
             if(hs.getAttribute("user")==null && hs.getAttribute("cust_id")==null)
             {
                 resp.sendRedirect("Login.jsp");
             }
             
             chain.doFilter(request, response);
    }

    @Override
    public void destroy() 
    {
 
    }
    
}
