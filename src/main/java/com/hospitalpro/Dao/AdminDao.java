package com.hospitalpro.Dao;

import java.util.List;

import com.hospitalpro.Entity.Admin;

public interface AdminDao {

	String addAdminData(Admin admin);
	String loginAdmin(String username,String passcode);
	List<Admin> showAdmin();
	String adminLogout(String username);
}
