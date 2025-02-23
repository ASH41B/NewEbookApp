package com.entity;

public class Book_details {

	
	private int bookid;
	private String bookname;

	private String bookauth;

	private double bookprice;

	private String bkcategory;
	

	private String bkphotoName;


	public Book_details() {
		super();
		
	}


	public Book_details(String bookname, String bookauth, double bookprice, String bkcategory, String bkphotoName) {
		super();
		this.bookname = bookname;
		this.bookauth = bookauth;
		this.bookprice = bookprice;
		this.bkcategory = bkcategory;
		this.bkphotoName = bkphotoName;
	}
//If your bookid is intended to be set by a database (e.g., auto-incremented), 
	//it's common practice to not provide a setter for bookid or to set it only during object creation after 
	//retrieving it from the database.
	
	
	public int getBookid() {
		return bookid;
	}


	public void setBookid(int bookid) {
		this.bookid = bookid;
	}


	public String getBookname() {
		return bookname;
	}


	public void setBookname(String bookname) {
		this.bookname = bookname;
	}


	public String getBookauth() {
		return bookauth;
	}


	public void setBookauth(String bookauth) {
		this.bookauth = bookauth;
	}


	public Double getBookprice() {
		return bookprice;
	}


	public void setBookprice(double bookprice) {
		this.bookprice = bookprice;
	}


	public String getBkcategory() {
		return bkcategory;
	}


	public void setBkcategory(String bkcategory) {
		this.bkcategory = bkcategory;
	}


	public String getBkphotoName() {
		return bkphotoName;
	}


	public void setBkphotoName(String bkphotoName) {
		this.bkphotoName = bkphotoName;
	}
	
	

}
