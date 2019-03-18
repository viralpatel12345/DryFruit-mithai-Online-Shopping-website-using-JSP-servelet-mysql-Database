package com.niit.container;

import java.io.IOException;
import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet(name="DeleteCartController" , urlPatterns = {"/DeleteCartController"})
public class DeleteCartController extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
         
         int custid=Integer.parseInt((String) req.getSession().getAttribute("cust_id"));
                   
         Connection connection=null;
         try
         {     
               Context context=new InitialContext();
               DataSource ds=(DataSource)context.lookup("jdbc/myDatasource");
               connection = ds.getConnection();
               
                
               String query="DELETE from customer_cart where cust_id="+custid;
               
               DeleteProductController.delete(connection,query);
               resp.sendRedirect("CustomerCart.jsp");
         }
         catch(Exception e)
         {
             
         }
         
        
    }
       
}
