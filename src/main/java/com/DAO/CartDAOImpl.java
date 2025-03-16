package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO{

	private Connection conn;
	
	public CartDAOImpl(Connection conn) {
		 this.conn= conn;
	}
	
	@Override
	public boolean addCart(Cart c) {
		
		boolean f= false;
		try {
			String sql = "insert into `ebook-app`.cart(bid, uid, bookName, author, price, quantity,  total_price) values (?,?,?,?,?,?,?)";
			
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookName());
			ps.setString(4, c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setInt(6, (int) c.getQuantity());
			ps.setDouble(7, c.getTotalprice());
				
			int i = ps.executeUpdate();
			if(i==1) {
				f= true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return f;
	}

	
	
	
	
}
