

<%@page import="com.mycompany.entity.User"%>

<%
User user1 = (User)session.getAttribute("current-user");
%>
<link rel="stylesheet" href="css/style.css">
<div class="bg-random">
<nav class="navbar navbar-expand-lg bg-random">
  <a class="navbar-brand" href="index.jsp">My Cart</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
   
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
      <li class="nav-item active" >
          <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-cart-plus" style="font-size: 25px;"></i> <span style="font-size: 20px;" cart-item>(5)</span> </a>
      </li>
      
   <% 
   if (user1==null){
       %>
        <div class="navbar-nav ml-auto">
          <li class="nav-item active" >
        <a class="nav-link" href="login.jsp">LogIn </a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register </a>
      </li>
     </div>
       
       <% 
   }else{
         %>
          <div class="navbar-nav ml-auto">
          <li class="nav-item active" >
        <a class="nav-link" href="#"><%= user1.getUserName()%> </a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="logout.jsp">LogOut </a>
      </li>
     </div>
      <%   
   }
   %>
  </div>
 
</nav>
</div>