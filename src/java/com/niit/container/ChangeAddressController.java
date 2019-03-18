package com.niit.container;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "ChangeAddressController" ,urlPatterns = "/ChangeAddressController")
public class ChangeAddressController extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
         String add=req.getParameter("address");
         Connection connection=null;
         HttpSession hs=req.getSession();
         int cid=Integer.parseInt((String)hs.getAttribute("cust_id"));
         try
         {
             Context context = new InitialContext();
             DataSource ds=(DataSource) context.lookup("jdbc/myDatasource");
             connection=ds.getConnection();
             PreparedStatement pstmt=connection.prepareStatement("UPDATE customer set address='"+add+"' where cust_id="+cid);
             pstmt.executeUpdate();
             resp.sendRedirect("PlaceYourOrder.jsp");
         }
         catch(Exception e)
         {
             PrintWriter p=resp.getWriter();
             p.println(e);
         }
    }
    
}
