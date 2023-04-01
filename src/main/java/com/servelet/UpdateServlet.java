package com.servelet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.Factoryprovider;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int noteId=Integer.parseInt(request.getParameter("noteId").trim());
		Session s=Factoryprovider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		
		Note note=s.get(Note.class, noteId);
		note.setTitle(title);
		note.setContent(content);
		note.setAddeddate(new Date());
		
		
		tx.commit();
		s.close();
		
		response.sendRedirect("all_node.jsp");
		
		
	}

}
