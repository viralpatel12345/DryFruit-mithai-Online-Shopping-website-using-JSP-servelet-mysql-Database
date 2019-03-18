<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.niit.container.AddToCartController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto Sans KR" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Fira Sans" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="engine1/style.css" />
    
    <script type="text/javascript" src="engine1/jquery.js"></script>


    <title>Welcome</title>
    <style>
        #home{
            color:#b9dcb6; 
        }
       @media screen and (max-width:800px)
       { 
        
          body{
                font-family:'Lato',sans-serif; font-size:2.7vw;
              }
           h3{
              font-size:5.75vw;
             }
           h5{  font-size:4.5vw;   }
            
           #product_label{
                 font-size:2.45vw;
             }
             .btn .btn-outline-success{
                 font-size:2.55vw;
             }
             #div-container{
                 font-size:2.50vw;
             }
       }
    </style>
</head>
<body style="background-color:#f1f7f7;margin:auto">
    
   
    <jsp:include page="Navbar.jsp"/>
	<!-- Start WOWSlider.com BODY section --> <!-- add to the <body> of your page -->
        <div class="container">
          <div class="row">
            <div class="col-lg-1"></div> <!--70999a-->
            <div class="col-xs-12 col-md-12 col-lg-10 shadow p-6 mb-5" style="background:#7ba39d;padding:35px;border-top-left-radius:65px;border-bottom-right-radius:65px;margin:8px">
              <div id="wowslider-container1">
  	       <div class="ws_images"><ul>
		<li><img src="data1/images/pure_almonds.jpg" alt="Pure Almonds" title="Pure Almonds" id="wows1_0"/></li>
		<li><img src="data1/images/afghani_anjeer.jpg" alt="Afghani Anjeer" title="Afghani Anjeer" id="wows1_1"/></li>
		<li><img src="data1/images/cashew_nuts.jpg" alt="Pure Cashew Nuts" title="Pure Cashews" id="wows1_2"/></li>
		<li><img src="data1/images/golden_walnut.jpg" alt="Golden Walnut" title="Golden Walnut" id="wows1_3"/></li>
		<li><img src="data1/images/fancyalmondsroastedsalted.jpg" alt="Salted Almonds" title="Salted Almonds" id="wows1_4"/></li>
		<li><img src="data1/images/arabian_dates.jpg" alt="Arabian Dates" title="Arabian Dates" id="wows1_5"/></li>
		<li><img src="data1/images/ajwa_dates__black.jpg" alt="Black Ajwa Dates" title="Black Ajwa Dates" id="wows1_6"/></li>
		<li><img src="data1/images/black_kismis.jpg" alt="BLACK RAISIN" title="BLACK RAISIN" id="wows1_7"/></li>
		<li><img src="data1/images/kismis_green.jpg" alt="Green Kismis" title="Green Kismis" id="wows1_8"/></li>
		<li><img src="data1/images/cardamom.jpg" alt="Green Elaichi" title="Green Elaichi" id="wows1_9"/></li>
		<li><img src="data1/images/datesajwa.jpg" alt="Ajwa Dates" title="Ajwa Dates" id="wows1_10"/></li>
		<li><img src="data1/images/green_ealichi.jpg" alt="Healthy Ealichi" title="Healthy Ealichi" id="wows1_11"/></li>
		<li><img src="data1/images/pure_golden_kismis.jpg" alt="pure Golden Kismis" title="Golden Kismis" id="wows1_12"/></li>
		<li><img src="data1/images/roasting_dried_dates.jpg" alt="Roasted Dried Dates" title="Roasted Dried Dates" id="wows1_13"/></li>
		<li><img src="data1/images/pure_quality_anjeer.jpg" alt="High Quality anjeer" title="Anjeer" id="wows1_14"/></li>
		<li><img src="data1/images/roasted_cashew.jpg" alt="Roasted Cashew" title="Roasted Cashews" id="wows1_15"/></li>
		<li><img src="data1/images/salted_almonds.jpg" alt="Salted Almonds" title="Salted Almonds" id="wows1_16"/></li>
		<li><img src="data1/images/vitamin_e_riched_almonds.jpg" alt="American Almonds" title="American Almonds" id="wows1_17"/></li>
		<li><img src="data1/images/sweet_cashew.jpg" alt="Sweet Cashews" title="Sweet Cashews" id="wows1_18"/></li>
		<li><img src="data1/images/walnut.jpg" alt="Walnut" title="Walnut" id="wows1_19"/></li>
		<li><img src="data1/images/goakaju.jpg" alt="GOA KAJU" title="GOA KAJU" id="wows1_20"/></li>
		<li><img src="data1/images/mamra_badam.jpg" alt="MAMRA BADAM" title="MAMRA BADAM" id="wows1_30"/></li>
		<li><img src="data1/images/masala_kaju.jpg" alt="Masala Kaju" title="Masala Kaju" id="wows1_31"/></li>
		<li><img src="data1/images/small_kaju.jpg" alt="Small Kaju" title="Small Kaju" id="wows1_32"/></li>
		<li><a href="http://wowslider.net"><img src="data1/images/pisori_pista.jpg" alt="bootstrap carousel example" title="PISORI PISTA" id="wows1_33"/></a></li>
		<li><img src="data1/images/pure_almonds_0.png" alt="Almonds" title="Almonds" id="wows1_34"/></li>
                <li><img src="data1/images/mix_mithai.png" alt="mix mithai" title="mix mithai" id="wows1_22"/></li>
				<li><img src="data1/images/angoori_rasgulla.jpg" alt="Angoori Rasgulla" title="Angoori Rasgulla" id="wows1_21"/></li>
                <li><img src="data1/images/bengali_rasgulla.jpg" alt="Bengali Rasgulla" title="Bengali Rasgulla" id="wows1_23"/></li>
		<li><img src="data1/images/dabang_laddu.jpg" alt="DABANG LADDU" title="DABANG LADDU" id="wows1_24"/></li>
		<li><img src="data1/images/gulabjamun.jpg" alt="GULAB JAMUN" title="GULAB JAMUN" id="wows1_25"/></li>
		<li><img src="data1/images/kesarpenda01.jpg" alt="kesar penda" title="kesar penda" id="wows1_26"/></li>
		<li><img src="data1/images/malaipenda.jpg" alt="MALAI PENDA" title="MALAI PENDA" id="wows1_27"/></li>
		<li><img src="data1/images/rasgulla.jpg" alt="Rasgulla" title="Rasgulla" id="wows1_28"/></li>
		<li><img src="data1/images/shahigulab50.jpg" alt="Shahi Gulab" title="Shahi Gulab" id="wows1_29"/></li>
		</ul></div>
	<div class="ws_thumbs">
               <div>
		<a href="#" title="Pure Almonds"><img src="data1/tooltips/pure_almonds.jpg" alt="" /></a>
		<a href="#" title="Afghani Anjeer"><img src="data1/tooltips/afghani_anjeer.jpg" alt="" /></a>
		<a href="#" title="Pure Cashews"><img src="data1/tooltips/cashew_nuts.jpg" alt="" /></a>
		<a href="#" title="Golden Walnut"><img src="data1/tooltips/golden_walnut.jpg" alt="" /></a>
		<a href="#" title="Salted Almonds"><img src="data1/tooltips/fancyalmondsroastedsalted.jpg" alt="" /></a>
		<a href="#" title="Arabian Dates"><img src="data1/tooltips/arabian_dates.jpg" alt="" /></a>
		<a href="#" title="Black Ajwa Dates"><img src="data1/tooltips/ajwa_dates__black.jpg" alt="" /></a>
		<a href="#" title="Black Raisin"><img src="data1/tooltips/black_kismis.jpg" alt="" /></a>
		<a href="#" title="Green Kismis"><img src="data1/tooltips/kismis_green.jpg" alt="" /></a>
		<a href="#" title="Green Elaichi"><img src="data1/tooltips/cardamom.jpg" alt="" /></a>
		<a href="#" title="Ajwa Dates"><img src="data1/tooltips/datesajwa.jpg" alt="" /></a>
		<a href="#" title="Healthy Ealichi"><img src="data1/tooltips/green_ealichi.jpg" alt="" /></a>
		<a href="#" title="pure Golden Kismis"><img src="data1/tooltips/pure_golden_kismis.jpg" alt="" /></a>
		<a href="#" title="Roasted Dried Dates"><img src="data1/tooltips/roasting_dried_dates.jpg" alt="" /></a>
		<a href="#" title="Anjeer"><img src="data1/tooltips/pure_quality_anjeer.jpg" alt="" /></a>
		<a href="#" title="Roasted Cashews"><img src="data1/tooltips/roasted_cashew.jpg" alt="" /></a>
		<a href="#" title="Salted Almonds"><img src="data1/tooltips/salted_almonds.jpg" alt="" /></a>
		<a href="#" title="American Almonds"><img src="data1/tooltips/vitamin_e_riched_almonds.jpg" alt="" /></a>
		<a href="#" title="Sweet Cashews"><img src="data1/tooltips/sweet_cashew.jpg" alt="" /></a>
		<a href="#" title="Walnut"><img src="data1/tooltips/walnut.jpg" alt="" /></a>
		<a href="#" title="Goa Kaju"><img src="data1/tooltips/goakaju.jpg" alt="" /></a>
		<a href="#" title="Mamra Badam"><img src="data1/tooltips/mamra_badam.jpg" alt="" /></a>
		<a href="#" title="Masala Kaju"><img src="data1/tooltips/masala_kaju.jpg" alt="" /></a>
		<a href="#" title="Small Kaju"><img src="data1/tooltips/small_kaju.jpg" alt="" /></a>
		<a href="#" title="Pisori Pista"><img src="data1/tooltips/pisori_pista.jpg" alt="" /></a>
		<a href="#" title="Almonds"><img src="data1/tooltips/pure_almonds_0.png" alt="" /></a>
                <a href="#" title="Mix Mithai"><img src="data1/tooltips/mix_mithai.png" alt="" /></a>
                <a href="#" title="Angoori Rasgulla"><img src="data1/tooltips/angoori_rasgulla.jpg" alt="" /></a>
                <a href="#" title="Bengali Rasgulla"><img src="data1/tooltips/bengali_rasgulla.jpg" alt="" /></a>
		<a href="#" title="Dabang Laddu"><img src="data1/tooltips/dabang_laddu.jpg" alt="" /></a>
		<a href="#" title="Gulab Jamun"><img src="data1/tooltips/gulabjamun.jpg" alt="" /></a>
		<a href="#" title="Kesar Penda"><img src="data1/tooltips/kesarpenda01.jpg" alt="" /></a>
		<a href="#" title="Malai Penda"><img src="data1/tooltips/malaipenda.jpg" alt="" /></a>
		<a href="#" title="Rasgulla"><img src="data1/tooltips/rasgulla.jpg" alt="" /></a>
		<a href="#" title="Shahi Gulab"><img src="data1/tooltips/shahigulab50.jpg" alt="" /></a>
	</div>
