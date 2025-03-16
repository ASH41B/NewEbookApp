package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.entity.Book_details;
import com.DAO.BooksDAOimpl;
import com.DB.DBConnect.DBConnect;

import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bookId = Integer.parseInt(request.getParameter("bid"));
        BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
        Book_details book = dao.getBkbyid(bookId);

        HttpSession session = request.getSession();

        // Initialize or fetch the cart list
        List<Book_details> cartList = (List<Book_details>) session.getAttribute("cart");
        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        // Check if the book is already in the cart
        boolean alreadyInCart = false;
        for (Book_details b : cartList) {
            if (b.getBookid() == book.getBookid()) {
                alreadyInCart = true;
                break;
            }
        }

        if (!alreadyInCart) {
            cartList.add(book);
            session.setAttribute("cart", cartList);
        }

        response.sendRedirect("cart.jsp");
    }
}
