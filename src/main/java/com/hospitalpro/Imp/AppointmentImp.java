package com.hospitalpro.Imp;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.AppointmentDao;
import com.hospitalpro.Entity.Appointment;
import com.hospitalpro.Entity.EntityDoctor;
import com.hospitalpro.Entity.NotiesBoard;
import com.hospitalro.Helper.SessionHelper;

public class AppointmentImp implements AppointmentDao{

	SessionFactory sessionFactory;
	Session session;
	@Override
	public String addappointment(Appointment appointment) {
		sessionFactory=SessionHelper.getsession();
		session=sessionFactory.openSession();
		Transaction trn=session.beginTransaction();
		Criteria cr = session.createCriteria(Appointment.class);
		cr.add(Restrictions.eq("doctorName",appointment.getDoctorName()));
		Appointment appoint = (Appointment)cr.uniqueResult();
		if(appoint==null) {
			Criteria cr1 = session.createCriteria(Appointment.class);
			cr1.add(Restrictions.eq("appointtime",appointment.getAppointtime()));
			cr1.add(Restrictions.eq("appointmentdate",appointment.getAppointmentdate()));
			Appointment appointime = (Appointment)cr1.uniqueResult();
			String gettime=appointment.getAppointtime();
			String[] split=gettime.split(":");
			int num=Integer.parseInt(split[0]);
			if(appointime==null) {
				if(num>=8 && num<=22) {
					System.out.println(num);
					appointment.setStatus("Active");
					session.save(appointment);
					trn.commit();
					return "Successfully";
				}
				else {
					return "apploint time 8:00am to 22:00pm only";
				}
			}
			else{
				return "this time already one appointment is there exact 30 s after";
			}
		}
		else{
			return "Doctor already one pasent is there";
		}
		
	}
	@Override
	public List<Appointment> showappointment(String status) {
		sessionFactory=SessionHelper.getsession();
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Appointment.class);
		cr.add(Restrictions.eq("status",status));
		List<Appointment> list=cr.list();
		return list;
	}
	@Override
	public String cancellappointment(int appointmentid) {
		// TODO Auto-generated method stub
		sessionFactory=SessionHelper.getsession();
		session=sessionFactory.openSession();
		Criteria cr=session.createCriteria(Appointment.class);
		cr.add(Restrictions.eq("appointmentid",appointmentid));
		Appointment list=(Appointment) cr.uniqueResult();
		Transaction transaction=session.beginTransaction();
		list.setStatus("Cancel");
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.update(list);
		transaction.commit();
		session.close();
		
		return "Successfully";
	}
}
