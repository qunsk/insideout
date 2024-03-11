package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.StaffBean;

@Mapper
public interface StaffDao {
	
	public List<StaffBean> getStaffList(StaffBean staff);

	public StaffBean getStaff(String staff_no);

}
