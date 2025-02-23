package com.admin.servlet;

 ///http://localhost:8080/Ebook-App
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDAOimpl;

import com.DB.DBConnect.DBConnect;
import com.entity.Book_details;
import com.mysql.cj.Session;

@WebServlet("/editbook")         //Declares the servlet and maps it to the URL /editbook. This means the servlet will handle requests sent to this URL.
@MultipartConfig                             //Indicates that the servlet is capable of handling multipart/form-data requests, often used for file uploads
public class editbook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {      //post is used to enter the form details

       // HttpSession session = req.getSession();
        

        try {
            // Retrieve form data
            int bookId = Integer.parseInt(req.getParameter("id"));  
            String bookName = req.getParameter("fname");
            String bookAu = req.getParameter("Author");
            Double bprice = Double.parseDouble(req.getParameter("price"));

//            // Optional: Handle file upload
//            String bookph = req.getPart("bimg");
//            String fileName = bookph.getSubmittedFileName();
//            String uploadPath = "C:\\path\\to\\upload\\directory";
//            File uploadDir = new File(uploadPath);
//            if (!uploadDir.exists()) {
//                uploadDir.mkdir();
//            }
//            String filePath = uploadPath + File.separator + fileName;
//            bookph.write(filePath);

            // Create the Book_details object
            Book_details b = new Book_details();
            b.setBookid(bookId);
            b.setBookname(bookName);
            b.setBookauth(bookAu);
            b.setBookprice(bprice);
//            b.setBkphotoName(bookph);
            

            req.setAttribute("book", b); 
            req.getRequestDispatcher("cardstructure.jsp").forward(req, resp);


            // Use DAO to update the book
           BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
            boolean isBookUpdated = dao.update_edit_Book(b);
            
            
            HttpSession session = req.getSession();

            // Handle success or failure
            	if (isBookUpdated) {    
            	session.setAttribute("succmssg", "Book edited successfully.");
                resp.sendRedirect("Success.jsp");
           } else {
               session.setAttribute("errormssg", "Failed to edit the book. Please try again.");
               resp.sendRedirect("error.jsp");            }
        } catch (Exception e) {
            e.printStackTrace();
//         session.setAttribute("errormssg", "An unexpected error occurred: " + e.getMessage());
//            resp.sendRedirect("error.jsp");
        }
        
    }
}
