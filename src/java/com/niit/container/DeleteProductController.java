
package com.niit.container;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet(name="DeleteProductController" ,urlPatterns = "/DeleteProductController")
public class DeleteProductController extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
         int product_id=Integer.parseInt(req.getParameter("pid"));
         Connection conn=null;
         try
         {
             Context c=new InitialContext();
             DataSource ds=(DataSource) c.lookup("jdbc/myDatasource");
             conn=ds.getConnection();
             HttpSession hs=req.getSession();
             int cust_id=Integer.parseInt((String)hs.getAttribute("cust_id"));
             String query="DELETE FROM customer_cart where product_id="+product_id+" and cust_id="+cust_id;   
             delete(conn,query);
             resp.sendRedirect("CustomerCart.jsp");
             
         }
         catch(Exception e)
         {
              
         }
         finally{
             try {
                 conn.close();
             } catch (SQLException ex) {}
         }
         
    }
    
    public static void delete(Connection conn,String q) throws SQLException
    {
        PreparedStatement ps=conn.prepareStatement(q);
        ps.executeUpdate();
        ps.close();
        conn.close();
        
    }
   
}
