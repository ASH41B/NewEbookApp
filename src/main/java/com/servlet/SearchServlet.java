package com.servlet;

import com.DAO.BooksDAO;
import com.DB.DBConnect.DBConnect;
import com.entity.Book_details;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.print.Book;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/search")
public class SearchServlet<BookDAO> extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String query = request.getParameter("query");
        Connection conn = DBConnect.getConn();
        BookDAO bookDAO = new BookDAO(conn);
        List<Book> books = bookDAO.searchBooks(query);
        
        request.setAttribute("books", books);
        request.setAttribute("query", query);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
