package com.niit.container;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet(name = "AddToCartController" ,urlPatterns = "/AddToCartController" )
public class AddToCartController extends HttpServlet
{
        
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
           String id=req.getParameter("id").trim();
           int pid=0;
           float pprice=0.00f;
           String pweight="",pname="";
           Connection conn=null;
           HttpSession hs=req.getSession();
           int customer_id=Integer.parseInt((String)hs.getAttribute("cust_id"));
           if(id.length()>8)
           {
               resp.sendRedirect("CustomerCart.jsp");
           }
           try
           {
               Context context=new InitialContext();
               DataSource ds=(DataSource) context.lookup("jdbc/myDatasource");
               conn=ds.getConnection();
               PreparedStatement ps=conn.prepareStatement("select product_id,product_name,product_weight,product_price from products where product_id="+Integer.parseInt(id));
               ResultSet rs=ps.executeQuery();
               boolean s=rs.next();
               System.out.println(s);
               if(s)
               {
                
                   pid=rs.getInt("product_id");
                   pname=rs.getString("product_name");
                   pweight=rs.getString("product_weight");
                   pprice=rs.getFloat("product_price");
                   
               }
               else{
                     resp.sendRedirect("CustomerCart.jsp");
                     ps.close();
                     conn.close();
                }
               
              
               
               
               boolean status=false;
               PreparedStatement ps1=conn.prepareStatement("select item_count from customer_cart where product_id="+pid+" and cust_id="+customer_id);
               ResultSet rs1=ps1.executeQuery();
               
               status=rs1.next();
               
               if(status)
               {  
                   int count=0;
                   count=rs1.getInt("item_count");
                   PreparedStatement ps4=conn.prepareStatement("UPDATE customer_cart set item_count=?,product_price=? where product_id=? and cust_id=?");
                   ps4.setInt(1,count+1);
                   ps4.setFloat(2,pprice*(count+1));
                   ps4.setInt(3,pid);
                   ps4.setInt(4,customer_id);
                   ps4.executeUpdate();
                   
                   ps4.close();
                   conn.close();
                  
                   resp.sendRedirect("CustomerCart.jsp");
                                   
                }
               else
               {  
                   PreparedStatement ps3=conn.prepareStatement("insert into customer_cart(product_id,cust_id,item_count,product_name,product_weight,product_price) values(?,?,?,?,?,?)");
                   ps3.setInt(1,pid);
                   ps3.setInt(2,customer_id);
                   ps3.setInt(3,1);
                   ps3.setString(4,pname);
                   ps3.setString(5,pweight);
                   ps3.setFloat(6,pprice);
                   ps3.execute();
                   
                   ps3.close();
                   conn.close();
                   resp.sendRedirect("CustomerCart.jsp");
                  
               }
                   
           }
           catch(Exception e)
           {
               PrintWriter p=resp.getWriter();
               p.println("<h1>"+e+"</h1>");
           }
           
          
    }
    
}
