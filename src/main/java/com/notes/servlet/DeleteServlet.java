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

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       try {
    	   int id=Integer.parseInt(request.getParameter("id").trim());
    	   SessionFactory factory=new Configuration().configure("config.cfg.xml").buildSessionFactory();
    	   Session sess=factory.openSession();
    	   Transaction tx=sess.beginTransaction();
    	   Note note=(Note)sess.get(Note.class, id);
    	     sess.delete(note);
    	   tx.commit();
    	   sess.close();
    	   factory.close();
    	   response.sendRedirect("all_notes.jsp");
       }catch(Exception e) {
    	   e.printStackTrace();
       }
	}

	

}
