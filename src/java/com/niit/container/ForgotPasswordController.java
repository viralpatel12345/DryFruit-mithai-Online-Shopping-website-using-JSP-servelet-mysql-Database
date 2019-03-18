package com.niit.container;

import com.niit.security.Security;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;


class Mailer
{
    String to;
    String subject;
    String text;

    public Mailer(String to, String subject, String text) 
    {
        this.to = to;
        this.subject = subject;
        this.text = text;
    }

    public void sendEmail() throws Exception
    {
             // System.out.println("=============mail===========");
		final String username = "vp22973@gmail.com";
		final String password = "ohb4jxju";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                        @Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress(username,"SHREENATHJI"));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		message.setSubject(subject);
	        message.setContent(text,"text/html");
                Transport.send(message);		
    }
   
}

@WebServlet(name="ForgotPasswordController" , urlPatterns = "/ForgotPasswordController")
public class ForgotPasswordController extends HttpServlet
{
    String email=null;
    String otp=null;     
    
    
    public String getOTP()
    {
          String numbers="0123456789"; 
          char number_array[]=numbers.toCharArray(); 
          StringBuilder sb=new StringBuilder();
        
          for(int i=0;i<6;i++)
          {   
              Random random=new Random();
              int index=random.nextInt(number_array.length);
              sb.append(number_array[index]);
          }
        
          String otpcode=sb.toString();
          
          return otpcode;
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        email=req.getParameter("email_id").trim();
       
        try
        {
             Context context=new InitialContext();
             DataSource ds=(DataSource) context.lookup("jdbc/myDatasource");
             Connection conn=ds.getConnection();
             PreparedStatement ps=conn.prepareStatement("select email from customer where email='"+email+"'");
             
             ResultSet rs=ps.executeQuery();
             conn.close();
             String email_id="";
             if(rs.next())
             {
                email_id=rs.getString("email");
             }
           
             HttpSession hs=req.getSession();
             
             if(email.equals(email_id))
             {
                 hs.setAttribute("email",email);
                 otp=getOTP();
                 Mailer mailer = new Mailer(email,"Shreenathji","<html>"+"<body>"+"<p><br/>Dear Customer ,<br/><br/>Your 6 Digit OTP is <br/><br/></p><h1 style='color:green'>"+otp+"</h1>"+"</body>"+"</html>");
                 mailer.sendEmail();
                 resp.sendRedirect("OtpVerification.jsp");
             }
             else
             {   
                 hs.setAttribute("email_error","email_error");
                 resp.sendRedirect("ForgotPassword.jsp");
             }
        }
        catch(Exception e)
        {
            PrintWriter out=resp.getWriter();
            out.println(e);
        }    
        
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
          HttpSession hs=req.getSession();
          String i=req.getParameter("otp");
             if(i.equals(otp))
             {  
                 try 
                 {
                   sendAccountDetails(email);
                   hs.removeAttribute("email");
                   resp.sendRedirect("Login.jsp");
                 } 
                 catch (Exception ex) 
                 {
                    PrintWriter out=resp.getWriter();
                    out.println(ex);
                 }
              
             }
             else{
              
                 hs.setAttribute("oe","oe");
                 resp.sendRedirect("OtpVerification.jsp");
             }
          }
      
     public void sendAccountDetails(String emailaddress) throws Exception
     {
                  String arr[]=new String[3];
                  Context context=new InitialContext();
                  DataSource ds=(DataSource) context.lookup("jdbc/myDatasource");
                  Connection conn=ds.getConnection();
                  PreparedStatement ps=conn.prepareStatement("select fname,username,password from customer where email='"+emailaddress+"'");
                 
                  ResultSet rs=ps.executeQuery();
                  if(rs.next())
                  {
                      arr[0]=rs.getString("fname");
                      arr[1]=rs.getString("username");
                      arr[2]=rs.getString("password").substring(3,11);
                  }
                  
                  ps.close();
                  
                  PreparedStatement ps2=conn.prepareStatement("UPDATE customer SET password=? where email=?");
                  ps2.setString(1,Security.md5(arr[2]));
                  ps2.setString(2,emailaddress);
                  ps2.executeUpdate();
                  
                  ps2.close();
                  conn.close();
                  
                  Mailer m=new Mailer(emailaddress,"Shreenathji","<html><body><p><br/>Welcome "+arr[0]+" <br/><br/>Username : <b style='color:#52165c'>"+arr[1]+"</b><br/><br/>Password : <b style='color:#52165c'>"+arr[2]+"</b></p></body></html>");
                  m.sendEmail();
     }
    
}