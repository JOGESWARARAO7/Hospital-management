package com.hospitalpro.Dao;

import java.sql.SQLException;
import java.util.List;

import com.hospitalpro.Entity.EntityDoctor;


public interface DactorDao {
	String addDoctor(EntityDoctor ed) throws ClassNotFoundException, SQLException;
	List<EntityDoctor> showDoctors()throws ClassNotFoundException, SQLException;
	List<EntityDoctor> searchAvailableSlot(EntityDoctor ed) throws ClassNotFoundException, SQLException;
}
