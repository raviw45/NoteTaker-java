<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.note.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import='org.hibernate.SessionFactory' %>
<%@page import='org.hibernate.cfg.Configuration' %>
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
    <div class="container">
       <div class="row">
          <div class="col-12">
             <%
		         SessionFactory factory=new Configuration().configure("config.cfg.xml").buildSessionFactory();
		         Session se=factory.openSession();
		         Query q=se.createQuery("from Note");
		         List<Note> list=q.list();
		         for(Note note:list){
		     %>
		       <div class="card mt-3 mb-3" style="width:500px;margin:auto;padding:15px;">
				  <img src="img/notepad.png" style="max-width:100px;"class="card-img-top mx-auto" alt="...">
				  <div class="card-body">
				    <h3 class="card-title"><%= note.getTitle() %></h3>
				    <p class="card-text"><%= note.getContent() %></p>
				    <p class="text-primary"><%=note.getAddedDate() %></p>
				    <div class="container text-center" >
        				    <a href="DeleteServlet?id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
		        		    <a href="edit.jsp?id=<%=note.getId() %>" class="btn btn-primary">Update</a>
				    </div>
				  </div>
				</div>
		        	
		     <%
		         }		         
		         se.close();
		         factory.close();
             %>
          </div>
       </div>
       
    </div>
</body>
</html>