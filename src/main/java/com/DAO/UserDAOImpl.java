package com.DAO;
import java.sql.*;

import com.DB.DBConnect.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl {
//	private Connection conn;
//
//	public UserDAOImpl() {
//		super();
//	}
//
//	public UserDAOImpl(Connection conn) {
//		super();
//		this.conn = conn;
//	}
	private Connection conn;

    // Default constructor should initialize the connection
    public UserDAOImpl() {
        this.conn = DBConnect.getConn();
        if (this.conn == null) {
            System.out.println("Database connection is NULL! Check DBConnect.");
        } else {
            System.out.println("Database connection initialized successfully.");
        }
    }

    // Constructor for passing connection explicitly
    public UserDAOImpl(Connection conn) {
        this.conn = conn;
    }	

    public boolean userRegister(User us) {
        boolean success = false;

        String sql = "INSERT INTO user (name, email, phone_number, password, address, landmark, city, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn == null) {
                System.out.println("Database connection is NULL! Check DBConnect.");
                return false;
            }

            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone_number());
            ps.setString(4, us.getPassword());
            ps.setString(5, us.getAddress()); //
            ps.setString(6, us.getLandmark()); //
            ps.setString(7, us.getCity());
            ps.setString(8, us.getState());

            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("Error in user registration: " + e.getMessage());
            e.printStackTrace();
        }

        return success;
    }


	public User login(String email, String password) {
		User us = null;
		try {
			String sql = "Select * from user where email=? and password=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone_number(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}
}
