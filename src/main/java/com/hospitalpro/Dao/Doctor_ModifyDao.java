package com.hospitalpro.Dao;

import java.sql.SQLException;
import java.util.List;

import com.hospitalpro.Entity.DoctorModify;
import com.hospitalpro.Entity.EntityDoctor;

public interface Doctor_ModifyDao {

	String addDoctor(DoctorModify dmd);
	List<DoctorModify> showModifyDoctors();
	List<DoctorModify> getDoctor();
}
