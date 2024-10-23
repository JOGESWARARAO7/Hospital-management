package com.hospitalpro.Imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.Keyinterface;
import com.hospitalpro.Entity.KeyPoints;
import com.hospitalro.Helper.SessionHelper;

public class KeyPoint implements Keyinterface{
	SessionFactory factory;
	Session session;
	public String adding(KeyPoints keyPoint) {
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(KeyPoints.class);
		Transaction transaction=session.beginTransaction();
		session.save(keyPoint);
		transaction.commit();
		session.close();
		return "Data will be saved";
		
	}
	@Override
	public List<KeyPoints> showpoints() {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(KeyPoints.class);
		criteria.add(Restrictions.eq("status","Active"));
		List<KeyPoints> list=criteria.list();
		return list;
	}
}
