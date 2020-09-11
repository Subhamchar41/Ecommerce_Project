
<%@page import="com.mycompany.entity.User"%>
<% 
User user = (User)session.getAttribute("current-user");
  if (user==null){
           session.setAttribute("messege","Log in first");
           response.sendRedirect("login.jsp");
           return;
           }else{
      if(user.getUserType().equals("normal")){
           session.setAttribute("messege","You are not admin");
           response.sendRedirect("login.jsp");
           return;
      }
  }

%>



<%@page import="java.util.List"%>
<%@page import="java.util.Locale.Category"%>
<%@page import="com.mycompany.entity.category"%>
<%@page import="com.mycompany.userdao.categorydao"%>
<%@page import="com.mycompany.mycart.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%@include file="Nav/nav.jsp" %>
        <div class="container admin">
            <div class="row">
                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/person.png"/>
                            </div>
                            <h1>2345</h1>
                            <h1>Users</h1>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/list.png"/>
                            </div>
                            <h1>6535</h1>
                            <h1>Categories</h1>
                        </div>
                    </div>
                </div>
                
                 <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/product.png"/>
                            </div>
                            <h1>6458</h1>
                            <h1>Products</h1>
                        </div>
                    </div>
                </div>
                
                
                <div class="col-md-6">
                    <div class="card" >
                        <div class="card-body text-center" data-toggle="modal" data-target="#Modal">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/calculator.png"/>
                            </div>
                            <p>Click Here</p>
                            <h1>Add Categories</h1>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body text-center" data-toggle="modal" data-target="#Modal2">
                            <div class="container">
                                <img style="max-width: 150px;" class="img-fluid" src="image/add.png"/>
                            </div>
                            <p>Click Here</p>
                            <h1>Add Product</h1>
                        </div>
                    </div>
                </div>
            </div>
              
        </div>
        



<!-- Modal -->
<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServelet" method="post">
              <input type="hidden" name="operation" value="addcategroy">
           
  <div class="form-group">
    <label for="exampleInputEmail1">Title</label>
    <input name="Title" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Category Title">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Description</label>
    <input name="Description" type="text" class="form-control" id="exampleInputPassword1" placeholder="Category Description">
   
  </div>
  <button type="submit" class="btn btn-primary">Add Category</button>
  <button type="reset" class="btn btn-warning">Reset</button>
</form>
      </div>    
    </div>
  </div>
</div>



<div class="modal fade" id="Modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form action="ProductOperationServelet" method="post" enctype="multipart/from-data">
             <input type="hidden" name="operation" value="addproduct">
           
  <div class="form-group">
    <label for="exampleInputPassword1">Name</label>
    <input name="pName" type="text" class="form-control" id="exampleInputPassword1" placeholder="Product Name">
   
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Description</label>
    <input name="pDesc" type="text" class="form-control" id="exampleInputPassword1" placeholder="Product Description">
   
  </div>
             <div class="form-group">
    <label for="exampleInputPassword1">Photo</label>
    <input name="pPic" type="file" requered>
   
  </div>
             <div class="form-group">
    <label for="exampleInputPassword1">Price</label>
    <input name="pPrice" type="numeric" class="form-control" id="exampleInputPassword1" placeholder="Product Price">
   
  </div>
             <div class="form-group">
    <label for="exampleInputPassword1">Discount</label>
    <input name="pDiscount" type="numeric" class="form-control" id="exampleInputPassword1" placeholder="Product Discount">
   
  </div>
             <% 
             categorydao cdao = new categorydao(FactoryProvider.getFactory());
             List<Category> list= cdao.getCategories();
             %>
             <div class="form-group">
      <label for="exampleInputPassword1">Category</label>
    <select name="catId" class="from-control">
        <option value="laptop">Laptop</option>
        <option value="laptop">Laptop</option>
        <option value="laptop">Laptop</option>
        <option value="laptop">Laptop</option>
        <option value="laptop">Laptop</option>
    </select>
  </div>
             
  <button type="submit" class="btn btn-primary">Add Product</button>
  <button type="reset" class="btn btn-warning">Reset</button>
</form>
      </div>
    </div>
  </div>
</div>

    </body>
</html>
