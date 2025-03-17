<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
    <%@ include file="navbar2.jsp" %>

  <%@ include file="navbar.jsp" %>
 
    <br><br><br>
  <%-- 
  <%@ include file="Caraousel.jsp" %> --%>
  
  <div class ="Container" style="background:linear-gradient(136deg,rgb(151,37,133) 0%,rgb(18,56,126)100%)">
   <center>
   <br><br><br><br><br><br><br>
  <h1 style=" color:white" >Explore Our Library</h1><br>
   
 <%-- <form class="col-6" role="search">
        <input class="form-control me-2 " style="border-width: 5px" ; type="search" placeholder="Search Title, Author or ISBN" aria-label="Search"><br>
        <button class="btn btn-outline-success" type="submit">Search</button><br><br><br><br><br><br><br>
      </form   --%>
      </center>
      
  </div>
  
  <br><br><br><br>

<%@ include file="featured.jsp" %>

</body>
</html>