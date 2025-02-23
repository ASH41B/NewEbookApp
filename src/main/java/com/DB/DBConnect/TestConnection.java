package com.DB.DBConnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        // Database credentials
        String url = "jdbc:mysql://localhost:3306/ebook-app"; // Replace with your database name
        String user = "root";  // Change if your MySQL username is different
        String password = "root";  // Change if you have a MySQL password

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection conn = DriverManager.getConnection(url, user, password);

            if (conn != null) {
                System.out.println("✅ Database Connected Successfully!");

            } else {
                System.out.println("❌ Database Connection Failed!");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("❌ JDBC Driver Not Found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ SQL Connection Error!");
            e.printStackTrace();
        }
    }
}
