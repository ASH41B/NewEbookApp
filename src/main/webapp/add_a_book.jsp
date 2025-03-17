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

 <center><body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg p-4 rounded-4">
            <h1 class="text-center text-success mb-4">Add a Book</h1>
            <form action="addbook" method="post" enctype="multipart/form-data">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label for="bname" class="form-label">Enter Book Name:</label>
                        <input type="text" id="bname" name="fname" class="form-control" placeholder="e.g. The Great Gatsby" required>
                    </div>

                    <div class="col-md-6">
                        <label for="Author" class="form-label">Enter Author:</label>
                        <input type="text" id="Author" name="Author" class="form-control" placeholder="e.g. F. Scott Fitzgerald" required>
                    </div>

                    <div class="col-md-6">
                        <label for="price" class="form-label">Enter the price in Rs. :</label>
                        <input type="number" id="price" name="price" class="form-control" placeholder="e.g. 500" required>
                    </div>

                    <div class="col-md-6">
                        <label for="inputState" class="form-label">Book Category</label>
                        <select id="inputState" name="btype" class="form-select">
                            <option selected>--- Select ---</option>
                            <option>Fantasy and Fiction</option>
                            <option>Biographies and Memoirs</option>
                            <option>Religion and Spirituality</option>
                            <option>Drama and Poetry</option>
                            <option>Mystery</option>
                            <option>Horror</option>
                            <option>Other..</option>
                        </select>
                    </div>

                    <div class="col-md-12 text-center">
                        <label for="formFile" class="form-label">Upload photo</label>
                        <input type="file" name="bimg" class="form-control" id="formFile">
                    </div>
                </div>

                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-success px-4">Add</button>
                    <button type="reset" class="btn btn-danger px-4 ms-2">Reset</button>
                </div>
            </form>
        </div>
    </div>

 </center>

<br><br>
 <%@ include file="ourPartners.jsp" %>

</body>
</html>