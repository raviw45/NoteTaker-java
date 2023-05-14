package com.notes.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.note.entities.Note;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaveNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Note note=new Note(title,content,new Date());
		//System.out.println(note.getId()+": "+note.getTitle());
		
		// Hibernate to save the data to the database which is strongly typed
		SessionFactory factory=new Configuration().configure("config.cfg.xml").buildSessionFactory();
		Session se=factory.openSession();
		Transaction tx=se.beginTransaction();
		se.save(note);
		tx.commit();
		se.close();
		factory.close();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<h1 class='text-success'>Note added successfully!!!</h1>");
		out.println("<a href='all_notes.jsp'>View all notes...</a>");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
