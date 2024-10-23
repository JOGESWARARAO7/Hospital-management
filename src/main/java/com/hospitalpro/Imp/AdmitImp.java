package com.hospitalpro.Imp;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.AdmitDao;
import com.hospitalpro.Entity.AdmitDetails;
import com.hospitalpro.Entity.Appointment;
import com.hospitalpro.Entity.RoomDetails;
import com.hospitalro.Helper.SessionHelper;

public class AdmitImp implements AdmitDao{

	SessionFactory factory;
	Session session;
	@Override
	public String addAdmit(AdmitDetails admitDetails) {
		
		String get="";
		
		
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(RoomDetails.class);
		criteria.add(Restrictions.eq("roomId",admitDetails.getRoomID()));
		
		Criteria criteria1=session.createCriteria(Appointment.class);
		criteria1.add(Restrictions.eq("appointmentid",admitDetails.getAppointmentID()));
		
		RoomDetails details=(RoomDetails)criteria.uniqueResult();
		Appointment appointment=(Appointment)criteria1.uniqueResult();
		
		System.out.println(details+"..."+appointment+admitDetails.getAppointmentID()+admitDetails.getEndDate());
		if(details!=null && appointment!=null) {
			System.out.println(details.getRoomalocate()+"....."+details.getRoomType());
			String roomtype=details.getRoomType().toString();
			System.out.println(roomtype+"..to string");
			if(details.getRoomalocate()>=2 &&roomtype.equals("TWO")) {
				System.out.println("Avalible room");
				get="Space not There 1";
				return get;
			}
			else if(details.getRoomalocate()>=3 && roomtype.equals("THREE"))
			{
				get="Space not There 2";
				return get;
			}
			else if((details.getRoomalocate()>=1 && roomtype.equals("DELUX"))||(details.getRoomalocate()>=1 &&roomtype.equals("SUITE") ))
			{
				get="Space not There 3";
				return get;
			}
			Criteria cr=session.createCriteria(AdmitDetails.class);
			Transaction transaction=session.beginTransaction();
			
			LocalDate startDate = admitDetails.getStartDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate endDate = admitDetails.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
            // Set the number of days to admitDetails
            admitDetails.setNoOfDays((int)daysBetween);
			session.save(admitDetails);
			
			details.setRoomalocate(details.getRoomalocate()+1);
			session.update(details);
			transaction.commit();
			session.close();
			get="Sucessfully";
			return get;
			
		}
		else {
			get="Invalid id Details";
			return get;
		}
	}

}
