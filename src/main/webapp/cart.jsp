<%@ page import="java.util.List" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <%@ include file="navbar2.jsp" %>
    <%@ include file="navbar.jsp" %>
    <br><br>

    <h2>Your Cart</h2>

    <%
        HttpSession sessionObj = request.getSession();
        List<Cart> cartList = (List<Cart>) sessionObj.getAttribute("cart");

        if (cartList == null || cartList.isEmpty()) {
    %>
        <h3>Your cart is empty!</h3>
        <a href="index.jsp">Continue Shopping</a>
    <%
        } else {
    %>
        <table border="1">
            <tr>
                <th>Customer ID</th>
                <th>Book Id</th>
                <th>User Id</th>
                <th>Book Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Action</th>
            </tr>
            <%
                double grandTotal = 0;
                for (Cart item : cartList) {
                    double total = item.getPrice() * item.getQuantity();
                    grandTotal += total;
            %>
            <tr>
                <td><%= item.getCid() %></td>
                <td><%= item.getBid() %></td>
                <td><%= item.getUid() %></td>
                <td><%= item.getBookName() %></td>
                <td><%= item.getAuthor() %></td>
                
                <td><%= item.getQuantity() %></td>
                <td>$<%= item.getPrice() %></td>
                
                  
                <td>$<%= total %></td>
                <td><a href="removeFromCart.jsp?id=<%= item.getBid()%>">Remove</a></td>
            </tr>
            <% } %>
            <tr>
                <td colspan="7"><strong>Grand Total:</strong></td>
                <td colspan="2"><strong>$<%= grandTotal %></strong></td>
            </tr>
        </table>
        <br>
        <a href="checkout.jsp">Proceed to Checkout</a>
        <br>
        <a href="index.jsp">Continue Shopping</a>
    <% } %>

    <%@ include file="ourPartners.jsp" %>
</body>
</html>
