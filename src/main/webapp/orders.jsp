<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>


  
  <%@ include file="navbar2.jsp" %>

  <%@ include file="navbar.jsp" %><br><br>

<table class="table">
<h1>Orders</h1>
<thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">User Name</th>
      <th scope="col">User Email</th>
      <th scope="col">Address</th>
      <th scope="col">phno</th>
      <th scope="col">Book Name</th>     
      <th scope="col">Author</th>
      <th scope="col">price</th>
      
      <th scope="col">Payment</th> 
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>@fat</td>
       <td>Mark</td>
       <td>Mark</td>
      <td>Otto</td>
      <td> <a href="" class= "btn btn-sm btn-primary">Edit</a>
          <a href="" class= "btn btn-sm btn-danger">Delete</a></td>
      
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
       <td>Mark</td>
       <td>@fat</td>
       <td>Mark</td>
      <td>Otto</td>
      <td> <a href="" class= "btn btn-sm btn-primary">Edit</a>
          <a href="" class= "btn btn-sm btn-danger">Delete</a></td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
        <td>Otto</td>
        <td>@fat</td>
       <td>Mark</td>
        <td>Otto</td>
         <td> <a href="" class= "btn btn-sm btn-primary">Edit</a>
          <a href="" class= "btn btn-sm btn-danger">Delete</a></td>
    </tr>
  </tbody>
</table>



<br><br>
 <%@ include file="ourPartners.jsp" %>
</body>
</html>