package com.example.InsideOut.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StaffMypageModel;

@Mapper
public interface StaffMypageDao {

	//public List<StaffMypageModel> staffBookingList();
	public ArrayList<StaffMypageModel> staffBookingList(String staff_no);

	public int confirmUpdate(StaffMypageModel smm);

}