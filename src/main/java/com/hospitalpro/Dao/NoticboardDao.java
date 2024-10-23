package com.hospitalpro.Dao;

import java.util.List;

import com.hospitalpro.Entity.NotiesBoard;

public interface NoticboardDao {

	public String adddata(NotiesBoard notiesBoard);
	public List<NotiesBoard> showNoticeboard();
}
