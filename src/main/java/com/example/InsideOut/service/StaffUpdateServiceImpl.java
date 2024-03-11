package com.example.InsideOut.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StaffUpdateDAO;
import com.example.InsideOut.model.StaffBean;

@Service
public class StaffUpdateServiceImpl implements StaffUpdateService{
	
	@Autowired
    private StaffUpdateDAO staffUpdateDAO;

	@Override
	public StaffBean getStaffByMemNo(String username) {
		// TODO Auto-generated method stub
		return staffUpdateDAO.getStaffByMemNo(username);
	}

	@Override
	public int updateStaff(StaffBean staff) {
		// TODO Auto-generated method stub
		return staffUpdateDAO.updateStaff(staff);
	}
	
	

}
