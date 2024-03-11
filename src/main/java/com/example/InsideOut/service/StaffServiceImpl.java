package com.example.InsideOut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.InsideOut.dao.StaffDao;
import com.example.InsideOut.model.StaffBean;

@Service
public class StaffServiceImpl implements StaffService {
	
	@Autowired
	private StaffDao staffDao;

	@Override
	public List<StaffBean> getStaffList(StaffBean staff) {
	    return staffDao.getStaffList(staff);
	}

	@Override
	public StaffBean getStaff(String staff_no) {
		// TODO Auto-generated method stub
		return staffDao.getStaff(staff_no);
	}


}
