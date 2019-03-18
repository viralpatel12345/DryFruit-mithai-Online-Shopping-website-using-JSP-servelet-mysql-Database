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

@WebServlet(name="DeleteAccountController" ,urlPatterns = "/DeleteAccountController")
public class DeleteAccountController extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        Connection conn=null;
        try
        {
            Context context=new InitialContext();
            DataSource ds=(DataSource) context.lookup("jdbc/myDatasource");
            conn=ds.getConnection();
            HttpSession hs=req.getSession();
            int cid=Integer.parseInt(hs.getAttribute("cust_id").toString());
            PreparedStatement ps=conn.prepareStatement("DELETE from customer where cust_id="+cid);
            ps.executeUpdate();
            ps.close();
            conn.close();
            resp.sendRedirect("Login.jsp");
        }
        catch(Exception e)
        {
            PrintWriter p=resp.getWriter();
            p.println(e);
        }
    }
    
}
