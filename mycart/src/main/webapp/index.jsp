
<%@page import="java.util.List"%>
<%@page import="com.mycompany.entity.category"%>
<%@page import="java.util.Locale.Category"%>
<%@page import="com.mycompany.userdao.categorydao"%>
<%@page import="com.mycompany.entity.product"%>
<%@page import="com.mycompany.userdao.productdao"%>
<%@page import="com.mycompany.mycart.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp" %>

<script src="js/script.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
    </head>
    <body>
        <%@include file="Nav/nav.jsp" %>
        
         <div class="container admin">
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/headphone.jpg"/>
                            </div>
                            <h1> Headphone</h1>
                            <h1>456</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/shoe.webp"/>
                            </div>
                            <h1>Shoe</h1>
                            <h1>500</h1> 
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/watch.jpeg"/>
                            </div>
                            <h1>Fastrack Watch</h1>
                            <h1>300</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/pent.jpeg"/>
                            </div>
                            <h1>Blue Jeans</h1>
                            <h1>300</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/shirt2.jpeg"/>
                            </div>
                            <h1>T-Shirt</h1>
                            <h1>500</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/iphone11.jpeg"/>
                            </div>
                            <h1>iPhone 11</h1>
                            <h1>₹71,600</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/shirt1.jpeg"/>
                            </div>
                            <h1>Men T-Shirt</h1>
                            <h1>300</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/apple1.jpeg"/>
                            </div>
                            <h1>iPhone SE</h1>
                            <h1>₹37,900</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/canon.jpeg"/>
                            </div>
                            <h1>Canon Color Printer </h1>
                            <h1>₹10,199</h1>
                            <button type="button" class="btn btn-info" onclick="add_to_cart()">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
         <div class="row">
            <%
              productdao dao = new productdao(FactoryProvider.getFactory());
               List<product> list= dao.getAllProducts();
              categorydao cdao = new categorydao(FactoryProvider.getFactory());
             List<category> clist= cdao.getCategories();
               
                %>
            
            <div class="col-md-2">
               <h1><%= clist.size()%></h1> 
                <%
                for(category c : clist){
                    out.println(c.getCategoryTitle());
                }
                %>
            </div>
            
            <div class="col-md-8">
                    <h1>Number of Product is <%= list.size()%></h1>
                <%
                     for(product product : list){
                      out.println(product.getpPhoto());
                      out.println(product.getpName()+ "<br>");
                  }  
                    
                    
                 
                    %>

            </div>
         </div>
   </div>
              
        </div>
 
    </body>

</html>
