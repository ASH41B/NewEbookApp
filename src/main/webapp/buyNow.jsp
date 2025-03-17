<%@page import="com.entity.Book_details"%>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page import="com.DB.DBConnect.DBConnect" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Now</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>


<%@ include file="navbar2.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    String bidParam = request.getParameter("bid");
    Book_details b = null;

    if (bidParam != null && !bidParam.isEmpty()) {
        try {
            int bid = Integer.parseInt(bidParam);
            BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
            b = dao.getBkbyid(bid);
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Book ID format.</p>");
        }
    } else {
        out.println("<p style='color:red;'>Book ID is missing.</p>");
    }
%>

<% if (b != null) { 
    double bookPrice = b.getBookprice();
    double tax = bookPrice * 0.10;          // 10% tax
    double deliveryCharges = bookPrice * 0.05; // 5% delivery charges
    double finalPrice = bookPrice + tax + deliveryCharges;
%>

<div class="container">
    <div class="row">
        
        <!-- Left Side: Book Details -->
        <div class="col-md-6 p-4 border">
            <center>
        <img src="book_images/<%= b.getBkphotoName() %>" 
     alt="Book Image"
     style="height: 200px; width: 200px;">

                <h3>Book Name: <span class="text-success"><%= b.getBookname() %></span></h3>
                <h4>Author Name: <span class="text-success"><%= b.getBookauth() %></span></h4>
                <h4>Category: <span class="text-success"><%= b.getBkcategory() %></span></h4>
            </center>
        </div>

        <!-- Right Side: Invoice and Payment Details -->
        <div class="col-md-6 p-4 border">
            <h3>Invoice Details</h3>
            <p>Book Price: $<%= bookPrice %></p>
            <p>Tax (10%): $<%= String.format("%.2f", tax) %></p>
            <p>Delivery Charges (5%): $<%= String.format("%.2f", deliveryCharges) %></p>
            <hr>
            <h4 class="text-danger">Total Amount: $<%= String.format("%.2f", finalPrice) %></h4>

            <!-- Address Section -->
            <form action="OrderServlet" method="post">
                <input type="hidden" name="bookId" value="<%= b.getBookid() %>">
                <input type="hidden" name="finalPrice" value="<%= finalPrice %>">

                <div class="mb-3">
                    <label for="address" class="form-label">Delivery Address:</label>
                    <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                </div>

                <div class="text-center">
                	<a href="PayNow.jsp" class="btn btn-success">Pay Now</a>
                	
                </div>
            </form>
        </div>
    </div>
</div>

<% } else { %>
    <p style="color:red; text-align:center;">No book details found.</p>
<% } %>

<%@ include file="ourPartners.jsp" %>
</body>
</html>
