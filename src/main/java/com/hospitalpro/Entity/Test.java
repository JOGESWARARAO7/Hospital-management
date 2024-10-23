package com.hospitalpro.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.hospitalpro.Entity.EntityDoctor.AvailableSlot;

@Entity
@Table(name = "checking")
public class Test {

	public enum AvailableSlot {
        GENERAL,
        MORNING,
        EVENING,
        WEEKENDS,
        CALLON;
    }
	@Id
	@Column(name = "hdid")
	private int hdid;
	@Column(name = "doctorid")
	private String doctorid;
	@Column(name = "hospitalid")
	private String hospitalid;
	@Enumerated(EnumType.STRING)
	@Column(name = "availableslot")
	private AvailableSlot availableslot;
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
	public AvailableSlot getAvailableslot() {
		return availableslot;
	}
	public void setAvailableslot(AvailableSlot availableslot) {
		this.availableslot = availableslot;
	}
	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Test(int hdid, String doctorid, String hospitalid, AvailableSlot availableslot) {
		super();
		this.hdid = hdid;
		this.doctorid = doctorid;
		this.hospitalid = hospitalid;
		this.availableslot = availableslot;
	}
	@Override
	public String toString() {
		return "Test [hdid=" + hdid + ", doctorid=" + doctorid + ", hospitalid=" + hospitalid + ", availableslot="
				+ availableslot + "]";
	}
	
	
	
	
}
