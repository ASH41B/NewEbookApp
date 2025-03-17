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
       <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-body p-4">
                        <h2 class="text-center text-success">Registration Page</h2>
                        <form action="register" method="POST">
                            <div class="mb-3">
                                <label for="email" class="form-label">Enter your email:</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone_num" class="form-label">Enter your phone number:</label>
                                <input type="number" id="phno" name="phno" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Enter your password:</label>
                                <input type="password" id="password" name="mypass" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="landmark" class="form-label">Enter your landmark:</label>
                                <input type="text" id="landmark" name="mylandmark" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Enter your address:</label>
                                <input type="text" id="address" name="myaddress" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="city" class="form-label">Enter your city:</label>
                                <input type="text" id="city" name="mycity" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label for="state" class="form-label">Enter your state:</label>
                                <input type="text" id="state" name="mystate" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Enter your role:</label><br>
                                <div class="form-check form-check-inline">
                                    <input type="radio" id="Admin" name="role" value="Admin" class="form-check-input">
                                    <label for="Admin" class="form-check-label">Admin</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" id="User" name="role" value="User" class="form-check-input">
                                    <label for="User" class="form-check-label">User</label>
                                </div>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Register</button>
                                <button type="reset" class="btn btn-danger">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </form>
    
 <%@ include file="ourPartners.jsp" %>
 </center>
</body>
</html>
