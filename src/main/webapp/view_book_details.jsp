<%@page import="com.entity.Book_details"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect.DBConnect" %>
<%@page import="com.DAO.BooksDAOimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">
</head>
<body>

<%@ include file="navbar2.jsp" %>
<%@ include file="navbar.jsp" %>

<%
    String bidParam = request.getParameter("bid");
    Book_details b = null; // Declare outside try block

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

<% if (b != null) { %>
    <div class="container">
        <div class="row">
            <div class="col-md-6 p-4 border">
                <center>
                    <img src="<%= (b.getBkphotoName() != null) ? b.getBkphotoName() : "images/default.jpg" %>" 
                         style="height: 100px; width: 100px;"><br>
                    <h3>Book Name: <span class="text-success"><%= b.getBookname() %></span></h3>
                    <h4>Author Name: <span class="text-success"><%= b.getBookauth() %></span></h4>
                    <h4>Category: <span class="text-success"><%= b.getBkcategory() %></span></h4>
                </center>
            </div>

            <div class="col-md-6 p-4 border">
                <center>
                    <h2>Purchase Options</h2><br>
                    <i class="fa-solid fa-wallet"> Cash On Delivery</i><br>
                    <i class="fa-regular fa-credit-card"> Online Payment</i><br>
                    <i class="fa-solid fa-rotate-right"> Return Available</i><br>

                    <div class="row text-center">
                        <div class="col">
                            <a href="addCart.jsp?bid=<%= b.getBookid() %>" class="btn btn-primary">Add to Cart</a>
                            <a href="" class="btn btn-success">$<%= b.getBookprice() %></a>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </div>
<% } else { %>
    <p style="color:red; text-align:center;">No book details found.</p>
<% } %>

<%@ include file="ourPartners.jsp" %>
</body>
</html>
