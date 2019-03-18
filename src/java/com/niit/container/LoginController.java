package com.niit.container;
import com.niit.security.Security;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet(name = "LoginController" , urlPatterns = "/LoginController")
public class LoginController extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user=req.getParameter("username").trim();
        String pass=Security.md5(req.getParameter("password").trim());
        Connection conn=null;
        try
        {
            Context context=new InitialContext();
            DataSource ds= (DataSource) context.lookup("jdbc/myDatasource");
            conn=ds.getConnection();
            PreparedStatement ps=conn.prepareStatement("select username,password from customer where username='"+user+"' and password='"+pass+"'");
            ResultSet resultset=ps.executeQuery();
            String u="";
            String p="";
           
            if(resultset.next())
            {
                u=resultset.getString("username"); 
                p=resultset.getString("password");                
            }
             
            HttpSession hs=req.getSession();
                
            if(u.equals(user) && p.equals(pass))
            {
                  hs.setAttribute("user",u);
                  
                  int cid=getCustID(conn, user);
                  
                  hs.setAttribute("cust_id",String.valueOf(cid));
                  
                  SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM yyyy , hh:mm:ss a");
	          String date = sdf.format(new Date()); 
                  PreparedStatement ps1=conn.prepareStatement("UPDATE customer set last_login='"+date+"' where username='"+user+"' and password='"+pass+"'");
	          ps1.executeUpdate();
                  ps1.close();
                  conn.close();
                  resp.sendRedirect("Welcome.jsp");
            }
            else
            {
                 
            /* PrintWriter lk=resp.getWriter();
               lk.print("eror");          */
               hs.setAttribute("err","errorc");
               conn.close();
               resp.sendRedirect("Login.jsp");    
            }
           
             
        }
        catch(Exception e)
        {
             
            PrintWriter p=resp.getWriter();
            p.println(e);
            
        }
        
    }
    
    public static int getCustID(Connection conn,String user) throws SQLException
    {
        int c_id=0;
        PreparedStatement ps=conn.prepareStatement("select cust_id from customer where username='"+user+"'");
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
           c_id=rs.getInt("cust_id");
        }
        ps.close();
        return c_id;
        
    }
    
}
