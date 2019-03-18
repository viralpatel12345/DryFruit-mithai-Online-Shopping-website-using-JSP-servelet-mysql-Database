<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Fira Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>forgot Password</title>
        <style>
         #tbl{
            text-align:center; 
            border:0.7px solid #bfbfbf;
            border-radius:11px;
            margin-top:50px;
            padding-bottom:35px;   
        }
        #ip_otp{
            border:0.5px solid #afafbf;
            padding:10px;
            font-family:Open Sans;
            color:#2a2b6a;
            margin:8px;
            margin-left:0px;
            border-left:none;
            border-top-right-radius:100px;
            border-bottom-right-radius:100px;
            margin-right:25px;
            margin-top:4.2%;
               
        }
       .fa-pencil{
            border:0.5px solid #afafbf;
            padding:18px;
            margin:8px;
            margin-left:25px;
            margin-right:0px;
            border-top-left-radius:100px;
            border-bottom-left-radius:100px;
            color:grey;
            margin-top:4.2%;
        }
        #ip_otp:hover,#ip_otp:focus
       {
           outline:none;
           box-shadow:none;
        }
        #btn_verify{
            margin-top:4%;
            padding:2%;
            padding-top:2.70%;
            
            padding-left:10%;
            padding-right:10%;
         /* border-top-right-radius:100px;
            border-bottom-right-radius:100px; */
            border-radius:122px;
            border:1.5px solid #9a2a7f;
            background:white;
            color:#9a2a7f;
            outline:none;
            font-family:Mada;
            font-size:18px;
            margin-bottom:4%;            
        }
        #btn_verify:hover,#btn_verify:focus{
            outline:none;
            border:1.5px solid #7c2567;
            background:#9a2a7f;
            color:wheat;
            transition-property:all;
            transition-duration:0.44s;
            transition-timing-function: ease;
            transition-delay:0.0s;
            cursor:pointer;
        }
        #txt_note{
            font-size:13px;
           
            color:#264d4c;
            padding:2%;
            margin:1.5%;
            text-align:left;
            font-family:'Lato',sans-serif;
        }
        #error_email_message
        {
            font-family:'lato',sans-serif;
            padding:2%;
            margin:2%;
            text-align:center;
            color:#b11c1c;
        }
        hr{ width:1%; }
        
     @media screen and (max-width:800px)
     {
      body{
           font-family:Open Sans; font-size:2.77vw;
      }
      #ip_email{
          font-size:2.99vw;
      }
      #btn_verify{
        font-size:3.2vw;
      }
      #txt_note{
          font-size:2.77vw;
          color:#264d4c;
      }
      #error_email_message{
          font-size:2.77vw;
      }
     
      
     }              
        
    </style>
    
    <script>
        function change(){
                   document.getElementById("validate-icon").className="fa fa-circle-o-notch fa-spin";
              }
    </script>
    <script>
        $(document).ready(function(){
           $("hr").animate({width:"99%"}); 
        });
    </script>
</head>
<body> 
<jsp:include page="Navbar1.jsp"/>

    <div class="container">
        <center>
          <form action="ForgotPasswordController" method="GET">
              <div><h3 style="font-family:Lato"></br>Account Validation</h3></div>
            <table id="tbl">  
                <tr><td><p id="txt_note">
                     Enter the 6 digit OTP ( One Time Password ) sent on your email address. The account details will be mailed to you to this email id.&nbsp;&nbsp;<b id="t"></b> 
                </p></td></tr>
                <tr><td><hr style="border:1.5px solid green"></td></tr>
                <tr><td><i class="fa fa-pencil"></i><input id="ip_otp" type="text" name="otp" spellcheck="false" placeholder="Enter 6 digit OTP" maxlength="6"></td></tr>
                <tr><td><button type="submit"  id="btn_verify" onclick="change();"><i class="fa fa-wrench" id="validate-icon"></i>&nbsp;&nbsp;&nbsp;Validate</button></td></tr>
            </table>
          </form>
            <c:if test="${oe=='oe'}">
                <c:remove var="oe" scope="session" />
                <label id="error_email_message"><i class="fa fa-exclamation-circle"></i>&nbsp;&nbsp;Invalid OTP entered</label>
           </c:if> 
         </center>
    </div>
</body>