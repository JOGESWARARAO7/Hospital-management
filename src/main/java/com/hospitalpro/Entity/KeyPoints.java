package com.hospitalpro.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "KeyPoints")
public class KeyPoints {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="slno")
	private int slno;
	@Column(name ="keypoint")
	private String keypoint;
	@Column(name = "status")
	private String status;
}
