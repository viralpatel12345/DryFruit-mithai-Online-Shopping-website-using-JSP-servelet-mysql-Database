<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <title>Register</title>
    <style>
        #tbl{
            width:90%; 
            margin-top:0%;
            margin-bottom:1%;
            margin-left:5%; 
            margin-right:5%; 
            text-align:center;
            font-family:'lato',sans-serif;
        }
        table tr td input{
            outline:none;
            box-shadow:none;
            border:1px solid #b1afc3;
            border-radius:100px;
            color:#2a0b25;
        }
        #select-style{
            outline:none;
            box-shadow:none;
            width:85%;
            margin:1.8%;
            padding:1%;
            padding-left:6%;
            padding-right:6%;
            border-radius:100px;
            border:1px solid green;
            font-family:'lato',sans-serif;
            color:#2a0b25;
        }
        
        #btn_submit{
           width:60%;
           margin-top:4.5%;
           padding:2.25%;
           padding-left:5%;
           padding-right:5%; 
           color:#9a2a7f ;
           border:1.5px solid #9a2a7f;
           background:white;
           outline:none;
           font-family:Fira Sans;
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
        #error,#error1{
            width:92%;
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
      input,#select-style,select>option{
          font-size:2.68vw;
      }
      #btn_submit{
        font-size:3.5vw;
      }
      h3{
          font-size:5.7vw;
      }
      #error,#error1{
          font-size:2.44vw;
          border:0.5px solid #b387d4;
      }
     }              

    </style>
    <script type="text/javascript" src="JS/register.js" />
    <script> </script>
    
</head>
<jsp:include page="Navbar1.jsp"/>
<body>
    <div class="container" style="margin-bottom:7%">
        <div class="row">
            <div class="col-lg-2 col-xs-1"></div>
            <div class="col-lg-8 col-xs-10" style="margin-top:3%">
                <div  class="card" style="width:100%;border:1px #619f98 groove;border-radius:20px">
                    <div class="card-header" style="background:white;border-bottom:1.6px solid #451a90; padding:2%;margin:2%;color:#911747;">
                        <h3 style="font-family:'lato',sans-serif">&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil"></i>&nbsp;&nbsp;&nbsp; Register Here </h3>
                    </div>
                    <div class="card-body" style="text-align:center">
                      <form method="POST" action="RegistrationController"> 
                        <table id="tbl">    
                            <tr>
                              <td><input type="text" name="fname" id="ip_fname" style="width:85%; margin:1.8%; padding:3%;padding-left:6%;padding-right:6%" placeholder="First Name" spellcheck="false"></td>
                              <td><input type="text" name="lname" id="ip_lname" style="width:85%; margin:1.8%; padding:3%;padding-left:6%;padding-right:6%" placeholder="Last Name" spellcheck="false"></td>                            
                            </tr>
  <!------------------------------------------------------------------------------------------------------------------- -->            
                            <tr>
                               <td>
                                   <select name="gender" class="custom-select" id="select-style">
                                      <option name="Male" selected>Male</option>
                                      <option name="Female">Female</option>
                                      <option name="Other">Other</option>
                                  </select>
                               </td>
                               <td><input type="text" name="age" id="ip_age" style="width:85%; margin:1.8%; padding:3%;padding-left:6%;padding-right:6%" placeholder="Age &nbsp; (10-99)" spellcheck="false"></td>
                            </tr>
  <!------------------------------------------------------------------------------------------------------------------- -->                           
                            <tr>
                                <td colspan="2"><input type="email" name="email" id="ip_email" style="width:92%; margin:1.8% ;padding:1.4%;padding-left:3%;padding-right:3%" placeholder="Email address" spellcheck="false"></td>
                            </tr>
  <!------------------------------------------------------------------------------------------------------------------- -->                      
                            <tr>
                               <td><input type="text" name="mobile" id="ip_mobile" style="width:85%; margin:1.8%; padding:3%;padding-left:6%;padding-right:6%" placeholder="Mobile number" spellcheck="false"></td>
                               <td><input type="text" name="alternative_mobile" id="ip_alt_mobile" style="width:85%; margin:1.8%; padding:3%;padding-left:6%;padding-right:6%" placeholder="Alternate Mobile" spellcheck="false"></td>                           
                            </tr>
  <!------------------------------------------------------------------------------------------------------------------- -->                          
                            <tr>
                                <td><input type="text" name="username" id="ip_username" style="width:85%; margin:1.8%; padding:3%;padding-left:6%;padding-right:6%" placeholder="Create Username" spellcheck="false"></td>
                                <td><input type="password" name="password" id="ip_password" style="width:85%; margin:1.8%; padding:3%;padding-left:6%;padding-right:6%" placeholder="Create Password"></td>                               
                            </tr>
                            <tr>
                                <td colspan="2"><label  id="error"></label></td>
                            </tr>
  <!------------------------------------------------------------------------------------------------------------------- -->                
                            <tr>
                               <td colspan="2"><input type="text" name="address" id="ip_address" style="width:92%; margin:1.8% ;padding:1.4%;padding-left:3%;padding-right:3%" placeholder="Complete Home or Shop address" spellcheck="false"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><label  id="error1"></label></td>
                            </tr>
  <!------------------------------------------------------------------------------------------------------------------- -->                           
                            <tr>
                               <td colspan="2"><button type="submit" style="border-top-right-radius:100px; border-bottom-right-radius:100px;" id="btn_submit">Submit&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i></button></td>
                            </tr>
                        </table>
                      </form>   
                    </div>
                </div>
                <div class="col-lg-2 col-xs-1"></div>
            </div>
        </div>
    </div>
    
</body>