<%@ page import="java.util.List" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Retrieve the Book ID from request parameter
    String bookIdStr = request.getParameter("bid");

    if (bookIdStr != null) {
        int bookId = Integer.parseInt(bookIdStr); // Convert to integer

        // Get cart from session
        HttpSession sessionObj = request.getSession();
        List<Cart> cartList = (List<Cart>) sessionObj.getAttribute("Cart");

        if (cartList != null) {
            // Find and remove the book from the cart
            for (int i = 0; i < cartList.size(); i++) {
                if (cartList.get(i).getBid() == bookId) {
                    cartList.remove(i);
                    break;
                }
            }

            // Update the session with the modified cart list
            sessionObj.setAttribute("Cart", cartList);
        }
    }

    // Redirect back to cart.jsp
    response.sendRedirect("cart.jsp");
%>
