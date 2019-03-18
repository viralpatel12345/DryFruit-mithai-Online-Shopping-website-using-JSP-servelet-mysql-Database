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
    <link href="https://fonts.googleapis.com/css?family=Open Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Change Password</title>
    <style>
        #cp{  color: #1b2a6d;background: #eaedf8; }
        #navbardrop{ color: #b9dcb6;  }
        #tbl{
            width:90%; 
            margin-top:0%;
            margin-bottom:1%;
            margin-left:5%; 
            margin-right:5%; 
            text-align:center;
            font-family:Lato;
            font-size:15px;
        }
        table tr td input{
            outline:none;
            box-shadow:none;
            border:1px solid #b1afc3;
            border-radius:100px;
            color:#2a0b25;
        }
         #btn_submit{
           margin-top:4%;
           padding:2.0%;
           padding-top:2.75%;
           padding-left:5%;
           padding-right:5%; 
           color:#9a2a7f ;
           border:1.5px solid #9a2a7f;
           background:white;
           outline:none;
           text-transform:uppercase;
           border-radius:111px;
           font-family:Mada;
           margin-bottom:0.5%;
          font-size:17px; 
        }
        #btn_submit:hover,#btn_submit:focus{
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
        #error{
            width:84%;
            margin:1.8%;
            padding:1.4%; 
            padding-left:3%; 
            padding-right:3%; 
            text-align:left; 
            font-size:14px; 
            border:1px solid #b387d4;
            border-radius:5px;
            color:#ba0e18;
        }
        
     @media screen and (max-width:800px)
     {
      body{
           font-family:'Lato',sans-serif; font-size:2.77vw;
      }
      input{
          font-size:2.68vw;
      }
      #btn_submit{
        font-size:3.5vw;
      }
      h3{
          font-size:5.7vw;
      }
      #error{
          font-size:2.44vw;
          border:0.5px solid #b387d4;
      }
      
     } 

    </style>
    <script>
        
        $(document).ready(function(){
               $("#btn_submit").hide();
               $("#error").hide();
               $(":input").keyup(function(){
                      
                    var new_pass=$.trim($("#pwd1").val());
                    var retyped_pass=$.trim($("#pwd2").val());
                    if((new_pass===retyped_pass) && new_pass.length===8)
                    {
                        $("#pwd1").css('border','1px solid green');
                        $("#pwd2").css('border','1px solid green');
                        $("#error").hide();
                        $("#btn_submit").show();
                    }
                    else
                    {  
                        $("#btn_submit").hide();
                        $("#error").html("Password should contain Exactly 8 characters including numbers. Special characters are strictly not allowed.").show();         
                        $("#pwd1").css('border','1px solid red');
                        $("#pwd2").css('border','1px solid red');
                        
                        
                    }
         
               });
            
        });
    </script>

    <script type="text/javascript">
      
      function togglePass(textboxid,btnid)
      {
           var pwd=document.getElementById(textboxid);
           var eye=document.getElementById(btnid);
           
           if(pwd.type==='password')
           {            
              eye.className='fa fa-bell-slash-o';
              pwd.type='text';
           }
           
           else
           {
              eye.className='fa fa-bell-o';
              pwd.type='password';
           }
      }
   </script>

</head>
<body>
    <jsp:include page="Navbar.jsp"/>
    </br>
    <div class="container">
        <div class="row">
            <div class="col-lg-2 col-xs-1"></div>
            <div class="col-lg-8 col-xs-10" style="margin-top:3%">
                <div  class="card" style="width:100%;border:1px #619f98 groove;border-radius:20px">
                    <div class="card-header" style="background:white;border-bottom:1.6px solid #451a90; padding:2%;margin:2%;color:#911747">
                        <h3 style="font-family:'lato',sans-serif">&nbsp;&nbsp;&nbsp;<i class="fa fa-lock"></i>&nbsp;&nbsp;&nbsp; Reset Password </h3>
                    </div>
                    <div class="card-body" style="text-align:center">
                      <form method="POST" action="ChangePasswordController"> 
                        <table id="tbl">    
                            <tr>
                              <td>
                                  <i class="fa fa-bell-o" id="eye1" style="color:grey; position: absolute; margin-left:69.5%; margin-top:3.5%; cursor:pointer;  " onClick="togglePass('pwd1','eye1');"></i>
                                  <input type="password" name="pass" id="pwd1" style="width:85%; margin:1.8%; padding:1.6%;padding-left:3%;padding-right:3%" placeholder="Enter New Password" spellcheck="false"></td>
                            </tr>
                            <tr>   
                              <td>
                                  <i class="fa fa-bell-o" id="eye2" style="color:grey; position: absolute; margin-left:69.5%; margin-top:3.5%; cursor:pointer;  " onClick="togglePass('pwd2','eye2');"></i>
                                  <input type="password" name="retyped" id="pwd2" style="width:85%; margin:1.8%; padding:1.6%;padding-left:3%;padding-right:3%" placeholder="Retype New Password" spellcheck="false"></td>
                            </tr>
                             <tr>
                                <td><label  id="error"></label></td>
                            </tr>
                            <tr>
                               <td colspan="2"><button type="submit"  id="btn_submit">Reset Password</button></td>
                            </tr>
                        </table>
                      </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