</div>
<div class="ws_script" style="position:absolute;"><a href="http://wowslider.net">image carousel</a> by WOWSlider.com v8.8</div>
	<div class="ws_shadow"></div>
	</div>	
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>
	<!-- End WOWSlider.com BODY section -->
       </div>
      </div>
    </div>
 <!-- ---------------------- wow slider body end --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
        
 
   <sql:setDataSource var="sqldata" user="root" password="" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/shop?zeroDateTimeBehavior=convertToNull"/>
   <sql:query dataSource="${sqldata}" var="result">
       select product_id,product_name,product_weight,product_price,product_file from products;
   </sql:query>         
   
       
       
   <div class="container" style="font-family:Lato;margin-top:2%;">
     <div class="row">
         <div class="col-xs-6 col-lg-12">
             <h5 style="text-align:center;font-family:Fira Sans">BUY SWEETS & DRY FRUIT</h5>
             <hr><br>
         </div>
     </div>
   </div>
   <div class="container" style="font-family:Lato;margin-bottom:6%">
     <div class="row">
              
       <c:forEach var="row" items="${result.rows}">
         
           <div class="col-lg-3 col-xs-12 col-md-4">      
               <div style="margin:2.5%; border:2px solid #dcdede; padding:7px" id="div-container">
                 <img class="img-fluid" src="Img/${row.product_file}" alt="${row.product_name}" style="max-width:100%;height:auto"/>
              </div>
              <div style="text-align:center;font-size:15px;margin-bottom:17%" id="product_label">
                 <label style="margin-bottom:2.5%;color: #2b2f65">${row.product_name} , ${row.product_weight}</label><br>
                 <b style="color:green">&#8377 ${row.product_price}</b><br>
                 <a href="AddToCartController?id=${row.product_id}"><button type="submit" class="btn btn-outline-success" style="margin-top:4.5%;font-family:Fira Sans;font-size:15px;border-radius:120px;">&nbsp;<i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;ADD TO CART&nbsp;</button></a>
              </div>
           </div>
              
       </c:forEach>   
             
     </div>
   </div> 
</body>

</html>