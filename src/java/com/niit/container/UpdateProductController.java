package com.niit.container;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

@WebServlet(name="UpdateProductController" ,urlPatterns = "/UpdateProductController")
public class UpdateProductController extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
             
           PrintWriter p=resp.getWriter();
           int input_count=0;
           
           HttpSession hs=req.getSession();
           int customer_id=Integer.parseInt((String)hs.getAttribute("cust_id"));
          
          
           try{
                 input_count=Integer.parseInt(req.getParameter("x"));
           }
           catch(Exception e)
           {
               p.println(e);
           }
           if(input_count <= 0)
           {
                resp.sendRedirect("CustomerCart.jsp");
           }
           
           String btn_plus=req.getParameter("b1");
           String btn_minus=req.getParameter("b2");
           
           Connection conn=null;
           
           try
           {
               Context context = new InitialContext();
               DataSource ds=(DataSource) context.lookup("jdbc/myDatasource");
               conn=ds.getConnection();
           }    
           catch (Exception ex) 
           {
                p.println(ex.getMessage());
           }
           
           if(btn_minus !=null)
           {
               int product_id=Integer.parseInt(btn_minus);
               try
               {   
                  int p_count=getProductCount(conn, customer_id, product_id);
                  if(p_count > input_count)
                  {
                      PreparedStatement ps=conn.prepareStatement("UPDATE customer_cart set item_count="+(p_count-input_count)+",product_price=(product_price/"+p_count+")*"+(p_count-input_count)+" where cust_id="+customer_id+" and product_id="+product_id); 
                      ps.executeUpdate();
                      ps.close();
                      conn.close();
                      resp.sendRedirect("CustomerCart.jsp");
                  }
                  else if(p_count <= input_count)
                  {
                       String query="DELETE from customer_cart where product_id="+product_id+" and cust_id="+customer_id;
                       DeleteProductController.delete(conn,query);
                       conn.close();
                       resp.sendRedirect("CustomerCart.jsp");
                  }
               }
               catch(Exception e)
               {
                  p.println(e);
               }
               
                 
           }
           else if(btn_plus !=null)
           {
               int product_id=Integer.parseInt(btn_plus);
               try
               {
                  int p_count=getProductCount(conn, customer_id, product_id);
                  if((p_count+input_count) < 1001)
                  {
                       PreparedStatement ps=conn.prepareStatement("UPDATE customer_cart set item_count="+(p_count+input_count)+",product_price=(product_price/"+p_count+")*"+(p_count+input_count)+" where cust_id="+customer_id+" and product_id="+product_id);
                       ps.executeUpdate();
                       ps.close();
                       conn.close();
                       resp.sendRedirect("CustomerCart.jsp");
                  }
                  else
                  {    
                       conn.close();
                       resp.sendRedirect("CustomerCart.jsp");
                  }
                
               }
               catch(Exception e)
               {
                   p.print(e);
               }
               
           }
          
    }
    
    public int getProductCount(Connection conn,int custid,int pid) throws SQLException
    {
        int count=0;
        PreparedStatement ps=conn.prepareStatement("select item_count from customer_cart where product_id="+pid+" and cust_id="+custid);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
           count=rs.getInt("item_count");
        }
        ps.close();
      
        return count;
    }
      
}
