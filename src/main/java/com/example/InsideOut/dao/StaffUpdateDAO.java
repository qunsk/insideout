package com.example.InsideOut.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StaffBean;



@Mapper
public interface StaffUpdateDAO {
	
	StaffBean getStaffByMemNo(String username);

	int updateStaff(StaffBean staff);


}
