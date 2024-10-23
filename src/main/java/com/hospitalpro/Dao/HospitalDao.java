package com.hospitalpro.Dao;

import java.util.List;

import com.hospitalpro.Entity.Hospital;

public interface HospitalDao {

	String addHospital(Hospital hospital);
	List<Hospital> showhospital();
	List<Hospital> gethospitalbyid(String hospitalid);
	List<Hospital> getHospitalCity(String city);
	List<Hospital> HospitalCity();
}
