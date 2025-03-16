package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOimpl;
import com.DB.DBConnect.DBConnect;
import com.entity.Book_details;
import com.entity.Cart;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int bid= Integer.parseInt(request.getParameter("bid"));
	       	int uid= Integer.parseInt(request.getParameter("uid"));
			
	       	
	       	BooksDAOimpl dao= new BooksDAOimpl(DBConnect.getConn());
	       	Book_details b=dao.getBkbyid(bid);
	       	
	       	
	       	Cart c = new Cart();
	       	c.setBid(bid);
	       	c.setUid(uid);
	       	c.setBookName(b.getBookname());
	       	c.setAuthor(b.getBookauth());
	       	c.setQuantity((int) c.getQuantity());
	       	try {
	       	    if (b.getBookprice() != null) {
	       	        double price = b.getBookprice(); // No need to parse
	       	        c.setPrice(price);
	       	        c.setTotalprice(price);
	       	    } else {
	       	        c.setPrice(0.0);
	       	        c.setTotalprice(0.0);
	       	    }
	       	} catch (Exception e) { // Catch all possible errors
	       	    System.err.println("Error handling book price: " + b.getBookprice()); // Log issue
	       	    e.printStackTrace();
	       	    c.setPrice(0.0);
	       	    c.setTotalprice(0.0);
	       	}

	       		HttpSession session = request.getSession();
	       	

	       	BooksDAOimpl dao2= new BooksDAOimpl(DBConnect.getConn());
	       	boolean f= dao2.add_Cart(c);
	       	System.out.println(dao2);
	    	System.out.println(c);
	       	
	       	if (f) {
	       		
	       		session.setAttribute("add_Cart", "book added");
	       		
	       		System.out.println("Added successfully");
	       	}else {
	       		System.out.println("Not Added successfully");
	       	}
	       	

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}


}
