package com.hospitalpro.Dao;

import java.util.Date;
import java.util.List;

import com.hospitalpro.Entity.ConsultionBilling;

public interface ConsultionBillingDAO {

	 	List<ConsultionBilling> showPatientConsultingDetails(int patientId);
	    List<ConsultionBilling> showConsultingDetailsOfParticularDate(Date date);
	    String addConsultingDetails(ConsultionBilling consultionBilling);
	    List<ConsultionBilling> searchConsultingDetails(int searchString);
	    List<ConsultionBilling> showConsultingDetailsWithPendingPayment();
}
