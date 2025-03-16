package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.entity.Book_details;
import java.util.List;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bid"));

        HttpSession session = request.getSession();
        List<Book_details> cartList = (List<Book_details>) session.getAttribute("cart");

        if (cartList != null) {
            cartList.removeIf(book -> book.getBookid() == bookId);
            session.setAttribute("cart", cartList);
        }

        response.sendRedirect("cart.jsp");
    }
}
