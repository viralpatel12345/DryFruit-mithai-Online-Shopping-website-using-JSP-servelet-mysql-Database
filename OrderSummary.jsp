<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <link href="https://fonts.googleapis.com/css?family=Mada" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Login</title>
    <style>
   
     #ad{ color:#b9dcb6; }   
     
     #box-container{
         color:#0e222e;
         padding:1.5%;
         margin:2%;
         font-family:Mada;
         font-size:15px;
     }
     #tbl,tr,td,th{
         
         border:0.5px solid #dcd7db;
         padding-left:2.5%;
         padding-right:1.5%;
         padding:1.35%;
       
     }
     .btn-outline-success{
         border-radius:100px;
         font-size:17px;
         margin:1%;
     }
     .btn-outline-success:hover,.btn-outline-success:focus{
         box-shadow:none;
         outline:none;
     }
     #x{
         font-size:17px;
         padding:1.4%;
         border:0.6px solid #a2c89e;
         border-radius:111px;
         padding-left:2.1%;
         font-family:Mada;
         text-transform:uppercase;
     }
    
    @media screen and (max-width:800px)
     {
      body{
           font-family:Mada; font-size:2.77vw;
      }
      #box-container{
          font-size:2.6vw; 
      }
      .btn,.btn-outline-success{
          font-size:2.75vw;
      }
      #x{
          font-size:2.5vw;
      }
     }              
        
    </style>
    
</head>
<body>
    <jsp:include page="Navbar.jsp"/>
    <% 
        HttpSession hs=request.getSession();
        int custid=Integer.parseInt((String)hs.getAttribute("cust_id"));
    %> 
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-lg-12">
                <div id="box-container" style="margin-top:15px">
                   <br>
                   <p id="x">For any details feel free to contact us on +91 9892173323</p>
                   <a href="Welcome.jsp" style="float:right;text-decoration:none"><button class="btn btn-outline-success">&nbsp;&nbsp;&nbsp;CONTINUE SHOPPING&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;</a>
                   <br><a>&nbsp;ORDER DETAILS&nbsp;&nbsp;&nbsp;</a><i class="fa fa-angle-right"></i><hr style="border:0.5px solid #a89fa8"><br><br>
                   <sql:setDataSource var="datasource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/shop?zeroDateTimeBehavior=convertToNull" user="root" password="" />
                    
                   <sql:query dataSource="${datasource}" var="result1">
                       select order_id,order_time,delivery_status from customer_order_mapping where cust_id=<%=custid %> order by delivery_status desc;
                   </sql:query>
                   
                   <c:forEach var="row" items="${result1.rows}">      
                   
                    <table id="tbl" style="width:100%;">
                        <tr>
                            <td>ORDER ID</td>
                            <td  colspan="2" style="color:#64157a">${row.order_id}</td>
                        </tr>
                        <tr>
                            <c:if test="${row.delivery_status=='Undelivered'}">
                            <td>DELIVERY STATUS</td>
                            <td style="color:#7e1626;text-transform:uppercase">${row.delivery_status}</td>
                            <td style="color:#1e520a">FREE DELIVERY</td>
                            </c:if>
                            <c:if test="${row.delivery_status=='Delivered'}">
                            <td>DELIVERY STATUS</td>
                            <td style="color:#0a5203;text-transform:uppercase">${row.delivery_status}&nbsp;&nbsp;&nbsp;<i class="fa fa-check"></i></td>
                            <td style="color:#1e520a">FREE DELIVERY</td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>ORDER TIME</td>
                            <td colspan="2" style="color:#64157a;text-transform:uppercase">${row.order_time}</td>
                        </tr>
                        <tr>
                            <td>MODE OF PAYMENT</td>
                            <td colspan="2" style="color:#64157a">CASH ON DELIVERY</td>
                            
                        </tr>
                    </table>
                    <c:set var="total" value="0.00" />
                    <sql:query dataSource="${datasource}" var="result2">
                        select product_name,product_weight,item_count,product_price from order_details where order_id='${row.order_id}'    
                    </sql:query>
                        
                        
                    <table style="margin-top:0px;width:100%;color: #09155c">
                        <tr>
                            <td style="border-top:1.5px solid #cec7cc;border-bottom:2px solid #cec7cc;color:#891068">PRODUCT DESCRIPTION</td>
                            <td style="border-top:1.5px solid #cec7cc;border-bottom:2px solid #cec7cc;color:#891068">PRICE</td>
                        </tr>
                        <c:forEach var="r" items="${result2.rows}">
                        <tr>
                            <td style="font-family:Mada">${r.item_count} x ${r.product_name} , ${r.product_weight}</td>
                            <td>${r.product_price}</td>
                        </tr>
                        <c:set var="total" value="${r.product_price + total}" />
                        </c:forEach>
                        <tr>
                            <td style="border:2px solid #b2cbbb;">TOTAL</td>
                            <td style="border:2px solid #b2cbbb;color: #174008">${total}</td>
                        </tr>
                        
                    </table>
                        <br><br><hr style="border:0.5px solid #a89fa8"><br><br>
                    
                   </c:forEach> 

                </div>
            </div>
        </div>
    </div>
</body>