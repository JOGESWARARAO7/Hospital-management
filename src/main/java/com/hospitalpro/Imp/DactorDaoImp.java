package com.hospitalpro.Imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.hospitalpro.Dao.DactorDao;
import com.hospitalpro.Entity.EntityDoctor;

import checkHospitail.ConncetionHeliper;


public class DactorDaoImp implements DactorDao{
	static Connection con;
	static PreparedStatement pst;
	
	public static String getDoctorId() throws SQLException, ClassNotFoundException {
        String query = "SELECT DoctorId FROM doctor d1 WHERE (SELECT COUNT(distinct DoctorId)FROM doctor d2 WHERE d1.DoctorId<d2.DoctorId)=0";
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
	public String addDoctor(EntityDoctor ed) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String doctorid=getDoctorId();
		ed.setDoctorid(doctorid);
		String add="insert into doctor (DoctorId, DoctorName, Specialization, Qualification, AvailableSlot) values(?,?,?,?,?)";
		con=ConncetionHeliper.getConnection();
		pst=con.prepareStatement(add);
		pst.setString(1,ed.getDoctorid());
		pst.setString(2,ed.getDoctorname());
		pst.setString(3,ed.getSpecialization());
		pst.setString(4,ed.getQualification());
		pst.setString(5,ed.getAvailableslot().name());
		pst.executeUpdate();
		return "**add details**";
	}
	@Override
	public List<EntityDoctor> showDoctors() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		con=ConncetionHeliper.getConnection();
		String list="select * from doctor";
		pst=con.prepareStatement(list);
		ResultSet rs=pst.executeQuery();
		EntityDoctor ed=null;
		List<EntityDoctor> docList=new ArrayList<>();
		while(rs.next()) {
			ed=new EntityDoctor();
			ed.setDoctorid(rs.getString("doctorid"));
			ed.setDoctorname(rs.getString("doctorname"));
			ed.setSpecialization(rs.getString("specialization"));
			ed.setQualification(rs.getString("qualification"));
			ed.setAvailableslot(EntityDoctor.AvailableSlot.valueOf(rs.getString("availableslot")));
			docList.add(ed);	
		}
		return docList;
	}
	@Override
	public List<EntityDoctor> searchAvailableSlot(EntityDoctor ed) throws ClassNotFoundException, SQLException {
		String availableslotlist="select * from doctor where availableslot = ?";
		con=ConncetionHeliper.getConnection();
		pst=con.prepareStatement(availableslotlist);
		pst.setString(1,ed.getAvailableslot().name());
		ResultSet rs=pst.executeQuery();
		EntityDoctor ed1=null;
		List<EntityDoctor> docList=new ArrayList<>();
		while(rs.next()) {
			ed1=new EntityDoctor();
			ed1.setDoctorid(rs.getString("doctorid"));
			ed1.setDoctorname(rs.getString("doctorname"));
			ed1.setSpecialization(rs.getString("specialization"));
			ed1.setQualification(rs.getString("qualification"));
			ed1.setAvailableslot(EntityDoctor.AvailableSlot.valueOf(rs.getString("availableslot")));
			docList.add(ed1);	
		}
		
		return docList;
	}
	
	 
}
