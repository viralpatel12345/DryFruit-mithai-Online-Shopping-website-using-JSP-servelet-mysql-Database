<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        
       @media screen and (max-width:800px)
       { 
           .nav-link{
               font-size:3.6vw;
           }    
       }
    </style>
</head>
<body>
 <nav class="navbar navbar-expand-md  navbar-dark fixed-top" style="font-family:Mada;background:#140014;font-size:17px;" >
  <div class="container">
      <a class="navbar-brand" href="Login.jsp" style="color:darkseagreen;"><h3 style="font-family:Lato"><i class="fa fa-envira" style="color: darksalmon;"></i>&nbsp;&nbsp;Shreenathji&nbsp;&nbsp;&nbsp;</h3></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
      <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="nav navbar-nav ml-auto">
      <div class="dropdown-divider" style="border-color:#141613"></div>
      <li class="nav-item">
          <a class="nav-link" href="Login.jsp" id="home">&nbsp;&nbsp;&nbsp;<i class="fa fa-home"></i>&nbsp;&nbsp;HOME</a>
      </li>
      <div class="dropdown-divider" style="border-color:#141613"></div>
      <li class="nav-item" >
          <a class="nav-link" href="AboutUs.jsp" id="about">&nbsp;&nbsp;&nbsp;<i class="fa fa-info-circle"></i>&nbsp;&nbsp;ABOUT</a>
      </li>
      <div class="dropdown-divider" style="border-color:#141613"></div>
      <li class="nav-item" >
        <a class="nav-link" href="TermsAndConditions.jsp" id="terms">&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;TERMS&nbsp;</a>
      </li>
  
    </ul>
  </div>
  </div>  
</nav>
    <br><br>
    <br><br>
</body>
</html>
