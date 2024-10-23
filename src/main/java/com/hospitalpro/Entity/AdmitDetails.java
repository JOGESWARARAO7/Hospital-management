package com.hospitalpro.Entity;

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
@Table(name = "AdmitDetails")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdmitDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "admitID",nullable = false)
    private int admitID;

    @Column(name = "RoomID", nullable = false)
    private int roomID;

    @Column(name = "PatientID", nullable = false)
    private int patientID;

    @Column(name = "AppointmentID", nullable = false)
    private int appointmentID;

    @Column(name = "StartDate", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date startDate;

    @Column(name = "EndDate")
    @Temporal(TemporalType.DATE)
    private Date endDate;

    @Column(name = "NoOfDays", nullable = false)
    private int noOfDays;

    @Column(name = "BillingAmount", precision = 9, scale = 2, nullable = false)
    private double billingAmount;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private Status status;

    @Column(name = "comments", length = 100)
    private String comments;

    public enum Status {
        PAID,
        PENDING
    }
}
