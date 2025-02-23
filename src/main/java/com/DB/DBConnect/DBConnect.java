package com.DB.DBConnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    // Create a method to establish the connection
    public static Connection getConn() {

    	 Connection con = null; 
    	    try {
    	        Class.forName("com.mysql.cj.jdbc.Driver");
    	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");
    	    } catch (ClassNotFoundException e) {
    	        System.err.println("Database Driver Class Not Found: " + e.getMessage());
    	    } catch (SQLException e) {
    	        System.err.println("SQL Exception: " + e.getMessage());
    	        System.out.println("Donee!");
    	    }
    	    return con; // Returns null if connection fails
    	   
    	}

    }

