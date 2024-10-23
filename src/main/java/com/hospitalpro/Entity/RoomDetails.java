package com.hospitalpro.Entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "RoomDetails")
public class RoomDetails {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="roomId" )
    private Integer roomId;

    @Enumerated(EnumType.STRING)
    @Column(name = "roomType")
    private RoomType roomType;
    
    @Column(name = "roomFare")
    private Double roomFare;

    @Enumerated(EnumType.STRING)
    @Column(name = "roomStatus")
    private RoomStatus roomStatus;
    
    @Column(name = "roomalocate")
    private int roomalocate;

    public enum RoomType {
        THREE, TWO, DELUX, SUITE
    }

    public enum RoomStatus {
        OCCUPIED, VACANT
    }
}
