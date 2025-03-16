package com.DAO;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect.DBConnect;
import com.entity.Book_details;
import com.entity.Cart;
import com.mysql.cj.PreparedQuery;

public class BooksDAOimpl implements BooksDAO {

    private Connection conn;

    // Constructor to initialize the connection
    public BooksDAOimpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean add_Book(Book_details b) {
        boolean isAdded = false;
        PreparedStatement ps = null;

        try {
            // SQL query to insert book details
            String query = "INSERT INTO `ebook-app`.book_details (book_name, book_author, book_price, book_category, book_photo) VALUES (?, ?, ?, ?, ?)";

            // Prepare the statement and set parameters
            PreparedStatement ps1 = conn.prepareStatement(query);
            ps1.setString(1, b.getBookname());
            ps1.setString(2, b.getBookauth());
            ps1.setDouble(3, b.getBookprice());
            ps1.setString(4, b.getBkcategory());
            ps1.setString(5, b.getBkphotoName());
            
            System.out.println("SQL Query: " + query);
            
            


            // Execute the query
            int rowsAffected = ps1.executeUpdate(); // ✅ Executes the query
            if (rowsAffected > 0) {
                System.out.println("Book inserted successfully!");
            } else {
                System.out.println("Insertion failed.");
            }
            
            

        } catch (Exception e) {
            e.printStackTrace(); // Replace with proper logging in production
        } finally {
            // Ensure the PreparedStatement is closed
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace(); // Replace with logging
            }
        }
        return isAdded;
    }
    
    @Override
    public boolean add_Cart(Cart c) {
        boolean isAdded = false;
        PreparedStatement ps = null;

        try {
            // SQL query to insert cart details
            String query = "INSERT INTO `ebook-app`.cart (book_id, user_id, price, total_price, quantity) VALUES (?, ?, ?, ?, ?)";

            // Prepare the statement and set parameters
            ps = conn.prepareStatement(query);
            ps.setInt(1, c.getBid());       // Book ID
            ps.setInt(2, c.getUid());       // User ID
            ps.setDouble(3, c.getPrice());     // Price
            ps.setDouble(4, c.getTotalprice()); // Total Price
            ps.setDouble(5, c.getQuantity());     // Quantity

            System.out.println("SQL Query: " + query);

            // Execute the query
            int rowsAffected = ps.executeUpdate(); 
            if (rowsAffected > 0) {
                isAdded = true;
                System.out.println("Cart item added successfully!");
            } else {
                System.out.println("Insertion into cart failed.");
            }

        } catch (Exception e) {
            e.printStackTrace(); // Replace with proper logging in production
        } finally {
            // Ensure the PreparedStatement is closed
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace(); // Replace with logging
            }
        }
        return isAdded;
    }



	@Override
	public List <Book_details> get_all_books() {
		// TODO Auto-generated method stub^
		
		List <Book_details> list= new ArrayList <Book_details>();
		Book_details b = null;
		
		try {
			String sql= "Select * from `ebook-app`.book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return list;
	}

	@Override
	public Book_details getBkbyid(int id) {
		// TODO Auto-generated method stub
		Book_details b = null;
		try {
			
			String sql= "Select * from `ebook-app`.book_details where book_id= ?";
			PreparedStatement ps= conn.prepareStatement(sql) ;
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return b;
	}
	
	public boolean update_edit_Book(Book_details b) {
	    boolean isAdded = false;
	    PreparedStatement ps = null;
	    
	    try {
	        // SQL query to insert book details
	        String query = "UPDATE `ebook-app`.book_details SET book_name = ?, book_author = ?, book_price = ? WHERE book_id = ?";

	        // Prepare the statement and set parameters
	        PreparedStatement ps1 = conn.prepareStatement(query);
	        ps1.setString(1, b.getBookname());
	        ps1.setString(2, b.getBookauth());
	        ps1.setDouble(3, b.getBookprice());

	        ps1.setInt(4, b.getBookid());
//	        ps.setString(4, b.getBkcategory());
//	        ps.setString(5, b.getBkphotoName());

	        // Execute the query
	        int rowsAffected = ps1.executeUpdate();
	        if (rowsAffected == 1) {
	        	 isAdded = true;
	       }

	    } catch (SQLException e) {
	        e.printStackTrace(); // Replace with proper logging in production
	    } finally {
	        // Ensure resources are closed
	        try {
	            if (ps != null) {
	                ps.close();
	            }
	            if (conn != null) {
	                conn.close(); // Ensure the connection is closed
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace(); // Replace with proper logging in production
	        }
	    }
	    return isAdded;
		
	}

	@Override
	public Book_details getBkbyid() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deletebks(int id) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			
			String sql = "DELETE from `ebook-app`.book_details where book_id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	@Override
	public List<Book_details> getNewMysteryBook() {
		// TODO Auto-generated method stub
		
		List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Mystery" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	
	

	@Override
	public List<Book_details> getNewFnFBook() {
		// TODO Auto-generated method stub
		
		List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Fantasy and Fiction" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> getNewBnMBook() {
		// TODO Auto-generated method stub
		
		List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Biographies and Memoirs" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> getNewRnSBook() {

		List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Religion and Spirituality" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> getNewDnPBook() {
		// TODO Auto-generated method stub

		List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Drama and Poetry" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> getNewHorrorBook() {
		// TODO Auto-generated method stub

		List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Horror" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> getNewOtherBook() {
		// TODO Auto-generated method stub

		List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Other.." );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next() && i<=4) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> displayMysteryBook() {
List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Mystery" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> displayFnFBook() {
List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Fantasy and Fiction" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> displayNewBnMBook() {
	List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Biographies and Memoirs" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> displayNewRnSBook() {
List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Religion and Spirituality" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> displayNewDnPBook() {
List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Drama and Poetry" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> displayNewHorrorBook() {
List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Horror" );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	@Override
	public List<Book_details> displayNewOtherBook() {
List<Book_details> list= new ArrayList<Book_details>();
		
		Book_details b= null;	
		
		try {
			String sql = "Select * from `ebook-app`.book_details where book_category= ?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,"Other.." );
			ResultSet rs= ps.executeQuery();
			int i = 1;
			while(rs.next()) {
				b= new Book_details();
				b.setBookid(rs.getInt(1));

				b.setBookname(rs.getString(2));

				b.setBookauth(rs.getString(3));

				b.setBookprice(rs.getDouble(4));

				b.setBkcategory(rs.getString(5));

				b.setBkphotoName(rs.getString(6));
				
				list.add(b);
				i++;
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	
	
	
	
	
	
	
	

}
	