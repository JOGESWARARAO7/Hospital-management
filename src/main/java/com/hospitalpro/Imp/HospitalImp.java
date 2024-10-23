package com.hospitalpro.Imp;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.HospitalDao;
import com.hospitalpro.Entity.Hospital;
import com.hospitalro.Helper.SessionHelper;

public class HospitalImp implements HospitalDao{

	SessionFactory factory;
	Session session;
	@Override
	public String addHospital(Hospital hospital) {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Transaction trn=session.beginTransaction();
		session.save(hospital);
		trn.commit();
		return "Hospital data saved";
	}
	@Override
	public List<Hospital> showhospital() {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria cr=session.createCriteria(Hospital.class);
		return cr.list();
	}
	@Override
	public List<Hospital> gethospitalbyid(String hospitalid) {
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria cr=session.createCriteria(Hospital.class);
		cr.add(Restrictions.eq("hospitalid",hospitalid));
		return cr.list();
	}
	@Override
	public List<Hospital> getHospitalCity(String city) {
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria cr=session.createCriteria(Hospital.class);
		cr.add(Restrictions.eq("city",city));
		return cr.list();
	}
	@Override
	public List<Hospital> HospitalCity() {
		factory = SessionHelper.getsession();
		session = factory.openSession();
		Criteria cr = session.createCriteria(Hospital.class);
				cr.setProjection(Projections.distinct(Projections.property("city")));
		return cr.list();
	}

}
