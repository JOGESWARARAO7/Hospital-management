package com.hospitalpro.Dao;

import java.util.List;

import com.hospitalpro.Entity.Appointment;

public interface AppointmentDao {

	String addappointment (Appointment appointment);
	List<Appointment> showappointment(String status);
	String cancellappointment(int appointmentid);
}
