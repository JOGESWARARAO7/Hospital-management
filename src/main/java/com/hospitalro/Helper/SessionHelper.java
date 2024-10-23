package com.hospitalro.Helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class SessionHelper {

	public static SessionFactory getsession() {
		return new AnnotationConfiguration().configure().buildSessionFactory();
		
	}
}
