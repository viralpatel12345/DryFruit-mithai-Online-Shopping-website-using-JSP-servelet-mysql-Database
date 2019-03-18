<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script>
        function change()
        {
            document.getElementById("so").className="fa fa-circle-o-notch fa-spin";
        }
    </script>
    <style>
         #tbl{
            text-align:center; 
            border:0.7px solid #bfbfbf;
            border-radius:11px;
            margin-top:50px;
            padding-bottom:35px;   
        }
        #ip_email{
            border:0.5px solid #afafbf;
            padding:10px;
            font-family:Open Sans;
            color: #150939;
            margin:8px;
            font-size:15px;
            margin-left:0px;
            border-left:none;
            border-top-right-radius:100px;
            border-bottom-right-radius:100px;
            margin-right:25px;
            margin-top:4%;
           
        }
        .fa-envelope{
            border:0.5px solid #afafbf;
            padding:16px;
            padding-left:19px;
            margin:8px;
            margin-left:25px;
            margin-right:0px;
            border-top-left-radius:100px;
            border-bottom-left-radius:100px;
            color:#c4c3c6;
            margin-top:4%;
        }
        #ip_email:hover,#ip_email:focus
       {
           outline:none;
           box-shadow:none;
       }
        #btndrk{
            margin-top:4%;
            padding:2.25%;
            padding-top:3%;
            padding-left:7%;
            padding-right:7%;
            border-top-right-radius:100px;
            border-bottom-right-radius:100px; 
            border:1.5px solid #672173;
            background:white;
            color:#672173;
            outline:none;
            font-family:Mada;
            font-size:18px;
            margin-bottom:4%;
            text-transform:uppercase;            
        }
        #btndrk:hover,#btndrk:focus,.btn:hover,.btn:focus{
            outline:none;
            box-shadow:none;
            border:1.5px solid #492051;
            background:#672173;
            color:wheat;
            transition-property:all;
            transition-duration:0.44s;
            transition-timing-function: ease;
            transition-delay:0.0s;
            cursor:pointer;
        }
        #txt_note{
            font-size:13px;
            color:#2c303d;
            padding:2%;
            margin:2%;
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
           font-family:Lato; font-size:2.77vw;
      }
      #ip_email{
          font-size:2.99vw;
      }
      #btndrk{
        font-size:3.2vw;
      }
      #txt_note{
          font-size:2.677vw;
      }
      #error_email_message{
          font-size:2.677vw;
      }
      
     }              
        
    </style>
    <script>
        $(document).ready(function(){
            
        $("hr").animate({width:"99%"},"slow");
        $("#btndrk").prop('disabled',true);
        $("#ip_email").keyup(function()
            {
                var email=$.trim($(this).val());
                var pattern=/^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                if(!pattern.test(email))
                {
                    $("#btndrk").prop('disabled',true);
                }
                else
                {
                    $("#btndrk").prop('disabled',false);
                }
            });
        });    
    </script>
</head>
<jsp:include page="Navbar1.jsp"/>
<body>
    <div class="container">
        <center>
          <form action="ForgotPasswordController" method="POST">
            <table id="tbl">  
                <tr><td><p id="txt_note">
                        
                            Registered users can recover their usernames and passwords by entering their registered email id.</br>The account details will be mailed to you to this email id.
                        </p></td></tr>
                <tr><td><hr style="border:1.5px solid green"></td></tr>
                <tr><td><i class="fa fa-envelope"></i><input id="ip_email" type="email" name="email_id" spellcheck="false" placeholder="Enter your email-ID"></td></tr>
                <tr><td><button class="btn" type="submit" id="btndrk" onclick="change();">Submit&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-send-o" id="so"></i></button></td></tr>
            </table>
          </form>
            
            <c:if test="${email_error=='email_error'}">
                <c:remove var="email_error" scope="session" />
                <label id="error_email_message"><i class="fa fa-exclamation-circle"></i>&nbsp;&nbsp;Invalid email address</label>
            </c:if>
                
         </center>
    </div>
</body>