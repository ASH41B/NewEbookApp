<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.0/css/all.min.css" integrity="sha512-9xKTRVabjVeZmc+GUW8GgSmcREDunMM+Dt/GrzchfN8tkwHizc5RP4Ok/MXFFy5rIjJjzhndFScTceq5e6GvVQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
    </head>	
    <body>
    
  <%@ include file="navbar2.jsp" %>
   <%@ include file="navbar.jsp" %>
   <center>
         <form action="register" method="POST">
             <h1>Welcome to the Registration Page</h1>
            <label for="name">Enter your name:</label>
            <input type="text" id="name" name="fname" required>
       
            <br><br>
            <!-- 
            <label>Enter your gender:</label>
             <input type="radio" id="female" name="gender" value="Female">
        <label for="female">Female</label>
        <input type="radio" id="male" name="gender" value="Male">
        <label for="male">Male</label><br><br>
             -->
              <label for="email">Enter your email:</label>
            <input type="email" id="email" name="email" required>
            <label for="phone_num">Enter your phone num:</label>
            <input type="number" id="phno" name="phno" required><br><br>
            
             <label for="password">Enter your password:</label>
            <input type="password" id="password" name="mypass" required><br><br>
            
            <label for="landmark">Enter your landmark:</label>
            <input type="text" id="landmark" name="mylandmark" required><br><br>
            <label for="address">Enter your address</label>
            <input type="text" id="address" name="myaddress" required>
             <br><br>       
            <label for="city">Enter your city</label>
            <input type="text" id="city" name="mycity" required>
             <br><br><label for="state">Enter your state:</label>
            <input type="text" id="state" name="mystate" required>
             <br><br>
             
             <label>Enter your role:</label>
             <input type="radio" id="Admin" name="role" value="Admin">
        <label for="admin">Admin</label>
        <input type="radio" id="User" name="role" value="User">
        <label for="user">User</label><br><br>
             
             
            <input type="submit" value="Register">
            <input type="reset" value="Reset">
           
        </form>
    
 </center>
</body>
</html>
