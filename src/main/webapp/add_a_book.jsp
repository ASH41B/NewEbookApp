<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>


<div style="background-color:#ade0ee; font-size: 30px;" >
    <center>
      <a class="navbar-brand" href="#" >Hello Admin</a>
  </center>
 </div>

  
  <%@ include file="navbar2.jsp" %>

  <%@ include file="navbar.jsp" %>

 <center>
         <form action="addbook" method="post" enctype="multipart/form-data">

         <br><br>
             <h1>Add a Book</h1>
            <label for="book_name">Enter book name:</label>
            <input type="text" id="bname" name="fname" required>
       
            <br><br>
            
              <label for="Author_name">Enter Author:</label>
            <input type="text" id="Author" name="Author" required>
<br><br>
             
            <label for="price">Enter the price in Rs. :</label>
            <input type="number" id="price" name="price" required><br><br>
           
            <div class ="form-group">
            <label for="inputState">Book Category</label>
            <select id ="inputState" name="btype" >
            
            <option selected>---select---</option>
            <option selected>Fantasy and Fiction</option>
             <option selected>Biographies and Memoirs</option>
              <option selected>Religion and Spirituality</option>
              
              <option selected>Drama and Poetry</option>
              <option selected>Mystery</option>
              <option selected>Horror</option>
              <option selected>Other..</option>
            </select>
            
            </div> 
            
            <br>
            
            
            
            
            
            <div>
            <center>
  <label for="formFile" >Upload photo</label>
  <input  type="file" name="bimg" class="form-control-file" id="formFile"></center>
</div>
<br><br>
           
            <input type="submit" value="Add">
            <input type="reset" value="Reset">
           
        </form>
    
 </center>

<br><br>
 <%@ include file="ourPartners.jsp" %>

</body>
</html>