package com.hospitalpro.Imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.Testdao;
import com.hospitalpro.Entity.Appointment;
import com.hospitalpro.Entity.DoctorModify;
import com.hospitalpro.Entity.EntityDoctor;
import com.hospitalpro.Entity.Hospital;
import com.hospitalpro.Entity.HospitalDoctor;
import com.hospitalpro.Entity.Test;
import com.hospitalpro.Execption.NotUnique;
import com.hospitalro.Helper.SessionHelper;

public class TestImp implements Testdao {

	SessionFactory factory;
	Session session;
	@Override
	public String addTest(Test test) throws NotUnique {
		String ret = null;
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria cr = session.createCriteria(DoctorModify.class);
		cr.add(Restrictions.eq("doctorid",test.getDoctorid()));
		DoctorModify ed = (DoctorModify)cr.uniqueResult();
		Criteria crho = session.createCriteria(Hospital.class);
		crho.add(Restrictions.eq("hospitalid",test.getHospitalid()));
		Hospital hospital = (Hospital)crho.uniqueResult();
		System.out.println(ed+"..."+hospital);
		if (ed!=null && hospital!=null) {
			// this only check Weekends only
			Criteria cr1 = session.createCriteria(Test.class);
			cr1.add(Restrictions.eq("doctorid",test.getDoctorid()));
			cr1.add(Restrictions.eq("hospitalid",test.getHospitalid()));
			List<Test> check=(List<Test>)cr1.list();
			System.out.println(".."+check.size());
			if(check.size()>1) {
				ret="Invalid data don't try same thing !... ";
				System.out.println("jjdjdjdjj");
				return ret; 
			}
			Test appointime;
				try {
					appointime=(Test) cr1.uniqueResult();
				} catch (Exception e) {
					throw new NotUnique("Already alcated");
				}
				
				
	            System.out.println(appointime+"appointime");
	            System.out.println("slot"+test.getAvailableslot());
			if(appointime==null) {
				if(test.getAvailableslot().equals(Test.AvailableSlot.WEEKENDS)&&appointime==null) {
					Transaction trans=session.beginTransaction();
					session.save(test);
					trans.commit();
					System.out.println("Add Shift Sucessfually weekends");
					ret="Shift Add Sucessfually";
					return ret;	
				}
				else {
					System.out.println("null");
				}
			}
			else if((test.getAvailableslot().equals(Test.AvailableSlot.WEEKENDS)&& appointime!=null) ||test.getAvailableslot().equals(Test.AvailableSlot.GENERAL)) {
				//&appointime.getHospitalid().equals(test.getHospitalid())
				if(appointime.getDoctorid().equals(test.getDoctorid())) {
					ret="already this Shift alocated weekends";
					System.out.println("already this Shift is add 1");
					return ret;
					}
					else {
						Transaction trans=session.beginTransaction();
						session.save(test);
						trans.commit();
						System.out.println("Add Shift Sucessfually weekends");
						ret="Shift Add Sucessfually";
						System.out.println("already this Shift is add 2");
						return ret;
					}
			}
			

		
			// This only for some shifts
			Criteria crho1 = session.createCriteria(Test.class);
			crho1.add(Restrictions.eq("doctorid",test.getDoctorid()));
			
			List<Test> test1= crho1.list();
			List<Enum> tests= new ArrayList<>();
			List<String> tests1= new ArrayList<>();
			for (Test test2 : test1) {
				tests.add(test2.getAvailableslot());
				tests1.add(test2.getDoctorid());
				
			}
			// we get checking table get available slot only by a id
			System.out.println(tests);
			System.out.println(test1);
			System.out.println(tests1);
			
			if(test1.isEmpty()) {
				
				Transaction trans=session.beginTransaction();
				session.save(test);
				trans.commit();
				System.out.println("Add Shift Sucessfually its null");
				ret="Shift Add Sucessfually";
				System.out.println("already this Shift is add 3");
				return ret;
			}
			
			else if (tests.contains(test.getAvailableslot())&&tests1.contains(test.getDoctorid())) {
					//ret="Add Shift Sucessfually";
				System.out.println("All ready this slot allocated");
				System.out.println("already this Shift is add 4");
					ret="All ready this slot allocated";
					return ret;
				}
			else {
				Transaction trans=session.beginTransaction();
				session.save(test);
				trans.commit();
				System.out.println("already this Shift is add 5");
				System.out.println("Add Shift Sucessfually");
				ret="Shift Add Sucessfually";
				return ret;
			}
			
			}
				
			
         else {
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
		
	
	}
	@Override
	public List<Test> avalibleslot() {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria cr=session.createCriteria(Test.class);
		cr.setProjection(Projections.distinct(Projections.property("availableslot")));
		return cr.list();
	}
	
}

