package com.hospitalpro.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Hospital_doctor")
public class HospitalDoctor {
	
	@Id
	@Column(name = "hdid")
	private int hdid;
	@Column(name = "doctorid")
	private String doctorid;
	@Column(name = "hospitalid")
	private String hospitalid;
	public int getHdid() {
		return hdid;
	}
	public void setHdid(int hdid) {
		this.hdid = hdid;
	}
	public String getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(String doctorid) {
		this.doctorid = doctorid;
	}
	public String getHospitalid() {
		return hospitalid;
	}
	public void setHospitalid(String hospitalid) {
		this.hospitalid = hospitalid;
	}
	public HospitalDoctor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HospitalDoctor(int hdid, String doctorid, String hospitalid) {
		super();
		this.hdid = hdid;
		this.doctorid = doctorid;
		this.hospitalid = hospitalid;
	}
	@Override
	public String toString() {
		return "HospitalDoctor [hdid=" + hdid + ", doctorid=" + doctorid + ", hospitalid=" + hospitalid + "]";
	}
	
}
