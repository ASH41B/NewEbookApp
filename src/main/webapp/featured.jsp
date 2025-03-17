<%@ page import="java.util.ArrayList" %>
<%@ page import="com.DAO.BooksDAOimpl" %>
<%@ page import="com.entity.Book_details" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page isELIgnored="false" %>

<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>Featured Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<%--<% User u = (User) session.getAttribute("userobj"); %>  --%>
<%
User u = (User) session.getAttribute("userobj");%>

<%--
<%
Connection conn = DAOconnect.getConn();
if (conn == null) {
    out.println("Database connection failed!");
} else {
    out.println("Connected successfully!");
}
%>--%>

<%

   BooksDAOimpl dao = new BooksDAOimpl(DBConnect.getConn());
//out.println(dao);
%>
<h2 class="text-start text-success ms-5">Featured Collections:</h2>
<h4 class="text-start ms-5">New and trending!</h4>
<h6 class="text-start ms-5">Explore our recently added and popular titles.</h6>

<!-- Mystery Section -->
<h2 class="container text-center">Mystery...</h2>
<div class="container text-center">
    <div class="row">
    
    
    
        <% 
            List<Book_details> mysteryBooks = dao.getNewMysteryBook();
            for (Book_details book : mysteryBooks) {
                %>
                
                
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <%--<img alt="Book Image" src="book images/<%= book.getBkphotoName() %>"
                    	style="width:300px; height:400px;" class="img-thumbnail">--%>
                    	<img alt="Book Image" src="<%= request.getContextPath() %>/book_images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">
                    	
                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">		
                    
      <% if (u != null) { %>
    <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-danger">Buy Now</a>
<% } else { %>
    <a href="Login.jsp" class="btn btn-danger">Buy Now</a>
<% } %>


<% if (book != null && book.getBookid() != 0) { %>
    <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">Buy Now</a>
<% } else { %>
    <a href="error.jsp" class="btn btn-warning">View Details</a>
<% } %>

                        
                    </div>
                </div>
            </div>
        </div>
        <% } %> 
                
    </div>
    <div class= "text-center mt-1">
    <a href="All_Mystery_books.jsp" class = "btn btn-danger">View All</a>
    
    </div>
 
</div>

<!-- Additional sections for Fantasy, Biographies etc. -->
<h2 class="container text-center">Fantasy and Fiction...</h2>
<div class="container text-center">
    <div class="row">
        <%
    List<Book_details> fictionBooks = dao.getNewFnFBook();
    for (Book_details book : fictionBooks) {
    	 request.setAttribute("book", book);
%>
     <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="Book Image" src="<%= request.getContextPath() %>/book_images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">

                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">
                         <% if (u != null) { %>
    <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-danger">Buy Now</a>
<% } else { %>
    <a href="Login.jsp" class="btn btn-danger">Buy Now</a>
<% } %>


<% if (book != null && book.getBookid() != 0) { %>
    <a href="view_book_details.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
<% } else { %>
    <a href="error.jsp" class="btn btn-warning">View Details</a>
<% } %>
 </div>
                </div>
            </div>
        </div>
        <% } %> 
                
    </div>
    <div class= "text-center mt-1">
    <a href="All Fantasy and Fiction Books.jsp" class = "btn btn-danger">View All</a>
     
    </div>
</div>


<!-- Additional sections for Fantasy, Biographies etc. -->
<h2 class="container text-center">Biographies and Memoirs...</h2>
<div class="container text-center">
    <div class="row">
        <%
            List<Book_details> bioBooks = dao.getNewBnMBook();
            for (Book_details book : bioBooks) {
            	 request.setAttribute("book", book);
                %><div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                   <img alt="Book Image" src="<%= request.getContextPath() %>/book images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">

                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">
                     <% if (u != null) { %>
    <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-danger">Buy Now</a>
<% } else { %>
    <a href="Login.jsp" class="btn btn-danger">Buy Now</a>
<% } %>


<% if (book != null && book.getBookid() != 0) { %>
    <a href="view_book_details.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
<% } else { %>
    <a href="error.jsp" class="btn btn-warning">View Details</a>
<% } %>
 </div>
                </div>
            </div>
        </div>
        <% } %> 
                
    </div>
    <div class= "text-center mt-1">
    <a href="All Biographies and Memoirs.jsp" class = "btn btn-danger">View All</a>
    
    </div>
</div>

