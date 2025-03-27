<%@ page import="java.util.List" %>
<%@ page import="com.entity.Book_details" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="navbar2.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <h2 class="text-center">Your Cart</h2>
    <hr>

    <%
        HttpSession sessionObj = request.getSession();
        List<Book_details> cartList = (List<Book_details>) sessionObj.getAttribute("cart");

        if (cartList == null || cartList.isEmpty()) {
    %>   
        <h3 class="text-center">Your cart is empty!</h3>
        <div class="text-center">
            <a href="featured.jsp" class="btn btn-primary">Continue Shopping</a>
        </div>
    <%
        } else {
    %>
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Book Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>Remove</th>
            </tr>
        </thead>
        <tbody>
        <% for (Book_details book : cartList) { %>
            <tr>
                <td><%= book.getBookname() %></td>
                <td><%= book.getBookauth() %></td>
                <td>$<%= book.getBookprice() %></td>
                <td>
                    <a href="RemoveFromCartServlet?bid=<%= book.getBookid() %>" class="btn btn-danger btn-sm">
                        Remove
                    </a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>

    <div class="text-center">
        <a href="PayNow.jsp" class="btn btn-success">Proceed to Checkout</a>
         <a href="featured.jsp" class="btn btn-primary">Continue Shopping</a>
    </div>

    <% } %>
</div>

<%@ include file="ourPartners.jsp" %>
</body>
</html>
