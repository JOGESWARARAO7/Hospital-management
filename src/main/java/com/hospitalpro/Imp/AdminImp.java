package com.hospitalpro.Imp;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;

import com.hospitalMailandPassword.Mailsend;
import com.hospitalMailandPassword.OtpGanarated;
import com.hospitalpro.Dao.AdminDao;
import com.hospitalpro.Entity.Admin;
import com.hospitalpro.Entity.Hospital;
import com.hospitalro.Helper.SessionHelper;

public class AdminImp implements AdminDao{

	SessionFactory factory=SessionHelper.getsession();
	@Override
	public String addAdminData(Admin admin) {
		Session session=factory.openSession();
		String returnstring = null;
		Criteria criteria=session.createCriteria(Admin.class);
		int count=countOfAdmind(admin.getHospitalid());
		
		if(count>=3) {
			return "Cannot add more than 3 admins hospital.";
		}
		String email=gethospitalmail(admin.getHospitalid());
		String otp=OtpGanarated.getotp().toString();
		System.out.println("otp vaue :"+otp);
		admin.setOtp(otp);
		admin.setOtppurpose("Admin login to hospital");
		admin.setStatus("InActive");
		String subject="Hospital Data";
		String mailout=Mailsend.mail(email,subject,otp);
		if("Successfully".equals(mailout)) {
			Transaction transaction=session.beginTransaction();
			session.save(admin);
			transaction.commit();
			return "Successfully";
		}
		else {
			return "Mail Invalid !....";
		}
	}
	private int countOfAdmind(String string) {
		Session session=factory.openSession();
		Query query = session.createQuery("select count(a) from Admin a where a.hospitalid = :hospitalid");
        query.setParameter("hospitalid", string);
        Long count = (Long) query.uniqueResult();
        return count.intValue();
	}
	private String gethospitalmail(String hospitalid) {
		// TODO Auto-generated method stub
		Session session=factory.openSession();
		Criteria criteria=session.createCriteria(Hospital.class);
		criteria.add(Restrictions.eq("hospitalid", hospitalid));
		Hospital hospital=(Hospital)criteria.uniqueResult();
		String mail=hospital.getEmail();
		System.out.println(mail);
		return mail;
		
	}
	@Override
	public String loginAdmin(String username, String passcode) {
		// TODO Auto-generated method stub
		String check=null;
		Session session=factory.openSession();
		Criteria criteria=session.createCriteria(Admin.class);
		Criterion cr1 = Restrictions.eq("username", username);
		Criterion cr2 = Restrictions.eq("passcode",passcode);
		LogicalExpression expr = Restrictions.and(cr1, cr2);
		criteria.add(expr);
		Admin listad=(Admin)criteria.uniqueResult();
		//System.out.println(listad.toString());
		if(listad==null) {
			check="incorrect";
			return check;
		}
		else {
			Transaction transaction=session.beginTransaction();
			listad.setStatus("Active");
			session.update(listad);
			transaction.commit();
			session.close();
			check="correct";
			return check;
		}
		
	}
	@Override
	public List<Admin> showAdmin() {
		// TODO Auto-generated method stub
		Session session=factory.openSession();
		Criteria criteria=session.createCriteria(Admin.class);
		return criteria.list();
	}
	@Override
	public String adminLogout(String username) {
		// TODO Auto-generated method stub
		String check=null;
		Session session=factory.openSession();
		Criteria criteria=session.createCriteria(Admin.class);
		criteria.add(Restrictions.eq("username", username));
		Admin listad=(Admin)criteria.uniqueResult();
		Transaction transaction=session.beginTransaction();
		listad.setStatus("InActive");
		session.update(listad);
		transaction.commit();
		session.close();
		check="correct";
		return check;
	}

}

