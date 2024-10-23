package com.hospitalpro.Dao;

import java.util.List;

import com.hospitalpro.Entity.RoomDetails;

public interface RoomDetailsDao {

	String addRoom(RoomDetails roomDetails);
    List<RoomDetails> showRoom();
    List<RoomDetails> searchRoomById(int roomId);
    List<RoomDetails> searchRoomByType(RoomDetails.RoomType roomType);
    List<RoomDetails> showAvailableRooms();
}
