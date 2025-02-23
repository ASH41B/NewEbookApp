<%@ page import="com.DAO.BooksDAOimpl, com.DB.DBConnect.DBConnect, com.entity.Book_details" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<body>
<div class= "" style="background-color:#ade0ee; font-size: 30px;" >
    <center>
      <a  class="navbar-brand" href="#" >Hello Admin</a>
  </center>
 </div>

  
  <%@ include file="navbar2.jsp" %>

  <%@ include file="navbar.jsp" %>

<%
    // Retrieve book ID from request
    String idParam = request.getParameter("id");
    int id = 0;  // Default value if ID is missing or invalid

    if (idParam != null && !idParam.isEmpty()) {
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            out.println("<p class='text-danger'>Invalid book ID format.</p>");
        }
    } else {
        out.println("<p class='text-danger'>Error: No book ID provided.</p>");
    }

    Book_details book = null;
    if (id > 0) {
        BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
        book = dao.getBkbyid(id);
    }
%>

<div class="container mt-4">
<center>
    <h2>Edit Book</h2>

    <% if (book != null) { %>
        <form action="editbook" method="post">
            <input type="hidden" name="id" value="<%= book.getBookid() %>">

            <label>Book Name:</label>
            <input type="text" name="fname" value="<%= book.getBookname() %>" required><br>

            <label>Author:</label>
            <input type="text" name="Author" value="<%= book.getBookauth() %>" required><br>

            <label>Price:</label>
            <input type="number" step="0.01" name="price" value="<%= book.getBookprice() %>" required><br>

            <button type="submit">Update</button>
            <button type="reset">Reset</button>
        </form>
    <% } else { %>
        <p class="text-danger">Book not found.</p>
    <% } %>
    </center>
    
 <%@ include file="ourPartners.jsp" %>
</div>
</body>