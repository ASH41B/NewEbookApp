<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<div class= "" style="background-color:#ade0ee; font-size: 30px;" >
    <center>
      <a class="navbar-brand" href="#" >Hello User </a>
  </center>
 </div>

<%@ include file="navbar2.jsp" %>

  <%@ include file="navbar.jsp" %>

 
    <center>
    
    <!--
    <div class="col"><div class="card" style="width: 18rem;">
  <div class="card-body border-3">
    <h5 class="card-title"><i class="fa-solid fa-cart-shopping fa-3x"></i></h5>
    <a href="orders.jsp" class="btn btn-success">Order</a>
  </div>
</div></div><br>-->
    
    <div class="col"><div class="card" style="width: 18rem;">
  <div class="card-body border-3">
    <h5 class="card-title"><i class="fa-solid fa-arrow-up-from-bracket fa-3x"></i></h5>
    <p class="card-text"></p>
    <a href="index.jsp" class="btn btn-success">Logout</a>
  </div>
</div></div><br>
</center>
  
 
 <%@ include file="ourPartners.jsp" %>
 <br><br><br>
</body>
</html>