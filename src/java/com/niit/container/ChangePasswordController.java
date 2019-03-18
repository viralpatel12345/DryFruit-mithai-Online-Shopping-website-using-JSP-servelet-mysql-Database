package com.niit.container;

import com.niit.security.Security;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet(name="ChangePasswordController", urlPatterns = "/ChangePasswordController")
public class ChangePasswordController extends HttpServlet
{
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
         String password=Security.md5(req.getParameter("pass").trim());
         Connection conn=null;
         try
         {
             HttpSession hs=req.getSession();
             String username=(String) hs.getAttribute("user");
             Context context=new InitialContext();
             DataSource datasource=(DataSource) context.lookup("jdbc/myDatasource");
             conn=datasource.getConnection();
             PreparedStatement ps=conn.prepareStatement("UPDATE customer set password='"+password+"' where username='"+username+"'");
             ps.executeUpdate();
             ps.close();
             conn.close();
             resp.sendRedirect("Login.jsp");
         }
         catch(Exception e)
         {
             
         }
         
    }
                 
}
