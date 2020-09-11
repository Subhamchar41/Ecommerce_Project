<%-- 
    Document   : register
    Created on : Sep 10, 2020, 11:01:40 AM
    Author     : CHAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
    </head>
    <body>
       <%@include file="Nav/nav.jsp" %>
      
        <div class="container-fluid">
       <div class="row mt-5 coll-md-2 offset-md-3">
         
           <div class="card my-50">
               <div class="card-body">
               <from action="RegisterServelet" method="post">
                    <%@include file="Components/messege.jsp" %>
                   <h3 text-center my-3>User Register Here!!!</h3>
                   <div class="form-group">
              <label for="exampleInputEmail1">User Name</label>
              <input name="username" type="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="User Name">
                   </div>
               <div class="form-group">
              <label for="exampleInputEmail1">User Email</label>
              <input name="useremail" type="useremail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="User Email">
                   </div>
                   <div class="form-group">
               <label for="exampleInputPassword1">User Password</label>
               <input  name="userpassword" type="userpassword" class="form-control" id="exampleInputPassword1" placeholder="User Password">
                   </div>
                    <div class="form-group">
               <label for="exampleInputPassword1">User Phone</label>
               <input  name="userphone" type="userphone" class="form-control" id="exampleInputPassword1" placeholder="User Phone">
                   </div>
                    <div class="form-group">
               <label for="exampleInputPassword1">User Address</label>
               <input  name="useraddress" type="useraddress" class="form-control" id="exampleInputPassword1" placeholder="User Address">
                    </div>
                 
               <button type="submit" class="btn btn-primary">Submit</button>
               <button type="warn" class="btn btn-primary">Reset</button>
                     </from>
                   </div> 
                </div>
             </div>
       </div>
    </body>
</html>
