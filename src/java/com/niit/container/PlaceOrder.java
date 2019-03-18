package com.niit.container;

import com.niit.modal.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet(name = "PlaceOrder" , urlPatterns = "/PlaceOrder")
public class PlaceOrder extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        int cid=Integer.parseInt(req.getParameter("id"));
        Connection conn=null;
        String oid=null;
        try
        {
            Context context = new InitialContext();
            DataSource datasource = (DataSource) context.lookup("jdbc/myDatasource");
            conn = datasource.getConnection();
            
            oid=getOrderId();
            
            PreparedStatement ps=conn.prepareStatement("select product_id,product_name,product_weight,item_count,product_price from customer_cart where cust_id="+cid);
            ResultSet rs=ps.executeQuery();
            Products product=null;
            ArrayList<Products> products=new ArrayList<>();
            
            while(rs.next())
            {
                product=new Products();
                
                product.setProduct_id(rs.getInt("product_id"));
                product.setProduct_name(rs.getString("product_name"));
                product.setProduct_weight(rs.getString("product_weight"));
                product.setItem_count(rs.getInt("item_count"));
                product.setProduct_price(rs.getFloat("product_price"));
                product.setOrder_id(oid);
                
                products.add(product);
            }
            
            ps.close();
           
            
            PreparedStatement ps2=conn.prepareStatement("insert into customer_order_mapping(order_id,cust_id,order_time,delivery_status) values(?,?,?,?)");
            ps2.setString(1,oid);
            ps2.setInt(2,cid);
            ps2.setString(3,getCurrentDate());
            ps2.setString(4,"Undelivered");
            ps2.execute();
            
            ps2.close();
                        
            PreparedStatement ps3=conn.prepareStatement("insert into order_details(order_id,product_id,item_count,product_name,product_weight,product_price) values(?,?,?,?,?,?)");
            for(Products p : products)
            {
                ps3.setString(1,oid);
                ps3.setInt(2,p.getProduct_id());
                ps3.setInt(3,p.getItem_count());
                ps3.setString(4,p.getProduct_name());
                ps3.setString(5,p.getProduct_weight());
                ps3.setFloat(6,p.getProduct_price());
                ps3.execute();
                
            }
            ps3.close();
            
            String query="DELETE FROM customer_cart where cust_id="+cid;
            DeleteProductController.delete(conn,query);
            conn.close();
            resp.sendRedirect("OrderSummary.jsp");
            
            
        }
        catch(Exception e)
        {
            PrintWriter p=resp.getWriter();
            p.println(e);
        }
    }
    
    public static String getOrderId()
    {
        
        String chars="12AKBC3DEF58GHI4J9LM0NOKPQR6STUV7WXYZ12345689";
        char arr[]=chars.toCharArray();
        StringBuilder sb=new StringBuilder();
        for(int i=1;i<=16;i++)
        {
           Random r=new Random();
           int index=r.nextInt(arr.length);
           sb.append(arr[index]);
        }
        
        return sb.toString();
    }
    public static String getCurrentDate()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy | hh:mm:ss a");
	String date = sdf.format(new Date()); 
        return date;
    }
}
