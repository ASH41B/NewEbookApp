<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.DB.DBConnect.DBConnect" %>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page import="com.DAO.BooksDAOimpl" %>
<%@ page import="com.entity.Book_details" %>
<%@ page import="java.util.List" %>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Books</title>
    <link rel="stylesheet" href="styles.css">  <!-- Add Bootstrap if needed -->
    
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>


<div class= "" style="background-color:#ade0ee; font-size: 30px;" >
    <center>
      <a  class="navbar-brand" href="#" >Hello Admin</a>
  </center>
 </div>

  
  <%@ include file="navbar2.jsp" %>

  <%@ include file="navbar.jsp" %>
  

 <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg">
                    <div class="card-header text-white text-center" style="background-color: #fda43d ">
                        <h4>Book Details</h4>
                    </div>
                    <div class="card-body">
                        <%

                            // Retrieve the book object from the request
                            Book_details book = (Book_details) request.getAttribute("book");
                            if (book != null) {
                        %>
                        
                     <%--     <img src="<%= request.getContextPath() %>/book images/<%= book.getBkphotoName() %>" class="card-img-top" alt="Book Image">--%>  

                            <p><strong>Book ID:</strong> <%= book.getBookid() %></p>
                            <p><strong>Title:</strong> <%= book.getBookname() %></p>
                            <p><strong>Author:</strong> <%= book.getBookauth() %></p>
                            <p><strong>Price:</strong> $<%= book.getBookprice() %></p>
                            
                            <!-- Uncomment if image handling is implemented -->
                            <%-- <img src="uploads/<%= book.getBkphotoName() %>" alt="Book Image" class="img-fluid rounded"> --%>
                           
                            
                        <% } else { %>
                            <p class="text-danger">No book details available.</p>
                        <% } %>
                    </div>
                    <div class="card-footer text-center">
                        <a href="Edit_books.jsp?id=<%= book.getBookid() %>" class="btn btn-danger">Edit Again</a>
                        <a href="admin.jsp" class="btn btn-success">Back to Dashboard</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
 <%@ include file="ourPartners.jsp" %>
</body>
</html>


</body>
</html>
