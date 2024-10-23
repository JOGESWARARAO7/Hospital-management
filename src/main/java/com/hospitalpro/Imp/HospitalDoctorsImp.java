package com.hospitalpro.Imp;

import java.util.concurrent.CountDownLatch;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.HospitalDoctorsDao;
import com.hospitalpro.Entity.EntityDoctor;
import com.hospitalpro.Entity.Hospital;
import com.hospitalpro.Entity.HospitalDoctor;
import com.hospitalro.Helper.SessionHelper;

public class HospitalDoctorsImp implements HospitalDoctorsDao{

	SessionFactory factory;
	Session session;
	@Override
	public String assignHD(HospitalDoctor hospitalDoctor) {
		// TODO Auto-generated method stub
		String ret = null;
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria cr = session.createCriteria(EntityDoctor.class);
		cr.add(Restrictions.eq("doctorid",hospitalDoctor.getDoctorid()));
		EntityDoctor ed = (EntityDoctor)cr.uniqueResult();
		Criteria crho = session.createCriteria(Hospital.class);
		cr.add(Restrictions.eq("hospitalid",hospitalDoctor.getHospitalid()));
		Hospital hospital = (Hospital)cr.uniqueResult();
		if (ed!= null && hospital!=null) {
			Criteria crhd = session.createCriteria(HospitalDoctor.class);
			cr.add(Restrictions.eq("doctorid",hospitalDoctor.getDoctorid()));
			HospitalDoctor hospitalD = (HospitalDoctor)cr.uniqueResult();
			if(hospitalD.getDoctorid()==null && hospitalD.getHospitalid()==null) {
				
				Transaction trans=session.beginTransaction();
				session.save(hospitalDoctor);
				trans.commit();
				return "Add Shift Sucessfually";
			}
             
			
        } else {
        	if(ed==null) {
        		ret="Doctor ID not a Present";
        		 return ret;
        	}
        	else if(hospital==null){
        	ret="Doctor ID not a Present";
            return ret;
        	}
        	else{
        		ret="Invalid";
                return ret;
        	}
        }
		return ret;
	}
	

}
