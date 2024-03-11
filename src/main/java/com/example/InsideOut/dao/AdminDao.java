package com.example.InsideOut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.InsideOut.model.MemberBean;

@Mapper
public interface AdminDao {

	public List<MemberBean> getAllMembers(int pageNum);	
	
	public List<MemberBean> getSearchMembers(String keyword);
	
	public void deleteMembers(int mem_no);

	public int getTotal();
	
	public int getSearchTotal(String keyword);

	
}
