package com.example.InsideOut.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StaffMypageDao;
import com.example.InsideOut.model.StaffMypageModel;

//@Service("staffMypageService")
@Service
public class StaffMypageService {
	
	@Autowired
	private  StaffMypageDao staffMypageDao;

//	public StaffMypageService(StaffMypageDao staffMypageDao) {
//		this.staffMypageDao = staffMypageDao;
//	}

	/*
	 * public List<StaffMypageModel> staffBookingList() {
	 * 
	 * 
	 * List<StaffMypageModel> list = staffMypageDao.staffBookingList();
	 * System.out.println("service list:"+ list);
	 * 
	 * return list; // return staffMypageDao.getBookingList(); }
	 */
	public ArrayList<StaffMypageModel> staffBookingList(String staff_no){
		return staffMypageDao.staffBookingList(staff_no);
	}

	public int confirmUpdate(StaffMypageModel smm) {
		// TODO Auto-generated method stub
		return staffMypageDao.confirmUpdate(smm);
	}

	
}
