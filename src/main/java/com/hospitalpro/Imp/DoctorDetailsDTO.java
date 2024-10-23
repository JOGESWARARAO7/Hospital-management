package com.hospitalpro.Imp;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.hospitalpro.Entity.DoctorModify;
import com.hospitalpro.Entity.EntityDoctor;
import com.hospitalpro.Entity.Hospital;
import com.hospitalpro.Entity.Test;
import com.hospitalro.Helper.SessionHelper;

public class DoctorDetailsDTO {
	private DoctorModify doctor;
    private Test test;
    private Hospital hospital;
    SessionFactory factory;
	Session session;
    // Getters and Setters
    public DoctorModify getDoctor() {
        return doctor;
    }

    public void setDoctor(DoctorModify doctor) {
        this.doctor = doctor;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public Hospital getHospital() {
        return hospital;
    }

    public void setHospital(Hospital hospital) {
        this.hospital = hospital;
    }
    
    public List<DoctorDetailsDTO> getSlotWithDetails(Test.AvailableSlot availableSlot) {
        factory = SessionHelper.getsession();
        session = factory.openSession();
        
        Criteria testCriteria = session.createCriteria(Test.class);
        testCriteria.add(Restrictions.eq("availableslot", availableSlot));
        List<Test> testList = testCriteria.list();
        
        List<DoctorDetailsDTO> doctorHospitalDTOs = new ArrayList<>();
        
        for (Test test : testList) {
            Criteria doctorCriteria = session.createCriteria(DoctorModify.class);
            doctorCriteria.add(Restrictions.eq("doctorid", test.getDoctorid()));
            DoctorModify doctor = (DoctorModify) doctorCriteria.uniqueResult();
            
            Criteria hospitalCriteria = session.createCriteria(Hospital.class);
            hospitalCriteria.add(Restrictions.eq("hospitalid", test.getHospitalid()));
            Hospital hospital = (Hospital) hospitalCriteria.uniqueResult();
            
            DoctorDetailsDTO dto = new DoctorDetailsDTO();
            dto.setDoctor(doctor);
            dto.setHospital(hospital);
            
            doctorHospitalDTOs.add(dto);
        }
        
        session.close();
        return doctorHospitalDTOs;
    }

}
