package com.helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factoryprovider {

	public static SessionFactory factory;
	
	public static SessionFactory getFactory()
	{
	
		if(factory==null) {
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}

	public void closefactory() {
		if(factory.isOpen()) {
			factory.isClosed();
			
		}
	}
}
