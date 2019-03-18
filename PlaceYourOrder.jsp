<%@page import="java.io.PrintWriter"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <title>customer cart</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
      <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Open Sans" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Noto Sans KR" rel="stylesheet">
      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
           
            .btn-outline-success{ font-size:15px; border-radius:111px;padding:5%; }
            .btn-outline-success:focus,.btn-outline-success:hover,.btn:hover,.btn:focus,.btn-outline-primary:hover,.btn-outline-primary:focus{
                outline:none;
                box-shadow:none;
                
            }
            .btn{ font-size:15px; }
            
            a:hover,a:focus{ text-decoration:none; }
            
            #main-box{
                padding:2%;
                margin:2%;
                font-family:Open Sans;
                font-size:15px;
                color: #0e382f;
                
            }
            th,tr td,table{
                padding:1.8%;
                padding-left:4.5%;
                
            }
            
            #a{
                font-size:15px;
                color:#7a279e;
                
            }
            #input_address{
                font-size:15px;
                font-family:Open Sans;
                border:1px solid #7ebd70;
                text-transform: uppercase;
                padding:14px;
                color:#2f642e;
                margin:2px;
                
                margin-left:0px;
                   
            }
            #input_address:hover,#input_address:focus{
                outline:none;
                box-shadow:none;
             
            }
           #error,#error1{
            width:100%;
            margin-top:2.2%;
            padding:1.1%; 
            padding-left:1.5%; 
            padding-right:1.5%; 
            text-align:left; 
            font-size:14px; 
            border:1px solid #b387d4;
            border-radius:5px;
            color:#ba0e18;
        }
        #address-toggle{
                font-size:14px;
                color: #164597;
                cursor:pointer;
            
        }
        #small{
                font-size:14px;
                color: #0d3312;
               
        }
            
             @media screen and (max-width:800px)
            {
                body{
                       font-family:Open Sans; font-size:2.77vw;
                  }
                  #main-box,#a,#ax,#small,#input_address,#address-toggle{
                       font-family:Open Sans; font-size:2.45vw;
                  }
                  .btn,.btn-outline-success,#btn_submit{
                      font-size:2.45vw;
                  }
                  .btn-outline-primary{
                      font-size:3vw;
                  }
            }      
    
         </style>
         <script>
             $(document).ready(function(){
                
                  $("#error1").hide();
                  $("#input_address").keyup(function(){
                   
                  var address=$.trim($(this).val());
                  var pattern=/^[A-Za-z0-9'\.\-\s\,\/]{30,180}$/;
                  if(!pattern.test(address))
                  {
                      
                      $(this).css('border','1px solid #cf5357');
                      $("#btn_submit").hide();
                      $("#address-toggle").hide();
                      $("#error1").html("Address must contain minimum 30 and maximum 180 characters.").show();            
                  }
                
                else
                {
                    $("#error1").hide();
                    $(this).css('border','1px solid #7ebd70');
                    $("#btn_submit").show();
                    $("#address-toggle").show();
                }                  
            });
            
            $("#input_address").css('background','#fcfcfc');
            $("#input_address").prop('disabled',true);
            $("#btn_submit").hide();  
            
            $("#address-toggle").click(function ()
            {
              if($("#btn_submit").is(":hidden"))
              {
                 $("#btn_submit").show();
                 $("#input_address").css('background','white');
                 $("#input_address").prop('disabled',false);
                 $("#address-toggle").html("DON'T CHANGE");
              }
              else
              {
                 $("#btn_submit").hide();
                 $("#input_address").css('background','#fcfcfc');
                 $("#input_address").prop('disabled',true);
                 $("#address-toggle").html("CLICK HERE TO CHANGE");
              }
             
                   
            });
            
            $(".btn-outline-primary").click(function(){
                $(".btn-outline-primary").html("&nbsp;&nbsp;&nbsp;<i class='fa fa-circle-o-notch fa-spin'></i>&nbsp;&nbsp;&nbsp;PREPAIRING YOUR ORDER&nbsp;&nbsp;&nbsp;").prop('disabled',true);
            });

        });
         </script>
        
    </head>
    <body>
        <jsp:include page="Navbar.jsp"/>
        <%  
            HttpSession hs=request.getSession();
            int customer_id=Integer.parseInt((String)hs.getAttribute("cust_id"));
          
        %>
       
        <sql:setDataSource var="datasource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/shop?zeroDateTimeBehavior=convertToNull" user="root" password="" />
        
        <sql:query dataSource="${datasource}" var="result1">
            select sum(product_price) as pprice from customer_cart where cust_id=<%=customer_id %>;
        </sql:query>
        
        <!-- if total order price is < 1000 Rs. then go to Welcome Page -->     
        
        <c:forEach var="item" items="${result1.rows}">
           <c:set var="totalprice" value="${item.pprice}" />
        </c:forEach>     
        <c:if test="${totalprice < 1000 or totalprice ==null}">
           <%  response.sendRedirect("Welcome.jsp");  %>
        </c:if>    
        
        <!-- end comment -->    
        
        <sql:query dataSource="${datasource}" var="result">
            select item_count,product_name,product_weight,product_price from customer_cart where cust_id=<%=customer_id %>;
        </sql:query>
            
        <sql:query dataSource="${datasource}" var="result3">
            select address from customer where cust_id=<%=customer_id %>;
        </sql:query>
        
        <div class="container" style="margin-top:16px">
            <div class="row">
                <div class="col-xs-12 col-lg-12">
                    <div id="main-box">
                        <a href="CustomerCart.jsp" style="float:right"><button class="btn btn-outline-success">&nbsp;&nbsp;&nbsp;GO BACK TO CART&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;</a>
                        <br>
                        <a id="a">ORDER REVIEW&nbsp;&nbsp;</a><i class="fa fa-angle-right"></i>
                        <hr id="h"></br>
                        <table style="width:100%;border-radius:8px;background: #f6fbf6" class="shadow mb-6 p-5">
                            <tr style="border-bottom:2px solid  #d3ddd8">
                                <th  style="border-right:1px solid #dee3ef">PRODUCTS</th>
                                <th>PRICE</th>
                            </tr>
                            
                            <c:forEach var="row" items="${result.rows}">  
                            <tr style="border-top:1px solid #dee3ef"> 
                                <td style="border-right:1px solid #dee3ef">${row.item_count} x ${row.product_name} , ${row.product_weight}</td>
                                <td>&#8377 ${row.product_price}</td>
                            </tr>
                            </c:forEach>
                            
                            <c:forEach var="row" items="${result1.rows}">
                                <tr style="border-top:2px solid #9ec6b2"> 
                                <td style="border-right:0.6px solid #9ec6b2;"><b>TOTAL</b></td>
                                <th>&#8377 ${row.pprice}</th>
                            </tr>
                            <tr style="border-top:0.6px solid #9ec6b2;"> 
                                <th style="border-right:0.6px solid #9ec6b2;">DELIVERY</th>                                
                                <th style="color:#70097a">FREE</th>
                            </tr>
                            <tr style="border-top:0.6px solid #9ec6b2"> 
                                <th style="border-right:0.6px solid #9ec6b2;">GRAND TOTAL</th>
                                <th style="color:#192453">&#8377 ${row.pprice}</th>
                            </tr>
                            </c:forEach>      
                        </table>
                        <br><hr style="border:1px solid #d3ddd8">
                        <a id="small">&nbsp;CHECK YOUR DELIVERY ADDRESS<a  id="address-toggle" style="float: right">CLICK HERE TO CHANGE</a></a>
                            </br>
                            </br>
                            <c:forEach var="r" items="${result3.rows}">
                                <c:set var="x" value="${r.address}"></c:set>
                            </c:forEach>
                            
                            <form method="POST" action="ChangeAddressController">
                           
                               <div class="btn-group" style="width:100%">
                                 <input  type="text" value="${x}" id="input_address" name="address" style="width:100%" spellcheck="false"/>
                                 <button type="submit" class="btn shadow-sm" id="btn_submit">&nbsp;&nbsp;CHANGE ADDRESS&nbsp;&nbsp;</button>
                               </div>
        
                            </br>
                            <label id="error1"></label></br>    
                        </form>
                        
                        <hr style="border:1px solid #d3ddd8">
                        <a id="small">&nbsp;PAYMENT MODE<a id="small" style="float:right;color:#971697">CASH ON DELIVERY</a></a><br>
                        <hr style="border:1px solid #d3ddd8">
                        <br><br>
                        
                        <div style="text-align:center"><a href="PlaceOrder?id=<%=customer_id %>"><button id="button" style="margin-right:2%;padding:1.9%;border-radius:111px;" class="btn btn-outline-primary shadow-sm">&nbsp;&nbsp;&nbsp;&nbsp;PLACE YOUR ORDER&nbsp;&nbsp;&nbsp;&nbsp;</button></a>
                        </a></div>
                        <br><br><br><br><br><br><br>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>