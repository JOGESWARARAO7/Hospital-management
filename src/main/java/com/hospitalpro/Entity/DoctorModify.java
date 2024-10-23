package com.hospitalpro.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name = "doctor_modifiy")
public class DoctorModify {
	@Id
	@Column(name = "doctorid")
	private String doctorid;
	@Column(name = "doctorname")
	private String doctorname;
	@Column(name = "specialization")
	private String specialization;
	@Column(name = "qualification")
	private String qualification;
	public String getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(String doctorid) {
		this.doctorid = doctorid;
	}
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public DoctorModify() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DoctorModify(String doctorid, String doctorname, String specialization, String qualification) {
		super();
		this.doctorid = doctorid;
		this.doctorname = doctorname;
		this.specialization = specialization;
		this.qualification = qualification;
	}
	@Override
	public String toString() {
		return "DoctorModify [doctorid=" + doctorid + ", doctorname=" + doctorname + ", specialization="
				+ specialization + ", qualification=" + qualification + "]";
	}
	
}
