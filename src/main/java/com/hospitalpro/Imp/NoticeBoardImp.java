package com.hospitalpro.Imp;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.NoticboardDao;
import com.hospitalpro.Entity.KeyPoints;
import com.hospitalpro.Entity.NotiesBoard;
import com.hospitalro.Helper.SessionHelper;

public class NoticeBoardImp implements NoticboardDao{

	SessionFactory factory;
	Session session;
	@Override
	public String adddata(NotiesBoard notiesBoard) {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(NotiesBoard.class);
		Transaction transaction=session.beginTransaction();
		session.save(notiesBoard);
		transaction.commit();
		session.close();
		return "Data will be saved";
	}
	@Override
	public List<NotiesBoard> showNoticeboard() {
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(NotiesBoard.class);
		criteria.add(Restrictions.eq("status","Active"));
		List<NotiesBoard> list=criteria.list();
		return list;
	}

}
