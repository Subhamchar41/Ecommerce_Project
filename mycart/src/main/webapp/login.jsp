<%-- 
    Document   : login
    Created on : Sep 10, 2020, 11:01:50 AM
    Author     : CHAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Components/common_css_js.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
       <%@include file="Nav/nav.jsp" %>
       <div class="container-fluid"> 
        <div class="row mt-5 coll-md-2 offset-md-3">
            <div class="card my-50">
               <div class="card-body">
                   <form action="LoginServelet" method="post">
           <h3 text-center my-3>Log In Here!!!</h3>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="username" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="userpass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
    <a href="register.jsp">If you not register Click Here</a>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  <button type="warn" class="btn btn-primary">Reset</button>
</form>
     </div> 
      </div>       
       </div>
       </div>
    </body>
</html>
