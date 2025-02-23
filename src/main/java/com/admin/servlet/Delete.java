package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOimpl;
import com.DB.DBConnect.DBConnect;

@WebServlet("/delete")
public class Delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            // Parse the book ID from the request
            int id = Integer.parseInt(req.getParameter("id"));

            // Initialize the DAO object
            BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());

            // Call the delete method
            boolean isDeleted = dao.deletebks(id);

            // Check the result and set appropriate messages
            if (isDeleted) {    
                session.setAttribute("succmssg", "Book deleted successfully.");
                resp.sendRedirect("Success.jsp");
            } else {
                session.setAttribute("errormssg", "Failed to delete the book. Please try again.");
                resp.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid ID format
            e.printStackTrace();
            session.setAttribute("errormssg", "Invalid book ID format.");
            resp.sendRedirect("error.jsp");
        } catch (Exception e) {
            // Handle unexpected errors
            e.printStackTrace();
            session.setAttribute("errormssg", "An unexpected error occurred: " + e.getMessage());
            resp.sendRedirect("error.jsp");
        }
    }
}
