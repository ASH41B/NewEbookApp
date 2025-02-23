<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<link rel="stylesheet" href="style.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>
<body>



<%@ include file="navbar2.jsp" %>
  <%@ include file="navbar.jsp" %>


<section id ="contact">	
<div class= "container-lg">
<div class= "text-center">
<br><br>
<h2>Get in Touch</h2><!-- 
<h4>Have a question? We are here to help.</h4>	 -->
<p class= "lead">Questions to ask</p>
<!-- <h2>Contact Form</h2> -->

</div>
<div class= "row-justify-content-center my-5">
<div class= "col-l-6">
<form> 
   <label for="email" class="form-label" >Email address: 	</label>
   <input type= "email" class= 	"form-control" id="email" placeholder= "johndoe@gmail.com"></input>	
   <label for="name" class="form-label"  >Name: 	</label>
   <input type= "text" class= 	"form-control" id="name" placeholder= "john"></input>	
   
   
   <label for="subject" class="form-label">What is your question about?	</label>
   <select  class= 	"form-select" id="subject">
   <option value= "request book" selected >Request Book</option>
   
   <option value= "Content query" selected >Content query</option>
   
   <option value= "other" selected >Other</option>
   </select>	
   
   <label for="query" class= "form-label" >Your Query: </label>
   <textarea id	="query" class= "form-control" 	cols="30" rows="10" placeholder= "Your Query..."></textarea><br>
    
   <center>
   <button class= "btn btn-success btn-lg" value="submit">Submit</button>
   </center>
</form>


</div>

</div>
 </div>



</section>
</body>
</html>