package com.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.Factoryprovider;

/**
 * Servlet implementation class DeleteServlet
 */

//@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		try {
			
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session s=Factoryprovider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			//String query="delete from note where id:=id";
			//Query q = s.createQuery(query);
			//q.setParameter("id", noteId);
			//q.executeUpdate();
			Note note=(Note) s.get(Note.class,noteId);
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_node.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

	}

}
