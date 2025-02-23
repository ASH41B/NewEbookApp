package com.DAO;

import java.util.List;

import com.entity.Book_details;

public interface BooksDAO {

	public boolean add_Book(Book_details b);
	
	public List<Book_details> get_all_books();
		
	public  Book_details getBkbyid(int id);

	 Book_details getBkbyid();

	public boolean update_edit_Book(Book_details b);
	
	public boolean deletebks (int id);
	
	public List<Book_details>getNewMysteryBook();
	
	public List<Book_details>getNewFnFBook();
		
	public List<Book_details>getNewBnMBook();

	
	public List<Book_details>getNewRnSBook();
	

	
	public List<Book_details>getNewDnPBook();
	

	public List<Book_details>getNewHorrorBook();
	

	public List<Book_details>getNewOtherBook();
	
	

	public List<Book_details>displayMysteryBook();
	
	public List<Book_details>displayFnFBook();
		
	public List<Book_details>displayNewBnMBook();

	
	public List<Book_details>displayNewRnSBook();
	

	
	public List<Book_details>displayNewDnPBook();
	

	public List<Book_details>displayNewHorrorBook();
	

	public List<Book_details>displayNewOtherBook();
	
}
