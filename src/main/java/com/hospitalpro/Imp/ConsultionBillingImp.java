package com.hospitalpro.Imp;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.ConsultionBillingDAO;
import com.hospitalpro.Entity.Appointment;
import com.hospitalpro.Entity.ConsultionBilling;
import com.hospitalpro.Entity.ConsultionBilling.PaymentStatus;
import com.hospitalro.Helper.SessionHelper;

public class ConsultionBillingImp implements ConsultionBillingDAO{

	SessionFactory factory;
	Session session;
	@Override
	public List<ConsultionBilling> showPatientConsultingDetails(int patientId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ConsultionBilling> showConsultingDetailsOfParticularDate(Date date){
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(ConsultionBilling.class);
		criteria.add(Restrictions.eq("billingDate", date));
		System.out.println(date);
		return criteria.list();
	}

	@Override
	public String addConsultingDetails(ConsultionBilling consultionBilling) {
		// TODO Auto-generated method stub
		String req="";
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria1=session.createCriteria(Appointment.class);
		criteria1.add(Restrictions.eq("appointmentid",consultionBilling.getAppointmentID()));
		Appointment appointment=(Appointment)criteria1.uniqueResult();
		if(appointment!=null) {
			Criteria criteria=session.createCriteria(ConsultionBilling.class);
			Transaction transaction=session.beginTransaction();
			session.save(consultionBilling);
			transaction.commit();
			session.close();
			req="Sucessfully";
			return req;
		}
		else {
			req="Invalid Data";
		return req;
		}
	}

	@Override
	public List<ConsultionBilling> searchConsultingDetails(int searchString) {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(ConsultionBilling.class);
		criteria.add(Restrictions.eq("consultionID", searchString));
		return criteria.list();
	}

	@Override
	public List<ConsultionBilling> showConsultingDetailsWithPendingPayment() {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(ConsultionBilling.class);
		criteria.add(Restrictions.eq("paymentStatus",PaymentStatus.PENDING));
		List<ConsultionBilling> pendingPayments = criteria.list();
	    session.close();
	    return pendingPayments;
	}

}
