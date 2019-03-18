<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
       
       @media screen and (max-width:800px)
       { 
           .nav-link,.dropdown-menu{
               font-size:3.6vw;
           }    
       }  
       
    </style>
    
</head>
<body>
 <nav class="navbar navbar-expand-lg  navbar-dark fixed-top" style="font-family:Mada;background:#140014;font-size:17px" >
  <div class="container">
      <a class="navbar-brand" href="Welcome.jsp" style="color:darkseagreen"><h3 style="font-family:Lato"><i class="fa fa-envira" style="color: darksalmon"></i>&nbsp;&nbsp;Shreenathji&nbsp;&nbsp;&nbsp;</h3></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="nav navbar-nav ml-auto">
      
       <div class="dropdown-divider" style="border-color:#141613"></div> 
       <li class="nav-item">
          <a class="nav-link" href="Welcome.jsp" id="home">&nbsp;&nbsp;&nbsp;<i class="fa fa-home"></i>&nbsp;&nbsp;HOME&nbsp;</a>
      </li>
     
      <div class="dropdown-divider" style="border-color:#141613"></div>
     
      <li class="nav-item ">
         <a class="nav-link" href="OrderSummary.jsp" id="ad">&nbsp;&nbsp;&nbsp;<i class="fa fa-info-circle"></i>&nbsp;&nbsp;ORDER DETAILS&nbsp;</a>
      </li>     
     
      <div class="dropdown-divider" style="border-color:#141613"></div>
      
      <li class="nav-item" >
          <a class="nav-link" href="CustomerCart.jsp" id="sc">&nbsp;&nbsp;&nbsp;<i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;CART&nbsp;</a>
      </li>
      
      <div class="dropdown-divider" style="border-color:#141613"></div>
     
      <li class="nav-item ">
          <a class="nav-link" href="Login.jsp">&nbsp;&nbsp;&nbsp;<i class="fa fa-sign-out"></i>&nbsp;&nbsp;LOGOUT&nbsp;</a>
      </li>    
     
      <div class="dropdown-divider" style=" border-color:#141613"></div>
          
      <!-- Drop-down -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
           &nbsp;&nbsp;&nbsp;&nbsp;OTHERS
       </a>
       <div class="dropdown-menu">
          <a class="dropdown-item" href="AccountDetails.jsp" id="aadd">Account Details</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="ChangePassword.jsp" id="cp">Change Password</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="AboutUs.jsp" id="ab">About</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="TermsAndConditions.jsp" id="tc">Terms</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="DeleteAccountController" id="ea">Delete Account</a>
       </div>
      </li>
  
    </ul>
  </div>
  </div>  
</nav>
    <br><br>
    <br><br>
</body>
</html>
