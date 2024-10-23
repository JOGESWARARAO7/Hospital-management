package com.hospitalpro.Imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.Doctor_ModifyDao;
import com.hospitalpro.Entity.DoctorModify;
import com.hospitalpro.Entity.EntityDoctor;
import com.hospitalro.Helper.SessionHelper;

import checkHospitail.ConncetionHeliper;

public class Doctor_ModifyImp implements Doctor_ModifyDao{

	SessionFactory factory;
	Session session;
	static Connection con;
	static PreparedStatement pst;
	public static String getDoctorId() throws SQLException, ClassNotFoundException {
        String query = "SELECT MAX(DoctorId) AS DoctorId FROM doctor_modifiy";
        con=ConncetionHeliper.getConnection();
        String check = null;
		pst=con.prepareStatement(query);
		ResultSet rs = pst.executeQuery();
		
		if (rs.next()) {
            String lastId = rs.getString("DoctorId");
            int sum=Integer.parseInt(lastId.substring(1,5));
            sum=sum+1;
            
           if(sum<=9) {
            	check="D000"+sum;
            }
            else if(sum==10||sum<=99) {
            	check="D00"+sum;
            }
            else if(sum==100||sum<=999) {
            	check="D0"+sum;
            }
            else {
            	check="D"+sum;
            }
		}
		return check;
            
    }
	@Override
	public String addDoctor(DoctorModify dmd){
		String doctorid;
		try {
			doctorid = getDoctorId();
			dmd.setDoctorid(doctorid);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(DoctorModify.class);
		Transaction transaction=session.beginTransaction();
		session.saveOrUpdate(dmd);
		transaction.commit();
		session.close();
		return "Data Saved";
	}

	@Override
	public List<DoctorModify> showModifyDoctors() {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(DoctorModify.class);
		return criteria.list();
	}
	@Override
	public List<DoctorModify> getDoctor() {
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(DoctorModify.class);
		criteria.setProjection(Projections.distinct(Projections.property("doctorname")));
		return criteria.list();
	}

}
