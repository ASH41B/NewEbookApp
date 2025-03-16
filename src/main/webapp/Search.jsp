<%@page import="com.DB.DBConnect.DBConnect"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

       <h2 class="container text-center">All Drama and Poetry books</h2>
<div class="container text-center">
    <div class="row">
    
    
   <%@ page import="java.util.List" %>
<%@ page import="com.DAO.BooksDAOimpl, com.DB.DBConnect.DBConnect, com.entity.Book_details" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="styles.css"> <!-- Add your CSS file here -->
</head>
<body>

<%
    String ch = request.getParameter("ch"); // Fix: Changed req to request
    BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn()); // Fix: Corrected variable declaration

    List<Book_details> searchBook = dao.getBookbySearch(ch); // Fix: Passing search parameter
    if (searchBook != null && !searchBook.isEmpty()) {
        for (Book_details book : searchBook) {
%>

<div class="col-md-3">
    <div class="card crd-ho">
        <div class="card-body text-center">
            <img alt="Book Image" src="<%= book.getBkphotoName() %>"
                 style="width:150px; height:200px;" class="img-thumbnail">
            <p><strong>Title:</strong> <%= book.getBookname() %></p>
            <p><strong>Author:</strong> <%= book.getBookauth() %></p>
            <p><strong>Category:</strong> <%= book.getBkcategory() %></p>
            <p><strong>Price:</strong> $<%= book.getBookprice() %></p>
            <%System.out.println(ch);%>

            <div class="row">
                <a href="addCart.jsp?id=<%= book.getBookid() %>" class="btn btn-danger">Add to Cart</a>
                <a href="viewDetails.jsp?id=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
            </div>
        </div>
    </div>
</div>

<%
        }
    } else {
%>
    <h3>No books found for your search.</h3>
<%
    }
%>

</body>
</html>
