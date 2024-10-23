package com.hospitalpro.Dao;

import java.util.List;

import com.hospitalpro.Entity.KeyPoints;
import com.hospitalpro.Imp.KeyPoint;

public interface Keyinterface {

	public String adding(KeyPoints keyPoint);
	public List<KeyPoints> showpoints();
}
