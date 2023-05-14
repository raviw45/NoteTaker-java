<%@page import="com.note.entities.Note"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<%@include file="all_css.jsp" %>
</head>
<body>
    <%@include file="navbar.jsp" %>
    
    <%
      int id=Integer.parseInt(request.getParameter("id"));
      SessionFactory factory=new Configuration().configure("config.cfg.xml").buildSessionFactory();
      Session ses=factory.openSession();
      Note note=(Note)ses.get(Note.class,id);
      ses.close();
      factory.close();
      %>
      
      
      <div class="container">
      <h2>Update the content and title.....</h2>
      <form action="UpdateServlet" method="post" >
          <input value="<%=note.getId() %>" name="id" type="hidden"/>
		  <div class="mb-3">
		    <label for="title" class="form-label">Title</label>
		    <input 
		    name="title"
		    required type="text" 
		    class="form-control" 
		    id="title" 
		    placeholder="Enter the title" 
		    value="<%=note.getTitle() %>"
		    aria-describedby="titleHelp">
		  </div>
		  <div class="mb-3">
		    <label for="content" class="form-label">Content</label>
		    <textarea
		     required class="form-control" 
		     name="content"
		     style="height:300px;" 
		     placeholder="Enter your content here...."
		     id="content">
		     <%=note.getContent() %>
		     </textarea>
		  </div>
		  <div class="container">
		  <button type="submit" class="btn btn-warning">Update Note</button>
		  </div>
		</form>
      </div>
</body>
</html>