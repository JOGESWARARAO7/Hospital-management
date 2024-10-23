package com.hospitalpro.Dao;

import java.util.List;

import com.hospitalpro.Entity.EntityDoctor;
import com.hospitalpro.Entity.Test;
import com.hospitalpro.Execption.NotUnique;

public interface Testdao {

	String addTest(Test test) throws NotUnique;
	List<Test> avalibleslot();
}
