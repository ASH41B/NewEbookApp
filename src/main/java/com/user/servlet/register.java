package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class register extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/ebook-app";
    private static final String USER = "root";  // Change if needed
    private static final String PASSWORD = "root";  // Change if needed

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	 String name = request.getParameter("fname");
         String email = request.getParameter("email");
         String phoneNumber = request.getParameter("phno");
         String password = request.getParameter("mypass");
         String landmark = request.getParameter("mylandmark");
         String address = request.getParameter("myaddress");
         String city = request.getParameter("mycity");
         String state = request.getParameter("mystate");
         String role= request.getParameter("role");

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Connection
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            // Insert User Data
            String query = "INSERT INTO user (name, email, phone_number,password, landmark,address,city,state, role) VALUES (?, ?,?, ?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phoneNumber); 
            stmt.setString(4,  password );
            stmt.setString(5, landmark);
            stmt.setString(6, address);
            stmt.setString(7, city);
            
            stmt.setString(8, state);
            stmt.setString(9, role);

            int rowsInserted = stmt.executeUpdate();
            stmt.close();
            conn.close();

            response.sendRedirect("Success.jsp"); // Redirect to success page

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}
