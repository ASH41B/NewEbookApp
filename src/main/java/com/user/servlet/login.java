package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect.DBConnect;
import com.entity.User;
//import org.mindrot.jbcrypt.BCrypt; // Import BCrypt for password hashing

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login() {
        super();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve form data
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            System.out.println("Login Attempt: " + email);

//            // Validate input
//            if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
//                req.setAttribute("errorMessage", "Email and password cannot be empty.");
//                req.getRequestDispatcher("error.jsp").forward(req, resp);
//                return;
//            }

            try (Connection conn = DBConnect.getConn()) {
                String sql = "SELECT * from `ebook-app`.user WHERE email = ?";
                try (PreparedStatement pst = conn.prepareStatement(sql)) {
                    pst.setString(1, email);
                    System.out.println(email);

                    try (ResultSet rs = pst.executeQuery()) {
                        if (rs.next()) {
                            // Verify password securely using BCrypt

                            System.out.println(rs);
                            String storedPassword = rs.getString("password");
                            if (!password.equals(storedPassword)) {  

                                System.out.println("error");
                                req.setAttribute("errorMessage", "Invalid email or password");
                                req.getRequestDispatcher("error.jsp").forward(req, resp);
                                return;
                            }else {

                            // Create user session
                            User user = new User();
                            user.setId(rs.getInt("id"));
                            user.setName(rs.getString("name"));
                            user.setEmail(rs.getString("email"));
                            user.setRole(rs.getString("role"));

                            HttpSession session = req.getSession();
                            session.setAttribute("userobj", user);
                            session.setMaxInactiveInterval(30 * 60); // Set session timeout (30 minutes)

                            // Redirect based on role
                            if ("admin".equalsIgnoreCase(user.getRole())) {
                                resp.sendRedirect("admin.jsp");
                            } else {
                                resp.sendRedirect("userlogedin.jsp");
                            }
                            }} else {
                            req.setAttribute("errorMessage", "Invalid email or password");
                            req.getRequestDispatcher("error.jsp").forward(req, resp);
                        }
                    }}
                
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}



//            // Database connection
//            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
//            User user = dao.login(email, password);
//
//            if (user == null) {  
//                HttpSession session = req.getSession();
//                session.setAttribute("userobj", user);  // Store user in session
//
//                // Check if the user is an admin based on hardcoded credentials
//                if ("ash@123.com".equals(email) && "admin".equals(password)) { 
//                    resp.sendRedirect("admin.jsp");
//                } else {
//                    resp.sendRedirect("userlogedin.jsp");
//                }
//            } else {
//                // If login fails, show error message
//                req.setAttribute("errorMessage", "Invalid email or password");
//                //req.getRequestDispatcher("error.jsp").forward(req, resp);
//            }

//            try (Connection conn = DBConnect.getConn()) {
//                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
//                try (PreparedStatement pst = conn.prepareStatement(sql)) {
//                    pst.setString(1, email);
//                    pst.setString(2, password);
//                    
//                    try (ResultSet rs = pst.executeQuery()) {
//                        if (rs.next()) {
//                            HttpSession session = req.getSession();
//                            session.setAttribute("userobj", rs.getString("email"));
//                            
//                            // Check if user is admin
//                            if ("admin".equalsIgnoreCase(rs.getString("role"))) {
//                                resp.sendRedirect("admin.jsp");
//                            } else{
//                                resp.sendRedirect("userlogedin.jsp");
//                            }
//                        } else {
//                            req.setAttribute("errorMessage", "Invalid email or password");
//                            req.getRequestDispatcher("error.jsp").forward(req, resp);
//                        }
//                    }
//                }}
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}



//		try {
//
//			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
//			
////			HttpSession session = req.getSession();
////
////			String email = req.getParameter("email");
////			String password = req.getParameter("password");
//
////			System.out.println(email + " " + password);
//
//			if ("ash".equals(email) && "admin".equals(password)) {
//
//				User us = new User();
//				session.setAttribute("userobj", us);
//				resp.sendRedirect("admin.jsp");
//				return;	
//			}
//				
////			User user = dao.login(email, password);
////			System.out.println(user);
//
//			UserDAOImpl dao = new UserDAOImpl();
//			User user = dao.login(email, password);
//			
//			
//            if (user != null) {
//                session.setAttribute("user", user);
//                resp.sendRedirect("userlogedin.jsp");
//            }  else {
//				// Login failed
//				req.setAttribute("errorMessage", "Invalid email or password");
//				req.getRequestDispatcher("error.jsp").forward(req, resp);
//			}
//
////			} else {
////				resp.sendRedirect("index.jsp");
////
////				User user = dao.login(email, password);
////				System.out.println(user);
////				if (user != null) {
////					// Login successful
////					session.setAttribute("user", user);
////					resp.sendRedirect("home.jsp");
////				}
////			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//
//		}
//	}
//
//}