<!-- Additional sections for Fantasy, Biographies etc. -->
<h2 class="container text-center">Religion and Spirituality...</h2>
<div class="container text-center">
    <div class="row">
        <%
            List<Book_details> RSBooks = dao.getNewRnSBook();
            for (Book_details book : RSBooks) {
                %><div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                   <img alt="Book Image" src="<%= request.getContextPath() %>/book images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">

                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">
                    <% if (u != null) { %>
    <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-danger">Buy Now</a>
<% } else { %>
    <a href="Login.jsp" class="btn btn-danger">Buy Now</a>
<% } %>


<% if (book != null && book.getBookid() != 0) { %>
    <a href="view_book_details.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
<% } else { %>
    <a href="error.jsp" class="btn btn-warning">View Details</a>
<% } %>
 </div>
                </div>
            </div>
        </div>
        <% } %> 
                
    </div>
    
    <div class= "text-center mt-1">
    <a href="All Religion and Spirituality Booksjsp.jsp" class = "btn btn-danger">View All</a>
    
    </div>
</div>
<!-- Additional sections for Fantasy, Biographies etc. -->
<h2 class="container text-center">Drama and Poetry...</h2>
<div class="container text-center">
    <div class="row">
        <%
            List<Book_details> DPBooks = dao.getNewDnPBook();
            for (Book_details book : DPBooks) {
            	 request.setAttribute("book", book);
                %><div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                <img alt="Book Image" src="<%= request.getContextPath() %>/book images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">

                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">
                        <% if (u != null) { %>
    <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-danger">Buy Now</a>
<% } else { %>
    <a href="Login.jsp" class="btn btn-danger">Buy Now</a>
<% } %>


<% if (book != null && book.getBookid() != 0) { %>
    <a href="view_book_details.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
<% } else { %>
    <a href="error.jsp" class="btn btn-warning">View Details</a>
<% } %>
 </div>
                </div>
            </div>
        </div>
        <% } %> 
                
    </div>
    <div class= "text-center mt-1">
    <a href="All Drama and Poetry Books.jsp" class = "btn btn-danger">View All</a>
    
    </div>
</div>



<!-- Additional sections for Fantasy, Biographies etc. -->
<h2 class="container text-center">Horror...</h2>
<div class="container text-center">
    <div class="row">
        <%
            List<Book_details> HBooks = dao.getNewHorrorBook();
            for (Book_details book : HBooks) {
            	 request.setAttribute("book", book);
                %><div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                <img alt="Book Image" src="<%= request.getContextPath() %>/book images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">

                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">
                      <% if (u != null) { %>
   <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-danger">Buy Now</a>
<% } else { %>
    <a href="Login.jsp" class="btn btn-danger">Buy Now</a>
<% } %>


<% if (book != null && book.getBookid() != 0) { %>
    <a href="view_book_details.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
<% } else { %>
    <a href="error.jsp" class="btn btn-warning">View Details</a>
<% } %>
  </div>
                </div>
            </div>
        </div>
        <% } %> 
                
    </div>
    <div class= "text-center mt-1">
    <a href="All Horror Books.jsp" class = "btn btn-danger">View All</a>
    
    </div>
</div>

<!-- Additional sections for Fantasy, Biographies etc. -->
<h2 class="container text-center">Other...</h2>
<div class="container text-center">
    <div class="row">
        <%
            List<Book_details> OBooks = dao.getNewOtherBook();
		if (OBooks != null && !OBooks.isEmpty()) {
            for (Book_details book : OBooks) {
            	// request.setAttribute("book", book);
                %><div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                <img alt="Book Image" src="<%= request.getContextPath() %>/book_images/<%= book.getBkphotoName() %>" 
     style="width:300px; height:400px;" class="img-thumbnail">

                    <p> <strong>Title:</strong> <%= book.getBookname() %> </p>
                    <p> <strong>Author:</strong> <%= book.getBookauth() %> </p>
                    <p> <strong>Category:</strong> <%= book.getBkcategory() %> </p>
                    <p> <strong>Price:</strong> $<%= book.getBookprice() %> </p>

                    <div class="row">
                    <a href="buyNow.jsp?bid=<%= book.getBookid() %>" class="btn btn-danger">Buy Now</a>
                        <a href="view_book_details.jsp?bid=<%= book.getBookid() %>" class="btn btn-success">View Details</a>
                    </div>
                </div>
            </div>
        </div>
     <!--   <% } }else{ %> 
        <p class="text-center">No books available at the moment.</p>
              <%  }%>-->
    </div>
    <div class= "text-center mt-1">
    <a href="All Other Books.jsp" class = "btn btn-danger">View All</a>
    
    </div>
</div>


</body>
</html>
