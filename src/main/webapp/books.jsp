<%@page import="com.DAO.BooksDAOimpl"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect.DBConnect"%>

<%@page import="com.entity.Book_details"%>

<%@page import="com.DAO.BooksDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" 
          integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<center>
    <div style="background-color:#ade0ee; font-size: 30px;">
    <center> 
        <a class="navbar-brand" href="#">Hello Admin</a></center>
    </div>

    <%@ include file="navbar2.jsp" %>
    <%@ include file="navbar.jsp" %><br><br>

    <div class="container">
        <h1>Available Books</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>																																																																													
            <tbody>
                <%
                
                
                BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn()); // Create DAO object
                List<Book_details> list = dao.get_all_books(); // Fetch all books from the database

                for (Book_details b : list) { // Loop through books
                %>
                <tr>
                    <td><%= b.getBookid() %></td>
                    <td>
                        <img src="book_images/<%= b.getBkphotoName() %>" 
     alt="Book Image" style = "width:50px; height:50px;"> 
          <!-- style="width:50px; height:50px;" --> <alt="Book Image"></td>
                    <td><%= b.getBookname() %></td>
                    <td><%= b.getBookauth() %></td>
                    <td><%= b.getBookprice() %></td>
                    <td><%= b.getBkcategory() %></td>
                    <td>
                        <a href="Edit_books.jsp?id=<%= b.getBookid() %>" class="btn btn-sm btn-primary">Edit</a>
                        <a href="delete?id=<%= b.getBookid() %>" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>	
                <%	
                    }
                %>
            </tbody>
        </table>
    </div>

    <%@ include file="ourPartners.jsp" %>
</body>
</html>
