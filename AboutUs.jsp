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
    <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>About Us & Contact Us</title>
    <style>
        #about{
            color: #b9dcb6;
        }
        #navbardrop{ color: #b9dcb6;  }
        #ab{  color: #1b2a6d;background: #eaedf8; }
        #card_header{
            border-top-left-radius:15px;
            border-top-right-radius:15px;
            border:2px solid #6ab8a7;
            background:#e8f6f6;
            border-bottom:1px solid #88bbb0;
            color: #593b67;
        }
        #card_body{
            border:2px solid #88bbb0;
            background: #e8f6f6;
            border-bottom-left-radius:15px;
            border-bottom-right-radius:15px;
            font-size:15px;
        }
       @media screen and (max-width:800px)
       { 
         body{
               font-family:'Lato',sans-serif; font-size:2.7vw;
             }
           h3{
              font-size:5.8vw;
             }
           #abtus{
             font-size:2.44vw;
           }
           
        }
    </style>
</head>
<body>
    
    <%  HttpSession hs=request.getSession();
         if(hs.getAttribute("user")==null)
         {    %>
            
            <jsp:include page="Navbar1.jsp"/>    
  
    <%   }   
         else 
         {     %>
              
         <jsp:include page="Navbar.jsp"/>       
   
    <%   }     %>
         
   
    <div class="container" style="font-family:'lato',sans-serif;margin-top:12px;margin-bottom:6%">
        <div class="row">
           <div class="col-xs-12 col-lg-12">
              
               <!--   About Us   -->     
               <div class="card" style="border:none">
                    <div class="card-header" id="card_header"><h3 style="margin:1%;padding:0.5%">About Us</h3></div>
                    <div class="card-body" id="card_body">
                     <p style="margin:1%;padding:0.5%;" id="abtus">
                      Shreenathji Stores was established in 1975. The store has been a pioneer in retail as well as Wholesale Dry Fruits,Sweets & Masala; we been credited for the gifting Dry Fruits on festive occasions. Our all the products are well manufactured & we guranteed of the quality of all the products such as mithais,dry fruits,masala & many more.</br></br>

                      Dry Fruits have been a part of our diet and our culture since times immemorial. Along with the umpteen fitness benefits that they offer, dry fruits are also a brilliant source of essential nutrients and healthy oils that help diminish the risk of chronic diseases. A long shelf life, ease of storage space and transportation make them an inherent part of every dietary suggestion.</br></br>

                      Shreenathji is our endeavour to deliver this goodness right at your doorway. Building on our two decades of promising wholesale operation, we are now foraying into the online space for offering dry fruits online. We aspire to reach out to customers across the country with a thrilling array of Indian and import dry fruits with matchless assortments and mouth-watering variations.</br></br>

                      We offer more than 100+ different varieties of dry fruits and nuts, starting from the usual and the classic, such as basic and salted nuts to exciting new flavours.
                      We particularly obey with the standards of Food Safety and Standards Authority of India (FSSAI) at our cleaning and packaging service. We also follow a severe quality control practices. This helps us ensure that we bring dry fruits and nuts of premium quality and taste.</br>
                    </p>        
                   </div>
                </div>
                    
                <!--   Contact Us   -->     
                <div class="card" style="margin-top:4%;border:none">
                    <div class="card-header" id="card_header"><h3 style="margin:1%;padding:0.5%">Contact Us</h3></div>
                    <div class="card-body" id="card_body">
                     <p style="margin:1%;padding:0.5%;" id="abtus">
                       <i class="fa fa-map-marker" style="color: #4d4d4c">&nbsp;&nbsp;&nbsp;</i><b style="color: #1e144b">Address : </b>&nbsp;297/65,New Anant,Narsee Natha Street,</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Near Fountain,Mumbai-400009</br></br>
                       <i class="fa fa-phone" style="color:#4d4d4c">&nbsp;&nbsp;&nbsp;</i><b style="color: #1e144b">Phone : </b>&nbsp;022 2616 4600</br></br>
                       <i class="fa fa-envelope" style="color: #4d4d4c">&nbsp;&nbsp;&nbsp;</i><b style="color: #1e144b">Email : </b>&nbsp;<a href="mailto:sales@shreenathji.com" style="text-decoration:none;color:#2d214f">sales@shreenathji.com</a></br></br>
                       <i class="fa fa-clock-o" style="color:#4d4d4c">&nbsp;&nbsp;&nbsp;</i><b style="color: #1e144b">Working Days/Hours : </b>&nbsp;Mon - Sun / 9:00 AM - 9:00 PM</br>           
                     </p>        
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>
