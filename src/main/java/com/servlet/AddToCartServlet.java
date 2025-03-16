package com.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        

        int bid = Integer.parseInt(request.getParameter("bid"));
        int uid = (int) session.getAttribute("uîd");

        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));

        String jdbcURL = "jdbc:mysql://localhost:3306/ebook-app";
        String dbUser = "root";
        String dbPass = "root"; // Change to your MySQL password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            String query = "INSERT INTO `ebook-app`.cart (bid, uid, bookName, author, price, quantity) VALUES (?, ?, ?, ?, ?, 1) ON DUPLICATE KEY UPDATE quantity = quantity + 1";
            PreparedStatement ps = conn.prepareStatement(query);
           
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setString(3, bookName);
            ps.setString(4, author);
            ps.setDouble(5, price);
            ps.executeUpdate();

            ps.close();
            conn.close();

            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
