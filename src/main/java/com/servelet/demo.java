package com.servelet;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.entities.Note;
import com.helper.Factoryprovider;

public class demo 
{
	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		Session s=Factoryprovider.getFactory().openSession();
		Query<Note> createQuery =  s.createQuery("from Note");
		List<Note> list = createQuery.getResultList();
		for(Note n:list)
		{
			System.out.println(n.getContent());
			System.out.println(n.getTitle());
		}
		s.close();
	}
}
