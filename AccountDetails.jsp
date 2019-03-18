<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Account Details</title>
    <style>
          
           #navbardrop{ color: #b9dcb6;  }
           #aadd{  color: #1b2a6d;background: #eaedf8; }
           #card_header
           {
             background:white;
             border-bottom:none;
             color: #593b67;
             margin-bottom:0%;
        }
        #abtus{   font-size:14px;   }
        hr{ width:1% }
        @media screen and (max-width:800px)
       { 
         body{
               font-family:'Lato',sans-serif; font-size:2.7vw;
             }
           h3{
              font-size:5.8vw;
             }
           #abtus,#card_body{
             font-size:2.44vw;
           }
           
        }
    </style>
    <script>
        $(document).ready(function(){
           $("hr").animate({width:"100%"},"slow"); 
        });
    </script>
</head>
<body>
    <jsp:include page="Navbar.jsp"/>
    
    <%   
         String fname="",lname="",cust_id="",gender="",age="",email="",mobile="",alt_mobile="",address="",last_login="";
         Context context=new InitialContext();
         DataSource ds=(DataSource)context.lookup("jdbc/myDatasource");
         Connection conn=ds.getConnection();
         HttpSession hs=request.getSession();
         String user=(String)hs.getAttribute("user");
         PreparedStatement ps=conn.prepareStatement("select * from customer where username='"+user+"'");
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
             fname=rs.getString("fname");
             lname=rs.getString("lname");
             cust_id=rs.getString("cust_id");
             gender=rs.getString("gender");
             age=rs.getString("age");
             email=rs.getString("email");
             mobile=rs.getString("mobile");
             alt_mobile=rs.getString("alt_mobile");
             address=rs.getString("address");
             last_login=rs.getString("last_login");
         }
         ps.close();
         conn.close();
         
    %> 
    
    
    
    
    <div class="container" style="font-family:'lato',sans-serif;margin-top:12px;margin-bottom:0.5%">
        <div class="row">
            <div class="col-xs-12 col-lg-12 col-md-12">
                <br>
                <div class="card" style="border:1px solid #5a8d6d;margin-bottom:10%">
                     <div class="card-header" id="card_header"><h3 style="margin-top:1%;margin-left:1%;"><i class="fa fa-user-circle" style="color:  #878e89"></i>&nbsp;&nbsp;&nbsp;Account Details</h3></div>
                     <div class="card-body" id="card_body"><hr style="margin-top:0%;border:1px solid #385e4e;">
                      <p style="margin:1%;padding:0.6%;margin-top:3%" id="abtus">
                     
                          <i class="fa fa-clock-o" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Last Login : </b>&nbsp;<%=last_login %></br></br>                
                        <i class="fa fa-tag" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Customer ID : </b>&nbsp;<%=cust_id %></br></br>
                        <i class="fa fa-user" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Name : </b>&nbsp;<%=fname.concat(" "+lname) %></br></br>
                        <%  if(mobile.equals(alt_mobile)) {  %>
                        <i class="fa fa-phone" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Contact : </b>&nbsp;<%=mobile %></br></br> 
                        <%  }  else  {  %>      
                        <i class="fa fa-phone" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Contact : </b>&nbsp;<%=mobile %></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=alt_mobile %></br></br>
                         <% }  %>                     
                        <i class="fa fa-envelope" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Email : </b>&nbsp;<%=email %></br></br>
                        <i class="fa fa-calendar" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Age : </b>&nbsp;<%=age %></br></br>
                        <i class="fa fa-intersex" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Gender : </b>&nbsp;<%=gender %></br></br>
                        <i class="fa fa-map-marker" style="color: #8e8e8e">&nbsp;&nbsp;&nbsp;</i><b style="color: #6c1a64">Address : </b></br></br><%=address %>
                        
                     </p>        
                   
                    </div>
                </div>  
            </div>
        </div>
    </div>
</body>
</html>