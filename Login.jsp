<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <title>Login</title>
    <style>
        
        #btn_submit{
            margin-top:20px;
            padding:2.5%;
            padding-top:3.4%;
            padding-left:10%;
            padding-right:10%;
            border-top-right-radius:100px;
            border-bottom-right-radius:100px;
            border:1px solid #267921;
            color:#267921;
            outline:none;
            font-family:Mada;
            font-size:18px;
            margin-bottom:6%;
            background-color:inherit;
            
            
        }
        #btn_forgot{
            margin-top:4%;
            padding:2.5%;
            padding-top:3.5%;
            padding-left:10%;
            padding-right:10%;
         /*   border-top-right-radius:100px;
            border-bottom-right-radius:100px; */
            border-radius:122px;
            border:1px solid #412a90;
            background:white;
            color:#412a90;
            outline:none;
            font-family:Mada;
            font-size:16px;
            margin-bottom:3%;
            text-transform:uppercase; 
           
        }
        #btn_new{
            margin-top:7%;
            padding:2.5%;
            padding-top:3.5%;
            padding-left:10%;
            padding-right:10%;
         /*   border-top-right-radius:100px;
              border-bottom-right-radius:100px; */
             border-radius:122px;
             border:1px solid #9a2a7f;
            color:#9a2a7f;
            outline:none;
            font-family:Mada;
            font-size:16px;
            margin-bottom:0%;
            text-transform:uppercase;       
            background-color:inherit;
        }
        #btn_submit:hover,#btn_submit:focus{
            outline:none;
            box-shadow:none;
            border:1px solid #22611e;
            background:#267921;
            color:wheat;
            transition-property:all;
            transition-duration:0.44s;
            transition-timing-function: ease;
            transition-delay:0.0s;
            cursor:pointer;
        }
        #btn_forgot:hover,#btn_forgot:focus{
            outline:none;
            border:1px solid #451a90;
            background:#412a90;
            color:wheat;
            transition-property:all;
            transition-duration:0.44s;
            transition-timing-function: ease;
            transition-delay:0.0s;
            cursor:pointer;
        }
        #btn_new:hover,#btn_new:focus{
            outline:none;
            border:1px solid #7c2567;
            background:#9a2a7f;
            color:wheat;
            transition-property:all;
            transition-duration:0.44s;
            transition-timing-function: ease;
            transition-delay:0.0s;
            cursor:pointer;
        }
        
        #ip_username,#ip_password{
            border:0.5px solid #b6bab8;
            padding:10px;
            font-family:Lato;
            color:#01000c;
            margin:6px;
            font-size:15px;
            margin-left:0px;
            border-left:none;
            border-top-right-radius:100px;
            border-bottom-right-radius:100px;
            margin-right:35px;
        
        }
        .fa-user,.fa-key{
            border:0.5px solid #b6bab8;
            padding:18px;
            margin:6px;
            margin-left:35px;
            margin-right:0px;
            border-top-left-radius:100px;
            border-bottom-left-radius:100px;
            color:#b6bab8; 
                              
        }
        #ip_username:hover,#ip_username:focus,
        #ip_password:hover,#ip_password:focus{
            outline:none;
           box-shadow:none;
        }
        #tbl{
            text-align:center; 
            border:1px solid #bfbfbf;
            margin-top:30px;
            padding-bottom:35px;    
            
        }
        #home{
            color:  #b9dcb6;
        }
        #success,#err{
            font-family:'lato',sans-serif;
            padding:2%;
            margin-top:3.8%;
            padding-left:5%;padding-right:5%;
            text-align:center;
            font-size:15px;
            border-radius:111px;
        }
        
        
       
        
        
    @media screen and (max-width:800px)
     {
      body{
           font-family:'Lato',sans-serif; font-size:2.77vw;
      }
      #ip_username,#ip_password{
          font-size:2.99vw;
      }
      #btn_submit,#btn_forgot,#btn_new,#err,#success{
          font-size:3.2vw;
      }
     }              
 
        
    </style>
    <script type="text/javascript" src="JS/login.js"/>
    
    <script> </script>
  
    
</head>

<body>
  <jsp:include page="Navbar1.jsp"/>
  <%    
        boolean login_error=true;
        boolean registration_success=true;
        HttpSession hs=request.getSession();
        hs.removeAttribute("user");
        hs.removeAttribute("cust_id");
        if(hs.getAttribute("err")==null)
        {
            login_error=false;
        }
        if(hs.getAttribute("rs")==null)
        {
            registration_success=false;
        }
        
        
       //
 
  %>
    <div class="container">
    <center>
      
      
     <table id="tbl" >
         <form action="Register.jsp">
           <tr>
              <td><button id="btn_new"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;&nbsp;new Account</button></td>
           </tr>      
       </form>
       <form action="ForgotPassword.jsp">
        <tr>
          <td><button id="btn_forgot"><i class="fa fa-lock"></i>&nbsp;&nbsp;&nbsp;forgot password</button></td>
        </tr>
       </form>
         <tr><td><hr></td></tr>
       <form action="LoginController" method="POST"> 
         <tr>
             <td><i class="fa fa-user"></i><input type="text" id="ip_username" placeholder="Username" spellcheck="false" name="username" ></td>
         </tr>
         <tr>
             <td><i class="fa fa-key"></i><input type="password" id="ip_password" placeholder="Password" name="password"></td>
         </tr>
          <tr>
              <td><button class="btn" id="btn_submit" onclick="change()">Login&nbsp;&nbsp;&nbsp;<i class="fa fa-sign-in" id="sign-in-icon"></i></button></td>
         </tr>
       </form>
     </table>
      
        <%   
            if(login_error){   %>
            <c:remove var="err" scope="session"/>
            <label style="color:#b11c1c;border:1px solid #cc9292" id="err"><i class="fa fa-exclamation-circle"></i>&nbsp;&nbsp;Invalid Username or Password</label>
        <%  } 
            else if(registration_success){ 
               
              if(hs.getAttribute("rs")=="Registration Successfull"){               %>
            
              <label style="color:#284e12;border:1px solid #82a86c" id="success"><i class="fa fa-check-circle" ></i>&nbsp;&nbsp;Registration Successfull</label>
            <%   } if(hs.getAttribute("rs")=="Registration Failed"){  %>   
                          
              <label style="color:#b11c1c;border:1px solid #cc9292" id="err"><i class="fa fa-times-circle"></i>&nbsp;&nbsp;Registration Failed</label>
           <%     }   %> 
           <c:remove var="rs" scope="session"/>
          <%   }     hs.invalidate();    %>
        
    </center> 
   </div> 
          <script src="JS/animation.js" type="text/javascript"></script>
</body>
</html>
