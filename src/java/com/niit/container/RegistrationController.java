package com.niit.container;

import com.niit.security.Security;
import com.niit.modal.RegistrationDetails;
import java.io.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.sql.DataSource;

@WebServlet(name = "RegistrationController" , urlPatterns = "/RegistrationController")
public class RegistrationController extends HttpServlet 
{
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
         RegistrationDetails userdetails=new RegistrationDetails();
         
         userdetails.setFname(req.getParameter("fname").trim());
         userdetails.setLname(req.getParameter("lname").trim());
         userdetails.setGender(req.getParameter("gender"));
         userdetails.setAge(req.getParameter("age").trim());
         userdetails.setEmail(req.getParameter("email").trim());
         userdetails.setMobile(req.getParameter("mobile").trim());
         userdetails.setAlt_mobile(req.getParameter("alternative_mobile").trim());
         userdetails.setUsername(req.getParameter("username").trim());
         userdetails.setPassword(Security.md5(req.getParameter("password").trim()));
         userdetails.setAddress(req.getParameter("address").trim());
         
         Connection conn=null;
         try{
             
              Context ctx=new InitialContext();
              DataSource ds=(DataSource)ctx.lookup("jdbc/myDatasource");
              conn=ds.getConnection();
             
             String query="insert into customer(fname,lname,gender,age,email,mobile,alt_mobile,username,password,address,last_login) values(?,?,?,?,?,?,?,?,?,?,?)";
             PreparedStatement ps=conn.prepareStatement(query);
             ps.setString(1,userdetails.getFname());
             ps.setString(2,userdetails.getLname());
             ps.setString(3,userdetails.getGender());
             ps.setString(4,userdetails.getAge());
             ps.setString(5,userdetails.getEmail());
             ps.setString(6,userdetails.getMobile());
             ps.setString(7,userdetails.getAlt_mobile());
             ps.setString(8,userdetails.getUsername());
             ps.setString(9,userdetails.getPassword());
             ps.setString(10,userdetails.getAddress());
             ps.setString(11,"null");
            
             ps.execute();
             
             ps.close();
             
             req.getSession().setAttribute("rs", "Registration Successfull");
             conn.close();
             resp.sendRedirect("Login.jsp");
             
         }
         catch(Exception e)
         {
                 req.getSession().setAttribute("rs", "Registration Failed");      
                 resp.sendRedirect("Login.jsp");
                         
         }
                 
    }
    
    
}
