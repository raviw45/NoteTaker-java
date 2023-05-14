package com.notes.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.note.entities.Note;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id").trim());
		String title=request.getParameter("title").trim();
		String content=request.getParameter("content").trim();
		
		SessionFactory factory=new Configuration().configure("config.cfg.xml").buildSessionFactory();
	    Session se=factory.openSession();
	    Transaction tx=se.beginTransaction();
	    Note note=se.get(Note.class, id);
	    note.setId(id);
	    note.setTitle(title);
	    note.setContent(content);
	    tx.commit();
	    se.close();
	    factory.close();
	    response.sendRedirect("all_notes.jsp");
	}

}
