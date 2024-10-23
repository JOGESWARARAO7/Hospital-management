package com.hospitalpro.Imp;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Dao.RoomDetailsDao;
import com.hospitalpro.Entity.RoomDetails;
import com.hospitalpro.Entity.RoomDetails.RoomType;
import com.hospitalro.Helper.SessionHelper;

public class RoomDetailsDaoImpl implements RoomDetailsDao{

	SessionFactory factory;
	Session session;
	@Override
	public String addRoom(RoomDetails roomDetails) {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(RoomDetails.class);
		Transaction transaction=session.beginTransaction();
		roomDetails.setRoomalocate(0);
		session.save(roomDetails);
		transaction.commit();
		session.close();
		return "Data Add";
	}

	@Override
	public List<RoomDetails> showRoom() {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(RoomDetails.class);
		return criteria.list();
	}

	@Override
	public List<RoomDetails> searchRoomById(int roomId) {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(RoomDetails.class);
		criteria.add(Restrictions.eq("roomId",roomId));
		return criteria.list();
	}

	@Override
	public List<RoomDetails> searchRoomByType(RoomType roomType) {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(RoomDetails.class);
		criteria.add(Restrictions.eq("roomType",roomType));
		List<RoomDetails> list=criteria.list();
		return list;
	}

	@Override
	public List<RoomDetails> showAvailableRooms() {
		// TODO Auto-generated method stub
		factory=SessionHelper.getsession();
		session=factory.openSession();
		Criteria criteria=session.createCriteria(RoomDetails.class);
		List<RoomDetails> list=criteria.list();
		List<RoomDetails> details=new ArrayList<>();
		for (RoomDetails roomDetails : list) {
			String roomtype=roomDetails.getRoomType().toString();
			if ((roomDetails.getRoomalocate()<2&&roomtype.equals("TWO"))||
					(roomDetails.getRoomalocate()<3&&roomtype.equals("THREE"))||
					(roomDetails.getRoomalocate()<1&&roomtype.equals("DELUX"))||
					(roomDetails.getRoomalocate()<1&&roomtype.equals("SUITE"))
					) {
				
				details.add(roomDetails);
			}
		}
		
		return details;
	}

}
