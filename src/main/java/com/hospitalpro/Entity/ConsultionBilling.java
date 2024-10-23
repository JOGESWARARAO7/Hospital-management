package com.hospitalpro.Entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ConsultionBilling")
public class ConsultionBilling {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "consultionID")
    private int consultionID;
	 
	@Column(name = "appointmentID")
    private int appointmentID;
	@Column(name = "patientID")
	private int patientID;
	
    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private Status status;
    @Column(name = "feeAmount")
    private Double feeAmount;

    @Column(name = "billingDate")
    @Temporal(TemporalType.DATE)
    private Date billingDate;

    @Enumerated(EnumType.STRING)
    @Column(name = "paymentStatus")
    private PaymentStatus paymentStatus;

    @Column(name = "comments")
    private String comments;

    public enum Status {
        VISIT, ADMIT
    }

    public enum PaymentStatus {
        PENDING, PAID
    }
}
