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
           
            .btn-outline-success:focus,.btn-outline-success:hover,.btn-outline-danger:hover,.btn-outline-danger:focus{
                outline:none;
                box-shadow:none;
            }
            #sc{
                color:#b9dcb6;
            }
            
            #div-box{
                margin:0.5%;
                padding:2%;
                background:#fefefe;
                border-radius:5px;
                font-family:Open Sans;
            }
            #btn-left{
                
                
                padding:1.7%;
                border-top-left-radius:111px;
                border-bottom-left-radius:111px;
                text-align:center;
                padding-left:15px;
                padding-right:12px;
            }
            
            #btn-right{
              
                padding:1.7%;
                padding-left:12px;
                padding-right:15px;
                text-align:center;
                border-top-right-radius:111px;
                border-bottom-right-radius:111px;
            }
            #count_input:hover,#count_input:focus
            {
                 outline:none;
                 box-shadow:none;
            }
           
            .fa-minus,.fa-plus
            {
                font-size:12px;
            }
            #notice{
                padding:1%;
                color:#510909;
                font-size:15px;
            }
            
            #a-tag{
                color:#215b2d;
                font-size:15px;
                font-family:Open Sans;
            }
            #ctotal{
                    font-size:15px;
                    padding:0.5%;
                    margin-left:1.6%;
                    color: #165755;
            }
            
            #btn-gp{ font-size:15px; }
            
            #count_input{ color: #47175c; }
            hr{width:0%; border:0.5px solid #c6c6c9 }
            @media screen and (max-width:800px)
            {
                body
                {
                    font-family:'Lato',sans-serif; font-size:2.77vw;
                }
                #count_input,#header,#div-box,#a-tag,#notice,#ctotal
                {
                    font-size:2.66vw;
                }
                .btn ,.btn-outline-success,.btn-outline-danger,#btn-gp
                {
                    font-size:3vw;
                    
                }
                .fa-plus,.fa-minus{ font-size:2.59vw;
                  
                }
            
                }
            }              
 
        </style>
        <script>
        $(document).ready(function(){
            $("hr").delay(30).animate({width:"100%"},"slow"); 
        });
    </script>
    </head>

    <body style="font-family:Lato">
        <% 
            HttpSession hs=request.getSession();
            String c_id= (String) hs.getAttribute("cust_id");
            int customer_id=Integer.parseInt(c_id);
            boolean status=true;
        %>
        
        <jsp:include page="Navbar.jsp" />
        
        <sql:setDataSource var="datasource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/shop?zeroDateTimeBehavior=convertToNull" user="root" password="" />
        
        <sql:query dataSource="${datasource}" var="result">
            select product_id,item_count,product_name,product_weight,product_price from customer_cart where cust_id=<%=customer_id %>;
        </sql:query>
        <sql:query dataSource="${datasource}" var="result1">
            select sum(item_count) as c from customer_cart where cust_id=<%=customer_id %>;
        </sql:query>
            
                 <div class="container" id="header" style="padding-top:32px">
                <div class="row" >
                    <div class="col-xs-12 col-sm-12 col-lg-12 col-md-12">
                        <c:forEach var="r" items="${result1.rows}">
                            <c:if test="${r.c==NULL}">
                            <a id="a-tag">&nbsp;MY SHOPPING CART &nbsp;<a style="background:#fcdcef;padding:0.5%;font-family:Open Sans">&nbsp;0&nbsp;items&nbsp;</a></a>
                            </c:if>
                            <c:if test="${r.c!=NULL}">
                                <a id="a-tag">&nbsp;MY SHOPPING CART &nbsp;<a style="background:#fcdcef;padding:0.5%;font-family:Open Sans">&nbsp;${r.c}&nbsp;<c:if test="${r.c==1}">item</c:if><c:if test="${r.c!=1}">items</c:if>&nbsp;</a></a>    
                            </c:if>
                        </c:forEach>
                            <a href="Welcome.jsp" style="float:right;color:#422148;text-decoration:none;" id="a-tag">+ Add More Products&nbsp;</a><hr><br>
                    </div>
                </div>
            </div>
            <c:if test="${result.rowCount==0}">
                <%  
                    status=false;
                %>
              
            </c:if>   
            
         <div class="container" style="font-size:15px">
          <div class="row">  
            <c:forEach var="row" items="${result.rows}">
              
                <!-- boxes -->  
                <div class="col-xs-12 col-lg-6 col-md-6 col-sm-12">
                   <div id="div-box" class="shadow p-6 mb-5">
                        <label style="margin:1.7%;margin-bottom:2.5%;"><b style="color: #34288b">${row.item_count} &nbsp;</b>x&nbsp; ${row.product_name} , ${row.product_weight}</label>
                        <a href="DeleteProductController?pid=${row.product_id}"><i style="float:right;margin:1.5%;color:#c66969" class="fa fa-remove"></i></a>
                        <br>
                        <form action="UpdateProductController" method="GET">
                        <div style="margin:1.7%;margin-bottom:0%" class="btn-group" id="btn-gp">
                           <button type="submit" value="${row.product_id}" name="b1" id="btn-left" class="btn btn-outline-success" ><i class="fa fa-plus"></i></button>
                           <input type="text" name="x" id="count_input" value="1" style="width:18%; border:1px solid #28a745;border-left:none; border-right:none;padding:1.7%;text-align:center" maxlength="3"/>
                           <button name="b2" value="${row.product_id}" type="submit" id="btn-right" class="btn btn-outline-success"><i class="fa fa-minus"></i></button>
                        </div>
                        </form>
                        <br>
                        <label style="padding-left:1.7% ; font-family:Open Sans"><b><a>${row.item_count}&nbsp; x &nbsp;&#8377 ${row.product_price/row.item_count} &nbsp;=</a><a style="color: #367721">&nbsp; &#8377 ${row.product_price}</a></b></label>
                    </div>
                </div>  
                 
            </c:forEach>    
        
        </div>
     </div>
    
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-lg-12 col-md-12" style="font-family:Open Sans;margin-bottom:12%">
                        <p id="notice">Your minimum order value should be Rs. 1000</p>
                          
                        <%  if(status==false) {  %>
                          <div style="text-align:center;color:#ad0f19;padding-top:3.5%">
                              <a style="padding:2%;border:1px solid #ad0f19;border-radius:100px;background: #fffbfb">YOUR CART IS EMPTY</a></div>
                              
                          <%     } else {   %>   
                             
                            <hr>
                            <sql:query dataSource="${datasource}" var="result2">
                                select sum(product_price) as pp from customer_cart where cust_id=<%=customer_id %>;
                            </sql:query>
                                <c:forEach var="myrow" items="${result2.rows}">
                                    <c:if test="${myrow.pp>=1000.00}">
                                        
                                        <a id="ctotal">CART TOTAL</a><a style="float:right;margin-right:1.6%;"><b>&#8377 ${myrow.pp}&nbsp;&nbsp;</b></a><br><hr>
                                        <a href="DeleteCartController"><button class="btn btn-outline-danger" style="padding:1.2%;padding-left:3%;padding-right:3%;margin-top:2%;margin-left:2%;border-radius:100px">REMOVE ALL</button></a>
                                        <a href="PlaceYourOrder.jsp"><button class="btn btn-outline-success" style="float:right;padding:1.2%;margin-top:2%;border-radius:100px;padding-left:3%;padding-right:3%;margin-right:2%;border-radius:100px">ORDER NOW</button></a></br></br>                                 
                      
                                    </c:if>
                                    <c:if test="${myrow.pp<1000.00}">
                                        <a style="padding:0.5%;margin-left:1.6%;"><b>Cart Total</b></a><a style="float:right;margin-right:1.6%;"><b>&#8377 ${myrow.pp}</b></a><br><hr>
                                        <a href="DeleteCartController"><button class="btn btn-outline-danger" style="padding:1.2%;padding-left:3%;padding-right:3%;margin-top:2%;margin-left:2%;border-radius:100px">REMOVE ALL</button></a></br></br>
                                       
                       
                                      </c:if>
                                </c:forEach>       
                                        
                          <%  }  %>
                          
                    </div>
                </div>
            </div>       
   </body>