package com.admin.servlet;

import com.entity.Book_details;
import com.DAO.BooksDAOimpl;
import com.DB.DBConnect.DBConnect;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/addbook")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB threshold
                 maxFileSize = 1024 * 1024 * 10,       // 10MB max file size
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB max request size
public class AddBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Retrieve form data
            String bookName = req.getParameter("fname");
            String bookAu = req.getParameter("Author");
            Double bprice = Double.parseDouble(req.getParameter("price"));
            String bookcat = req.getParameter("btype");
            Part bookph = req.getPart("bimg");

            // Retrieve file name
            String fileName = (bookph.getSubmittedFileName() != null) ? bookph.getSubmittedFileName() : "default.jpg";

            // Define upload path
            String uploadPath = "C:\\Users\\bashs\\eclipse-workspace\\NewEbookApp\\book_images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // Creates directories if they don't exist
            }

            // Save the uploaded file
            String filePath = uploadPath + File.separator + fileName;
            bookph.write(filePath);  // Write the file only once

            // Create Book_details object
            Book_details book = new Book_details(bookName, bookAu, bprice, bookcat, fileName);

            // Save book in database
            BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
            boolean isBookAdded = dao.add_Book(book);
            System.out.println(isBookAdded);
            System.out.println(dao);

            // Handle success or failure
            HttpSession session = req.getSession();
            if (!isBookAdded) {
                session.setAttribute("succmssg", "Book added successfully");
                resp.sendRedirect("Success.jsp");
           
            } else {
                session.setAttribute("errormssg", "Failed to add the book. Please try again.");
                System.err.println("Book insertion failed. Possible DB issue or data error.");
                resp.sendRedirect("error.jsp");
            

            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("File upload failed. Try again.");
        }
    }
}
