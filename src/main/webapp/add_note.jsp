<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add Note Page</title>
	 <%@include file="all_css.jsp" %>
	</head>
<body>
      <%@include file="navbar.jsp" %>
      <!-- form to add the note to the database -->
      
      <div class="container">
           <h1>Please fill the not details......</h1>
            <br>
      <form action="SaveNoteServlet" method="post" >
		  <div class="mb-3">
		    <label for="title" class="form-label">Title</label>
		    <input 
		    name="title"
		    required type="text" 
		    class="form-control" 
		    id="title" 
		    placeholder="Enter the title" 
		    aria-describedby="titleHelp">
		  </div>
		  <div class="mb-3">
		    <label for="content" class="form-label">Content</label>
		    <textarea
		     required class="form-control" 
		     name="content"
		     style="height:300px;" 
		     placeholder="Enter your content here...."
		     id="content"></textarea>
		  </div>
		  <div class="container">
		  <button type="submit" class="btn btn-primary">Add</button>
		  </div>
		</form>
      </div>
</body>
</html>