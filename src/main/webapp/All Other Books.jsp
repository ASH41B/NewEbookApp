<%@ page import="com.DB.DBConnect.DBConnect" %>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page import="com.entity.Book_details" %>
<%@ page import="java.util.List" %>

<%@ page import="com.entity.User" %>

<%@ page import= "java.sql.Connection" %>
<%@  page import= "java.sql.PreparedStatement" %>
<%@  page import= "java.sql.ResultSet" %>
<%@ page import= "java.util.ArrayList" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" 
          integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>All other books</title>
</head>
<body>

<%
User u = (User) session.getAttribute("userobj");%>


    <%@ include file="navbar2.jsp" %>
    <%@ include file="navbar.jsp" %><br><br>
    
    
   
       <h2 class="container text-center">All Other Books</h2>
<div class="container text-center">
    <div class="row">
        <%
        

        BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
        List<Book_details> OBooks = dao.displayNewOtherBook();
        for (Book_details book : OBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                <img alt="Book Image" src="<%= request.getContextPath() %>/book_images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">
                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">
                       <% if (u != null) { %>
    <a href="AddToCartServlet?bid=<%= book.getBookid() %>&&uid=<%= u.getId() %>" class="btn btn-primary">Add to Cart</a>
<% } else { %>
    <a href="Login.jsp" class="btn btn-danger">Add to Cart</a>
<% } %>


<% if (book != null && book.getBookid() != 0) { %>
    <a href="view_book_details.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
<% } else { %>
    <a href="error.jsp" class="btn btn-warning">View Details</a>
<% } %>  </div>
                </div>
            </div>
        </div>
        <% } %>  <!-- End loop -->	
    </

    </div>
</div>
    
   
  
    
    
    <%@ include file="ourPartners.jsp" %>
</body>
</html>