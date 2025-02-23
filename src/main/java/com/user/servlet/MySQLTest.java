package com.user.servlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MySQLTest {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/ebook-app"; // Replace with your database name
        String user = "root"; // Replace with your username
        String password = "root"; // Replace with your password

        try {
            // Establishing a connection
        	try {
        	    Class.forName("com.mysql.cj.jdbc.Driver"); // Example: Loading MySQL JDBC Driver
        	} catch (ClassNotFoundException e) {
        	    e.printStackTrace(); // Handle the exception
        	}

            
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Database connected successfully!");

            // Creating a PreparedStatement
            String sql = "INSERT INTO user (name, email) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "John Doe");
            ps.setString(2, "john@example.com");
            ps.executeUpdate();

            System.out.println("Insert successful!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
